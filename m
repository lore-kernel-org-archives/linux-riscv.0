Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1829EDA69C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDwlUa0diD2KU78uZ2qEBS6dp8OfN7Cx1+D0CIuI3aE=; b=iPrWcTIaUYCZM4
	/DYZflOxmpfUN0w6eCIFjZrllMTV6/di5Q+04/I7DP5uBdiIgjBlHq60vJEYk2uCqFFm+AqggKPMW
	ZmVlBEAQG0iC6xbkrkeKxZeC6nsRXIklXcDGUxgREtIuSihH/miwfTMUnFd6UDdrrONY/8kNTi2MG
	MlUIG/PNOLeBsYDUVFertYiNq7WBuWCBiPSwPl4Ta28G0BD/gDBrm7BdzDLEq0NaoSSk3euU6kZa9
	wBBLPwiPY37O3wahdhRveJysEAirc3s1oeKjJsXYSSe3ZdpVwKP8y3xCi57PwMQD6DkjCGsfjO8z9
	iSE51KYtDcABx+uAkATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSp5-0000000Fb8b-1Wvy;
	Tue, 03 Mar 2026 16:42:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSp3-0000000Fb7j-0jF7
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 16:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7033440377;
	Tue,  3 Mar 2026 16:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565EFC19425;
	Tue,  3 Mar 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772556131;
	bh=bbZUQ1Fh88Ysd1nXQksQhhVxv6QAdP3LT7Br6CGSAx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NwCczY5RputsSxitXbGoWUt4LvLRcgcDCa1WKwRrN0CgdjhCZ+8/BpEN1tZ2K0JjM
	 jwNKpvGryP5SAK/VG8BPq88chVfnlzFNzk1ZQVLoxzLq4crflL7E2SlklhMqqy5ACZ
	 3yQjgcae/u6btdQhZLcXShH59pOvUd2Vn79uEu9QQoQmsaXxiUeZRctHjFifbNnxsw
	 WuJN8HJrVG1QvT+IZujk4IEG/YrkCys3TZuAqC5HIPGYBXsk7tw8h5aqGzBEePcDtr
	 5iAryzE6Uq7sQd28jcy/j8PX+ViBULn/Gf/Fa8buRmSV8Q1xulLRz1dGPae4xTlDvf
	 RRhYdKC/z7+aA==
From: Conor Dooley <conor@kernel.org>
To: linux-spi@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] spi: dt-bindings: mpfs-spi: remove clock-names
Date: Tue,  3 Mar 2026 16:41:52 +0000
Message-ID: <20260303-spoils-snowbird-99f6e3a2dae3@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303-deceiver-rack-82f2b89eac40@spud>
References: <20260303-deceiver-rack-82f2b89eac40@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bFK+YrOO+k6RjSRpgJYi3gE/wKFWYaDieRUCyzGNhUA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnL+f2y1RwOXhRnLBQvLTZWTppRuuDb+01T9Dx/ZblGs fo3LJ3QUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImU5DP8j3wwa4LZrRDWs3Z/ Y2WehHvFXGdSdViZd519268DVyJZUxj+WU2u9zMyW7+maLf3pPmPNof6hk6+HJeS+Uj+XPnB6G3 RfAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_084213_236998_3E0C904F 
X-CRM114-Status: UNSURE (   8.70  )
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

This binding documented clock-names, but never bothered to document what
the name should be, rendering the property useless to software. It's not
a required property, so it can just be removed without harming any
software that conjured up it's own name for the clock, as they could not
rely on it being there to begin with.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-spi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
index b7d8acc924be4..8ff50dfcf5855 100644
--- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -35,9 +35,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  clock-names:
-    maxItems: 1
-
   clocks:
     maxItems: 1
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
