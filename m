Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20C9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a77nLa1Jk/N0UxBFaKrkwlqGX2423yBkvpWcUVgIJv0=; b=ijEgb5tauadHcA
	iUfnkmTqzniublHXDsp70M2Jg44xRm72V+Jbkf0EK+cgjMOUE1QbUYA7ljILYp7ieGQYHSuDWfCsD
	qrWxZcQ3uU2Z/0XLx3aUmjtQYw7hcyB8fmOaw0OCO2Q9f3qsO/mcwv9Xjg/mWFzBcdgO1wx2AcPhu
	0zcldM5sTJDMuOIyf67dbpFuMjpoGH6XQ2IQ2Jwm5rDt2HbH3rNp3oZ8VWE/yL+pnuphBqvRMgktR
	W6iSjes9FEjRSb/xxjPAq7LrV3Qb023nXD1mn7tNSzzBFMwud6LkN5YnEFYdHrRv7nS4A5rCcCUy/
	IDY4FnknuKebHVVxAMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Wf-00GCFz-47; Thu, 27 Jan 2022 15:17:29 +0000
Received: from out28-221.mail.aliyun.com ([115.124.28.221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WK-00GBzy-AW
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:09 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.510604|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.191371-0.00178411-0.806845;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P-L_1643296623; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P-L_1643296623)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:04 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 05/12] dt-bindings: interrupt-controller: add compatible
 string for UX600 PLIC
Date: Thu, 27 Jan 2022 23:16:40 +0800
Message-Id: <20220127151647.2375449-6-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071708_616066_130C95AC 
X-CRM114-Status: UNSURE (   6.58  )
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

Nuclei UX600 series CPU has an optional PLIC (recommended when running
Linux).

Add a compatible string for it.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 28b6b17fe4b2..70f5bd6cb879 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -47,6 +47,7 @@ properties:
           - sifive,fu540-c000-plic
           - starfive,jh7100-plic
           - canaan,k210-plic
+          - nuclei,ux600-plic
       - const: sifive,plic-1.0.0
 
   reg:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
