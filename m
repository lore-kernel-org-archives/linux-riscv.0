Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A09C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 21:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NOIXxP4GhYUhR8SovpEgKsBPM+aOvheYclD0MPMHa8=; b=wfRj4OUQrnzaJ0
	eZUlpcHUzMNdNHS0OHcLEG+N2de651jl6d1vVauE+kO/bAifVXC6gW6VGF9Oa8Q92/tGKuOD0WMjy
	CXLryyG6WJq8k5faAICH1ueeOkLpjdCvj02pnVMvuegJqvpu6jJxthjQP5XHH3gualJwZ1frvntII
	eUo/JSSfEoM/5Vpf40iNS3pgviV0ppz4b7Ug7oS1b7UWyfBEdpDovmaRHogM5JZ53pPMSMYgjyAx6
	HfNDT0MuNz9CLeIvTU0xFcW8XYqSKzMKSb/NqcJ46rIeZj18+BSOh648Ttp52cWQ3r41bfqxRLUAA
	8WsUxjypPnwRsGeiRwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1wuM-00BRq9-Jm; Sun, 04 Dec 2022 21:52:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1wuK-00BRnR-0y; Sun, 04 Dec 2022 21:52:21 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p1wu6-0006zx-3Y; Sun, 04 Dec 2022 22:52:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 02/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
Date: Sun, 04 Dec 2022 22:52:03 +0100
Message-ID: <5629547.DvuYhMxLoT@diego>
In-Reply-To: <20221204174632.3677-3-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-3-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_135220_095499_D70536A6 
X-CRM114-Status: GOOD (  17.82  )
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

Am Sonntag, 4. Dezember 2022, 18:46:21 CET schrieb Jisheng Zhang:
> It's a bit weird to call riscv_noncoherent_supported() each time when
> insmoding a module. Move the calling out of feature patch func.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 1 -
>  arch/riscv/kernel/setup.c      | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c743f0adc794..364d1fe86bea 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -274,7 +274,6 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>  	if (!riscv_isa_extension_available(NULL, ZICBOM))
>  		return false;
>  
> -	riscv_noncoherent_supported();
>  	return true;
>  }
>  
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 86acd690d529..6eea40bf8c6b 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -300,6 +300,8 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_init_cbom_blocksize();
>  	riscv_fill_hwcap();
>  	apply_boot_alternatives();
> +	if (riscv_isa_extension_available(NULL, ZICBOM))
> +		riscv_noncoherent_supported();

hmm, this changes the behaviour slightly. In the probe function there
is the
	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
		return false;
at the top, so with this change the second WARN_TAINT in arch_setup_dma_ops
will behave differently

Heiko




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
