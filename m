Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8D1C83F1D
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jul 2025 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kiX1QGWULBDUVutQ7+bJoCI8NZE2bqASTxjJFL7J8Y=; b=FXDRhdoQ8EV0mX
	huAdaVvW8EOacsDDUvbgzLGIE8eJuNi8pwtVzYQ+n0Qjqsi1n34W8T52R/ho5LzcnnQ596I7pT8dM
	o3+0s1xucKWteGXaew2Ve4DpcBJfk/F8EOH+GAvjddn7+Dmb3/FgPOFigEdecqjczct49Xs0LKAxB
	8l3EaRSX/aTHOlwl3Ky8PyGP4tLo/OV4sf/wp2m+jq7+HPw3LiivCn8VKvwEIRg99Z1CBbtRIRVw4
	dgA2KFuXKDmqUjqTUvKiiyutaukhgCiUQ/XpCzh09WnoAOqizj5fiSd04yZvp9WRCoQ+EuFzrWg3R
	UtcxzxKi6qTbyWAS9Iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawuA-00000000CUo-0Z9B;
	Sun, 13 Jul 2025 13:38:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawql-00000000CGU-0zJh
	for linux-riscv@lists.infradead.org;
	Sun, 13 Jul 2025 13:34:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28BF4A4D485;
	Sun, 13 Jul 2025 13:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3888C4CEE3;
	Sun, 13 Jul 2025 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752413677;
	bh=M0e7BZCRHQvfdjHIlPvPxnacXc8HJ3PDKZo0Z3OiJXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HiV9hFLr8XQeVItHWo75SPFqO5eqrOznmElvxKVepqha9jdxgmw7eTbwOWIlCH1Dp
	 zHUlgmf2x4oJHKW97aVh4OHhpJtW0WY5tKsl/yHPCJf8WgNMzOaLejiRKz+xmdS/2Y
	 sIyMkA1gAcoxsrke78FuWKVLJmRMuJ9LLiKNh9hI68F8NO8YL7u8S2dtvf0LFrlK4H
	 AnZBKWlIxXev4xL6vTCTfsJ43R6ZpqlX3/4znWHtnREOr9RA6Y6zrnIVjUXCx6tyHr
	 022ikIksXB9GmjH8RjWhlB54FqJH14XUYhmI/gGuW5ybD8I006KhhtAoPv+4fNgEfX
	 4TH++r9lkI0jA==
Date: Sun, 13 Jul 2025 14:34:31 +0100
From: Will Deacon <will@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v4 3/3] iommu/riscv: Add ACPI support
Message-ID: <aHO158RO9fD6mXVh@willie-the-truck>
References: <20250710085657.2844330-1-sunilvl@ventanamicro.com>
 <20250710085657.2844330-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710085657.2844330-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_063439_339321_21840FB3 
X-CRM114-Status: GOOD (  14.28  )
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

On Thu, Jul 10, 2025 at 02:26:57PM +0530, Sunil V L wrote:
> RISC-V IO Mapping Table (RIMT) provides the information about the IOMMU
> to the OS in ACPI. Add support for ACPI in RISC-V IOMMU drivers by using
> RIMT data.
> 
> The changes at high level are,
> 
> a) Register the IOMMU with RIMT data structures.
> b) Enable probing of platform IOMMU in ACPI way using the ACPIID defined
>    for the RISC-V IOMMU in the BRS spec [1]. Configure the MSI domain if
>    the platform IOMMU uses MSIs.
> 
> [1] - https://github.com/riscv-non-isa/riscv-brs/blob/main/acpi-id.adoc
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/iommu/riscv/iommu-platform.c | 17 ++++++++++++++++-
>  drivers/iommu/riscv/iommu.c          | 10 ++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)

Sorry, I missed there was a v4 of this. I'm not sure how you plan to
merge the series, but from the IOMMU side:

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
