Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6180EE81DE9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpUvfVBDM87MAFLDQ15jR4JvpbBpSQGHQc4e8RE0KVQ=; b=uobtCs3sSwbzYz
	IMsjJ118sEGmzVvjCKtuNea+C2c8fAB7tVdZLqGAujl/KzZA2sj+JMQp45HQyU4dQfgTCAgFFR7HO
	WqFTAkAjWRwelQasxl7k2TjxsltBrF+eXhBF0FhFgm7pxHvsRrJM4cN5BAML+MCn71zkk4/bhlmuJ
	Wr97tOrqk2TJ0BPDYF2f22qhkEMFSFjB04WbxIjEuA167rca3P0otRebAFai0jfqM6WmG+k/SUeRI
	49QxGCAI2N40gVyLdX9So5tB7c2qpRYX9NPkMNigjwkpZIZBLdOLwCGCDO7L0vfBL/5ma5HN4NHQQ
	wujgsKPHuAEAET66alSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojv7-005m1o-2Q;
	Fri, 06 Oct 2023 12:27:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojv4-005m0R-2O
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 29181B828F7;
	Fri,  6 Oct 2023 12:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBCAC433CC;
	Fri,  6 Oct 2023 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696595220;
	bh=SnqqmnuywOhmCW0NrWgiJLL8C+SD9HabtHjqFfDXRA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KtJmRO1Cou5EiBgcTPgxHF4yWrW5dQsCuOzc3NBJ/sytY3coZjSlqnwJaYftSR8c7
	 2RbcSXoDWtBH/JU/0Vv+1XBJS/XocLczha3d5kPnnzAKQjdDMhkmE08ejeAW/fNTer
	 B+7zdTmj/wISBxpDgLLSmQW30RcjirkDhk5DV+0eQ668kmQWp6bP5OImaXA9OCu5x7
	 elML0q+1TQ6DSXYEsM5eb1Iq9lPpSTNfbFrYt9Kfkr5A1g0Nr0wqxmsBCduLzspe76
	 fNOu9O2z/0AsoSH/m0DQCuxk7Teh7Uvg6CHROcN8NPvmvRJpKT8rnJ/jC65Yxbdl+C
	 12L9Y4fspI3Ew==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: interrupt-controller: Add SOPHGO CV1800B plic
Date: Fri,  6 Oct 2023 20:14:45 +0800
Message-Id: <20231006121449.721-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231006121449.721-1-jszhang@kernel.org>
References: <20231006121449.721-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_052702_920746_120C07B0 
X-CRM114-Status: UNSURE (   7.80  )
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

Add compatible string for SOPHGO CV1800B plic.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 16f9c4760c0f..0c07e8dda445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - sophgo,cv1800b-plic
               - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
