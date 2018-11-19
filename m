Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163ECC43610
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE0CE208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 16:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JcFdGlOQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B/L0wwy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE0CE208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Bedq8xVTIXRenZrPpFdBvwrdnNJuj6wDKfTkeTqxfoo=; b=JcFdGlOQt2tl0Rr08iRNx0dhj
	9qLCv/hpBc9TV3P1Yv4WYsL31/vOcRwyuM07kzm/06MOzmoQhq/WVO/RgSATMdMsU5iAI+RodU0JP
	rqaq8TMU/eOFo2uAwl7doFaPK1hxKy5ZRsOoFjaZTVodf9cRbnMRbbPcT0gG3YgpxPjjgaHvVi7eN
	hmlDEhDtJrTsusqsaCvC10Irv+F6eHF2cDhg9Xnlt0bMLnhWf9t/0VatIBz7rpAh0XdCLkLRu77Em
	q66FlxOq0fr6+mWticJ5nSj5hP8RqphoGrg5Zw9RRd1d1dk8rZmnsX+mB8XVxRcePl3wzjvKvuGbC
	g2wFYkcIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOmo1-0007Ye-LK; Mon, 19 Nov 2018 16:53:49 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOmnz-0007WL-BL
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 16:53:49 +0000
Received: by mail-pl1-x644.google.com with SMTP id e5so4826986plb.5
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 08:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ttZHNaBnbF4lntgoxBzHeh1qXjFVZdLtS6IDRkan10U=;
 b=B/L0wwy+dn5vG7fJT6SsYdHfRWRPp8b15m3T12pcYKj2IKGP2gNyt+NwZglKJRldb3
 4bsOoCOwkcU8ufzTG3flJg44d/ei51J0PbL900IvIbL4JB7T9gCmHc94YMXVh9E5jGP6
 YK7YMDZUkjQl+GcEpF3OOS9nKAXYh9WgLUc+X+k0nRb/b1/cXGakwgNYRDNJAIt+5mLO
 vqEPL3pby20Yf7ppz0lJxMIv/O0KiTFpO9p1N6dT5CH4VsIxKN8tniHAIF7D5jpvKJjm
 aT10/GFiEiUnGAlvjMfwxOVDVSdsBeKsYV5JSSzY4iHWNxCZ84A+9ERQyPbcGcaS8exB
 yyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ttZHNaBnbF4lntgoxBzHeh1qXjFVZdLtS6IDRkan10U=;
 b=k0RWzWeuAte4mZTFxQjNyAbPwMfvR1CCC7J0A+9PY24mgiI1vSAr/+BBy8Kb44oaAT
 AqtqJ37fkEpQ2MIzmVSzsVOpgWwUWFj68bQJxJ6suPuGtCJUwfuFss/ag3SGO49I1oNc
 pL+hyA1zExXUCcz9hB4oHjEi5zQY1j2/JvRuQEosyHKfaiO0w1xqpfXuC5MiMdV1hFe1
 MDn/Ej/tmbrhImhI0eeWFoxu6KJEVuJ2++EbZTjfsMqQG4VhYuYGWdbEOyEAabM6fInq
 WXucozqYKvxwxzTqIdjIXAxmktXIg1jvLYXYCDMf6YmQxHD+EvZwdPvm0EkomCxDwJct
 2lyg==
X-Gm-Message-State: AGRZ1gKac54aGlIjhYxF1YIAkjEdp/RsR4xucHCHd1nWrT3rn79M5h41
 OL2xyNybwKKBO/+IlJzRzEKPTQ==
X-Google-Smtp-Source: AJdET5em3zKbfoXv8oC8+p3p6i+9Vhm6QtVoW5kPLxknBqqopSyOoNFN4nTmRHB2EWBH1v/hs98OKg==
X-Received: by 2002:a17:902:6b82:: with SMTP id
 p2-v6mr23315505plk.50.1542646416393; 
 Mon, 19 Nov 2018 08:53:36 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u76-v6sm59747963pfa.176.2018.11.19.08.53.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 08:53:35 -0800 (PST)
Date: Mon, 19 Nov 2018 08:53:35 -0800 (PST)
X-Google-Original-Date: Mon, 19 Nov 2018 08:52:10 PST (-0800)
Subject: Re: [PATCH v2] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAOesGMhgBxu+L-R5OaEdBjv4jGSY3AnB9LqaKvWKKUgEKBabjw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Olof Johansson <olof@lixom.net>
Message-ID: <mhng-b667387d-ef0f-45aa-8e22-ed828d410161@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_085347_385304_D0BBB735 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 david.abdurachmanov@gmail.com, linux-kernel@vger.kernel.org,
 marcin.juszkiewicz@linaro.org, linux-riscv@lists.infradead.org,
 linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119165335.zADeY5b9dgOAbbkc5TgDuU4XajnORD8Ot1sI1awfnGA@z>

On Fri, 16 Nov 2018 18:39:45 PST (-0800), Olof Johansson wrote:
> On Thu, Nov 8, 2018 at 11:02 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
>>
>> Marcin Juszkiewicz reported issues while generating syscall table for riscv
>> using 4.20-rc1. The patch refactors our unistd.h files to match some other
>> architectures.
>>
>> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT only for 64-bit
>> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
>> - Adjust kernel asm/unistd.h
>>
>> So now asm/unistd.h UAPI header should show all syscalls for riscv.
>>
>> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
>> generated asm/unistd.h UAPI header thus user didn't see:
>>
>> - __NR_riscv_flush_icache
>> - __NR_newfstatat
>> - __NR_fstat
>>
>> which are supported by riscv kernel.
>>
>> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")
>> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>
> Acked-by: Olof Johansson <olof@lixom,net>
>
> This fixes the 32-bit build error I'm seeing here as well. Palmer, it
> would be nice to have 4.20 compile 32-bit kernels still.
>
> Per builder logs:
> http://arm-soc.lixom.net/buildlogs/mainline/v4.20-rc2-133-g1ce80e0fe98e7/buildall.riscv.rv32_defconfig.log.failed,
> actual errors are:
>
> include/uapi/asm-generic/unistd.h:247:29: error: 'sys_fstatat64'
> undeclared here (not in a function); did you mean 'sys_fstatfs64'?
> include/uapi/asm-generic/unistd.h:249:27: error: 'sys_fstat64'
> undeclared here (not in a function); did you mean 'sys_fstatat64'?

Sorry, I missed the v2 here.  I'll include it as part of this week's PR.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
