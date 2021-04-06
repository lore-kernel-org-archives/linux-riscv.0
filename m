Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5648C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:57:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8A8613C8
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8A8613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7WQDVkcs1/QH6UhyvpLFQd8Ck+3X6tU1kzxp7rcp77E=; b=izlouyvn/2W1FNQ4vhHVsbox+
	GmkRgkTFMk/R4GPtjFp2LHlGj2p79RAcNMmFQ5vwrzoU6HI7GAJOP1wOPywImBADwPDLEjH1+0HEf
	U2S+rlQY5cw34ZqyJUz9SuAvIo1sMN6kYSPcLeZ6QiAguNxuK4QjbUo+0cEKMHGM3wnIqwws13mJy
	JNEGCq4K6aHeOrDMSvbSRHeAobovfxGOfdESSXyFBQMfIeJpyzZsw5skBZmmrWNkKEQHFq6HwBBkp
	ExeWyzy1PfVmvWloz43bedRudaMNvH855DxwMwmpMhB4oS9lwwO2HgwP8SOzcqDj1JX4FuQTjWo1p
	t85mgFipg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThWF-001ut1-4X; Tue, 06 Apr 2021 08:57:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThWB-001usA-Bi
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 08:57:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id c204so6185613pfc.4
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uZUmKkwLM2oSaojuTn4DZClVwuluaLe6PZbLvPR8s3c=;
 b=WpscpUN2s8UcwB80GPNIwVjusSFrsDNimXL3met/I3dY8jN7f/vDKn6GC3ZCHm0gvJ
 X0eSOYRoV3NrPws6+e881tyauDFR2DHTYRV6VDqRR6VreNS5QLy+z6a529MqZm6XO64F
 lmZaxZTY8DzlbI/lOZk7FXot9YJCSbwMtxI73bs8JqKe+1fcadudbIefJQn+3yvE5QwO
 v51LL2yCRBNsZZY7W/VBJY2QK9Zy7gCpGu0LKVY+ttIhCbpKZSiKfm34rIQ6oN64mUjr
 ODCo1c/gMcffa6EZt3MRR1y4wMbMqMCvg55HnV7a22su7k7OVEgCuiZOOpr1Dun6mzcW
 ahtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uZUmKkwLM2oSaojuTn4DZClVwuluaLe6PZbLvPR8s3c=;
 b=CGEuwc/S6w7JoSTXfQb7JqVERKq6q3QZy69lfvNEsDuc0bSy2Px7frgurAknPMNmeS
 2IZqa3A45cUfgWhTZwgMxgDkhMZ6gjvV7me4reNiAV329iB5witPxLxDYmm72ffWJ4T6
 qXGKcWRcFPCb1nzmWitjBu/ed/bzxmmhrQh3XDK21rfHqUZfOq/WRpJJyb2aw2ocE0+7
 xY3FQdYBVpyTCMWGCVd14oHzFN34OgTYykB3N55NjJxkTao9qZ0d52mrz7Va4Pawx+Qe
 2N2qkSl4h8gkvTtMI+dX0Xa8i/WBIuqt5Q8tQyRhQE4q9Pjnjvths2Bc5FflakCVd4PS
 aOFw==
X-Gm-Message-State: AOAM530Mo5MYmrNiuYkzVFrS9zz8K7EOzVWrCzlXKnReRY0Pa3FZNsbd
 Hr10mSmrjqfOtxlbfvpCRJg=
X-Google-Smtp-Source: ABdhPJyoX4fauwUz8/uRPC+PLrlDTqY/BbNhdRIQpb2w7mh6/qLvfq7K0aPB9a6PVbfbagmli9jcUQ==
X-Received: by 2002:a63:e903:: with SMTP id i3mr21319346pgh.374.1617699421963; 
 Tue, 06 Apr 2021 01:57:01 -0700 (PDT)
Received: from localhost (g139.124-45-193.ppp.wakwak.ne.jp. [124.45.193.139])
 by smtp.gmail.com with ESMTPSA id
 y15sm20720606pgi.31.2021.04.06.01.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:57:01 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:56:59 +0900
From: Stafford Horne <shorne@gmail.com>
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [PATCH v6 6/9] openrisc: qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210406085659.GF3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-7-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617201040-83905-7-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_095703_495960_CEB20E8F 
X-CRM114-Status: GOOD (  16.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 31, 2021 at 02:30:37PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> We don't have native hw xchg16 instruction, so let qspinlock
> generic code to deal with it.
> 
> Using the full-word atomic xchg instructions implement xchg16 has
> the semantic risk for atomic operations.
> 
> This patch cancels the dependency of on qspinlock generic code on
> architecture's xchg16.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: openrisc@lists.librecores.org

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index 591acc5990dc..b299e409429f 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -33,6 +33,7 @@ config OPENRISC
>  	select OR1K_PIC
>  	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
>  	select ARCH_USE_QUEUED_SPINLOCKS
> +	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select OMPIC if SMP
>  	select ARCH_WANT_FRAME_POINTERS
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
