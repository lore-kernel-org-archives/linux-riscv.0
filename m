Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19809CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgegqiFtib+CrLOf+n8iWRIRpUYmKTs1PPIIh0tT7Sw=; b=W5jyEHutozEqZM
	yCNX2hkyhyDiAaNAphpqhrrvndJadyz1y0gGG6Q4mrK+iNDNAmH1IPm3Nifx9HnDjuOzR2G4wXpwj
	LKZiMYNa5XGd/9vK+TI0AJ1hZ6Ts1UvQtBF6GfTpt3i+L5arajIuPsv2asVxlee1/7Agrsj8tT59a
	vYSCZvi7vBG2ikpHV4vAhUKdqxHFFim1J6d339QVF3uUVrIhWHZ0hRGJeBm/hvCOuTGBYwfkYsROh
	y89hGYHb7B45v/0xreY1+hnzBY7+ZWHwr9XPXSdjEzbE8pW0fYQaGqTUCs/Qvn6AUSEyIx7KZ1W20
	gevXsrBQMvN0NmBtvlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbIY-0000000BSpL-1k8f;
	Fri, 02 Oct 2026 11:19:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbIW-0000000BSpC-1enR
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 11:19:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A9E943EEC;
	Fri,  2 Oct 2026 11:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A391F000FF;
	Fri,  2 Oct 2026 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939967;
	bh=zaPxFWn5phk1poNRE58QojD0V2a1+4RKn/uvTqNxibg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A5+kComBFwibwIBdu4/nl2+6XPwpM13HBqbAX5eu91k/JApiaNiENgKducsCrVGQ/
	 TqI0pz3lugDEksMOSO6awWNy5cC/BTvrAgMjaXbVYX77f37UxF9nURhIFSjjm52pNs
	 phPOEse/wMmmtcdiXKTEJeDIJsOVIxdRGw0OmQss4KKU4tgAKxYYvxFfvLErjCAUjF
	 oroUCb0m3nCdTgDByBbi4OzqYFUA1JlOfoHoK/UFGd8ZPJ8GUouYUtEaq4qPMxweTy
	 daf8ZbSaZR6kLL4GZptyD5OOPAJ9VBemjQyqCeC5IsYWuEJcXIfP1gIcq1rygfDB6l
	 8+kKXK8nVjoYQ==
From: Yixun Lan <dlan@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 0/6] spacemit: k3: Replace bad CLINT node with ACLINT nodes
Date: Fri,  2 Oct 2026 11:19:15 +0000
Message-ID: <179093990819.1237110.17149048431287759426.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
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


On Fri, 18 Sep 2026 00:29:32 +0800, Junhui Liu wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>   Platform IPI Device         : aclint-mswi
>   Platform Timer Device       : aclint-mtimer @ 24000000Hz
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=73329198cdc273008bd273b0c5ad4c65251cb49e
[2/6] dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=c9bae665035f345ca050e98d6f4d6830c3d74f84
[3/6] dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=08257b5b3d38b3e19b61b807850f5a637fd1421b
[4/6] dt-bindings: timer: sifive,clint: Remove spacemit,k3-clint
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=5397ba147c28427d3728812dec999fdab0f53619
[5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=b424b3b0ab920a25c23fbd7d226a0174b38d0de7
[6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=cc6371a7f5195387584e56054f3af671ff7354dc

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
