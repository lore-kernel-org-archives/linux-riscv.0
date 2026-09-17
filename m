Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97186C982D6
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLN1IEw5qHSdLRuuPUe7g8GCo1IsNMBAGToEONVNok8=; b=r12Yq5GFrNFoHR
	wZcNiNxYs63fWHFm1OCMSRXi8p5/7DMF8aX6gDHzCMs5QnZoDfjohPf6vuloa8eaVqLUUh3xaLXmq
	holxPIJJPvDm8xfm7SdNjhvXnUb1femdC03ElvVu9ZZo8I5vVPWNOCUScmRCc1aeQX/R+inBgTq11
	ANIuyqMddpT4XKLFt+yP6/CqpMKrcS/+WBwIHNgi7UAjtxkFDl2lVO0fKyb7YKlyE6o/e3Io6n4K/
	CfqKoMTZw5Wsp5/OTcoNFMFO28+uoDLeRsgP4kArL8w9HH/Dx3TJVIJJjmukrD34LWvS1b84k6Tsg
	51Ku43AXiO9HvNHyP9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F19-0000000Bueh-0Lsn;
	Thu, 17 Sep 2026 16:31:23 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F16-0000000Bud7-3QTn
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 16:31:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789662662; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gnYBVvwbxguZPKcTueRFRVOdJ/Ik5PTmF6P9/oEPZkDLrLC1PhEhy3n09ZkJUhDXPuegv2asODvqMa8FrW6paKLnNvBclvyDfuS4ESU6bgy8pu44wZc6gkzbLfuLyCQlJxIgDOjKkGxKH5zURZD3Mi+syG1OUirNSim5dIFilIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662662; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d/R38e+KIiy763V8ovXVlsoTRmA0dX2whnVD1VgfDpo=; 
	b=XbOVqNYPwQm1wgO5X2OmGqO8jPzbGDqt0ngnWqfDVwhj12qVzlJhuPlmDxS0MlF7LIag6ZZ7flt7KofoqmkN4JWYqZwqd0/w70dw+4tSP5zb9FOinRD6z+//3hVgQO16p3xLk+k53BFuD3e4GKNb9CE3hYbykMMIkKumUjcv9xc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662662;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=d/R38e+KIiy763V8ovXVlsoTRmA0dX2whnVD1VgfDpo=;
	b=hwAD0j7NWo4L3/iZ1CCFo8mJTZp+pjydJ0dryhC8W77OB6PVC3VCj8bGj592D8zV
	h6CtqKOqWmuacuiU/m8RtRX0Or5QFrjDlR7J4N7nKIobiWF7E0qGPu4Mpas2f7DB9Gh
	a9J071Bdt0GRJ/rbH46oBcZVDBYegUEOqLDmsA74=
Received: by smtp.zohomail.com with SMTPS id 1789662660763610.4312802809931;
	Thu, 17 Sep 2026 09:31:00 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:36 +0800
Subject: [PATCH v3 4/6] dt-bindings: timer: sifive,clint: Remove
 spacemit,k3-clint
MIME-Version: 1.0
Message-Id: <20260918-k3-aclint-v3-4-cf4fd4050e14@pigmoral.tech>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
In-Reply-To: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=3xCk7OGClnr/wXNaDol09PLEBK26cy2PA+QvNHwN47Q=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiHazCkv8ci1LtL/QXJ/zZX2kdUz9og+FZqf851bIH
 eK3LQ7tKGVhEONikBVTZOHyF/9nrcPz7YhA632YOaxMIEMYuDgFYCJaHowMX5adOjSHlTXfoNal
 s7BdlPnLQn3pww4Rs2/amBeKP79+m+F/HN9JvttnChsVvPTXcv1ZY14TbGuneNrgu93Co5FfLq5
 hAwA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_093120_905838_16BE73BB 
X-CRM114-Status: UNSURE (   7.46  )
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

The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
devices. The existing spacemit,k3-clint compatible incorrectly describes
the SSWI register space as a legacy CLINT.

Remove this compatible, as it never matched the actual hardware and
has no remaining users.

Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..d53f52e80d88 100644
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

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
