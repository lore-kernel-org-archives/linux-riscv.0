Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E259C83F17
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jul 2025 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnZCBwwswnutjZBll2tLwN6km9DwWW54pLRuGU3Ouyk=; b=FTrJUQqotIh7he
	rFrLZurif1Fsm/Lp0qoXuKMI7AqUEeQXxfI+TDJ3t9opqRLCGNqbMELDSdGU0QwTM0yTtV9yYcPvH
	+PRLIqi27o74ahkOqdroVUtmM309KaYufRIJr0/qBy8uZMDwCaYOX+EG+wTeMDbPb5eI037KFc05H
	3ZhD1k+2R7Nx/QJIyvM8DVaK9jLD+MyNe4i4jkCG4AouboxUguVqPFKW/BUUAvFGNyn6NVwcwCi1T
	Yxk5C+KTbfCBNt35xvX3/O9rkUw8NOKKyzRkM1Rzlg4AjUIf0+f7Ao34pZEVaingAQevwRYTXYTxK
	7UjHkLiOYL0qstPHAoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uavBH-000000006vn-0EH4;
	Sun, 13 Jul 2025 11:47:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uavBE-000000006vS-0qih
	for linux-riscv@lists.infradead.org;
	Sun, 13 Jul 2025 11:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8222545F0D;
	Sun, 13 Jul 2025 11:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7336BC4CEF5;
	Sun, 13 Jul 2025 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752407259;
	bh=M/pi6LcA8Q4D+HAp7JPhFXciqaEe2rBWyhTGd354j1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5cG82/4gVQfid77wwr29J57EImm7MjS7SurIH1RZmUizMZ6e0+tnRbr0JpNOxIx0
	 KqQI6Ppp2MqsW6wxvPivqX//8zf403hUEFmoifKoAguPaiBlD+4XR1YVzte91l7mT7
	 F1yMfSFBaITIpGfjeJn8Z4Zz12K+hCyFbmaHVQ2iYqoqIqs3hpXtSMUSUWExjRj3m1
	 uI6qnGvyJRUGnRwstf4pEdLf+iO+3+Cf5F6wiyg/uxr/9rbv8bR70G8X4zHl6z+2Qp
	 rRPQzuRnmtxCU4JrinplBVAJJZ6x4NwYdZiNyrVZuvGuYMTOv5W9lGv3CENcVnW65G
	 JcA/h1HkvEbmA==
Date: Sun, 13 Jul 2025 12:47:33 +0100
From: Will Deacon <will@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 3/3] iommu/riscv: Add ACPI support
Message-ID: <aHOc1Syl1roOd5Pz@willie-the-truck>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630034803.1611262-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_044740_264034_EEC13233 
X-CRM114-Status: GOOD (  13.45  )
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

On Mon, Jun 30, 2025 at 09:18:03AM +0530, Sunil V L wrote:
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
> ---
>  drivers/iommu/riscv/iommu-platform.c | 17 ++++++++++++++++-
>  drivers/iommu/riscv/iommu.c          | 10 ++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)

This looks relatively straightforward from the IOMMU perspective
(assuming the driver still compiles if CONFIG_ACPI=n) but the ACPI parts
in the first two patches need reviewing before this can land.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
