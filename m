Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F063CA1016
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 18:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04rUPe7jO3+63Ow27H5jUGg+5XFD7uD9xw5tCLLw758=; b=umUfBOOy1/yHZ8
	DHV5x/O2k+aLFL5aRyl2tP/eRVotSEbZlpjNe7CcXFwqmYQpY2N4YNwW9buBZBuHsW40z7mjM9bgJ
	WAYs29L1qHwEA3lMIzu8UdBRRaVOAwDSsFZi0nF4JlhFrOIoUDfyuGhdUs3jm/04WZ+6z665DIggw
	hkyIGgFUOVU+Ma3DJc/szTsNkgzcP565esqxpzWgQAi0Mm4Rm2TTjzFIKWInWTJmXkU3nN/UWNbMQ
	Rv7Dot6k35LbXyYjvijQNiRbkbV9c1jpcCkg3g9AMt98TxhXXUBehls9mEtH46F9a0IkH5VWyxDHp
	nTvgzqXJqcVdkpDufk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubG2-00000003oyI-3FrZ;
	Fri, 05 Sep 2025 18:33:58 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXeM-00000002Sqs-1T89
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 14:42:51 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8C579B22004E;
	Fri,  5 Sep 2025 16:42:45 +0200 (CEST)
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
Subject: [PATCH v3 4/5] dt-bindings: riscv: starfive: add milkv,marscm-lite
Date: Fri,  5 Sep 2025 07:39:42 -0700
Message-ID: <20250905144011.928332-5-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905144011.928332-1-e@freeshell.de>
References: <20250905144011.928332-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_074250_570060_1321756D 
X-CRM114-Status: UNSURE (   6.01  )
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

Add "milkv,marscm-lite" as a StarFive JH7110 SoC-based system-on-module.

Signed-off-by: E Shattow <e@freeshell.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 0713edb687fe..04510341a71e 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -29,6 +29,7 @@ properties:
               - deepcomputing,fml13v01
               - milkv,mars
               - milkv,marscm-emmc
+              - milkv,marscm-lite
               - pine64,star64
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
