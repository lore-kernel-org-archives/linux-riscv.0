Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D43DCFC276
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 08:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgF7j6R+fdH8dkNlS3dwHO6jGY32c1V36Ow5o69ZZMg=; b=vjS4CVtqSHmijW
	cEeSxgVbwmpH1SErZiMrpjAAkMsbsMnlS+yipBC/Qjw+WMfTPM5Old8+lfeZBgGTxSspMCSz0pnUz
	gpDQ210F4R5URe96w2X9qIIaYm8y0W0WFj2w06FOjYAQ4+fRyGhUTdlXuSYFTQkcR4r+ITjj7vDwc
	EapVPPNYKOPwUnN6+coE0RF84G/mfQ/xCEBg13PFYkLUz7QrnJ2j28C4TyxN0lGcF+oAHizVSWOgK
	RwMdIsgzRNB9sCerAbrQ+AShNsKcIPd6r1kEsaQCsc4+CpHAO3oL49K89Mb0OIE9fPGRAdxwKHIyL
	E/Lyop/3OCfdE8BlFTrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dGN-00000007ZcA-1R9n;
	Tue, 15 Oct 2024 08:50:43 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dGJ-00000007Zac-35QL
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 08:50:41 +0000
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A4E842A01B8;
	Tue, 15 Oct 2024 10:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1728982237;
	bh=O4+wEG/X9xbfhukqS6DHHrV3rRut28DqQfj0gz0kqus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkhIVplw2EPEWkpN2AX8orxgpWlon1PjyqdW4jrvqn+tpEfcC5r++4e5j8xPKMFL5
	 0o1Ur0m6qhtQk+AHw1L1u/eWGBlUSecUMolC2VJhZqVxs+ZJQcWipnqgvvpzHYngBJ
	 7UNbr8Q0F+oNR0o75QukuMadhitMrplp1ElOwSGAsFtqb+6/1RezN5xp0V3401jRyC
	 7jNalyIgAGt/JTr+JJ/nilC9YHJc/BuvoIFdYVmVqG4qkD/taXOiORAbKibndroOTX
	 HiW2XHURYBYraGpyjPwOy1G1XI115tcLW3jz06nk7NOr59xzGSzR79zZ27mX064/x5
	 M1zVsFKGWMotg==
Date: Tue, 15 Oct 2024 10:50:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v9 0/7] Linux RISC-V IOMMU Support
Message-ID: <Zw4s3BHQZ6x4d79-@8bytes.org>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1728579958.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_015040_022957_6321E217 
X-CRM114-Status: UNSURE (   8.94  )
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

On Thu, Oct 10, 2024 at 12:48:03PM -0700, Tomasz Jeznach wrote:
> This patch series introduces support for RISC-V IOMMU architected
> hardware into the Linux kernel.

Thanks Tomasz. I plan to merge this driver into the IOMMU tree if no
further objections are raised in this thread by Friday.

Regards,

	Joerg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
