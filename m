Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFCECAC5B0
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GZ+XunWHpGKIrkCG3p/BK0v9cY7SDyl0jbINXQZEm4Y=; b=giRYV8NDXWjQL4
	JTRgXIjcc4LNzD1OuMzWV6M6hrFdiSFrwTWjqksdmBryRha57bEfkahl0M251Qvy+EKfKdoafNK8N
	vLe66N7rVYc+d4mjMsTXxUOURs3CW7WWH7eYqcoeRMSu2I3zH7vyGALTY7VgOa/ullj/+TtB44bqF
	woXFCC8+0rlQ/OZbxggxhGpldv4Fw+xPYuoYz1RoElbe8i8FRAG+ZoSsqGVE2BFl2SrPS2kut5GTB
	LHqBK8nFYMbdgaXp3AeAe7RpBfUbBqkuTP7JQxmVwZUqgAt3UVaFWvTIgxSy1QYuK7cyT5U2yS0gQ
	5CyDajCF2DBizznuiR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4chv-0000000C0aL-0j15;
	Fri, 03 Oct 2025 10:08:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4cht-0000000C0Zy-0S71
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 10:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B437E4414D;
	Fri,  3 Oct 2025 10:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89427C4CEF5;
	Fri,  3 Oct 2025 10:08:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/2] of/irq: Fix root interrupt controller handling
Date: Fri,  3 Oct 2025 12:07:47 +0200
Message-ID: <cover.1759485668.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_030809_166371_2C5F6431 
X-CRM114-Status: GOOD (  20.60  )
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

	Hi all,

On ARM, the main interrupt controller is typically the GIC, and one can
safely put "interrupt-parent = <&gic>;" in the root node.  The GIC node
has an interrupts property, but it points to itself, causing
of_irq_init() to treat it as the root interrupt controller.

On RISC-V, the main interrupt controller is typically the PLIC.
However, one can not put "interrupt-parent = <&plic>;" in the root node,
as that would cause a kernel panic ("No interrupt controller found").
The main difference with ARM is that the PLIC is not the root interrupt
controller: its interrupt parent is the RISC-V CPU or Hart-Level
Interrupt Controller (HLIC).  The latter is the root interrupt
controller, and despite having no interrupts property, it is currently
not considered the root interrupt controller when an interrupt-parent
property is present in the root node.

This series fixes the issue in of_irq_init(), and moves the
"interrupt-parent = <&plic>;" for the RZ/Five (R9A07G043F) SoC from the
soc node to the top node, like was done recently for the very similar
RZ/G2UL (R9A07G043U) SoC[1].

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/commit/?h=renesas-dts-for-v6.19&id=0070434f4a910179a23cd7ab812c33811f00b253)

Geert Uytterhoeven (2):
  of/irq: Ignore interrupt parent for nodes without interrupts
  riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 drivers/of/irq.c                            | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
