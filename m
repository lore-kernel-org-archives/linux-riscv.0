Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AB0C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEwaKRLkFBcLeH6d7imucufHgNbCpby7w95PFSHFFjI=; b=0H2CuEHtu8ZUfW
	KETl3YWufzGW5fmbWbZ2ptCB0zMrELzMOLhL8/7gz4kLHpB+KLrx5meSCUNYMStyNHLkRPGwAv1Fy
	joJxOeQz9RXp/nLeUencrAp0yuZV3dTlzsFwI2F9DMyJyT8UeygdnDhwIGK2J6D5U7i37vOeuh1cQ
	lmHXIwGUnsyBcW16dBSUpTr42x18J7WjNdYbuRCAsz7RoJsfPDwt4Mn/AlX/5pFygr40jYY2VfvX9
	QBOVbPIZmcDPtzQf0NI5AbN9BjlMWCrNMvjkB7F9iwjP687z41xUmdbPaDP3Ma0h0CipBb6rIMzrZ
	1NG/EtiCLOih3Ri69iEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouDqK-00Bn0i-8h; Sun, 13 Nov 2022 14:20:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouDqH-00Bmz6-A6
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 14:20:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B66B8B80945;
	Sun, 13 Nov 2022 14:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA9AC433C1;
	Sun, 13 Nov 2022 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668349210;
	bh=BYWQERbdgHEBT7t6yByeyv9+5k/nRsNpyAKlViPkdOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+UzpbeA2zc2YeQ6TvzpWvfs6jT3UZiKmrKcZ5ObtrlOPyv4FpN5qQORO8KxBSXvv
	 ifJpHTtjwYAIGunQn4960S2KgFR8dpz0qpG7PmPGB4vI4Fn2oKHYUTeQjKQb3SVcfW
	 hUewxrCuVB+qUqjF4LgzZ5n+f53+7yCwmAgittArQqvDeDUUjO7Z7nItdrfcTFTW1h
	 AhjE6sFcvillgplHdJn8jh1g1U//Jbdp2xEY8DqSiHYAZJXZoh/dBoLF5n2LS8yJzN
	 0ixqanPgMbvLbEVK2VGdgKgDLiSzjn52kmVR8df9q5PVkfzOPovE3d/gVxbcRBBwKc
	 KLMLE7FyrfarA==
Date: Sun, 13 Nov 2022 14:20:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <Y3D9FfXd+vULLTc0@spud>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111044207.1478350-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_062013_663389_474BF10C 
X-CRM114-Status: GOOD (  18.97  )
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

On Fri, Nov 11, 2022 at 10:12:00AM +0530, Anup Patel wrote:
> We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> and Ssaia (S-mode AIA CSRs).
> 
> We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 8 ++++++++
>  arch/riscv/kernel/cpu.c        | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b22525290073..06314220284f 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,9 +59,17 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> +	RISCV_ISA_EXT_SSAIA,
> +	RISCV_ISA_EXT_SMAIA,
>  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>  
> +#ifdef CONFIG_RISCV_M_MODE
> +#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
> +#else
> +#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
> +#endif
> +
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension static
>   * keys. We can use static key to optimize code path if some ISA extensions
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 852ecccd8920..3c84680c2289 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -138,6 +138,8 @@ device_initcall(riscv_cpuinfo_init);
>   *    extensions by an underscore.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),

Trivially minor question: Is there a reason you added these before
after svinval elsewhere but before it here?

>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..e6d750d088ab 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -205,6 +205,8 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
