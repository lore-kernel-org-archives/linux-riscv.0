Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F70C3DA7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uwki7a0bvaf1mWzxrcAGWvbVcne580TN75Lq/dr6RaA=; b=AspawtxVlmq40c
	kxzeoAaNDzxtZ6V2YsnIgy8qowq4Le7lHzIlhQO7qbubO6CJhhem72T5Xi0pWhtL7SlsUpOXezdw3
	B71MD/czwd/kCsyiz8oLuJxePC2ssHFkITuhFRY4wKvW/7hAQxDUTPLVbEVH4Nn/Ldg0/LWoJtwt5
	FrXBmeDXaxEplxMiRGclSMy7dk/r83FZ12+8Bn0xFT5sub6U1nCACvdH31SRTW6MzyyBYXaPHTZCE
	JlvdR1PxO1WqUf18pa3pGb5vAoPXzG08iLFPUVhwMXz0ElnWEzCeksFsdvPieqZD8/8PT/CCUnLXK
	8LLqmAWdGra9w6lj6j4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYU-000000015hQ-1ctP;
	Thu, 25 Jul 2024 13:30:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOs-00000000sLe-2yJM
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 12:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wk26y0Zx6odkh26HmG5ZsAnwUPNQtCHihjL+FYugk9I=; b=K0BVIS05+mPLnQeaXKyNRdDmJn
	1cBfybbhclGkcY5r6hD3IDinxjSL2svKJBZgshYuQigLpx9wmCvl19kf+ziP54CzAX1uLK+QqKPCr
	7bu0VLjWXEkLC4OS8Xz8ZHFy5EQvq5dPCq+4CwpwPT0aO234YsOWOIoBUeWvskWfRgdxd1isI5aAX
	qSv/0ALLfPrXo0YllYrTh8Z61Dq1LO/ygdm0wH3/D5I6t1iUGPYh3sSFY7X+5jPpGtVW7i2qGH5UH
	coDFW7r/hspE+0BJ2rv+z0aWUYHyBAFzLgOdDhAf1E5G10UTHQlCutkq8ZJHN40vkjQNOaoZ91T15
	C/IgN25w==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOo-00000003zz4-3mcn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909806; x=1753445806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=69lFbB2jeTYBiUaoNoQ4L8pJt0Z/rKLzQZrqDV7Af4E=;
  b=xrRMb/87O8T5M1PUj9XaSD3CU4k6zFjTOvYqN9o3+LmZbLs4kQsvnzaC
   9LSju/U5iAE53iSYOMmi2drxJjiqFhWcIy7oPffcfrXGEuQwAO3EQVH0X
   tJ7NjO1ccxyyVHsZy9WU3hIlRbsPmChfvD8WWswHxBWQf0+kwNq3G5eGV
   2oqZRC2bOaJXGsrgnqvZpSc3j351U05ovCzO3hAsKoPBDlRF+WIqrKod+
   fKcQbUgzmKFddFYnLa64kj2ztmp4BabsD/V1X/kcAd1QuTFeNvAOZOugP
   HIHIHN3YNDThE42cVdgblXf6+DTxhxyurxcx/7jSOwt5Ap80hJFnlvL8N
   A==;
X-CSE-ConnectionGUID: 7H0adE5mRmid6ymnvkB3VA==
X-CSE-MsgGUID: Y8om+FnmQmCfo95fR/6Z2Q==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="197092680"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:31 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:29 -0700
From: <pierre-henry.moussay@microchip.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 06/17] dt-bindings: riscv: sifive-l2: add a PIC64GX compatible
Date: Thu, 25 Jul 2024 13:15:58 +0100
Message-ID: <20240725121609.13101-7-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_131647_633532_D5ED7C8D 
X-CRM114-Status: UNSURE (   7.96  )
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

The PIC64GX use an IP similar to MPFS one, therefore add compatibility with
MPFS as fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 7e8cebe21584..9d064feb2ab1 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -47,6 +47,11 @@ properties:
           - const: microchip,mpfs-ccache
           - const: sifive,fu540-c000-ccache
           - const: cache
+      - items:
+          - const: microchip,pic64gx-ccache
+          - const: microchip,mpfs-ccache
+          - const: sifive,fu540-c000-ccache
+          - const: cache
 
   cache-block-size:
     const: 64
@@ -93,6 +98,7 @@ allOf:
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
               - microchip,mpfs-ccache
+              - microchip,pic64gx-ccache
 
     then:
       properties:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
