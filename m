Return-Path: <SRS0=E7Bo=ZP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D5AC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 04:26:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A645420719
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 04:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHvgYtse";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="UXtt5ruz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A645420719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rG3M567oAD+2a+p1aprQFkODAOBTB87TZjMp46uvS+o=; b=qHvgYtsen8VbCz
	o75H/1Kw00x/m/uz0vgWlZwkIPiysWWY6L4uumv97LSzvjpnBp69YJ+Voe4MLIU6CIdFXlMEiZCJf
	krlCb6+xU8UK80+9aRx1vsBuiarait064xbNnOpy4BK0S2VgoOpkpW9CDIhH+F6zFnN3uE9rAr+Jw
	0JCejF8LmZ/z2azOP2HC6S6DtVpe4kefT/ksNidbiaGb7qwPxa5gUpFAqil5RlBF+9DwXBNZ0kETK
	pP+0kkTl1eHf6j3MfSVLsg6v7CayyeQX18O3cpwhh20ZZA0juXKEJzSPJCvT9gKQT/nUdh5GFXVPN
	9JwYsgoIMQFESFYwgzZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYMzq-0003GZ-En; Sat, 23 Nov 2019 04:26:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYMzn-0003G0-Hw
 for linux-riscv@lists.infradead.org; Sat, 23 Nov 2019 04:26:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id f129so8579014wmf.2
 for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2019 20:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x5vSWA7vo59HSfD1wB9OHpfd47dGzSgPp1svxey2yFs=;
 b=UXtt5ruzhXomYfpYP8oDylutdumHQfqqdrrq+QR/SpluW5+uWsbtMkFIIjVXVRidPF
 93ScDYn08Fi+aVtmFiuB60UHDwgYk3ygD5iosKR/MW4e9caV286VtqbBLF4tMkYuIqrM
 wLBr7w5QDG/GpgsEevljSAuN9r+5NVseGu+kaTQbL4ihGfjzW62VeDanlIs3Vb6gNDDh
 3XFwcNCeKecx5zN0MFYOsLA/q8htzdAUYlOFroQczD3jW8amY5a0G5Oo91oB6tOLeSk7
 xzo8KriEAdwpvDaWGrhIhH5evKIUHg3NTpuPIPctWlt4dfNtFNH2Iaca49JnDXM/cg5s
 XnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x5vSWA7vo59HSfD1wB9OHpfd47dGzSgPp1svxey2yFs=;
 b=VLrzSlq0G1SIbpkoigeflqwLI+AL+j0uzGnbjq1F4dz2QyFldbz14/+8xsxFw4qqmK
 KdOrsK8sUin+qAM9DBb26UFyt0cDtUrwjmHalGwrR+exzJrGlVSpF/8GooPNSwU7Tm5W
 AkjHUau1U31hD+dvOMyYG5madMz2Y7bS8XVFjvIgnVrUFMQ5MTstsS5mdnMy3PZVfAMh
 w46NYQrqOl61uruoG9FFWf7NhzdkwjvxE7G7GKcPZzS5FxXySCAQPUnVym+FyLSyBYTH
 yyEOQVrX+Ce8WV4mxL0X3A9lpmJsKaUH0mOCVlLl47Dh9sRdhgi6LvsH+Axdm/MbEIIu
 0pKQ==
X-Gm-Message-State: APjAAAXTuQ6ftl9DvLh5HjTHflpIf5o2FNNyyaQAS2cLYM0rqkO8zIZ8
 zgSAP1neVWEDKMwitT/2EcyPaWBm9d57xRAoofCOsQ==
X-Google-Smtp-Source: APXvYqy/O8sXPtPirjnApS0WnptOuyrSp1KWPyKKJIpfJTjxz7oHQBkjYV+BCEmsFk3abTPFK+LSiwxkj3t4U79kUV4=
X-Received: by 2002:a1c:30b:: with SMTP id 11mr18226300wmd.171.1574483165276; 
 Fri, 22 Nov 2019 20:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20191122225659.21876-1-paul.walmsley@sifive.com>
 <20191122225659.21876-3-paul.walmsley@sifive.com>
