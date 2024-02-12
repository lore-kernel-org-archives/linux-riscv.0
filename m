Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F79C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3TMe9f7PPiKhcQE47kIy0/rDvmlFnaqTalrfDvb7+o=; b=mvNyPcz5KRaA4j
	E72tpGRQVZ/z5K2uUuLhK8xj/LtUS3/cG00cnSsSTfsmjKJvqU5iT1CCQ8q6IHSYkLDf/HHOGcwon
	RsPYoRn4WRHus8n5G8iDPVbzeL32Qsg27/SNpwASxBWrqIN/qi4ndDZICnLJ9KSb6vKUrJDNMoYtn
	elhMyyiJiAy6ByGwZpQZ8c1tZeWobJj0ju/udg2mqPx3dbvp5LveeIA9YZElWRBxYJmxsNMBWcnaw
	RLSBCzMZPmTKOYAzQEawU3lStocoS1eJzK4zUeouvV1TkgNUGWnv+l+OOh3RBzYvyT4US825ad7qm
	/I0nhwTWYWxWbtJ399bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTTi-00000004rIk-3s9x;
	Mon, 12 Feb 2024 10:23:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZTTg-00000004rHw-1B71
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 10:23:57 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a3ccea0d75fso38367866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 02:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707733434; x=1708338234; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=er7uqV/3pxqI9E15uDGZ9iWhLJcFGSi+T2B/hFaMbBg=;
        b=DUcHAIfK+v7NPGaUYlESxuKyI0EsyeXaqBKg5j+iE+dOCmnebefuolvSCG/ahwESTt
         Quel/Q882kKRfcnOiXWY7D9Ad/pCZ0kGENToRv4z95QzHWocxfHSH1l8OIRsI8E2eios
         2nEnIzN1k3kgPFx8UrHwWwrZSJj5QbZBZYkzo/PgRDGBd0jhScjMVwAYQ2Oo052FcNpR
         +j6mhPSl/5hr2eDaMxK/TulNzqdXcNXvI3/2Ud/fWw0p2kv/IHwGlpk/VKnZWEvHyWH0
         aEtCPsWUcrSkM8//TXSsgawyk3f9++d1xd54rc28x/2mpa2cnWFG1ogxtWZvd6zsnKTL
         PIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733434; x=1708338234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er7uqV/3pxqI9E15uDGZ9iWhLJcFGSi+T2B/hFaMbBg=;
        b=Cux4fT10SoxMJwWYu08Pva0no11Oun5uShvCw8Y/EFtMTszh2rkGEK7QS6fnBdOpop
         iZWHw/XwEh3hks0dfLQX2yMfk0meSUtj4ic9CbF6tNOa520PkGXBS3lb3kc7yctNdHkS
         rEutuGHZv31XLRIK3N4TC2RXwcxax50vUMAjBPkI3DPreUfue03CE1abJ6PKlOP8x+VZ
         btzZzzNvgNFg7lIl2/Xe4nDlGukX4MfwyWyAcesXA338l6umfN/UKJbp3pmsBbHoReBM
         gAEDqwcNJsNVFRUm+ZvIzHQ9qfTj/+7/d8m4FTWmpvcRTOwrS/NYA/njLRMQKlgm8hgY
         l31Q==
X-Gm-Message-State: AOJu0Yz8QKeqa0zkY8a98D5nL0smVwU567YybIEF2xo9Do6MjKwhOJp/
	GAVguIS+MYHf4OSYZUk3sAvpi4yndKmGX3CQJWK8GFKwzN1a3jr1QuoQa63KCgE=
