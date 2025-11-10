Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C69CCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOVgzR0jW44omelI7o9yF+y0M2LVV5lMcbmpsobgpSU=; b=Rr/XoQ//J1Wzv9
	czqfDJ74SwmtsXP3rQWr/PqynAXAZqAYtvDES9nYgQrz+PdrReX77TfwvitK4uJtS3tHYM5DUEics
	1MX7BkHmjWLVHn3ZO3jyfVK+fnDRgjfnkKOnGS+ynCpJsL4TO7S0OtaqdmX26KwO82whINaKP/ZEg
	WgvdH7Yn49vHavAW3jmCJLyL5e+SwyDZ9xRvFfygv8IrSnHSPA02tIqjFXzU3TPVEeZHSPZuq9lY/
	WuXX/auuSavfuHgHxhmyBQbjeyqZP+g8iT4twcKx7gUvxXUOpRvS07yeBJO08238wavvEPU4mVN0R
	fcikEXM5dbNJiExISwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0S-00000005InY-17g9;
	Mon, 10 Nov 2025 11:24:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0P-00000005Ilr-02w6
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 11:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C0E7446B3;
	Mon, 10 Nov 2025 11:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35921C116D0;
	Mon, 10 Nov 2025 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773856;
	bh=E43Z5Y8tSJqRgamwuiELwt0g0OSF4ium8fxWSOTU1R0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mAA72F0Rq4I2u6jvTdEFPVqAmJ7fTvOkaDGoyA/T7bzy/+LP2SlPPIPQ9a0yDj04s
	 kdMhf90x5TnvmpJRA93dQRQY1IGTHDzwpY5qhYkX+YbVCQvxgOCumd9t+tqUtKmTZu
	 b1PyelrqW3CmiYorwAMIyl0FZKMxGuMX/Ow75V1KWvpLRPYhORymNlhVfTXWW9ju3j
	 FHgYaJ1bOHxF+iyju63WO/R9ciqfNZBxu8VP/Pr5DB0YBE2CFIE9jWTjGzMWS6w11L
	 USyZUa+6+1nsEb+2mX2sxkY83iJjvQAwpqfFAm5IQ8e5Dl6BfKSXxmS/xEvw2BVufL
	 WPpOiSzjE13Uw==
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
Subject: [PATCH v7 4/5] MAINTAINERS: add new soc drivers to Microchip RISC-V entry
Date: Mon, 10 Nov 2025 11:23:53 +0000
Message-ID: <20251110-creature-spousal-213edfea02ce@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110-zookeeper-femur-68a0ae346397@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gmAo0f4txEXEqIJYVzrDbfZIGVrUbtgonOlTrrMh7lQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmCpz3O3zCWCLXNS8qzqw1exiS5dfOJP57dfbHNTYF8/ Eau+1Q7SlkYxLgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJEtKxj+mZvsF6rd3xnnrcAj sf3ZZvZ1goV63F6s//rs203dWhh+MPzPrT/Fbbdj4/u0YreLy5duf77+8abHN99YfP7Y/TP8/5Z IdgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_032417_074748_D7C6A2E5 
X-CRM114-Status: UNSURE (   7.82  )
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
