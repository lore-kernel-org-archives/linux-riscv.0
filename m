Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EA8CCD18F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOVgzR0jW44omelI7o9yF+y0M2LVV5lMcbmpsobgpSU=; b=36B31DDZ5XqOAK
	6rpPMs0zJCj1oC14UnM6zYE/GLGfnUDNT3qwyN+4IUWWtDjgq1JwmFfKcbPBsd6sdq0g49M0KpU+6
	kxOeg30n9G5uusc0Wp8uJYgRwpewr48swDG7+6k4/asR/I0WeTf63H5fJ+9dzy10OCLlg1LScLJgv
	6UbGUT+as8QjNq0Z3/SLMveB8/ueM9hwLX3Qm6+MThy2i6W5BtXPC0dKqybBbGqqD4TZSIqBg8b67
	R8MaLuCMBkwgsxpnHrMLhLoomF2aEl+yo5Gcz1o2lUwLfMNgBNBvl8Mw7HkQFfTUJ8jSCMbbzG/w1
	Vvu0pV2sxHdH9+H5JC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Mea-0000000E4z7-44BF;
	Mon, 13 Oct 2025 17:48:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeY-0000000E4xX-3BDX
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7735145494;
	Mon, 13 Oct 2025 17:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F9FC116B1;
	Mon, 13 Oct 2025 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377690;
	bh=E43Z5Y8tSJqRgamwuiELwt0g0OSF4ium8fxWSOTU1R0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qujdbc16f7MiyfY0lPmh3IzN15hzoM0c3atnmpR/raocNuIMANh9SeMnOtgU0iTg1
	 estioe/QofSs2DoK4XPJmkXrAX5A86hkijot0EDgzQUjHCopWtGoAtpugAugArvmLG
	 5BIf0RQBiWlVeII843aqhbp6KQHKL8jDQN8PcURW3+RTKl4qn8DC6kGsLU/CeMUsIW
	 MtsXm/SiQ9289Y2DzfC0itMJiEw+aY1g54cHQC8CMLheppwLxK+s8fV/2LUWibD4o/
	 S7pVrrr6JFH0F7PLacIWRqCEfb535DtfXlKirChMkmdcYaZ/k13r+fxbc2PZRI/ozX
	 BNobxQsi+zuYg==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/9] MAINTAINERS: add new soc drivers to Microchip RISC-V entry
Date: Mon, 13 Oct 2025 18:45:40 +0100
Message-ID: <20251013-sinister-undocked-be95b8e93df8@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-album-bovine-faf9f5ebc5d4@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gmAo0f4txEXEqIJYVzrDbfZIGVrUbtgonOlTrrMh7lQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlvrQ7OP/OqnuvG5oBDh7/oCnxc4nvkfflzdwPXPRPOx 8Y3JPYf7ShlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEroQyMrw7w2M31f/CVylX HXsOm6POc604723If3T4BYfACceTsxoZ/pmbVkiVH7K5lSV2py30tULRjXlnpvZdEYtJu7Wt9Gf +CxYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_104810_827586_5EBB8C52 
X-CRM114-Status: UNSURE (   7.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add the two new syscon drivers to the RISC-V entry for Microchip
platforms.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..a28740a7d87a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22105,6 +22105,8 @@ F:	drivers/pci/controller/plda/pcie-microchip-host.c
 F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
+F:	drivers/soc/microchip/mpfs-control-scb.c
+F:	drivers/soc/microchip/mpfs-mss-top-sysreg.c
 F:	drivers/soc/microchip/mpfs-sys-controller.c
 F:	drivers/spi/spi-microchip-core-qspi.c
 F:	drivers/spi/spi-microchip-core.c
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