X-Google-Smtp-Source: AGHT+IEIVVAUpTpqdBT16MY7gnKOm8Wgm8lU/UhtOte8u9qNN7LVPAHblq+h85cUkD6/Ed6GGvCddQ==
X-Received: by 2002:a17:906:a88b:b0:a3c:cebc:9e0e with SMTP id ha11-20020a170906a88b00b00a3ccebc9e0emr567479ejb.66.1707733433939;
        Mon, 12 Feb 2024 02:23:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPAzE+xdeF9TrZSKLD2pHEr88oRydbkgxmrvinHSvSQxUcUIyGSd4eufO2JDcBJ7dp7k0omkE0TZm5KqaV2RSmopwEH9KJUBeAuNEnCQZp/Na3kZyhqGhtsPoWUFMQWLjH8g1/XK5jmvnK3onAoGGYAjWJYmG20MsKxc8Yn9hXfF2DIBZZzGU6LHBehpCvPsVjofyX2DVddSWuIv/g8ypG3DrQoeVz4cIaOtpF0w2aQFPxniQSHtJKifQoI36QcqUz+GTeRa25cUcHcaFSIQmeIhQc0JSMEzlS4c0IEEQuh4BCexsaE+Q2RkgtWWZhpOa/zFS9tiBq7NOlJoD7GObmq5y2nTJbzou3e8N/JqJSg+NdzdwTTJUpVKPs29VIz44lxoHm6/kZeP4Smk1W08JaOjCzXRt8PuEeZ/ZindEfAW3sw5G8/+7SeMUmw0s+pjY5aq6PL8Es9QTI+gFjyh5aBJdPU11Mw/b8r+ggEfN9EqNFco+lICueODov2KMWeF9NjaBVj7iuEimn1MzGt8h09gt++g3M+hv8cjkxyNnKs568+BR8yc2MOxQQfPS10utFK8+zFVEhGgYzQdUVImLwxe37lmPhh60wZlbX9IzH8qQrJ6pXMKqI7ua/HuD+egoIQG7OQAblqLWyAAYzgzeBywNTlp4Txdjmklview3xwwTap1D5fOGoJcX3j6hu48qZsuyeGsyC9nsBmohNR1DagrdFR+BQPMd8gUJY++R62GwIzRAH4E9fbyPamjyvb3f65wE2mOTSc9FZUoRQcF639WAouaosGVNVx1Lb+cyBEU6FitjgZXDhOSgLIEDineFX73GZcKSrIBtz4oK2eq7mAoQvQNaGVZKmYrzVDunSfj481sy1kH7T62OUcjxcEqkvFA6AoU8syAnrTA/2MrCiJ2cTSBnstrRgHXEzdtHuRyNWjIHVyXNF4EoXfIjpHWpKwC
 eFJ5J+101mb/s4Q/1cmQ4Wz11QZhp5DbbKlvzcjLsFg2m3gpryp3twJqX5TrxCAcFt/wAV3BkzPRN88+roOQEXkWbekKlM46Y71IoxRtiUkdHJN5WqFsqlTyD5KyCw2GGJTw3SH6T/MmHAr+oOwvKSIc3aC0hV24YWulCM2OsuRuhclbmlzyt6Y2JJxxnVKaEqRxDeMNsLrGMeiDbuUhtua8pSpKm3dNm1G1WDslPC35cV5XDKSWmKAb1/M2wkuq5SETC7B1gv6XnzZnlR1wQSLix+8+kin8J6JO3gm3X+McNhBRLrxx2loxFJMo2c/xjh7wF3wDssyxKjHX5A+5fcuPqv50ODa5GDub27T0Uc32g162GnVdCC+VeowGyq11KgvugkpIVtk10/sJDfMFGpZuviKTl3msRZRr3qrlPR4dQveuCxGTOo6Oyav0FytnJtGp3LnLOhGFP3ew0jwPCoPc6cw6K+VeKW8qiwGLv/Zb8bgVl3bujL9JS6Qo/52tJiC0ZuLRKF0FHpPoBy/q+YQhTYHMl18uxLehORfxoVvopoQWyWBYfdFhJ6Zw4rz8Q3MZWMxMDQ3CncpPaKx2ctow9uTjN8qQgbOhE/nRr55TRTZYeL2J9umD0EbRUOAPfKrtRYeRcln+faWGY1RFXS0SkOu8ul3zt4sehJkmrrwdGMZP7KTM7JcjoVtmgaa5ny3FdpkRXFN6TbIN0bGzTgwdO8Q47IPyS1xFnDgY3d3inqjDrNKZ+ApxxPH0VXmkBGBMUz3yomR0ChsvRgC5CMHBStwF4uSxPqonHfDFzPjINLbSkuK5J1iq1mGTAGg/z4AFlUd/6W2ARQswjf42gEBah0qBZ/jxD0NzH+A1BvfORnnJDXSaxlJzogY3Yqw7ulEjTbff7wBfEAQd1+H23TSbMHcfcEg8bJq1L8w8lzRqmE3x5zY1gHR9uI3y8tKtTr166Quq7EosM5SUUfT9LoO3vcs6beCXmhNk7
 vesJ1Ft9sE1alaQEh
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id cd6-20020a170906b34600b00a34c07816e3sm61419ejb.73.2024.02.12.02.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:23:53 -0800 (PST)
Date: Mon, 12 Feb 2024 11:23:52 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: debug@rivosinc.com
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com, 
	kito.cheng@sifive.com, keescook@chromium.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	corbet@lwn.net, aou@eecs.berkeley.edu, oleg@redhat.com, 
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com, shuah@kernel.org, 
	brauner@kernel.org, guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com, 
	xiao.w.wang@intel.com, apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	waylingii@gmail.com, greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org, 
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com, 
	panqinglin2020@iscas.ac.cn, willy@infradead.org, vincent.chen@sifive.com, 
	andy.chiu@sifive.com, gerg@kernel.org, jeeheng.sia@starfivetech.com, 
	mason.huo@starfivetech.com, ancientmodern4@gmail.com, mathis.salmen@matsal.de, 
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com, ruscur@russell.cc, 
	bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il, zhangqing@loongson.cn, 
	catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com, 
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 01/28] riscv: abstract envcfg CSR
Message-ID: <20240212-cf2c44241bfd5e942a4e3752@orel>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-2-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125062739.1339782-2-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_022356_341328_B1B9C92B 
X-CRM114-Status: GOOD (  18.01  )
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

On Wed, Jan 24, 2024 at 10:21:26PM -0800, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
> 
> This patch abstracts envcfg CSR in kernel (as is done for other homonyn
> CSRs). CSR_ENVCFG is used as alias for CSR_SENVCFG or CSR_MENVCFG depending
> on how kernel is compiled.
> 
> Additionally it changes CBZE enabling to start using CSR_ENVCFG instead of
> CSR_SENVCFG.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h   | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 306a19a5509c..b3400517b0a9 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -415,6 +415,7 @@
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE
>  # define CSR_TVEC	CSR_MTVEC
> +# define CSR_ENVCFG CSR_MENVCFG
>  # define CSR_SCRATCH	CSR_MSCRATCH
>  # define CSR_EPC	CSR_MEPC
>  # define CSR_CAUSE	CSR_MCAUSE
> @@ -439,6 +440,7 @@
>  # define CSR_STATUS	CSR_SSTATUS
>  # define CSR_IE		CSR_SIE
>  # define CSR_TVEC	CSR_STVEC
> +# define CSR_ENVCFG CSR_SENVCFG
>  # define CSR_SCRATCH	CSR_SSCRATCH
>  # define CSR_EPC	CSR_SEPC
>  # define CSR_CAUSE	CSR_SCAUSE
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b3785ffc1570..98623393fd1f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -725,7 +725,7 @@ arch_initcall(check_unaligned_access_all_cpus);
>  void riscv_user_isa_enable(void)
>  {
>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> -		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
> +		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
