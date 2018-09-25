Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216D9C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 18:08:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E8D2086E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 18:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+jlIaeE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jxdYnne/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8E8D2086E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=U94HPIL/9uNR7XUXxZdUXZO9WA1PiT6HsT2xGSePhqM=; b=s+jlIaeEubfruCKmWIu85CgsO
	AUy3hxBU+UPO7sAt4uyOeIjzf48KqoZLWtVKX1GrqRRA9jei8k0L3SYzpMoHD2na4T/aUuxgrzWf7
	boexpiwCSMn0VbxnKpZzCVaIQ+CL6ECM9+MDbt6MfuhdZWiFd3/hieb2Qgb1o0EfQqvtLbR4/nGgw
	kXdxovk5nd51pXKas7nUypHfIW4qgsnS3rROjLK2IwIeRErg/lkgfxtyIsSkHGQMYtQZCM5kRy3Cu
	LWMKqZBbu9gy1sT1Abx0fTDBQZTA6klJc5KWnnlGkg8pbTEd5UretBF4SpvajuBdcY7wBUbCwDLum
	jbRB3F5JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4rlQ-0005qI-Ng; Tue, 25 Sep 2018 18:08:48 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4ran-0007HT-E3
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 17:58:03 +0000
Received: by mail-pf1-x443.google.com with SMTP id j26-v6so11741923pfi.10
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 10:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=s56OFK1djYzC05lrSnn6/0rMMF5lKJIW0wKOcRDOk9I=;
 b=jxdYnne/Rg9jpmaEWBUZtAQHHChY1m6mepOobRiYVW9FP4NNIU4mm8V69itye4CVpc
 4xsAXlnd40v49OB6l058RXs2cUs51cNvsQtdcYwPdqT0Obdslq71LmvFUs2L4ykUuIlI
 AlAZbtyNojbh0HR+a7qcYO2uwFVqV9HHsWsZoWHSKYCj8RXZxR1iR1MiIYqo+ZNtnQwJ
 cjXjE1Bt0nwr/jG3pl+FZJTAuLPDtDMbWBvDV5hyupLWbArdGj48wB7c/Fuan+zD8FRH
 6L8gC68XrdvIJPaRKyTLpwiueHgZIYyuVbTOE1gt9A0H12hQKKqb6OZE2ATD0KEA/5ed
 PSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=s56OFK1djYzC05lrSnn6/0rMMF5lKJIW0wKOcRDOk9I=;
 b=uJG9+P9s0OAb6q5HYb4t0zu7YnnYmpmCT/L4KrdQSPvqs7/klmxsw6PTCK3qNJ08nu
 8vXT9jg/SxCv8gfgxP6xZ9o7x6cKE8k34nIws3x2SCzqB4V6D48cB4wNTOVZLCaMbdab
 YkWjUiZO2w5Cw+1FoSrrdVsJi1kqVjfWw1IwA4Gp3IZdob/O98V1XFO4QZiWTK4bAXCT
 6eU2k+DKFFnP63UGVWrTYmlfvcrdv5BTZWJleLJnPuLuzkrPUMcT2UGzm5cPxKIikEX9
 B4h/9Nsi4LEHl7M4THzDjchkzCLqOn+H3tgMtDm3hg51sn4kWLJz/92f73iMcV7uMSlL
 rnEQ==
X-Gm-Message-State: ABuFfoiCzZbL9tIc35Vhqty+EKodEs02o5ztVUesKovRLE8dXYGx5qYv
 VhWqbTFlb+xjYwczYTAYkxa99w==
X-Google-Smtp-Source: ACcGV62+ghjlXeE2MA7S8p9oMlJNg67J0X6t0vpyDKDlvChihAWYI9IDD3jGTTYqjpJkCiSUgEan6w==
X-Received: by 2002:a17:902:d881:: with SMTP id
 b1-v6mr2253098plz.191.1537898243741; 
 Tue, 25 Sep 2018 10:57:23 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t128-v6sm7784311pfc.90.2018.09.25.10.57.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 10:57:22 -0700 (PDT)
Date: Tue, 25 Sep 2018 10:57:22 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Sep 2018 10:56:09 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv/bitops: Remove smp_mb__{before,
 after}_clear_bit()
In-Reply-To: <20180925174906.GA4372@andrea>
From: Palmer Dabbelt <palmer@sifive.com>
To: andrea.parri@amarulasolutions.com
Message-ID: <mhng-011ba62c-cdf5-4a9b-9d4e-b1a7909d5d43@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_105749_688778_1AE0C28A 
X-CRM114-Status: GOOD (  14.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925175722.aUlAuuaxJ8pMooKQ9VqNb3xdIOnOwRWr8gezwYarY9w@z>

On Tue, 25 Sep 2018 10:49:06 PDT (-0700), andrea.parri@amarulasolutions.com wrote:
> On Tue, Sep 25, 2018 at 10:19:24AM -0700, Palmer Dabbelt wrote:
>> On Tue, 25 Sep 2018 05:12:24 PDT (-0700), andrea.parri@amarulasolutions.com wrote:
>> > The barriers are unused; remove their definition.
>> >
>> > Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
>> > Cc: Palmer Dabbelt <palmer@sifive.com>
>> > Cc: Albert Ou <aou@eecs.berkeley.edu>
>> > Cc: <linux-riscv@lists.infradead.org>
>> > ---
>> >  arch/riscv/include/asm/bitops.h | 5 -----
>> >  1 file changed, 5 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
>> > index f30daf26f08f4..01db98dfd0435 100644
>> > --- a/arch/riscv/include/asm/bitops.h
>> > +++ b/arch/riscv/include/asm/bitops.h
>> > @@ -23,11 +23,6 @@
>> >  #include <asm/barrier.h>
>> >  #include <asm/bitsperlong.h>
>> >
>> > -#ifndef smp_mb__before_clear_bit
>> > -#define smp_mb__before_clear_bit()  smp_mb()
>> > -#define smp_mb__after_clear_bit()   smp_mb()
>> > -#endif /* smp_mb__before_clear_bit */
>> > -
>> >  #include <asm-generic/bitops/__ffs.h>
>> >  #include <asm-generic/bitops/ffz.h>
>> >  #include <asm-generic/bitops/fls.h>
>>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> Thank you.
>
>
>>
>> Do you want me to take this via the RISC-V tree?  I only ended up with patch
>> 1/2 in my inbox, and I probably shouldn't take both.
>
> I expected this to go via the RISC-V tree and 2/2 via the H8/300 tree,
> but really no preference from me as long as they get upstreamed. ;-)

Works for me.  I'll take this one.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
