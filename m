Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645C1C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 00:08:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3086B20844
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 00:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FCcgqNyg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TQH6Na6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3086B20844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Wvd2Soa5TgKY33v0qrhnnXtGYiK9vY/w/WXyrvBJtPA=; b=FCcgqNyg2KNNN4r2UiqcoW5Lp
	mBoimWBNFySYQRDOJ5FvaSi43PZCjzdwrhRBZrGrNhDw+m2G3zTBlpy+0PlqsexwM6yWXhWULK9Gv
	r64B19V4aLrhm+FuJGTDckEkgqkUJwp/c7wcTT+IsBSgoIx12UmKQujJvBmMWKQ2njwoEbtS1Zh8F
	CvXcwEOkh3P8yzF3TUVuI0LIux580TNvAWzmg/4hRNQpppSXjgli9GJY2xf+oG0T1kqsmkOBRwbfC
	hMA7ViByXmkBz2GRL7qfbDYbkK+rZNy0XLixP95jtxFCN2sgjFxTp/R5OOKZ7949LRr9nWxJpd8Mi
	CeqqZmQug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKBOV-0000P8-4v; Wed, 07 Nov 2018 00:08:27 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKBOS-0000Nf-3W
 for linux-riscv@lists.infradead.org; Wed, 07 Nov 2018 00:08:25 +0000
Received: by mail-pl1-x642.google.com with SMTP id q19-v6so3989974pll.7
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 16:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hubmrFzQ0plWGuu2K62h+KATnuMFguTUWrWDDvxDlQA=;
 b=TQH6Na6j0dexD5BQKsAoXyU0XrjFqmJUGL4ucj2LeR4rD3SvMuwSqW2OcgThS5TNiI
 YElZoSnziQriuTFp3ZW4cPe5Bb5SNcph0V6iV9XfJeXCwFcH1G0b75yYtHveV/pL5jE2
 fsb8egP8nn0GxyFeg/O8PLEBjtcnUeb48fcZc6umcD9r08hYC3WJi6m4bmxPAtiDvPX6
 bK4rgg2b1Gv6ewHyXwNwh42E3Ud6aRcDhYoq4lF0J4KNfrUa5vjaQ3Rk2uqqUGlTMYVg
 Q98b0Bps6hhrkzchZJ/s4AdlMzdUzsMpsveymxH52vBxQapo5FAKUQ9TDh/tNe9ADj+a
 8DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hubmrFzQ0plWGuu2K62h+KATnuMFguTUWrWDDvxDlQA=;
 b=PMcIAUqqmxb8mdQwEL/mHGXZgMoKmdvVEe8rhMq6slhOOSdRbrpacppSxx2ItX2C+G
 IL+02peWg1FD4/pWo22iRciLFNTcyIgYl1CdHB3GrUTNtJhW29i8WsetMGQP3179oCMn
 BiB6g63onrUEXxzj1JKC5BMYjEpLso6nNUJCSjRkQngATEhCXwl3Mu2FoTTFCfZilZgO
 BNrNrIgehte/n8+hZx/BSAgos4rUfQ16AhmFl5BLMyV2U76XNvVWeyh1EFx1dVBo7zIg
 2M8HJPuiYURZiwZLDxqlrPGljqucixqQ9RPFCUk9Q410YcYoD+SWxoOcvKKn3OoX1lgY
 prgg==
X-Gm-Message-State: AGRZ1gKJO8I16QFxYDOPCy3V62mRMsobtihXRrp/U9WIN9CnnZWnnVgl
 Qv2bQGb/eni9dhh3yyG+LVrzjg==
X-Google-Smtp-Source: AJdET5dCNX5Km13vLHHBwP8jKdRGdL5LmAHk44e9Ozyk61W3YmhdBhYJIfeGJ24EK5AzMvNc6terYg==
X-Received: by 2002:a17:902:162:: with SMTP id
 89-v6mr28414420plb.293.1541549293315; 
 Tue, 06 Nov 2018 16:08:13 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a11-v6sm28378058pff.8.2018.11.06.16.08.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Nov 2018 16:08:12 -0800 (PST)
Date: Tue, 06 Nov 2018 16:08:12 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 16:07:51 PST (-0800)
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAK8P3a3JcztCSYBuu5ZJXaV83VNLv_1v3v-EKMR+tC1oOsQesw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-3c26b2fb-0c11-42f2-9026-1113b200a7b2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_160824_146779_4EEC7C86 
X-CRM114-Status: GOOD (  20.13  )
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
Cc: aou@eecs.berkeley.edu, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, marcin.juszkiewicz@linaro.org,
 linux-riscv@lists.infradead.org, linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107000812.Wboy3ZGvobpT2itlROOhX_jlyUOuQ2mmtMAbMM7k0ew@z>

On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
> On 11/5/18, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
>> Marcin Juszkiewicz reported issues while generating syscall table for riscv
>> using 4.20-rc1. The patch refactors our unistd.h files to match some other
>> architectures.
>>
>> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT
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
>
> Thanks for addressing this, your patch correctly fixes riscv64, and
> I should have noticed the mistake when I originally merged the
> broken patch.
>
> However, looking closer I found another problem with the original
> patch that your fix does not address:
>
> __ARCH_WANT_NEW_STAT should only be set on 64-bit
> architectures.
>
> For a 32-bit architecture, we only want __ARCH_WANT_STAT64 if
> any. For 64-bit architectures with compat mode, we still need to
> set __ARCH_WANT_STAT64 from the non-uapi file so we get
> the syscall implementation.
>
> If we don't care about the riscv32 ABI changing yet, we can
> decide to leave out __ARCH_WANT_STAT64 here, and require
> glibc to implement it using statx() like any new architecture.
> stat64 is not y2038 safe, and statx replaces it because of that.

Thanks for pointing this out.   A while ago we decided the rv32 ABI was 
"slushy": it can change if it has a good reason to.  Right now the only planned 
changes are the y2038 changes, which I consider this a part of.  For some 
reason I thought we'd already done this, but since we haven't then I think it 
should go in sooner rather than later -- that will help the glibc guys get 
everything lined up.

The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.  
That's progressing well, with one last blocking issue related to some of our 
floating-point emulation routines before we can submit the port.  This should 
give us ample time to line up the ABIs correctly so everything works.

So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.

>> Fixes: 67314ec7b025
>
> That line should be formatted as
>
> Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")

Yep, and I have 

[pretty]
	fixes = Fixes: %h (\"%s\")

to make that slightly easier for me to remember :).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
