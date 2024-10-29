Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7F0D5B16F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OH1Kq/kBIqwtRV+wSaDUODebtvxl1a2GMuIla0xe8Io=; b=bXWlgLwj1Xiipt
	R4jmRH4eczUev6zixIPIcpCkRyVvpBUC4ZL59QDL/DVfmA2utrhaWx9gVgdkLAKo1JP9CpUJklo4I
	AQX3kY5tXcpLz9Q4zI2DsKR/ouCNOS7l/fWFcC6Wa23JC3pJkMN7yz5K2cFhPGT389gBLGCdSOTNc
	zd131xINPAZv2dsn1U5gOW0uqhz4MuCKEJgLZjlwPwwbA0wr0235aCOEHln/Y07aZ7AcAayLfnzK6
	PS2y/xrZGr6EuJ1atEkJh434gb4XIEZVIWU0mhmvCMD4YGqQ6rcHcqqzh/zohXnGkMKT0A3tKmHe0
	X/oiP3N4kCCeK5zmnGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i1n-0000000Dmef-1yNr;
	Tue, 29 Oct 2024 08:56:39 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hod-0000000Disg-0php
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 08:43:04 +0000
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C9F922A8D55;
	Tue, 29 Oct 2024 09:42:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730191377;
	bh=3obJMxT/iLNG5zmbZLIIDYwv1bCDqT29YPV4LLHT0D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLdPx2b4pXUOpdWcGGiZXG7u3OzXLN6XCbArTH3FfOyophisj9GPCdqyxU09urIbD
	 59hcffdqEwheqtSj3u1GTs2Qd+456uO9RnH6OQvFu7DgPzmlX2MgA8ImPV3W+hIAuK
	 7uMRhfbNmJ0AxIrWe+NaPCM+Q/uuCcMiSlfmQJqKNiiQYtRWn2nSO/yWhwWgpvoBDG
	 NxEU3qLL1UtEOuAnBr1ElB45c02hIG2ZlsnLEOeFem3W+eWn5HA5iMsGjhi0uPeQuV
	 gWgi7t1m9kHJEyy62z/4KMd55SOZ8BN+ZQuCFTsOryjHLi/JgOb4VS9tfWNw58y/t5
	 BrCJJnxD7LU7A==
Date: Tue, 29 Oct 2024 09:42:55 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v10 0/7] Linux RISC-V IOMMU Support
Message-ID: <ZyCgD__VeR4LJj_a@8bytes.org>
References: <cover.1729059707.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1729059707.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_014303_478814_EA76890D 
X-CRM114-Status: UNSURE (   8.24  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2024 at 11:52:12PM -0700, Tomasz Jeznach wrote:
> Tomasz Jeznach (7):
>   dt-bindings: iommu: riscv: Add bindings for RISC-V IOMMU
>   iommu/riscv: Add RISC-V IOMMU platform device driver
>   iommu/riscv: Add RISC-V IOMMU PCIe device driver
>   iommu/riscv: Enable IOMMU registration and device probe.
>   iommu/riscv: Device directory management.
>   iommu/riscv: Command and fault queue support
>   iommu/riscv: Paging domain support

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
