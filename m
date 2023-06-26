Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEE6EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pNuJtmkuYUydUIP/OvgA+HmBRLF44ULGWQdD6T4Id0=; b=r6Zwvu8LWHZbiR
	fVgrv7RXxrl9GYGp1s6ITWyZbyIcTOXwNaqk17CU71SWTgbANciBMK4ntvulCFrZHZzp/1Idk2/o4
	O5Nr2p2APtWmTwbJ1bwf6NKwq/4p/zdttJeQsJuL/01tDrnA9qs2p+v2yFBAUW4WFRRYTXW2qXPrb
	atyDWlc1NkJirtL2L8DwvnDL+7NVX6QpFPSCWtr7vRmlZfcsmddFm70xk0cH7cJJQ4XD50XmzaibX
	cc1ZYpHcStuBTY3EGsEwa79vE21jL/uyGxyIez/2CpqlNdEikd9IFpBKn1X8o3ZGRkye/UYSwmJXR
	kdg0/hZVDpVtrlF4x6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoDX-00AUub-1n;
	Mon, 26 Jun 2023 15:33:27 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoDU-00AUto-14
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 15:33:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-991aac97802so181368066b.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687793601; x=1690385601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9Tqh+bgbzS0BvzbAVqiPRlSG90nmkGIpBCBAQqX0QQ=;
        b=b96UvgNvzkbRYx0trBuQ5YMZtUpfdLwxWVUZLt/XsYHa+WF4aDTSAzAVcNZEHV1QVA
         IxLy2YU/6Gvj3bHqrMvp1WtNIye4TQJmH7oJP+GBF7NYM4bewJ/kTqofouD+ibzp37an
         GCacxYfy+O3WG4zt0C3ZLPHfC5X5fBsksrowiu3eoDyhy6eJiA2PRv4R1u6jKm8XXbR3
         1c1f0iALjxO/fMn5OpBDWQATQFg/5BXaFSkNLwIQwHDttqvjNSwSM98UOdo7dkfwyYei
         mqgxE5B0HxTu1cM4LK3KXQd2Q+XvMp3KFOBdRbckxWiFWi1OxCdDO3uv5J27/aRC/OtC
         w4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793601; x=1690385601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9Tqh+bgbzS0BvzbAVqiPRlSG90nmkGIpBCBAQqX0QQ=;
        b=S+Z7V/S0psAaqZmZoLhXRLPJgXK9rCD2Y/0IwKwTcrqwJv04R1f5e1sFX1ENrQv5Nx
         O/DIFDl/fDSPZaTsLvkMnrWOjwPtKF/BjQEL3R0GrYohFUfQJ9jHe50ggPhIhtG9Ue9g
         QvCGx+2ZrKtVu27DQAeUHCB01YppidLDAnu3a6r81wmKDOzVyDot0HoCXLucs1nQ45bj
         PYvh2g30kHAmfFAQy/d9n+XUEdBHqj2yN2JK4gCdMJm+GrK6XffPDxSENyNamEhEXCIK
         ef8u6MqU1fmeI1fpuKH1Rh3oYJz8tae7aIlAQXth6uaUbOTDf0mSXVvjjyucX1j4W3UG
         GVNA==
X-Gm-Message-State: AC+VfDw4LPTmwb4mwESJFMJpM/DYwW1b2Hn/YqAMBjOiQhkjsJdRh845
	ksm289D0krMGY6eVI3QRJxPX/w==
X-Google-Smtp-Source: ACHHUZ6RGIY8Q5EYr8VS/MG5yhZySuR5xYGF1P7o3orytf0EAD7Xhd7VamRyzp2t7CMaPRzZHLL0RA==
X-Received: by 2002:a17:907:2d88:b0:98d:4e03:1d55 with SMTP id gt8-20020a1709072d8800b0098d4e031d55mr11226240ejc.76.1687793601212;
        Mon, 26 Jun 2023 08:33:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hk8-20020a170906c9c800b00987316d1585sm3420624ejb.145.2023.06.26.08.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:33:20 -0700 (PDT)
Date: Mon, 26 Jun 2023 17:33:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 4/9] RISC-V: repurpose riscv_isa_ext array in
 riscv_fill_hwcap()
Message-ID: <20230626-2eca99968e20531752dea023@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-thieving-jockstrap-d35d20b535c5@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-thieving-jockstrap-d35d20b535c5@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_083324_367326_232F7ED9 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:42PM +0100, Conor Dooley wrote:
> In riscv_fill_hwcap() riscv_isa_ext array can be looped over, rather
> than duplicating the list of extensions with individual
> SET_ISA_EXT_MAP() usage. While at it, drop the statement-of-the-obvious
> comments from the struct, rename uprop to something more suitable for
> its new use & constify the members.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h |  6 ++----
>  arch/riscv/kernel/cpu.c        |  5 +++--
>  arch/riscv/kernel/cpufeature.c | 26 +++++++-------------------
>  3 files changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 7a57e6109aef..36f46dfd2b87 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -70,10 +70,8 @@
>  unsigned long riscv_get_elf_hwcap(void);
>  
>  struct riscv_isa_ext_data {
> -	/* Name of the extension displayed to userspace via /proc/cpuinfo */
> -	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];

The RISCV_ISA_EXT_NAME_LEN_MAX define can now also be deleted.

> -	/* The logical ISA extension ID */
> -	unsigned int isa_ext_id;
> +	const unsigned int id;
> +	const char *name;
>  };
>  
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 61fb92e7d524..beb8b16bbf87 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -164,9 +164,10 @@ static void print_isa_ext(struct seq_file *f)
>  {
>  	for (int i = 0; i < riscv_isa_ext_count; i++) {
>  		const struct riscv_isa_ext_data *edata = &riscv_isa_ext[i];
> -		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> +		if (!__riscv_isa_extension_available(NULL, edata->id))
>  			continue;
> -		seq_printf(f, "_%s", edata->uprop);
> +
> +		seq_printf(f, "_%s", edata->name);
>  	}
>  }
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index f0ae310006de..b5e23506c4f0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -99,11 +99,10 @@ static bool riscv_isa_extension_check(int id)
>  	return true;
>  }
>  
> -#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
> -	{							\
> -		.uprop = #UPROP,				\
> -		.isa_ext_id = EXTID,				\
> -	}
> +#define __RISCV_ISA_EXT_DATA(_name, _id) {	\
> +	.name = #_name,				\
> +	.id = _id,				\
> +}
>  
>  /*
>   * The canonical order of ISA extension names in the ISA string is defined in
> @@ -367,20 +366,9 @@ void __init riscv_fill_hwcap(void)
>  					set_bit(nr, isainfo->isa);
>  				}
>  			} else {
> -				/* sorted alphabetically */
> -				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> -				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
> -				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> -				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> -				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> -				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
> -				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> -				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
> -				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> -				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
> -				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> -				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
> -				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> +				for (int i = 0; i < riscv_isa_ext_count; i++)
> +					SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
> +							riscv_isa_ext[i].id);

Three cheers for removing one list that needed to be maintained!

>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> -- 
> 2.40.1
>

Other than also dropping the define,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
