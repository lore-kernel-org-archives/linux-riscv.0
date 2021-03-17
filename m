Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123B6C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:10:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815EF64F4F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815EF64F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=64ZGMXPvaGs088Ptd+BdSdV9LfnTKp+Y0P4mGetI+A0=; b=ZS+KWe1MqDUcA+GMP9PeEoCrz
	2QSWY3Pc7R9Eqcii1Q6X+/MRviUJj9KbzyZ9Nx6BXW0E+wqLIzs62zV+qJipi7s2dEq+6mkn00q8U
	jiGRhGV9Rnf63Gjaefld8SF5lyKrAiBuIlPnhkj8otiL5PQbMxNrw6NOFL/eD+rl0Ut6UTgBQXv2f
	yP4A/2ueAC3BoB3ouNlCHS8lq7RrMJlq3z9+UZo22xXh2/5hY+19KpqAPuU3dc4lCsnO3GkhtLHa7
	GgOD32Any0IsKxU4DXljFX1Rb2yFzGBW0Y0uNp0u5heLptsKeE9tEhMRNMFCD3S640osTUNzJ9k3z
	TyJvdBJAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMORo-002UDa-O8; Wed, 17 Mar 2021 05:10:20 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMORk-002UCj-Ni
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 05:10:18 +0000
Received: by mail-pg1-x52e.google.com with SMTP id n9so23125735pgi.7
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 22:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=eaXgrCobu2/aVMN+vm+3fiX+Mb+nHmlXIgWJ0XHtqG0=;
 b=KFj6kwqQvIqUheboR/EnrJlMVrCpmn3TfuzR4uFZr0pcL8XYjIhvZ62VphrrOXytIS
 f/DhBMvnngmv/ALpX+RzG1rYaZPU5GpCDDKYz/LR4+cHZq8FdJsJn8soFie6d4Bb/VKD
 N1R1eE+UPNfdnhzEgCH029hjz1Q656+mam3UJ5BeH+uQulsxnsd6OrxIXQ+112qgtAad
 R+9yBVyv21KhG086o57bc4MBWny2ntvgYblzR9zbP20L7N07GO3vUYd9AkHC+8TGtCAb
 wMYw1oOkCaodW/OZdwvY6m0kcIsbEUap2ELVS4uAeb8ItrexKIDaAqPUcvYfRzQPWNAp
 YY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=eaXgrCobu2/aVMN+vm+3fiX+Mb+nHmlXIgWJ0XHtqG0=;
 b=In2aKtI+ZXkt/UWO0qblKspSRIsn0YA/qv45TcGPHd4e4c79q6lIOexodk1e2CkO/r
 CmLB2K9em97HTKWa1TuQhxsVeL3vBBkAL3t+wVgkVk4o8djRf8ovwa+wyiWqIUAzWqPR
 WdweDhv9S9FzgmeuR12baiejugOMz203Nalwxt8XZaouYuCgj8kTxjZJr8d2Bl6BoyN5
 GifrkAndDtvx7SOCLK/U2w5XafQRYJAm03LNPVlhS3sv1Af64X5a5VTdxfp3hLu0L+TP
 XTg7D83OfsAuELseNIvg8egUDKIXnS9AsxwmWkdSIK14l7zd7gzGmf14sUDWOVY5nbyg
 OFXw==
X-Gm-Message-State: AOAM531YM9D/Z7iso7sDa8xyBrIu4mP8UAorjypArs4w8l6K7bnaqXg2
 AfPwGHCuQXR1v/4mVfbYfeJuzbg+lDYhkw==
X-Google-Smtp-Source: ABdhPJynP3eY6Qyx9P8p5PV3Ls1yiUGaDsR69xfqC31jHIdbK1xCWK0bmhO3m4Av8XaJHlw3hJb0yQ==
X-Received: by 2002:a62:485:0:b029:1ef:2110:d91d with SMTP id
 127-20020a6204850000b02901ef2110d91dmr2745225pfe.43.1615957815017; 
 Tue, 16 Mar 2021 22:10:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t6sm17569152pgp.57.2021.03.16.22.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 22:10:14 -0700 (PDT)
Date: Tue, 16 Mar 2021 22:10:14 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 22:09:45 PDT (-0700)
Subject: Re: [PATCH] riscv: Correct SPARSEMEM configuration
In-Reply-To: <20210315120307.17142-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <Atish.Patra@wdc.com>, logang@deltatee.com,
 wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-afc9ae5d-ab12-4d65-81ea-1161eae50922@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_051016_911473_2228B76F 
X-CRM114-Status: GOOD (  17.01  )
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

On Mon, 15 Mar 2021 05:03:07 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> There are two issues for RV32,
> 1) if use FLATMEM, it is useless to enable SPARSEMEM_STATIC.
> 2) if use SPARSMEM, both SPARSEMEM_VMEMMAP and SPARSEMEM_STATIC is enabled.
>
> Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 85d626b8ce5e..87d7b52f278f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -93,7 +93,6 @@ config RISCV
>  	select PCI_MSI if PCI
>  	select RISCV_INTC
>  	select RISCV_TIMER if RISCV_SBI
> -	select SPARSEMEM_STATIC if 32BIT
>  	select SPARSE_IRQ
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
> @@ -154,7 +153,8 @@ config ARCH_FLATMEM_ENABLE
>  config ARCH_SPARSEMEM_ENABLE
>  	def_bool y
>  	depends on MMU
> -	select SPARSEMEM_VMEMMAP_ENABLE
> +	select SPARSEMEM_STATIC if 32BIT && SPARSMEM
> +	select SPARSEMEM_VMEMMAP_ENABLE if 64BIT
>
>  config ARCH_SELECT_MEMORY_MODEL
>  	def_bool ARCH_SPARSEMEM_ENABLE

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
