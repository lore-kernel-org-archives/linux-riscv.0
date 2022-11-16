Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475ABC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6o6Rz9TjWxDJSaLvQF0RWY2YBgDwylG/5LZ4mW+nNU4=; b=MGmBaM29LopyML
	hUiMW+qGQCdysQcqXG5MZD265RKYNykaC5dAp1RpDZRa3prVDxo7odBQ+NuN+5F6AzakqQqlHsZC2
	2TF0I9CGBnN9Esvo26yuJh52j2PlWfskcauWYJhYXHHlRLL4o+T47Bp6Nt5VYsvFcKCf4b1fuccSt
	8r8P31urRS02rmAqDDbkllrRjHdwb6S7x62AoOCKSK/59pFoFqSorlYRSSw53qJG9M96vnykEp5mo
	U+N6C34qpp5YbQoNpyolfNf9LleyAg/CwehBzgZ/1MWl6LtbOMdg33kjJAyC2iknHJRNi3ibzxAnk
	6SiCVX6LJ41eq+r214KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLTo-005zk9-R5; Wed, 16 Nov 2022 16:41:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovLTl-005zj3-TS
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 16:41:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BA876198C;
	Wed, 16 Nov 2022 16:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61B9C433C1;
	Wed, 16 Nov 2022 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616896;
	bh=HYpEHb458ynbxAKabjr4uSIFgXP6E7ARKUixQ37JNbw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=S/lCORL+53IpIORWuv0CT/72nB3+aH4UbStCBy4xwsYjjw4GUO8DNw9wiX0aCYBJv
	 44M6dGbkGYQ1nqWANg80A18EwFOThv8MtqErFQzOapPuV34rA3s/z2Pj+oiMbdU1AT
	 j/eS9WvY21WPImy8rEgcqNW1oP9aVEWqNdxX4kdtLnqBg9YbxE7OYinnA4x2fDdiy9
	 Ogg5vgo7wZetuRfoSbP85mfnJEIZ572r0M0uwLEHvfWz4+iCq7RfXvg21K2YziZ71s
	 M2JHkDmN9hS/0+np3KsulIQvrt6ZyMLqFNqWhSpF3JNzok4R7bYl0XPjxPJWAOv5sz
	 B26h4thcE9Chw==
Date: Wed, 16 Nov 2022 10:41:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 5/9] PCI: microchip: Gather MSI information from
 hardware config registers
Message-ID: <20221116164135.GA1117054@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-6-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_084138_002339_F0FAB172 
X-CRM114-Status: GOOD (  11.54  )
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

On Wed, Nov 16, 2022 at 01:55:00PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> The PCIe root complex on PolarFire SoC is configured at bitstream creation
> time using Libero.  Key MSI-related parameters include the number of
> MSIs (1/2/4/8/16/32) and the MSI address. In the device driver, extract
> this information from hw registers at init time, and use it to configure
> MSI system, including configuring MSI capability structure correctly in
> configuration space.

Minor nits for v2.

> +	/* fixup msi enable flag */

s/msi/MSI/ here and comments below to match other usage.

> +	reg = readw_relaxed(ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
> +	reg |= PCI_MSI_FLAGS_ENABLE;
> +	writew_relaxed(reg, ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
> +
> +	/* fixup msi queue flags */
> +	queue_size = reg & PCI_MSI_FLAGS_QMASK;
> +	queue_size >>= 1;
> +	reg &= ~PCI_MSI_FLAGS_QSIZE;
> +	reg |= queue_size << 4;
> +	writew_relaxed(reg, ecam + MC_MSI_CAP_CTRL_OFFSET + PCI_MSI_FLAGS);
> +
> +	/* fixup msi addr fields */

> +	/* allow enabling msi by disabling msi-x */

s/msi-x/MSI-X/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
