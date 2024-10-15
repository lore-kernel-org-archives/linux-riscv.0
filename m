Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A239CFC279
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZC9aBRHEXWnFaDyqPkhvcQWS4WfZuORvKR4/0U1cpPs=; b=b7y2fmjSNT7DM2
	uy1tZRVWFyUcbEDPDuI4iWOYXvsmOAUMIZ95rMdxE8kDE1J1VunSJ61IOqAzwhk7Lfju+NU5Y0PA2
	BEMdqYQXef4MlzxQ30c9TzFXMfQff1yPxOWftiuVuqgIMT1NoqFTwvFShRy9tKn1q+rQlxyJKciIF
	trN4TnA5i0EWfJOwiC9fQKiEx7EaC65LdeFiD1Gwxdilf3gJUsN7eTA5tfYHi5GiXVJ7oTE70uXDC
	8JpoVgIF9AtBJBgCPcolahwV4IdiSI4++9NRmVgTtdkkPpQtM0CLHyBfSghDi5sYZBDrWvap7XR/H
	UBfl9hn7mrXet+ZOmrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dcN-00000007eoK-3zPP;
	Tue, 15 Oct 2024 09:13:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dPE-00000007bHl-3qpU
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 08:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2C6EA41792;
	Tue, 15 Oct 2024 08:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C35DC4CEC6;
	Tue, 15 Oct 2024 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728982791;
	bh=y3aK+OC3+bmAwtiyXzBhoRjPUn7oC1omzxWkKEaweQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNvBY8RbYZyW4uIXyvjZb7rC0g0Dkmw0bowhZixXU3TgcAe8Tdou+A1/BSJX5p8m6
	 kHMuuCu+6Umd1KgKySjGYD6HLzjA3IXG7w/P1L+DC5pK1M/Q2iv3ubfT1aGKMqSKCk
	 iNkuVHtfe5Lu07Fr+ZrC5zdY/q6HaZGFESY0Osb/mmUinKZ4Kp8iDHt6Y4q3GKsIzO
	 OyDT0UaJo/4dRnRINUGRAH4mvmEmK9gzdW/NpZWBR14lCWLOHnlq4kJYY/a6iBqZKQ
	 aDIEpw29fBzj2njrU+bsBPK9wRkXDy1RkcyakFs3hSirX7pHWTD/qGm90vc/+SsRhR
	 7Na8oo9GHo4Mw==
Date: Tue, 15 Oct 2024 09:59:45 +0100
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v9 0/7] Linux RISC-V IOMMU Support
Message-ID: <20241015085945.GC19110@willie-the-truck>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
 <Zw4s3BHQZ6x4d79-@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zw4s3BHQZ6x4d79-@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_015953_042554_B77372FF 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2024 at 10:50:36AM +0200, Joerg Roedel wrote:
> On Thu, Oct 10, 2024 at 12:48:03PM -0700, Tomasz Jeznach wrote:
> > This patch series introduces support for RISC-V IOMMU architected
> > hardware into the Linux kernel.
> 
> Thanks Tomasz. I plan to merge this driver into the IOMMU tree if no
> further objections are raised in this thread by Friday.

Sorry, bad timing on my part -- I just left a couple of questions/comments
after Drew poked me at LPC to look at this.

Hopefully we'll get those resolved asap.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
