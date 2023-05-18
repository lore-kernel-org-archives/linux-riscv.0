Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AA3C7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoDS85ze/vZ5o/l0+0FxIsxiIIdeWeJSej6+e4N84QM=; b=d+EQjvTJTMNY/g
	ef7ORv9FzOW8oUC4U3YkkabcXbizxIdgZ+Jb1DSdxwEjY2VYcLKzmw6UqFUmHzOszoonZWuOahUT+
	QvOBXZbyQFsrmuPfgsj/uIERm7UIUyGAUTu0Lw1b7uX6s9n9wvjGPcugJ906oZwWsn1PXaRKFbQGS
	SWpM3YseZDs7i5fgsExBGGls3VLEKxYDG7tCBUOyiE8S2Q3EPym6XTi13U2bsGaKX2jZmBAvEgvHM
	JBtaHIKeHd0QYWmB7uflk36kGxwjVirFxOBCus3k2eKUg6l600PDflJq6/Jljt5hU/wKtGJzcapq4
	mMg3qFirj9PKC+Os9/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmIK-00ENSF-2n;
	Thu, 18 May 2023 22:40:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmIG-00ENPj-06
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DFC9652BA;
	Thu, 18 May 2023 22:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7C1C4339E;
	Thu, 18 May 2023 22:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449619;
	bh=vFxtHREVJ9UNBDng1m71MFH7Sb5ddr33ZSLOi8jzDkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iZAiGKpLFBCWpXjnHOa0G1uBBP6KR0AVjLr3F3bOIs50/DE+ordRlvZ+wXweBWtHX
	 8Uefj8GUC51cJShihnA0CDlTaEYh+0qfD1OhCfBlEZdk1ye0rW6ZY/7qhM9gK3Zn+5
	 Dc+NjD7HRCODaVds/NAWofa+rGrVvH2sgFWxFPqoWNJOoTggFb9uXljbANRxwl3nnr
	 9Y/Felf32eGyBcYagmm7HPvp6gkvnaiUMTQM2RardFd+pKxrXkEwEoZxu63i+hsPGB
	 R5hBOap+FdNV5co0HXg4lglkGxQjLPiIbhZwipQN2BWRLuiRnq+uFoJuxnAlx3UcZ5
	 cqJi2RlO/1YHQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 7/8] dt-bindings: riscv: explicitly mention assumption of Zicntr & Zihpm support
Date: Thu, 18 May 2023 23:39:08 +0100
Message-Id: <20230518-earthy-subduing-0ccc26d9c99a@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-moneybags-rebalance-1484db493d6a@spud>
References: <20230518-moneybags-rebalance-1484db493d6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FqaBAVwOvKHQOTc+2d9mFz4gWPu5PBX8oewfgU7Ysuc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpKzk3xnye17G69sI9nzOFoiUMsk2HeFdarN6zUWnJN YWOamnhjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEV4WR4W71PF2xltPzuuIF zwqzPyi8Jspt7zll5SHZ5m3VV95Pms7IsCG6wZB9oenG2QfEl645saoh6eTC3YmlzPee+e2+xGw 1lxMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154020_107487_62445FCC 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Similar to commit 41ebfc91f785 ("dt-bindings: riscv: explicitly mention
assumption of Zicsr & Zifencei support"), the Zicntr and Zihpm
extensions also used to be part of the base ISA but were removed after
the bindings were merged. Document the assumption of their presence in
the base ISA.

Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index db5253a2a74a..d5208881a1fb 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -89,8 +89,8 @@ properties:
       Due to revisions of the ISA specification, some deviations
       have arisen over time.
       Notably, riscv,isa was defined prior to the creation of the
-      Zicsr and Zifencei extensions and thus "i" implies
-      "zicsr_zifencei".
+      Zicntr, Zicsr, Zifencei and Zihpm extensions and thus "i"
+      implies "zicntr_zicsr_zifencei_zihpm".
 
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
