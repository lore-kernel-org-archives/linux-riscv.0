Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D825DC79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 18:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqLDmABbRdDN4evFDx/0Cdva4p7D/e/TdJKJ6HdkmlE=; b=xpdgNgftyKoVtD
	0816WrCu86ySnvVWzJ9g+a+eQB9kzVhntXiY/66+LMyE191S3jcYAs6eyHaDPR8am6kzxV0YC7WQg
	s42Gs3qOnOzqeaZJ84Vvlj31YReQ1IT6/a7lCZTHCUgjFv8b541ImBpuX9D/UAAek3RYIMV+KoBYE
	QUFWoee3DCfveO87KwT7MJF4KoD1OOMErihV43Pg4aAABgAQMZIfI2OvKMWAFd/N32E56c8H38FQv
	1PmUOHAQrf4KocvQNJxf0c/HTmcmRXiiir/WMRJhAufbcwZoq3QooVnStkpaNfz6tjiFt+NbkBUzu
	hfwj/nlaqwFrnbs+5OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40Qu-00000009xWa-2wUi;
	Tue, 08 Sep 2026 18:20:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x40Qt-00000009xWQ-0BU2
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 18:20:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93EB8601F9;
	Tue,  8 Sep 2026 18:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B35B1F00A3A;
	Tue,  8 Sep 2026 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788891632;
	bh=mpzINRNRq1CBm2/HslyepZlk5MVgORYoamd+SFjS3ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TP3HBXBL+799ygFMkGXjA0a7gu7THkPZVcee7jnQRYuvBNYQgUSpJouE4ppvKRMbt
	 Usv5TCWPajZa9XzDeGFluNmuRl7z2ikzJHyKxDauLaTD68V+OB3dqiQKod5E1QN8Di
	 fC3S564bxug3dz7H5yR7DIRjohByzsUGOXki+03MIu2YP43ZHgshEr25tLUPjUpS4E
	 eKFSTfdOBtY0yvq2zpfdLGy755+DPe2qINIlnZeO6yrARq0V2zSzdRqzDkK3/tHzcR
	 PSOSVNQme3uS0AHtRPaGXw4tuDBOSgCeShGBDoPCn3xqiNcN1beg7WtAPk7JjIAJcu
	 XAPFZ9erBBu2A==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts
Date: Tue,  8 Sep 2026 19:20:27 +0100
Message-ID: <178889161920.3146991.520958835856287447.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904172253.2274751-3-conor@kernel.org>
References: <20260904172253.2274751-3-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZjFyHx8kfO+HZ4s57D5vDO7q0jUtFSGy5PPMUBeWPak=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFkLAl9XtWW/Trfe/PyqWVz/n8bJl+66FL1ly1+k1vtvp mPcGvGVHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIAhsjw4P9eyRvLL5QX/bs r0MM/9Lze4wfzsrOdLMquFFmfTtmwn6Gfwp7+hLEPk35vn3iQ700rjdxUv4q07m+5JjbMO5IrFD sYQQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 04 Sep 2026 18:22:55 +0100, Conor Dooley wrote:
> When the irq-mux and its interrupt-map were added to the mpfs
> devicetree, the gpio interrupts became fixed at the SoC level rather
> than dependant on the design - the interrupt-map is now what varies.
> The beaglev-fire should have had its dts copy of the interrupts removed
> but did not. As a result, the mcp3564 driver does not probe, because
> even though it doesn't use the interrupt at present, the SPI core still
> looks it up. This lookup fails because the second copy of the interrupts
> property doesn't resolve to something valid when passed via the
> interrupt-map. Remove the second/incorrect set of interrupts properties.
> 
> [...]

Applied to cache-for-next, thanks!

[1/1] riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts
      (no commit info)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