In-Reply-To: <20191122225659.21876-3-paul.walmsley@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 23 Nov 2019 09:55:54 +0530
Message-ID: <CAAhSdy1j0z09tytn0dFVBc7AAVo3EZEJwXRKUFJ9RWbok77bMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: defconfigs: enable more debugging options
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_202607_597604_6D74CC68 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 23, 2019 at 4:28 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Enable more debugging options in the RISC-V defconfigs to help kernel
> developers catch problems with patches earlier in the development
> cycle.

Lot the debug options enabled by this patch have big performance
impact. I would suggest to have separate debug defconfig for
RV32 and RV64 with debug options enabled instead of enabling
these in regular defconfigs.

>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> ---
>  arch/riscv/configs/defconfig      | 23 +++++++++++++++++++++++
>  arch/riscv/configs/rv32_defconfig | 23 +++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f0710d8f50cc..e2ff95cb3390 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -101,4 +101,27 @@ CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_FS=y
> +CONFIG_DEBUG_PAGEALLOC=y
> +CONFIG_DEBUG_VM=y
> +CONFIG_DEBUG_VM_PGFLAGS=y
> +CONFIG_DEBUG_MEMORY_INIT=y
> +CONFIG_DEBUG_PER_CPU_MAPS=y

> +CONFIG_SOFTLOCKUP_DETECTOR=y

This one is fine.

> +CONFIG_WQ_WATCHDOG=y

Is WQ_WATCHDOG as debug option ?

> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_DEBUG_TIMEKEEPING=y
> +CONFIG_DEBUG_RT_MUTEXES=y
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_DEBUG_MUTEXES=y
> +CONFIG_DEBUG_RWSEMS=y
> +CONFIG_DEBUG_ATOMIC_SLEEP=y
> +CONFIG_STACKTRACE=y
> +CONFIG_DEBUG_LIST=y
> +CONFIG_DEBUG_PLIST=y
> +CONFIG_DEBUG_SG=y

All these debug options reduce kernel performance
in a noticeable way. Please have separate defconfig
for these options.

>  # CONFIG_RCU_TRACE is not set
> +CONFIG_RCU_EQS_DEBUG=y
> +CONFIG_DEBUG_BLOCK_EXT_DEVT=y
> +# CONFIG_FTRACE is not set
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> +CONFIG_MEMTEST=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index bdec58e6c5f7..eb519407c841 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -98,4 +98,27 @@ CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_FS=y
> +CONFIG_DEBUG_PAGEALLOC=y
> +CONFIG_DEBUG_VM=y
> +CONFIG_DEBUG_VM_PGFLAGS=y
> +CONFIG_DEBUG_MEMORY_INIT=y
> +CONFIG_DEBUG_PER_CPU_MAPS=y
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_WQ_WATCHDOG=y
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_DEBUG_TIMEKEEPING=y
> +CONFIG_DEBUG_RT_MUTEXES=y
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_DEBUG_MUTEXES=y
> +CONFIG_DEBUG_RWSEMS=y
> +CONFIG_DEBUG_ATOMIC_SLEEP=y
> +CONFIG_STACKTRACE=y
> +CONFIG_DEBUG_LIST=y
> +CONFIG_DEBUG_PLIST=y
> +CONFIG_DEBUG_SG=y
>  # CONFIG_RCU_TRACE is not set
> +CONFIG_RCU_EQS_DEBUG=y
> +CONFIG_DEBUG_BLOCK_EXT_DEVT=y
> +# CONFIG_FTRACE is not set
> +# CONFIG_RUNTIME_TESTING_MENU is not set
> +CONFIG_MEMTEST=y

Same comments as above.

> --
> 2.24.0.rc0
>

The debug and trace instrumentation although helpful
in development comes with performance overhead. We
should be careful in enabling debug and trace options
by default in defconfigs.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
