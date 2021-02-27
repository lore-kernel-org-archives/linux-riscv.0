Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA406C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 05:29:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D44964EE7
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 05:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D44964EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=pUGkj9tUHdesiNRRnIU1yFtRgnrGBC/M5Zb/Gf3yEGI=; b=iWSGZVXVsyivYyukWPrt5e0ys
	MSBGx3en9/bL4XEEOrXH9vfHA6kdJ9kUYCSU6nev55Z2tWZYU+LI5b1pgRgAUKdzwVF2MszA4nUQD
	MGoWdkCEjVzONRuWxGfjTUOqg0dbgtBY2GVVzqZs1BbVoanMXjBX3MNAh/jau2eKUBuugfTUf0JeF
	qY1R4++Gan+qszo7Rr90tSiV8oNYcxGOxIIZzzvDIOVm7kmTpUKnh30o319Xa+ORyIfESWQU93iB5
	m+wS+ifJkrZJdruXcXYmjeutYUdbt47GnhsnGPsQIv+9uMA/9y3Ulh2x2cSeTQcaEfSEH0We52hcR
	NgQ0VDomA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFsAJ-00057D-Rk; Sat, 27 Feb 2021 05:29:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFsAH-00056j-IX
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 05:29:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id p5so6418534plo.4
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 21:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FOIh0C6p3H+/JCgzGYGGAscTPrZ5Gvg80ujzoULD2s4=;
 b=0OqHQexTKfdmlFKyKJDt1xoZPVDLkTmpgkslAOzpRmyTvw07KLYhfbbDP5Za2IygZC
 nGrGoARGHxBYp7sYhQItAp+OC/f51zDLMBsHeNZd2vnlcyEr/b37JCjk0s81jwjHCJa8
 u/kJ5kcv8MF8+Jae9QAZtAjqYV4LiARUkaG0m3ZoV6ISCPaXlEVzKTiwPTyJoZxYq669
 vkWy8VU+UxQ1O6UwMdgFyNUC9JMeVPzlehdq2OJZ1SAeODK81UXH8iePMPyNJTgN/V2f
 Lits+tZIaMnA8IpR99Y60K8zQ+3UYxiC/28YTZWTEzdYLVE76JxTrJRKaWt899TDkq2X
 OzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FOIh0C6p3H+/JCgzGYGGAscTPrZ5Gvg80ujzoULD2s4=;
 b=eC1Dsdu7MbQaxu/qf85QV2qMx7FEXkgJDrYTqjWW27c7TxfJ6NBp5vvzlWSXmEstOC
 CZ02AVOz4hUf8lWJGi0fI7E85uczLXAW5xvpRLSfxX0KfHMvTCvb0sgmtJL6ioan61NG
 bOfjNllAvzPcZLLJ2K607BzJTbrqg3XLvJ7qxkSE4RAPBnZHqso5fQGbeAajBTCGWfJa
 yi5fXzS5cZcG2zCbWbdCMWKkE7RK6zQ63G3sZhdbOuPDohh+Ih1+o4bxkS+zbS6iUOnG
 iv0jg/jnRC2pQY3BcGM10LbCfTJ9OX8ZGhSmFBtmcQmD3g1/uhcwFE11bYsU8XxS1m4v
 3JxA==
X-Gm-Message-State: AOAM533MQLHIc8vJ1uzd1USwJnsdIjGvAdhqPZ0djyqN18uBdQxjGz8l
 rRh1HenKVkcvk9g5tMFMxGwOUg==
X-Google-Smtp-Source: ABdhPJx1hFmgkOpRQCZvfZEJZq9FZOaO4yip8ci844PJDkDteECpwN8ig742xVNy+hIN+Ksyuuyidg==
X-Received: by 2002:a17:90a:7104:: with SMTP id
 h4mr6561000pjk.189.1614403755369; 
 Fri, 26 Feb 2021 21:29:15 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q128sm11246093pfb.51.2021.02.26.21.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 21:29:14 -0800 (PST)
Date: Fri, 26 Feb 2021 21:29:14 -0800 (PST)
X-Google-Original-Date: Fri, 26 Feb 2021 21:29:13 PST (-0800)
Subject: Re: [PATCH] RISC-V: Enable CPU Hotplug in defconfigs
In-Reply-To: <20210209054620.25005-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-1c7a9de4-c98a-4b2f-bcee-dc0d618b8c26@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_002917_634753_B829F897 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 08 Feb 2021 21:46:20 PST (-0800), Anup Patel wrote:
> The CPU hotplug support has been tested on QEMU, Spike, and SiFive
> Unleashed so let's enable it by default in RV32 and RV64 defconfigs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 8c3d1e451703..6c0625aa96c7 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -17,6 +17,7 @@ CONFIG_BPF_SYSCALL=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
> +CONFIG_HOTPLUG_CPU=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 2c2cda6cc1c5..8dd02b842fef 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -18,6 +18,7 @@ CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
> +CONFIG_HOTPLUG_CPU=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y

Sorry about that.  I missed a handful of things, I'll send this out tomorrow.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
