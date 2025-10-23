Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0628CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=D8jDrBhBgwOwjtIWMKg3Htjwep3h+q0nHAB0qltlb60=; b=XXxnctz3CvX/Lq
	aNxg12qnz5MW0qruBCeaY9IsKStTbheoc72SCofe64dh3CvjsuRAJpUyWZYSZWraeYS/ncbSr1Opx
	RMzqoPtLQMv9/vCETi1F+qG4KwYHf44RJflG45qVVuVOxxp1TtgBgvncyuNWVeZWD4vuha5quWAci
	23kFKedF7SA4OVXf/g84gHI+DmBnfa6mr06mSmf3TXknC0tWrLFb0LS7IVuoxcX6h0f+C0DCkRsYS
	drcCl5K/AMFZQXXaz5X3D+XrJ9wLeogH9IjiLqQPW2o0l9Mo9ZmnoLqV0AUeflVNb04qbNEYnNVsD
	UJPVvSugK6a5YdViaQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2C0-00000007YaN-0q2D;
	Thu, 23 Oct 2025 20:45:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2By-00000007Ya2-2MGj
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 20:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95BD660052;
	Thu, 23 Oct 2025 20:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1926BC4CEE7;
	Thu, 23 Oct 2025 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761252349;
	bh=+mP1pvM4InKqRlScVcASL4W4+e15L6r0Y16hTzd6U1Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=b8HF2r44gXjOpem75sfXsYhOVaAy6VyKAljZ399LBb2twmYVfDx7uL/hUCTfw1zjj
	 MfjbryAd3zg3FyQcyj1O+cXHG5lIPySMBFIAySExphNI2nR0jCTzB5HUuNBtj76Ipa
	 mB5NjR4icOf+S4KUtw7g+CczAwqSB/dQ5VuHXxjcZvTjfc4wWvJtaaVnEPBPYeIlBf
	 7PvEVrr75ifXzP/VsVpZ0P9VPbmv0Z3RKTDm6mKKZlljgk+1T1tC1WT33j/Uq6ethn
	 U0smBQGcpEkc3kwr2HdOIa5ESoa59PqXw4GGpejuaZmhXLbVf7TO8OLDLQnKZBzckb
	 8JGCLVT8B0+AQ==
Date: Thu, 23 Oct 2025 15:45:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, pjw@kernel.org, randolph.sklin@gmail.com,
	tim609@andestech.com
Subject: Re: [PATCH v9 0/4] Add support for Andes Qilai SoC PCIe controller
Message-ID: <20251023204547.GA1314904@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023120933.2427946-1-randolph@andestech.com>
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

On Thu, Oct 23, 2025 at 08:09:29PM +0800, Randolph Lin wrote:
> Add support for Andes Qilai SoC PCIe controller
> 
> These patches introduce driver support for the PCIe controller on the
> Andes Qilai SoC.

> Randolph Lin (4):
>   dt-bindings: PCI: Add Andes QiLai PCIe support
>   riscv: dts: andes: Add PCIe node into the QiLai SoC
>   PCI: andes: Add Andes QiLai SoC PCIe host driver support
>   MAINTAINERS: Add maintainers for Andes QiLai PCIe driver

I wonder if you should use "qilai" instead of "andes" as the tag,
e.g.,

  riscv: dts: qilai: Add ...
  PCI: qilai: Add Andes QiLai ...

in case Andes ever makes another SoC with a different product name.

No need to repost for this; just let us know your thoughts.

>  .../bindings/pci/andestech,qilai-pcie.yaml    |  86 ++++++++
>  MAINTAINERS                                   |   7 +
>  arch/riscv/boot/dts/andes/qilai.dtsi          | 106 ++++++++++
>  drivers/pci/controller/dwc/Kconfig            |  13 ++
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  drivers/pci/controller/dwc/pcie-andes-qilai.c | 198 ++++++++++++++++++
>  6 files changed, 411 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
>  create mode 100644 drivers/pci/controller/dwc/pcie-andes-qilai.c
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
