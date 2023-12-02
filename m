Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F0AC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spUuYUIBKwnkogovT1NQTH9m81CgmFVB7ERNCSLNnDE=; b=V+deuRh174DIkL
	w6v1Q7x1f5UiVzVVCKz7UrJw7prLxvUiHtq1lHHjAUi/xdZHt7r8C5ChuiATF19wMEdNY9LztR2ol
	Ys4iy0h2fwgw9tGqCMpiIid5qU98bm/ou2PL4Qe2H9nCq19j0RU+PiUY6LtHyshfgo+uKiBdKmULv
	GG0z3TPxyUwlJnNsW+6AsMnaQXT18Znb1W+Nozfc4BeM0rJMKpoqEt/majAeWC7UF6ApVIGYTm0BZ
	JL9uwO0zuR1KRwaqkOcYTDVBdCaVB+iK+0Oa9UEXeOmOnwqSKGYMCNrIwxt7180fe6jM6fgLSAEYy
	I2N3gZkz0cQu2sfPGT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9SCO-00FrXL-0R;
	Sat, 02 Dec 2023 15:46:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9SCL-00FrUt-0p
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 15:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 422BD60B68;
	Sat,  2 Dec 2023 15:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D773EC433CC;
	Sat,  2 Dec 2023 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701531985;
	bh=whEVkV47vBAQ1zFS0tehUj15XN7L3r6QxlK/D9oqA80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=asKKD/k5o+McKYglU/mkm9kiYxyiM6bTAss95f6RHv3gr80nNMTbfbuTZtZDIlMtf
	 A1CeM2w3k8M/To+RnJ/QBGNCQRGP7+aJltkBwezUeKjGyjUlB1A1XqNgxgcmO1AJ3I
	 QeymBZPQ5sOuaqGeo6FrdeAqQYK9IPHuG2fcPSQ+SOhst7LhsweriDBb7G8H6L5/iC
	 3qPStak58iYUpULhMZkV2cHfL1xpc8Y8T3BZANx2Cqs+Wts8If3O2LvdgtNMtppfAF
	 sbaZ6XCl7gdVQbOE1FHhrwqq0wjDBlKKSjYiMd1GdmprZcfFE9EEwaTJmVM9RzPpFA
	 g6tYTGyTctltA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: riscv: starfive: add Milkv Mars board
Date: Sat,  2 Dec 2023 23:33:52 +0800
Message-Id: <20231202153353.635-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231202153353.635-1-jszhang@kernel.org>
References: <20231202153353.635-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_074629_333442_260F519C 
X-CRM114-Status: UNSURE (   7.32  )
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

Add device tree bindings for the Milkv Mars board which is
equipped with StarFive JH7110 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index cc4d92f0a1bf..b672f8521949 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - milkv,mars
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
