Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B924EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jRS3xVM33tfKzCjiGcD5LIte2UDy2SvAy1xk2TyPv0=; b=vIpP7ANK2t7q64
	IaoLBD/1z1buCoPZNZw8lB9NM+//VQ8bp2pFkATfKDMiyzNt0ZN7JYAvZrA+S5q9p0Rasgw9EjjSF
	vuyRHfpv7biaBw/W5xHXkcDFZaUpKiDZic+pDCb2NEHxmgnaOAcwz4BlJDcD+L0HRKma4Fev4gtzx
	4GstoD0qNi2JbU6I2eDyyiexABku7RDGqFBzwrP9rl8OlbUqgKFu6JkoJzsMG82hZU7d++tfLu8zc
	M3Z3b6u6JCLXCxMDrFEGiIGWmP0yjlcGhIEH6xhICK2saz/e+GpLxsBvXs6mgyuQMQPC42fRYyhbp
	03o0ldR4jmQQAEyNdNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlpo-00DQV1-2k;
	Fri, 21 Jul 2023 08:50:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlpm-00DQTr-23
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 08:50:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-316f589549cso1342405f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689929397; x=1690534197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt7duMrhhGboCZgWUi11DgbWh38pglLSd2Ac5S8hJ98=;
        b=CKFmLcHHRBDQTNG4/wEUdkzP+ntuKpQDypBvIOFq6QqHjwlnY3odA2KCUlA9McbDHp
         iNlKd9jYpb3fKaw9ZaTRq08CdeHsVaXwe+ZNCkhQAK78SU1N/o3biqO/zXD9bLHIBmk+
         vcJTXTwsTomqhvO5xn0gyur5+RkKnDtmlEXq5ZkS6ejc/aRG/+R8yUi0h1xrf0ZrOvZW
         238MOzXlUJNkv5/ojuGL5ncpt2gweT0pmvnPM+VlxqdmNmJgp9Trr/7EIPGHoTjDu+yE
         +73Ga2hCjfQX1DXFXmuE0L8BY1co7OGVq+OdIaKmQKRvvMrgoyJGYbEfFa3eOslC3V0l
         L6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689929397; x=1690534197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt7duMrhhGboCZgWUi11DgbWh38pglLSd2Ac5S8hJ98=;
        b=QweECjyvOajnDbxo039/2w4pGpReYAB39rMR2Vt+bMWRf2F4EyxrRmOT+6dQet/4mV
         MxBCiVjpq+CJYvZy91pU8lpB3fJNn2hNF6zk1OHTfwPG8O64kZ2jlonB0QT6+lYRf/Td
         hFbuGtHz+Y7HuHH+zf5kP7E9+1jO6j9Udeh0Pg/eBhJOjRrYcG90MDLoV4fb6R5cjECu
         G3QKxy/acW0Z6DiYhN57HwA4E/O/LjqBkaSVvUTn5YC4jLui7SDn6QxkI1WAQd4jRbEf
         R3D2VTy5K72apXBPNs4EDoc3eRZhXMFun8vOivKtgqSD0Jz4raPDRWt8ciU1dtSSi9am
         Rq9w==
X-Gm-Message-State: ABy/qLaPbiyCpnwngX10D7zcHe9PWVqRJ363erRnffkQ06450y2Of+ZX
	OguctYBadlptdh05b1G+MISs6VQoWxa6ehD/FQc=
X-Google-Smtp-Source: APBJJlHKN36ghsLfLCzJCIvUveITPP3N3Rm9eAN/e6pfBkxsUpGsXLlUD4aKZZW9YWYX5qayE+/Bog==
X-Received: by 2002:a5d:4d10:0:b0:314:30ed:9b55 with SMTP id z16-20020a5d4d10000000b0031430ed9b55mr957676wrt.15.1689929396734;
        Fri, 21 Jul 2023 01:49:56 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id z17-20020adfe551000000b003062b2c5255sm3610632wrm.40.2023.07.21.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:49:55 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:49:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] RISC-V: Detect Smstateen extension
Message-ID: <20230721-72554b5197954b80af35a7bb@orel>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-2-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721075439.454473-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_014958_675714_8E9DB13C 
X-CRM114-Status: GOOD (  16.91  )
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

On Fri, Jul 21, 2023 at 01:24:34PM +0530, Mayuresh Chitale wrote:
> Extend the ISA string parsing to detect the Smstateen extension
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  arch/riscv/include/asm/hwcap.h                          | 1 +
>  arch/riscv/kernel/cpu.c                                 | 1 +
>  arch/riscv/kernel/cpufeature.c                          | 1 +
>  4 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..1e6d0e182be1 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -128,6 +128,12 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pull
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>  
> +        - const: smstateen
> +          description: |
> +            The standard Smstateen extension for controlling accesss to CSRs
                                                                ^ access

> +            added by other Risc-V extensions in H/S/VS/U/VU modes and as

s/and//

> +            ratified at commit a28bfae (Ratified (#7)).
> +
>          - const: ssaia
>            description: |
>              The standard Ssaia supervisor-level extension for the advanced
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f041bfa7f6a0..fad1fd1fcd05 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -53,6 +53,7 @@
>  #define RISCV_ISA_EXT_ZICSR		40
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
> +#define RISCV_ISA_EXT_SMSTATEEN		43
>  
>  #define RISCV_ISA_EXT_MAX		64
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index a2fc952318e9..fb0df651bc48 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -217,6 +217,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bdcf460ea53d..ddca31160637 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -301,6 +301,7 @@ void __init riscv_fill_hwcap(void)
>  			} else {
>  				/* sorted alphabetically */
>  				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +				SET_ISA_EXT_MAP("smstateen", RISCV_ISA_EXT_SMSTATEEN);
>  				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
