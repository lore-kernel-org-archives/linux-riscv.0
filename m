Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81EECA1010
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 18:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYMAG8bz1VYNbZNFPmahgYi/6M8UXo3iMateUNEpnqA=; b=gGdfLwYelWJ1nP
	n21IjEvEpuwNsQ57LH0+jxDAcKeHADSEzudtr5DyuaUN4ulPTiXrUNXUACeS6nMB5yYNVyYko+6Lp
	Fk5zbn4bOSHybPXBj7D8g6TrSgkzI3FfaODnKs/8lLACcWyjZ/QRo7dhdR7HuD0YymcZy33OebN99
	a6OYZxabsx2CfI0JWXUP0XziqJHWLzWQwiaOz68G5DcI6hxH/GAC3eal6W47j2WZzaO+yajMdzN/3
	iAmLaYLpleMw+2chMedrsrd3+/WXNWHwF1wQ8UDZSO/riY270ZcFmDl7pRwASs0rs+biyAGbpU4RA
	HSmB0Uqp2fpgz6XW6HOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubG1-00000003ox5-1q06;
	Fri, 05 Sep 2025 18:33:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXdl-00000002SbI-1j1G
	for linux-riscv@bombadil.infradead.org;
	Fri, 05 Sep 2025 14:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gOE7XNWSTpEmufTQ7PonAVEiPm1U0umeEflouSa4mAM=; b=Zyq30saL/TiRhvJyt4SptcX48+
	PjtUvBDTiNERjQsu5Y9j9cm7fZ1ESqIyCZCkWfT545QNKjsTCSrGZqVtQ3IZSq2iFvNnQA5soFYZY
	u3E1hjhIFkRqJ0LAX4E1IDQpdVQ7W1yVJHwuGb/3hxrXNpbrBspXCyInfqKBfjIXDUS5pMJC/TvgR
	O4GaQ/U9HvVtMpAvec+ytlOyQ0bPiwgXcUU2K62F3zadqmJnH2HzUeHYfo8MUN9aRH5ZFpljKPtgP
	BuZWqZ3A+t6TQtiYSnBAxBsm8cYN7GY/kJxaMiDLXIhWrPeFeEYm7svfblAU4NqdOkjDfZRaHmv7B
	NWmBRdjg==;
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXdi-00000004cnt-2Yms
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 14:42:12 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8BDC7B22007F;
	Fri,  5 Sep 2025 16:42:03 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v3 2/5] dt-bindings: riscv: starfive: add milkv,marscm-emmc
Date: Fri,  5 Sep 2025 07:39:40 -0700
Message-ID: <20250905144011.928332-3-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905144011.928332-1-e@freeshell.de>
References: <20250905144011.928332-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_154210_785536_9E1F180E 
X-CRM114-Status: UNSURE (   5.95  )
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

Add "milkv,marscm-emmc" as a StarFive JH7110 SoC-based system-on-module.

Signed-off-by: E Shattow <e@freeshell.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 7ef85174353d..0713edb687fe 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - deepcomputing,fml13v01
               - milkv,mars
+              - milkv,marscm-emmc
               - pine64,star64
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
