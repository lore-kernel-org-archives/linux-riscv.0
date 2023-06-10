Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6B9C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nz/WMEFkhUTkAzsFhDRHvKmxX8QaMLrqEf7v/mGQ3ho=; b=zPFz2ZyVunxuNN
	XtSxKNR9A5s2d/jjeijav66jwl1i3AfQPK+7jeOQrND7a2krVsMDbZxFDnirnq842ooiS9JeTjyUR
	+znm9l+tYolUFtu6gt1dpejVl92pkJhK+B8rNgO8c381R9Z1BtRlWG+k5kmoE+ERVHXfr+aM2P394
	55aqtNWSmPFBuvuFPACzBnmuvWwJpSmdTJrcWVeGg7scGKRwUc8XQ4y5wb9Aak9vCTn2LbrcJEiCU
	Gl3mte2ujyyGQ6uLou2BENTYdRPiI1sueprbVRYOpI1+Ykvx6Z+NIVuZx8GlDPmSqKTtQu4E03yjP
	xtoNtTz5fh6x8aWqiQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82L7-00GevL-0R;
	Sat, 10 Jun 2023 17:25:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82L3-00Get4-2p
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 17:25:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C3E6611A5;
	Sat, 10 Jun 2023 17:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED653C4339E;
	Sat, 10 Jun 2023 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686417920;
	bh=hm8DFtI0+spkXUeJgFAB5WoC+koaV/CfCqr4C9q9gnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HFjqa4SyfhT6CpI0rgZuv7zUWeXAq40+W98EwPO70oi7ZQc+vq7zs6NtCYQbRhUO0
	 RVPxmZM7MUiOLJ3xgULwcdDPAGtprU2eggSwt0d61GgHaCJc34Jr5F+Y79iPFNN7eQ
	 ozZVS6rsMywFaXbvux5cXvJxrsjiww6Kz7c49pXaURJWFPHVtg07KglrRX2c4PTy2W
	 KUPdxIixl9LTNsUtmeJCykDF+oxZKmA79LHPGREA8frTZX0XYkx9zpEHtEYNkd7gdz
	 jnH5KfFks8DiP1WzD1Z2+KB/4+kNy584yFK1FKjYSH4SiHsCVgHI/nlqV167kI6pu6
	 tVf8eLQdB2UUQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/6] dt-bindings: riscv: cpus: document cpu-supply
Date: Sat, 10 Jun 2023 18:24:52 +0100
Message-Id: <20230610-quaintly-eastcoast-c006ff4ce942@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610-snaking-version-81ae5abb7573@spud>
References: <20230610-snaking-version-81ae5abb7573@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=f3zWC+rsKH2/myZR3Jx3qGAL8gTZdvoMweP7fwlgFq4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCktGx8u3/X1x4NSbceCwBLds7qTVCYkvr+r+mprrELeT dvuM5OzOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRjc8YGS4/ds35MPtkR/2L g8F9lh4ub7Um/zWOMIyusfTaqd2f/4KR4YaSrKbsw58LTt9NNbeaW/WIKT3obUSkH9fkvFVf5zx 9zQgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_102521_954523_D2081FE1 
X-CRM114-Status: UNSURE (   9.47  )
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

To facilitate switching to "unevaluatedProperties: false", document the
cpu-supply property that is already in use in several Allwinner
devicetrees.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 00d1e273f1a9..5e2db35411f1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -62,6 +62,10 @@ properties:
   clocks:
     maxItems: 1
 
+  cpu-supply:
+    description:
+      Regulator supplying the CPU's power rail.
+
   mmu-type:
     description:
       Identifies the MMU address translation mode used on this
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
