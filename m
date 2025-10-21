Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97C0CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3vL+zJ2u5X8QkbNvifA138GU7kUKHRrdeuY9gzeyXAA=; b=xCV6aRyaJ+Cib+
	YUvipz2yem4bG2CFWUkCNBLxFQvLwJpmTE2TfxGeRytJ2qenOaVQpW6oGNAsYLyxbQxYOFPTbkwo9
	q2ooJUzzUINnTxkCWVEgUzXpCFAgnc9YfZM5iODm9YzBve2EpM8EpGWMhXY2PG+MnXkhP5udMiMeQ
	gfa0apXBC29Fy8STg6bqTqFyJ/yWG9fOneBoa9Ta907p2l0RWDWeqUE+1TE4LWes/7OrmU3ofjfcZ
	16Qs64LPUdl365ykTro4wZFR2y1PYHLfTT3c2Upu+Nli7HHtxOOjVhF0rd/MbnSCu4pWP8uplH76O
	BhwIJtVcEQMX/zla33vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFnU-00000000Bfw-2vR5;
	Tue, 21 Oct 2025 17:05:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFnT-00000000BfV-07mK
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 17:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B3906257E;
	Tue, 21 Oct 2025 17:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2BEC4CEF1;
	Tue, 21 Oct 2025 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761066317;
	bh=nTdwv3Rks8hDE9igPxkMOcHeAQ1oHeXXF17Qtt8UWNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BfuC1iWzEwI9u9n3LOJLbQ9s2OOkABW/X5O5BnhDVairX7hiGIwwWZR016oUFlwhd
	 fLc9xJixm03Nir31F+8FRS2DqKVHlOaKQoMiET30k8XwvAI9JuvZQQlw6Suz9KFJDQ
	 ox4zVMwDHa3Rit7JDT8rwHqFrFE2t7TbqFaIFpnPm5fDtgU+imc8VUidXrarKuoXkR
	 ALUwTwN4+BKPW31Ig46yCYPeG5IKzsXqLPLqkDUKMQ/vfEEH0WkdhZDguNgR5ZfI7A
	 JX7fkvUJzy58mZr5oCilgJPOLWAjHKSuzubpSWTJ22XmZl+JWxkIBF7kI/eJqMo0FQ
	 K4d13AKGqsNnA==
Date: Tue, 21 Oct 2025 12:05:16 -0500
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
Subject: Re: [PATCH v8 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <20251021170516.GA1193376@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120349.656553-5-randolph@andestech.com>
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

On Tue, Oct 14, 2025 at 08:03:48PM +0800, Randolph Lin wrote:
> Add driver support for DesignWare based PCIe controller in Andes
> QiLai SoC. The driver only supports the Root Complex mode.

> + * Setup the Qilai PCIe IOCP (IO Coherence Port) Read/Write Behaviors to the
> + * Write-Back, Read and Write Allocate mode.

s/Setup/Set up/
s/Qilai/QiLai/

> + * The QiLai SoC PCIe controller's outbound iATU region supports
> + * a maximum size of SZ_4G - 1. To prevent programming failures,
> + * only consider bridge->windows with sizes within this limit.
> + *
> + * To ensure compatibility with most endpoint devices, at least
> + * one memory region must be mapped within the 32-bits address space.
> + */
> +static int qilai_pcie_host_fix_ob_iatu_count(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct device *dev = pci->dev;
> +	struct resource_entry *entry;
> +	/* Reserved 1 ob iATU for config space */
> +	int count = 1;
> +	bool ranges_32bits = false;
> +	u64 pci_addr;
> +	u64 size;
> +
> +	resource_list_for_each_entry(entry, &pp->bridge->windows) {
> +		if (resource_type(entry->res) != IORESOURCE_MEM)
> +			continue;
> +
> +		size = resource_size(entry->res);
> +		if (size < SZ_4G)
> +			count++;
> +
> +		pci_addr = entry->res->start - entry->offset;
> +		if (pci_addr < SZ_4G)
> +			ranges_32bits = true;
> +	}
> +
> +	if (!ranges_32bits) {
> +		dev_err(dev, "Bridge window must contain 32-bits address\n");
> +		return -EINVAL;

Is this really a PCI host controller driver probe failure?  I assume
there are devices that only have 64-bit BARs and could work fine
without a 32-bit window?

If a device requires a 32-bit BAR, and the PCI core can't assign such
an address, and gracefully decline to enable a device where we
couldn't assign the BAR, I think that would be preferable and would
identify the specific device that doesn't work.

> +	}
> +
> +	pci->num_ob_windows = count;
> +
> +	return 0;
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
