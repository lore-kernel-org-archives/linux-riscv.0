Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C42CCF9EE
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLb5BNQCr+URUtM5rRmMPVFEtiboPl9pzxINKwjcJRQ=; b=KXS1Ckr6OGx+ou
	L4t2HPo0MTYUWqDdJCreSlhRVQOdSfQu5iYf4yp3JUldtjYQ5b/AQlEkxjuWsZbJ1U/utrghp+u+q
	5UYo+AfGLvtUyQgRGMP6bCmZbxuE44fTzmpeR7LWLI9MtoukL1D0fWyKl27LHCbpZ3qIVcHg7HQ5M
	4GWwNK4u7iNJL6LUBpPUcUQMiHAt4FEIUFoUc2oO+ihzBcSVf7quTH8xz2ScD/1RyyYvK5lzbE5nv
	8atdkT+5OjoNPwQaAQUB9z1g0sq8DSHhYkpPndMAj0g2myB1dy1ijoI7OTsDg/lj6YWGis6oTETRn
	3+5EmkMu2jUceN+TYyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBTp-00000002VjQ-1JaO;
	Wed, 29 Oct 2025 19:05:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBTl-00000002Vid-2iAc
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 19:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B6A1E621B7;
	Wed, 29 Oct 2025 19:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FC9C4CEF7;
	Wed, 29 Oct 2025 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761764704;
	bh=8twDFXhB5PP9hk8ajFP0G5YZKCa0gWuPFjkkttFuV5s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=II0Wbb4gSCSAiOkxHMtgix3grklvFNYuoyHHYNXV0oJ6ICwBBC9vDT7wx9szxQXJ4
	 gYTDSpAewcDZHJgrVCBMxeKTWPpBGnIaGK50Sy5SZinYX1AnQe7bAkOKeJHW8LNYkk
	 DPqMyWprBXjsvscPyEMSkzd7epOVthAkE2E5Ny7H1dzBPx2ceU4SXXnj0ySkXwRCay
	 6DNqIILZok3O0nELPLNZR5j91d6jawcRGATKPIDohjQ5Trs/MijN/+83nP40GecTCB
	 qL4C3QaNBCHbG4t+hxu5/4Y35k7n2ORQon5W03p7bxcer+T2eopkXNG771YMHZ29E7
	 fiY0acVUDj0qw==
Date: Wed, 29 Oct 2025 13:04:59 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 1/1] RISC-V: Add common csr_read_num() and csr_write_num()
 functions
In-Reply-To: <20251014132106.181155-2-apatel@ventanamicro.com>
Message-ID: <012aaa39-a37b-e682-0e34-9b7d7cd87f75@kernel.org>
References: <20251014132106.181155-1-apatel@ventanamicro.com> <20251014132106.181155-2-apatel@ventanamicro.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On Tue, 14 Oct 2025, Anup Patel wrote:

> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

This patch also (silently) removes the CSR number filtering, e.g.

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

... the above code, and:

>  /*
>   * Read the CSR of a corresponding counter.
>   */
>  unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
>  {
> -	if (csr < CSR_CYCLE || csr > CSR_HPMCOUNTER31H ||
> -	   (csr > CSR_HPMCOUNTER31 && csr < CSR_CYCLEH)) {
> -		pr_err("Invalid performance counter csr %lx\n", csr);
> -		return -EINVAL;

... the above code.

I'm thinking that we probably want to keep the CSR number filtering code 
in; at least, I can't think of a good reason to remove it.  Care to add it 
back in?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
