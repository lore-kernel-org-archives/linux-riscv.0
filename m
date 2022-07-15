Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A68C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 03:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Za0dRju3gze19MFZB+yq2VnKB89i1TF7dDw+vtFJvrc=; b=cQZLHh93OwqlFN
	nwr7XL1hqdlxXqG5H/RXDwTEAQvChgtnjX6BdKmGMbtkC1xQR/85+ZlBFieZ7zQ9eZs8k8EYDfTxm
	OKMHmE3o/Ktq2w9MpAoUcTJ2xAtn20BA61CS4EWfDBXuDICq2P9BDubDXxfpblbUsiS5X8UJF1QXJ
	uwbaZnsc419rT3+vL2wgY2aSByu4LEZKKSFbFZI3ffDvR9/WPWMCr8hbcFVVjoCUh2EECcI8aVmpe
	R2YbDFpYyQnd3R4g7I0yZMomFUfkDXTfylUdiTx5ij2/pXfMxsnpJ5Dc/S5jXZsnhhEZM3Ujy4Zd4
	2PCbOeqxQjSyW0ehEp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCBlV-003p7z-TS; Fri, 15 Jul 2022 03:13:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCBlT-003p5d-TC; Fri, 15 Jul 2022 03:13:17 +0000
Received: by mail-pg1-x532.google.com with SMTP id 72so3311021pge.0;
        Thu, 14 Jul 2022 20:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0kNvzHNczTALecfT9wto6CsS50awskOSoxCbfvaNPgc=;
        b=d6rOttoave+cYYycQLZVtn7+6/EvvZMoC4KlEKnu5+Iy0CvIZB6RZvM+yDNYgjVsg2
         zExWP1Kt2mvHL2caS42uLQwLfFdIGT+vt+VNkOv6EFVEz1IJ1Ei1z/SUwomvWvL9yqs/
         LsfjR3vwcHDm1bfvDdBsjVXVCIzYFoJ6KMcatcAC61WXc2/vMcOjiKCXnv0z+ZYpPW1D
         29300GYk48m1QvWYlTwrWUJ2ga8Ap1QJw6DN92YdxZnF6aT4PwJr+48L7OzWyifSHnIo
         bBliGjA2A7iI1JHvd2yG0VTITazqxx3xOm38zhCb9ZIUiYeXEPs2TlvdcILgJvPCljIq
         R2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0kNvzHNczTALecfT9wto6CsS50awskOSoxCbfvaNPgc=;
        b=rNQXWA9zUhyoe5NcCKpnQ4EeEa9XPISo5RyHcjcTB42fr74jFGy0DaoU7p8JFmatPl
         mMPsdoUi9itopTzM0fmztEAfcqnXbSLtLvqYzZfBsRqCJzhQyq4GYRWARtxl81egBqYd
         qd7j8svyx996AU+O7jL5Zds5kZFC9vpeQTt+uFs6QMzp16FMjUb8xPtdFszpa0s14oU3
         kYRSjFTrU6CEMpereUZjLMKxHXrbHcIDOvlLpwsKHZU+Z6OZGD2SlSJXetVck2GoVGRj
         phc40CdXELmXRa2u25aCzkdQMSwiECvylmcj6zoGyAXUIpKc/sccV5Bdbbdm5AhkrC9K
         PA2g==
X-Gm-Message-State: AJIora9mcFk4w2P74kTARGvrbhQvoZ0yO9uCKOnyF5/os7n4+p4Cl/c/
	PXpKiuo+NXIJ5SWK4Sa+oHs=
X-Google-Smtp-Source: AGRyM1vK5uqkhNs5DYoiUnUKiOfj2RRKOpP4xHProAEOYr/w1Br1ZQPpNcitPwDkSe+/qgFCXMCFZg==
X-Received: by 2002:a63:2051:0:b0:412:6d61:ab0a with SMTP id r17-20020a632051000000b004126d61ab0amr10627004pgm.52.1657854794876;
        Thu, 14 Jul 2022 20:13:14 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id d12-20020a170903230c00b0016c6a6d8967sm2236563plh.83.2022.07.14.20.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 20:13:14 -0700 (PDT)
Message-ID: <d95d1afe-655c-3526-0c7e-949dfad8c6ba@gmail.com>
Date: Thu, 14 Jul 2022 20:13:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH V12 01/20] uapi: simplify __ARCH_FLOCK{,64}_PAD a little
Content-Language: en-US
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de, nathan@kernel.org,
 naresh.kamboju@linaro.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, heiko@sntech.de
References: <20220405071314.3225832-1-guoren@kernel.org>
 <20220405071314.3225832-2-guoren@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220405071314.3225832-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_201315_993234_6A5E0927 
X-CRM114-Status: GOOD (  14.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 4/5/2022 12:12 AM, guoren@kernel.org wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> Don't bother to define the symbols empty, just don't use them.
> That makes the intent a little more clear.
> 
> Remove the unused HAVE_ARCH_STRUCT_FLOCK64 define and merge the
> 32-bit mips struct flock into the generic one.
> 
> Add a new __ARCH_FLOCK_EXTRA_SYSID macro following the style of
> __ARCH_FLOCK_PAD to avoid having a separate definition just for
> one architecture.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Being late to this, but this breaks the perf build for me using a MIPS 
toolchain with the following:

   CC 
/home/fainelli/work/buildroot/output/bmips/build/linux-custom/tools/perf/trace/beauty/fcntl.o
In file included from 
../../../../host/mipsel-buildroot-linux-gnu/sysroot/usr/include/asm/fcntl.h:77,
                  from ../include/uapi/linux/fcntl.h:5,
                  from trace/beauty/fcntl.c:10:
../include/uapi/asm-generic/fcntl.h:188:8: error: redefinition of 
'struct flock'
  struct flock {
         ^~~~~
In file included from ../include/uapi/linux/fcntl.h:5,
                  from trace/beauty/fcntl.c:10:
../../../../host/mipsel-buildroot-linux-gnu/sysroot/usr/include/asm/fcntl.h:63:8: 
note: originally defined here
  struct flock {
         ^~~~~
make[6]: *** 
[/home/fainelli/work/buildroot/output/bmips/build/linux-custom/tools/build/Makefile.build:97: 
/home/fainelli/work/buildroot/output/bmips/build/linux-custom/tools/perf/trace/beauty/fcntl.o] 
Error 1

the kernel headers are set to 4.1.31 which is arguably old but 
toolchains using newer kernel headers do not fare much better either 
unfortunately as I tried a toolchain with kernel headers 4.9.x.

I will start doing more regular MIPS builds of the perf tools since that 
seems to escape our testing.

Thanks!
-- 
Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
