Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC18AC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 21:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885EA2147A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 21:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QZQlZ9e0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FlgxZkii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 885EA2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=L2FUYwOCB9IpMiy1yOd7ODAETQc79UHwNOcmbkScJao=; b=QZQlZ9e0/I8ncABD2RDdrlOtE
	I9ZonrvM2MU2m1rTVzI/Yh3+zEwhTH/EM77uV8Mo1gEd+6XYWVpmAXzj+zcY6NJByKrC/orsNjhss
	ES8kWPQq1XFCS96XjCNrJZHz+VSYSYTNqfbP+G3HvI0FnBmhjl0DutWjJ6df63SDn3VHxYK6j6Eh2
	VOq1XRYospjQav6k48d0AqGNON9NDWWTzQPbxybqAqW2O9qn3r0PGc3M0oi12StrK+j7beN+m/coF
	suGGHTBzGm4hPQq0tLMdUWC7KXasDtF2yWZOJjHfCk9sN6jwtKEwhZM2MA3oqAWAIOPbZ0Th8lXEd
	RrZ/ST22A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwDMz-0000OM-02; Tue, 19 Feb 2019 21:56:05 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwDMv-0000Ne-60
 for linux-riscv@lists.infradead.org; Tue, 19 Feb 2019 21:56:02 +0000
Received: by mail-pf1-x441.google.com with SMTP id h1so10841109pfo.7
 for <linux-riscv@lists.infradead.org>; Tue, 19 Feb 2019 13:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zwftrmOanSdXzGc8vLBd3uz4NYesZr6TcF6+HO5ue/8=;
 b=FlgxZkii1ql/ihK9/mTDXJZxMuqUGxQwjTuD6Js76dnbctgvl2vSAe73VTxWX0xlb7
 BKd877LCMLLdk6LW8f4WKDe/gS9oAlDjgZYEe1IMhhBkQXAL3XEUweP90fm9CSEfFhzZ
 BCv/zekDCVH2tH45qJ0Dmo3Lo8Q17+hY7POGQaiA9MhIacwSqf8DXZxWUGDzGrCo7n4P
 TdJEoZjKEOWaP6NY6P5BVye0gnsh9Hwh8MNOS0MNih3UBfYeTrenAdbJzcn6HJIrgM9Q
 fKIG8nwg8X6c+GdKIPT7yl4iXDtkQAxswC5ygIPe8949hzgOefWv54XIb1CmDmkhQUkx
 Ss9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zwftrmOanSdXzGc8vLBd3uz4NYesZr6TcF6+HO5ue/8=;
 b=N2YUD6X/D1TWwtXvm+0lT86VqCEIYvgkdX9kumjUMwhRGHbEJ9L/T4IUGybzsHL2PT
 KOhwbOayM/+h4ij5jQP8bSDS1vN97NmVTyDSOGMANSQvb4WVVE8q09g2GX0tM4HUyP0V
 tcMXGGo25mNRLPTximUufetRuPVVYQ1eeM0FLyHhyJO46PLRTzHEedHCyfrca15Z0J7S
 4HZIJ3z7u+6xjvIGEc6LlY242wrwPa3OQDHDty/OoOWT+L8rAvxnnJnDBCT3rB+Ct+Pd
 vacrQYyZc+v/nPTUQ1Zd9UV5yykFxVNDGWk8Or4pMbM2+TC+cnnlBX9/dvCK/tnyQiWX
 OE4w==
X-Gm-Message-State: AHQUAub554VF2ADCjP+hvnhN2D4IRfBN1YhLQS2trenBXkRqk3xig2Nu
 fcaNW+lNuN7BmZU/8OuNhnuWup5G9hE=
X-Google-Smtp-Source: AHgI3IbO71j/yAEHBSC/UTbub00j189AuzZZ0wQvGAVS08M3quqG9okfN46WWJ73A48emt4TkHOIYg==
X-Received: by 2002:a63:5b1c:: with SMTP id p28mr25442696pgb.73.1550613359530; 
 Tue, 19 Feb 2019 13:55:59 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u2sm21380550pfh.134.2019.02.19.13.55.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Feb 2019 13:55:58 -0800 (PST)
Date: Tue, 19 Feb 2019 13:55:58 -0800 (PST)
X-Google-Original-Date: Tue, 19 Feb 2019 13:55:45 PST (-0800)
Subject: Re: [PATCH 02/11] riscv: remove the HAVE_KPROBES option
In-Reply-To: <20190219151759.GD4121@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-a73ea6c9-683c-4ee0-991e-24a6608b6887@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_135601_323381_65B36A82 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
 yamada.masahiro@socionext.com, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 19 Feb 2019 07:17:59 PST (-0800), Christoph Hellwig wrote:
> On Fri, Feb 15, 2019 at 06:32:07PM +0900, Masahiro Yamada wrote:
>> On Thu, Feb 14, 2019 at 2:40 AM Christoph Hellwig <hch@lst.de> wrote:
>> >
>> > HAVE_KPROBES is defined genericly in arch/Kconfig and architectures
>> > should just select it if supported.
>> >
>> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>> Do you want this patch picked up by me?
>>
>> Or, by Palmer?
>
> Given that I don't think I'll have the rest of this series respun in time
> for this merge window:  Palmer, can you pick it up?

It's on my for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
