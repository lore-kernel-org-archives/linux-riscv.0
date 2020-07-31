Return-Path: <SRS0=O7qi=BK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C66EC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 03:58:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 069ED207F5
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2020 03:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BL9/5K+j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="GXb0qJsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 069ED207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=GnYRLGUHLHtxoe431siYLLRJahpMmT5TVdNwNsuo2ZY=; b=BL9/5K+j/6z2eAdLUqynCmBbk
	uDeaZwNlAjYqhE30ySZByhqU2u/2Skn+JkDBYSVo+I28v+lgjCplEVR3AMBq8lH5XYaprph5SsVf9
	Fugl2OHHfiF5h3LwTJxCoTZ+k2kmsJzlcbrpkP4Mh5HEhRKDoFQ9XEB/NBkRlAUsNME6gd1UocsS6
	n8s3FIqW881NOxzEhKFh+zxyxuf1NHE1XTmEJZnYqnHMpG2dfI0nMl7J1soVgp5k6toGsFw3IYN9d
	tFePflxYCau/QzhPaUuQF7nmrJ1q/ro/3Jec0P36jxmJcjhMYXJ9rpDXXUbAHcojWTrE7xE68JSqU
	OLd4R0P2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1MBY-0000UJ-3n; Fri, 31 Jul 2020 03:58:20 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1MBV-0000TX-4x
 for linux-riscv@lists.infradead.org; Fri, 31 Jul 2020 03:58:18 +0000
Received: by mail-pl1-x643.google.com with SMTP id w17so16155236ply.11
 for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2020 20:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NQzoZlQ0/4rcsXbnjkrazIOlBy8Cl4Z03XZanrhAWT4=;
 b=GXb0qJsEdZIWDVJczeo8n5pUfF7eJnHaMcDJwtR9SMpY0GDgWvSUT4YUW9zoRTzlCn
 QvlvdEddW7b/MJXBnv895+A+plHP7GNSn7lPTYqWebHLNiC8qEEYHQptFUbMnIjKhK80
 S5DC1NIHHAWQFZnjmIRYHq5bcByDOn2dw83S+GFoKD4o2JB0+gfLspFgo05goaDYbWi4
 yc9cjXmIWRcRzPQre7FcJIEr9cuFpODva56wOOtibq93MHdZu6GrvIQJFusAQ7FC9lkL
 Is42pstzsWKWgEhgYSkocWERmtsEc/1Leb3MxHXhDAT6+bZK/ItcdYR/MSTD3eIfS93R
 9lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NQzoZlQ0/4rcsXbnjkrazIOlBy8Cl4Z03XZanrhAWT4=;
 b=lz21Ik61tGO/3N6TfJpBSXNaYixeV0PPjP38cra9DlQ3AEs+ivSS0+kht0mWAGB3c1
 qx37dMgQmQczEQ29VHegDzNRc+RB5nao1hjxB08ClAe5dwvjYkXyqdqGjOYq8c5ZQ7l8
 1Valm5SsKumkSwu23855WlRlgIwn9iwmmB6S1RtAxnWzIzdEbxxUaN3efy4956Dh6+eH
 ailbei44sf5aiwo/eeoIqWmi7Hi1gOuAGOxvlYEOSoiMUjrhOAFIdT7X9Z+RRmd0k/Lh
 Ks5Yv7BnEuWdaIE+RTFxCsh3y4yPbUjEzNqrs/jyzTRv4dQZFrq+b2y4m9TVJRFJ63Qk
 g3HQ==
X-Gm-Message-State: AOAM5317pgW8pLNkc7sxXsCHSFO+A3SZmdLUUD0OnZNMCALUMUaaW8CT
 GPYAHpoTs2YNASdtH6+4M7OdhA==
X-Google-Smtp-Source: ABdhPJwx4UF7SIxaiVMvWevP/FtV+ONc8tTa7tqCzifdRhzZmhC8JSkLR70alptCFLbNO9czCaOBzQ==
X-Received: by 2002:a62:fb07:: with SMTP id x7mr2032496pfm.252.1596167895228; 
 Thu, 30 Jul 2020 20:58:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id fh14sm7076579pjb.38.2020.07.30.20.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 20:58:14 -0700 (PDT)
Date: Thu, 30 Jul 2020 20:58:14 -0700 (PDT)
X-Google-Original-Date: Thu, 30 Jul 2020 20:21:59 PDT (-0700)
Subject: Re: [PATCH] riscv: disable stack-protector for vDSO
In-Reply-To: <20200729075129.11538-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-ffa63ba2-4220-4caa-80aa-5eb42f58010a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_235817_244590_51FFB265 
X-CRM114-Status: GOOD (  17.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 29 Jul 2020 00:51:29 PDT (-0700), tklauser@distanz.ch wrote:
> Currently, building the vDSO with clang leads assembler errors like the
> following:
>
>   /tmp/vgettimeofday-1ae0d2.s: Assembler messages:
>   /tmp/vgettimeofday-1ae0d2.s:28: Error: bad expression
>   /tmp/vgettimeofday-1ae0d2.s:28: Error: illegal operands `auipc a2,%got_pcrel_hi(__stack_chk_guard)'
>
> Disable the stack-protector for vDSO to fix these.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1112
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index c8c9e40023c6..478e7338ddc1 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -16,6 +16,8 @@ vdso-syms += flush_icache
>  # Files to link into the vdso
>  obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
>
> +ccflags-y := -fno-stack-protector
> +
>  ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
>  endif

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
