Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019CDC27C65
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=slWrMb72FZhzqYKIjWzEZp+H77vDP6UctGM1sgGGink=; b=AYNFKX9SKuef8J
	Zl1lku1SLszYb9Sy4/yTvpUwnP6rITXSJ2HkXieH8ofXL1em+x7PbzZr8ROuGonoMWbSOrdWOUFhR
	gv9FOAD11qzdrLDO66UKMtoUE38ALMRW1px+XB76Y4c88zc3PzdyacMCs6IX1LWz40wtRYsAnwe5Y
	ChlZQBwVkQo638M5kMIeLVgfH2fM5dqWzqwgf9LOBDHCIahupFbRlzhK4W3CTEhePnD+X17lOpb74
	BpfZBucsWyjkFmPdYoo3eK1hZUv7UYph6lfD00DWTQh+QJ06x5CYr0UQ2mAc1bM5aWhxougZ46ng5
	1LXaNzQS0ChgWzQgVUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH51Q-00000009chs-1ETx;
	Tue, 11 Jun 2024 17:11:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH51O-00000009chH-10lQ
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 17:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C24960F73;
	Tue, 11 Jun 2024 17:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9CBC2BD10;
	Tue, 11 Jun 2024 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718125856;
	bh=gFYHyJOp+GLvLO8caFrC+bAJxiiQYs3SDuhR95Pp0qo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rrKsbTQu+g8sy3y1sNoL/1cLUJzwsI+jSnaeJF/MUDr9qBxDOXI6yVew9zke6UlYs
	 Niwyn9lfbTuT9Cr+QujfSQQaieXHLWYZh8rj7ssbarEupC2Bv9YsZPcMBG8kEBJPd/
	 rkjLST5yzg4X8QJWMXnjfCELmLrrgbuPsFerKYAYDP2FBD5vq9FJW4/rSVDGwLTN6x
	 QzCcItvo6D4CYccoG8wXEpusNaq9STs0AOH6kH5KHTJm/5rmKxbH9ZN6UYu9MuQcMJ
	 URp2sqtJbHh5fD7Xt5Ks4nOMQ7g3u4aGSYpsXvt5xO+iMbHTGBJDxXbI6vifW1gyAI
	 U/Slc4E54/X0g==
Date: Tue, 11 Jun 2024 12:10:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/2] PCI: microchip: rework reg region handing
Message-ID: <20240611171054.GA989979@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240527-flint-whacky-4fb21c38476b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_101058_351910_9636A4B7 
X-CRM114-Status: GOOD (  16.77  )
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

On Mon, May 27, 2024 at 10:37:17AM +0100, Conor Dooley wrote:
> The PCI host controller on PolarFire SoC has multiple "instances", each
> with their own bridge and ctrl address spaces. The original binding has
> an "apb" register region, and it is expected to be set to the base
> address of the host controllers register space. Defines in the driver
> were used to compute the addresses of the bridge and ctrl address ranges
> corresponding to instance1. Some customers want to use instance0 however
> and that requires changing the defines in the driver, which is clearly
> not a portable solution.
> 
> The binding has been changed from a single register region to a pair,
> corresponding to the bridge and ctrl regions respectively, so modify the
> driver to read these regions directly from the devicetree rather than
> compute them from the base address of the abp region.
> 
> To maintain backwards compatibility with the existing binding, the
> driver retains code to handle the "abp" reg and computes the base
> address of the bridge and ctrl regions using the defines if it is
> present. reg-names has always been a required property, so this is
> safe to do.

When you update this, can you add something about the objective to the
subject line?  "rework reg region handling" just says "we did
something", but not why or what the benefit is.

The cover letter ("support using either instance 1 or 2") has good
information that could be part of this.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
