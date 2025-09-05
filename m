Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AACCA1010
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7Bmd+yJR0RYbydMvCUYzWQrrxqmBHjgl4of0+u7ZEU=; b=Zb5VJjYxKREkRJ
	gGHNxyjD4TCM4OmtsdG/RYPthdZylB0RgN69xfcJ+9xf2VkkprMITrKaakJzooqH6t1HqIg/xqkuk
	HZh1qHgrmeFrMn0cVd1f4K1/YAqEYyyf5k9aQexPwe0/2ohEiadJy/oijKRXXK1kFdKh0FquUMrI7
	/d5hSUZMXGA6rQ81UVy6L1ugvJLrSg2yArfeifJ5JcGn5wl/YNDqWKJSbK94BJpPAnLGIttaOdLHL
	hDK7ByD4c4Qb/gMAQCjxxyAM1LGA23zqlABaqOAVePWsVlAzZaEstL8DbK837IqGAsayw69qXuwHH
	X0eLcqvn/P2lsu1kL4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZVe-00000003BDk-2tYB;
	Fri, 05 Sep 2025 16:41:58 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWAY-00000001sKp-3Yi7
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 13:08:00 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A487C54B04;
	Fri,  5 Sep 2025 15:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1757077676;
	bh=l2WYFgNBaZ4MPlTyWgrzjuvT6QefjAm47yBpEriSIzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3ruazn7B23/bC9vVhxp+lCN8z7Ji/30T9XvQ2a/vkxR1T8vn/MEx7ESEE8ox8Orv
	 qfoYJMK9KHecd97sU1eWDtxrzerXg5xyJyXxKQJA7jveApAefw43PWOxzpsN2py9km
	 RN+2ztf2Qg5JBGtK9h60EkPo6iwO+PRoTSjOZO38GdWsF+uG6NoHjuMG85yD2ZJWoE
	 aAsezNtF6WzYs9xzWGBdz6csTgf9taXtwp3tkCoA9fYKk76swDbEAtjypBlLoIj3Ta
	 J1Fx7jaDTMoeVfM/rC91FNmrTYTlt3nkzdjm0hKFNOmjRhUHYOcRL+tGr2wAWUVyhF
	 e7WkErgLNTI5g==
Date: Fri, 5 Sep 2025 15:07:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v6 0/3] RISC-V: Add ACPI support for IOMMU
Message-ID: <aLrgq_n1WiQxOKmJ@8bytes.org>
References: <20250818045807.763922-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818045807.763922-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_060759_113004_553C9999 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Mon, Aug 18, 2025 at 10:28:04AM +0530, Sunil V L wrote:
> Sunil V L (3):
>   ACPI: RISC-V: Add support for RIMT
>   ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
>   iommu/riscv: Add ACPI support
> 
>  MAINTAINERS                          |   1 +
>  arch/riscv/Kconfig                   |   1 +
>  drivers/acpi/Kconfig                 |   4 +
>  drivers/acpi/riscv/Kconfig           |   7 +
>  drivers/acpi/riscv/Makefile          |   1 +
>  drivers/acpi/riscv/init.c            |   2 +
>  drivers/acpi/riscv/init.h            |   1 +
>  drivers/acpi/riscv/rimt.c            | 520 +++++++++++++++++++++++++++
>  drivers/acpi/scan.c                  |   4 +
>  drivers/iommu/riscv/iommu-platform.c |  17 +-
>  drivers/iommu/riscv/iommu.c          |  10 +
>  include/linux/acpi_rimt.h            |  28 ++
>  12 files changed, 595 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/acpi/riscv/Kconfig
>  create mode 100644 drivers/acpi/riscv/rimt.c
>  create mode 100644 include/linux/acpi_rimt.h

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
