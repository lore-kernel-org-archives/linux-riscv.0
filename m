Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB547C5516F
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 02:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAp38pNt2pHGGNmk/OkzMPoF2Ot8vY+DvgAGOu71dwg=; b=ziIM7786I/WpRp
	lj4N0UEdAxAUN7k+jQOQByj1HgxuBUleXJCyx+z+pQKFathDI/cr7II7aPp9m9Ey6Z2R0mnmEOLSS
	t6l7frT8+85g9SIwSzZv58l9EJBfTrg+trRX/wGV+HMUJikqYkXrtB1WTWAzQXD0Ud/B6qB3XySAS
	AW5Xi9eY3xeCgXce9VYidXrh7Uziqv3DXCZ1t1EN+FvHDDfQgORF9R3AjcOVYP+PHBCjAwtYdmV4h
	4bLEfgQec0/ibQ3/kTBs9EHYnz2Iw1myaCajepytksUnlbu2h/p4MxIpgcfO/g6UAGQ9EaOd1o+fr
	Bye5loMMDOTnLcBv4k9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLlm-0000000FHF5-1whe;
	Sun, 02 Aug 2026 02:17:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLll-0000000FHEz-41S9
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 02:17:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 870D040E51;
	Sun,  2 Aug 2026 02:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED5D1F00AC4;
	Sun,  2 Aug 2026 02:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637061;
	bh=Aq/Cksr2yBrv/xNqFC5ZL66T11jbRr6+oFBbQciyapA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XiUHTVjCJhM9SZInjXWPGOL7KZE8HI8DzCPtbaapWyQC92euZAkap5bZAor/LX8nu
	 4rqEYHsm3K2YtqIM9n6wt8zdSNWd8lozbMvGZD0sC+9rl2nTKWfdQvx9Z6xMyDBqHh
	 fkUNbcYj6iuley/FM+VuC7EW8hc7+w40twF7OenBCnj+32Xbs9Bk4C+prikQl+UcOU
	 m1uU9IHo475Yo0XxUvDCWliGoRbonjX6hslOIL+fg5Qho50AUPhN18xHTC6C10u14Q
	 vIIBXdxU2EIidaDhBdHViYIGzy0R44xHj4TrLNHuIKWIrbZJpPQPMbxJxOmEmMa/+3
	 LJwoLhGW+KwdA==
From: Yixun Lan <dlan@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] SpacemiT K3: fix I2S DT integration and add controller nodes
Date: Sun,  2 Aug 2026 02:17:34 +0000
Message-ID: <178563700560.1616223.8425945303990754428.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
MIME-Version: 1.0
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


On Tue, 21 Jul 2026 19:35:54 -0700, Troy Mitchell wrote:
> The SpacemiT K3 SoC has six SSPA-based I2S controllers (i2s0-i2s5).
> This series fixes two bugs that prevented writing a correct DT for any
> of them and adds all six nodes.
> 
> Patch 1 fixes the ASoC driver's clock lookup names. The driver was
> requesting "sspa_bus" and "sspa" but the published binding specifies
> "bus" and "func", causing probe failures on any conformant DT node.
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=cd01c677869affe1b01403ca2fad8fc0fe85e8bd

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
