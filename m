Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F6DCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJkaBaBerKzZ/ktgWsMe3hjbE5tXjJw3cpycigaUutM=; b=qb8CwnokJ4WY7j
	v2/6i3bGLrVd3+Hq3X3aKAcdVU4Z0AWiudSolxSGDoQaxDwoZ+I+LZ25MAm/m7D+Jmrfey2kRkYxv
	YaO0ZQckklzwVlzamC8K/uPAk7syTX96FoPLidLX42Ex+9TTEGVdEqzXgAk6WFj/l0eJuuHoUpNtt
	Kb7OTipdORPACP8iZ5jE418vDRmFJcL5tYQ+SHCL+jc8ndX9RYWEJtxHLkKz0j93Fi2CkcI9F3ATE
	fco7KFfAYaKMWyHuv2csGyoy7tdQCZrDgFq7etIWJA84E2RthDxFLOmGEoWrhmKRrCKXkghUlZp2B
	/LqFHM3bN/gPjLGTXRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Gy-0000000GKoI-2V4D;
	Mon, 17 Nov 2025 15:36:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Gx-0000000GKni-0pQB
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0F9B40335;
	Mon, 17 Nov 2025 15:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C430C4AF09;
	Mon, 17 Nov 2025 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763393766;
	bh=/v1QAlCCWNbMx8wdrlD6B9enfAEnlVlEnoMDUomq2iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iqbogmmP3g3V+qa77+i8GG9erc9ZF2tJnX3QDpaiw/uJxk5fh7C8vGLyLNsqwk3IX
	 zZXQMYlKhdgPcFpTE5EM6YEuHFYnrx7NOZ0E5YIKpgFN56LBXfhxnRMzcyLYmf7DaS
	 9Csy/UC+pXDB4JlT2q1c7EV+TRE6pCIGN8KozlVql04Pb275gfESTedP3Na61t+7E3
	 us+822vPug1aJ/gBXbeMJXbHrv93N7XQdkg2JqSvyx71rco75Amtj2cBxAZK0xZ7JM
	 wwd9nSkqXVVSMkfGiJVxHXPgFHYSqhTDiNiR9APVT8sgATFkC1i7ulE75Sh6Qo8Vys
	 75ULQZeOZZH8Q==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v1 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
Date: Mon, 17 Nov 2025 15:35:19 +0000
Message-ID: <20251117-mocha-shelter-4d9aa88e34b5@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-shadow-police-56aba5d855a3@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6u/MVsorAWOBiuYW/sM6Lc9tNpUToYIrlt3K2vcU0zQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSDlusVvftkHSbI/m754E088HkidUdItfEpF5f+V5VL 2zZ3re3o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABN5+ZqR4c6ZvLOPar/VzKzT sd6fnbzU7qJDl9rllttumRelXixtecjI8Lluutw2H93TGrbeBhOrT+1sNy0PSPs3983v5fr33KM 4eQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073607_256358_E5CF7FAD 
X-CRM114-Status: UNSURE (   7.53  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx SoC Clock Conditioning Circuitry is compatibles
with the Polarfire SoC

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
index f1770360798f..9a6b50527c42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-ccc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-ccc
+          - const: microchip,mpfs-ccc
+      - const: microchip,mpfs-ccc
 
   reg:
     items:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
