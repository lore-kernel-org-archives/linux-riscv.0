Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA01C54F5C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGy5jgiiJ+65Snh3S3Ej+UlL9i2lOPqe+/y+5NinYgs=; b=UIn88fmKu2tVyD
	dUV9sLztSp+vqixUpMVEMKNxD+vxA7BS19V+Wu/OgWNV8sXwLAbAa8hw/fgTn58E87cHJ6qdybBvD
	KQOft7Yqr2nC1RKHyr1Zwo8bls/XA+adLalCDHFsfbTv9ljoL7TmH2zNAuur5KG0dPYHRLtrh2Ioz
	7dWZq8Xz/ncN2DxrhTl7MRVTsaqJz0aeWbuJs2d7lPz2Q24xQPVgfMXnaSDlwCrENVMXVMqaWYJHh
	MctX5LO9OF0p31tRVTjusyCNngxjyf3jO0+FWP3cYWNN4u2HCeEgzuaqCbXNCLfxGRsesTiCg47d7
	DTJv6vnXx2DTyQn1OuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokpM-00000005qNk-2v2a;
	Tue, 28 Jul 2026 16:38:48 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokpK-00000005qMm-3Rxx
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785256716; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dzRrFTmDuFDhWCSeO29UGkCY86sG6qgQsdAusMlX0YEdrwK1eUyNXY7JGgdTmHOjAUbanMaKKPeAozTYaOhXSsM3QTYTc3kG5CIW/Hcmk8xeg2lpF/J5gLzo1EKgZaS75ZkVee6ploBEdsrujVmmEiJFNq+R+atyKF7QbMdDUog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256716; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vNK07w4i28sJ0yvnkxA8bU9FVrodICj/zVtQdViMRps=; 
	b=d00qwRJYVOKr5DmeJizESxt9UsmkUYhmSQt9QsyhQfsUSXIvKQGyTfozu+xX+2H+55riDTA3dHh0amh8vwyhj7qxZ6d3nV952gqdy8pfQaecXpiT0FtOehh9FC0WdR8NaRqbIb/YTBnSP2YulvrlDRpTB566QEpjFOcX3V9mVs4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256716;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vNK07w4i28sJ0yvnkxA8bU9FVrodICj/zVtQdViMRps=;
	b=TPhHlZoD5Z+C6jD+ce7rVm4c1pxxO/YwV+Nua8ljKj7+Svi+IPtufgbYHhQFPRi/
	UqRtlk52xDayG1hdBPESE3WZHB9K6U5IBhLadb39ZRct62WoOzwEIIAVxnhOWCLJA0t
	4EteireQLAPiroKraGA4m18l+XnK5CQ6G7dkZ+QE=
Received: by mx.zohomail.com with SMTPS id 17852567144881008.9054051243619;
	Tue, 28 Jul 2026 09:38:34 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:30 +0800
Subject: [PATCH RFC 4/7] dt-bindings: timer: sifive,clint: Mark
 spacemit,k3-clint as deprecated
MIME-Version: 1.0
Message-Id: <20260729-k3-aclint-v1-4-aef88614d3a5@pigmoral.tech>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
In-Reply-To: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=nXwVHGNEMc38S57dTyE8iwYIHXDvTKlSFZlWaErD+uA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybl25xtl9+bH+g+5PL9if+3Gem7+jZ/fJx5xcV9lOr
 6+5VNSl3lHKwiDGxSArpsjC5S/+z1qH59sRgdb7MHNYmUCGMHBxCsBELkgxMvxQWPtUX6p4y6nP
 HkFP7y9zbMjNfix/7b3B6ZX/d1W1ndBn+O9wwCz0/byj6oHrWs5Wfb+85qhwykmT3Ts8DK9r1ap
 GvWACAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093846_918984_7D4D6608 
X-CRM114-Status: UNSURE (   9.36  )
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

The SpacemiT K3 SoC actually implements a full ACLINT interface rather
than a legacy CLINT interface. Deprecating this entry prevents improper
usage in device trees while maintaining backward compatibility.

Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 105e3ef539e6..bdb58f97c2e1 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -34,7 +34,6 @@ properties:
               - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
-              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
@@ -61,6 +60,10 @@ properties:
           - const: riscv,clint0
         deprecated: true
         description: For the QEMU virt machine only
+      - items:
+          - const: spacemit,k3-clint
+          - const: sifive,clint0
+        deprecated: true
 
     description:
       Should be "<vendor>,<chip>-clint", followed by "sifive,clint<version>"

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
