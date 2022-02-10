Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E190EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=teOQF4UGQUigtuojh5R+eNYcskA8cxMzKQ5nJxQE/PU=; b=KRItjBHbbJO96lT+mYjX1+rt+f
	ULECa5Ya8txz8Oxdg21zt5bTA445nALXU/aTaWiEtWEcOIPDQaQeRH71Y2E32VwXsJWqFfWrfpdid
	B1NtrMkXUnhq4p8yZt2m2c+lEv++EkufDM9dyYlctn8C3N1uL5Qq7mmhVBLNyJepPa4UmvAd6tMcs
	qhtbf2bS7L6GDa9upvgh8fo//4WmYBHCVydDrJdTiI0QT5GQLM938P8vDkehBGDpAF4oXTIiQrw3/
	WoWZ/4jmug52aQ2GEHW0vUmX2dgsxYoDz8jVkR9A6Wr7mPy+kWvTVSymwTGafmyeDurhgozuC9LNz
	SRP1yYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIDQi-004W5f-Jw; Thu, 10 Feb 2022 17:40:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIDQf-004W4h-9t
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 17:40:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id y18so2427507plb.11
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=myBRZosts+JYJ5LwNGhf9v9p6lhlpsXAJiru0hFcO1Y=;
 b=aAjlLmerWaHRMPPmnTh/eMVQdksaqsQCPlhAeUmrvIzXcASlboU4inkIhxwnKYimuX
 0GK/6q/yCs/SCXeQKr4c7hI0xr8pT1gDiF1qkPN6HK85ueijua7rkyxNcWmxmbtGYkA+
 XyJijfGX6awchUj1c/r4uFmj8MGuCbhp6wB+uCEp3dtc9bsPBl4JFWBOa1tMRs0P/a9z
 U9lvKPUmipoEAqvwv6YU3Ne/vdwUqpn13CQSKM0n7Wf+QK2z5UXLsoVb60FWIBqEdWiG
 JdqxpprYHd09U2Ql3L5jib441sfzNu0TC/uX+ZPBGXQWJPLCk4tTLMoEzalbHSFlihR6
 nw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=myBRZosts+JYJ5LwNGhf9v9p6lhlpsXAJiru0hFcO1Y=;
 b=YJjn1tvLzAN66kNRu1vUY0e6wissUBa6mC6Y5Wp6GIAMkdfALw+0yJRJ63JirHtTFW
 ARWzCeuso0NZK2PSantkBeUdZVHrnhTdAniFHhCzOtcWoU6Wz8+epCgs7O7eXtDA+DIU
 5oatgvCiyg0pTZRIDEO89Zb9DCdtgn9KSd/pCw2685hGBMxI2fsMtmLPVqO+JkEM9owD
 HA1bvTB1/BRwUiMx5GXBqdMoGbExGg2LDyzfqJArieSb1CrLVK2KXfXU2CQVpPkQHD7f
 uvr1Xv+OIJLMxy5pdEmIUBnEbTSUmHchQbig0Q2g3xzcNOgShq36UWYxOfp3xa378ipH
 X30g==
X-Gm-Message-State: AOAM530NJo5WvEtY5itljwpxZ0p2HAwG/Ie8e4W1am7jJzIYELtHEbeR
 wRYb4x4PUzbhOC+K2ca6znGJBw==
X-Google-Smtp-Source: ABdhPJxeY8H0Yf3skfinMnvJcXTVOjBVIkFb5XNq6b1nnadRiC17Tlj1rfV9YuSzkMcJtKm+OiXkig==
X-Received: by 2002:a17:90b:1b46:: with SMTP id
 nv6mr3878148pjb.143.1644514823391; 
 Thu, 10 Feb 2022 09:40:23 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id g5sm23970235pfv.22.2022.02.10.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 09:40:22 -0800 (PST)
Date: Thu, 10 Feb 2022 09:40:22 -0800 (PST)
X-Google-Original-Date: Thu, 10 Feb 2022 09:39:36 PST (-0800)
Subject: Re: [PATCH] riscv: fix build with binutils 2.38
In-Reply-To: <20220126171442.1338740-1-aurelien@aurel32.net>
CC: linux-kernel@vger.kernel.org, aurelien@aurel32.net, stable@vger.kernel.org,
 Kito Cheng <kito.cheng@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: aurelien@aurel32.net
Message-ID: <mhng-f5101f2f-eb08-4e20-8cb3-b7d267ba25bc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_094025_428432_AD7AC850 
X-CRM114-Status: GOOD (  21.34  )
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

On Wed, 26 Jan 2022 09:14:42 PST (-0800), aurelien@aurel32.net wrote:
> From version 2.38, binutils default to ISA spec version 20191213. This
> means that the csr read/write (csrr*/csrw*) instructions and fence.i
> instruction has separated from the `I` extension, become two standalone
> extensions: Zicsr and Zifencei. As the kernel uses those instruction,
> this causes the following build failure:
>
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>   <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
>
> The fix is to specify those extensions explicitely in -march. However as
> older binutils version do not support this, we first need to detect
> that.
>
> Cc: stable@vger.kernel.org # 4.15+
> Cc: Kito Cheng <kito.cheng@gmail.com>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 8a107ed18b0d..7d81102cffd4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -50,6 +50,12 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> +
> +# Newer binutils versions default to ISA spec version 20191213 which moves some
> +# instructions from the I extension to the Zicsr and Zifencei extensions.
> +toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> +riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> +
>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>  KBUILD_AFLAGS += -march=$(riscv-march-y)

Thanks, this is on fixes.  It's CC stable, but doesn't have a "Fixes" 
tag -- I did that on purpose as this isn't really fixing a bug in Linux 
so I'm not sure it's right to point at a particular patch, but I'm not 
sure how that will play with the stable tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
