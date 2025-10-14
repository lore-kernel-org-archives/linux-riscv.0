Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A776CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 09:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktTeCzzD8IDX3l+l1uaOdKQK7DEEPmq7Pz5Z1MHOCc8=; b=b9X0gkL2DTmyda
	pDTGVTaj/wEPXxoWAXgHvumDD/kzm0PGEiqo9yXYbnHjyOTi/s8BumqiTp3F8/SNYYxhRKlttJC2J
	2atvlX2rSqccZhSQfembe+HAT3Ggj/j4mARE0ddxZSL46ZC37sFyfq/hSJoVCH+2JHjE55/YuXu5I
	kUM7F0wa5FjkhIB41jEhvRn0k9QkYl1g1L8rAnNKnd4jx8ptMUfRt5F1JeD3Fna1HaBC3SMnLkjHS
	wpCWqo/dAhOiv06nw5Kqd0Dyfk/1YlW0ZOc88hX5E+ykpbfWec1wz5Bqn2ts9PJXOw1ECXJTzJyiO
	DhTifP1opL6o/fbH+AbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bZb-0000000FnVg-3hH1;
	Tue, 14 Oct 2025 09:44:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8bZZ-0000000FnUp-4400
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 09:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4905B42B18;
	Tue, 14 Oct 2025 09:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3F1C4CEE7;
	Tue, 14 Oct 2025 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435041;
	bh=62DynX5Fht+DyP/QVDKn/evvRtifvlmnihjlLkxrxfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYv0ioYyVYUDNWbhBpxV2Ik86MO0Ueb8AQnNsXonFkoyeF7JcywfD/Fk+h8KezQP/
	 NJRfGcvdAmaqJ8w35uDS1nWteDw5MSoHCPkxaRwsnrLGnQnGu18aSs5WaBaEJeLALL
	 nLUGTxuC0d97AsbCRIHz0vpMg2FjfxXCP/iXdtk0l81+yHpjp3xC+FHEk3M3UoA9Vn
	 mAso3gSByLshjh6KIU1lNqfZTLL0z5NGfB2uDbqzw39D1dxOUTUJiBqAyDncbB+ce3
	 6TfyB1nSVarfBD+t3sp5QNoq4Gh9A3PIP1u/GY8MJJ5h2Jds2MzK7iZ7EYePS0eEuz
	 UzNGKmv+kbc0A==
Date: Tue, 14 Oct 2025 11:43:53 +0200
From: Niklas Cassel <cassel@kernel.org>
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
Subject: Re: [PATCH v6 1/5] PCI: dwc: Allow adjusting the number of ob/ib
 windows in glue driver
Message-ID: <aO4bWRqX_4rXud25@ryzen>
References: <20251003023527.3284787-1-randolph@andestech.com>
 <20251003023527.3284787-2-randolph@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251003023527.3284787-2-randolph@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_024402_024177_06A276E3 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, Oct 03, 2025 at 10:35:23AM +0800, Randolph Lin wrote:
> The number of ob/ib windows is determined through write-read loops
> on registers in the core driver. Some glue drivers need to adjust
> the number of ob/ib windows to meet specific requirements,such as

Missing space after comma.


> hardware limitations. This change allows the glue driver to adjust
> the number of ob/ib windows to satisfy platform-specific constraints.
> The glue driver may adjust the number of ob/ib windows, but the values
> must stay within hardware limits.

Could we please get a better explaination than "satisfy platform-specific
constraints" ?

Your PCIe controller is synthesized with a certain number of {in,out}bound
windows, and I assume that dw_pcie_iatu_detect() correctly detects the number
of {in,out}bound windows, and initializes num_ob_windows/num_ib_windows
accordingly.

So, is the problem that because of some errata, you cannot use all the
{in,out}bound windows of the iATU?

Because it is hard to understand what kind of "hardware limit" that would
cause your SoC to not be able to use all the available {in,out}bound windows.

Because it is simply a mapping in the iATU (internal Address Translation Unit).

In fact, in many cases, e.g. the NVMe EPF driver, then number of {in,out}bound
windows is a major limiting factor of how many outstanding I/Os you can have,
so usually, you really want to be able to use the maximum that the hardware
supports.


TL;DR: to modify this common code, I think your reasoning has to be more
detailed.



Kind regards,
Niklas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
