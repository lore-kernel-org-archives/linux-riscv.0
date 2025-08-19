Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A77ECA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XI1icwAvfSHLB9Dkot8qIPRaXBkGhjn0/+GILknK/bM=; b=Y/GWEyd8BAybok
	IK/6zQzvDwGmwVHvprb4kYphTusbHjTrgiyf2o3ynujDabRAmbg3AipmKJc9ZmGil1IcZL/cOuJjd
	3dGhaETCMQYLao3hDfohmBQmiQ3zH6q/VgDttREl7P3jf59VMi79ORVqdk93H+KV1nOjOgNiceopj
	/NrkFYWzuW9dewKyZv36iM75c+4vOPLKWf5TSgDl6LlXQ9ICzjhAZBS0LG/kk5vMYdF6Pfr+rKoF3
	CGxlzDsqQy3Pt07GKNJpTR/BU9etg6SE1fI92eX+JR4MpsIoMIy3GQpbS6PMMv09tudaY2c5L0EXq
	zIkqJiYrxKAlYex+slfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoCzl-00000009GLc-1g3M;
	Tue, 19 Aug 2025 03:26:45 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoCzi-00000009GKp-33t6
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 03:26:44 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1BC3F22D7F;
	Tue, 19 Aug 2025 05:26:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mf-pBRRXyKk; Tue, 19 Aug 2025 05:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755573999; bh=v2fOmGvCEa1uf4z/p4esCXg2wiXJmeWbshwawmhZPck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lIocyK96JzLEoWkrV/InqiZnpuh5giFNVn7nTAr4tSxuJTGEOC7rFrJr9L4axHtEN
	 f4+O36eWEssxmtQCGx6ey9rkLp9UTPIRu76Rlr25CobclxH0YkZLuJhd05iC/ae24o
	 Y7Uf4iu104epCpo/in1Ff7Ih3VPWj6kMJqSqwv8qXtm2rpMn/ExADKsClvRBUUbslN
	 28HPJYDduR8hNPecYhtNDv5tpExyjmu4YLliYLLpeRvgxwByWf+Edtkt0aRFW58Efd
	 8suHStYpx+zphVDOflDvS+HYKlStJ/Il3+fNPjB+1J7kY3kjLLFaK5HPaqoyxpscxC
	 BrIm4QZw5cBxA==
Date: Tue, 19 Aug 2025 03:26:18 +0000
From: Yao Zi <ziyao@disroot.org>
To: Anup Patel <apatel@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
Message-ID: <aKPu2g1MOZBBzQbV@pie>
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818143600.894385-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_202643_181596_78F0E155 
X-CRM114-Status: GOOD (  22.05  )
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

On Mon, Aug 18, 2025 at 08:06:00PM +0530, Anup Patel wrote:
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h |   3 +
>  arch/riscv/kernel/Makefile   |   1 +
>  arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>  drivers/acpi/riscv/cppc.c    |  17 ++--
>  drivers/perf/riscv_pmu.c     |  54 ++----------
>  5 files changed, 184 insertions(+), 56 deletions(-)
>  create mode 100644 arch/riscv/kernel/csr.c
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 6fed42e37705..1540626b3540 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -575,6 +575,9 @@
>  			      : "memory");			\
>  })
>  
> +extern unsigned long csr_read_num(unsigned long csr_num, int *out_err);
> +extern void csr_write_num(unsigned long csr_num, unsigned long val, int *out_err);

I think it's more consistent to directly return the error code, and for
csr_read_num, we could pass out the read value by a pointer. e.g.

	int csr_read_num(unsigned long csr_num, unsigned long *val);
	int csr_write_num(unsigned long csr_num, unsigned long val);

This allows the caller to eliminate a variable for temporarily storing
the error code if they use it just after the invokation, and fits the
common convention of Linux better.

> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_CSR_H */

...

> diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
> index 42c1a9052470..fe491937ed25 100644
> --- a/drivers/acpi/riscv/cppc.c
> +++ b/drivers/acpi/riscv/cppc.c
> @@ -65,24 +65,19 @@ static void sbi_cppc_write(void *write_data)
>  static void cppc_ffh_csr_read(void *read_data)
>  {
>  	struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
> +	int err;
>  
> -	switch (data->reg) {
> -	/* Support only TIME CSR for now */
> -	case CSR_TIME:
> -		data->ret.value = csr_read(CSR_TIME);
> -		data->ret.error = 0;
> -		break;
> -	default:
> -		data->ret.error = -EINVAL;
> -		break;
> -	}
> +	data->ret.value = csr_read_num(data->reg, &err);
> +	data->ret.error = err;
>  }
>  
>  static void cppc_ffh_csr_write(void *write_data)
>  {
>  	struct sbi_cppc_data *data = (struct sbi_cppc_data *)write_data;
> +	int err;
>  
> -	data->ret.error = -EINVAL;
> +	csr_write_num(data->reg, data->val, &err);
> +	data->ret.error = err;
>  }

This could be simplified as

	data->ret.error = csr_write_num(data->reg, data->val);

and variable err could be dropped.

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
