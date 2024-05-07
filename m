Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13907C25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiVWIpoupT4GBEne8ae7vasR9TirSIUi0vC4eLiMh3w=; b=1fV1m7Arme7fmM
	XOAbSdkuIw3sZUS51yocjZkziWKOdlTfBAhfw7CuoK06ZwS8OKvuZr9M6hqI9Uk+fzK4AYvL9bTue
	913ZuTF4/bqEi/pJfLmPVsiUeCDdIGvVAaXqht0ZgmPcpQ4ITvfwQhSg9K+yquLca3GwPtoCA+qDH
	2PQan7xso6XIis7OF2BXeAz7eEV8gIpaaTouj4xMPi83WJTeSNQYpurDxaogCMb1d9bxE/n54WLy5
	ieR3apn7PTJFUd3/kC21RR4ShN9m0TKhBcqoSGBxU3f1OOgYkjVIJiJY1dl/RimvhdXMfdfZr1Szj
	etkMnAkWPMCpulyAPzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4M7W-0000000Ba03-2RHm;
	Tue, 07 May 2024 14:48:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4M7T-0000000BZyn-1oUT
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48F296179B;
	Tue,  7 May 2024 14:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A89C4AF63;
	Tue,  7 May 2024 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093318;
	bh=urdxsMlEzLQBGVqSKnxrypj4fBHWfpgOgfIX92EUsvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiVBOLbxPUAIFbu38Cyv0TU+25GTrEESVMN3vjRSuUjR9aYs/eaWgKNGihOnzF8Fh
	 rHzd7knaeJG34ACNTajX4zEYFNCQsgt6pJKijjtMqRMp+Q5QJNVYY5qhvLj+AgSzYb
	 fzSl5VkfwfhAFYWAOAhy09KcJhQBK6l23XvPSnNtXF80w7cwq94EACPyIFdMvHTh5v
	 YFJA9VKOtfDHlRzQaFtmVd9l3EUTmXpaGKmOOhEwNxp/1j4WaeKBijog6QtAK730Xe
	 xbxNwmoDHTzlye3dnNu6Qx+kOZt237/19gXuDexIk3po7XZLE69DphaqSgR2oY4uzl
	 FDWLxxIVQigbQ==
Date: Tue, 7 May 2024 09:48:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: iommu: riscv: Add bindings for
 RISC-V IOMMU
Message-ID: <171508897177.213758.18021668060802877165.robh@kernel.org>
References: <cover.1714752293.git.tjeznach@rivosinc.com>
 <845127470ad85f9b4f690077968fe8c5d615c538.1714752293.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <845127470ad85f9b4f690077968fe8c5d615c538.1714752293.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_074839_700454_32EEFBB2 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 03 May 2024 09:12:34 -0700, Tomasz Jeznach wrote:
> Add bindings for the RISC-V IOMMU device drivers.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  .../bindings/iommu/riscv,iommu.yaml           | 147 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
