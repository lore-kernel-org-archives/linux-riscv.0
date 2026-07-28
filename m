Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E98C54F4D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iqeU6PkzABxffsGKBL7Zm985FcsK53ZxiCOzmz7Ing=; b=v7ZclurYd2Kk/M
	4ufPnArLbb9NU0Eewr4g+pZhVM86nuS2yz0WX/z1Drtc6Z68jV94g+8bc+Atq3n833dDexxTv8aoi
	V/CnzOwD425q7n9ZriE/TCEsYED2ELXCRxq4riQXukTqygOOAjYh2ztW6ES5qSgpANRpOTB7DKwVk
	z78lVDFX7ckaiPkWyaMpG5uEQaLC0CX8/3aalnKp1L2UX28rQl+OdU1jeZ6G05mAxJjaPef9tQEPN
	e/Q3fLdE/kdnVjz1sm0z14pmaHdRIAzX+ry0Epz/2o3CUBu6Hw36kf+BNRd8v42tjMhpHUJ3mYDje
	MAEpDWBkFTySVpPKEQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokpA-00000005qIf-2TPo;
	Tue, 28 Jul 2026 16:38:36 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokp9-00000005qI9-0Mme
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:38:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785256708; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CA+FyKHb5JLp9ZmEZlxH0IUlByMW9m1DeK/XE06Fj7ZW4aX3rw2wHSV/e799dIV3kHxbeUByi0SLM1OLyIXFwhESY5K6ynnwm4bkVlfdnuHicCZy7p8WRRUkpfZGB0HAEd2WXGa9uXMgFsGOypEwu99OC9MWJ8GuUgmCoaUKiIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256708; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3DlI2oYgitgTHr4Rd33aB49gAvNURyeB8wYezuuohmc=; 
	b=F0XIq4GlC2T1w9pqVDglz5AaSs6aaKeoTJ7gS1d46hAfqnKVsaBKQP5xg2BVgyIaL26b30etsvbbvI2ZSFWhVXUegNPRkT0+I4ez7ZMwmDAAxPElybxA0qFDy9sYsWQCVxu/ExmMprSJnPoI4falDygB3apyFt7xFURN7djyFW8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256708;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3DlI2oYgitgTHr4Rd33aB49gAvNURyeB8wYezuuohmc=;
	b=SBivAKez60aV7eeaV1TEdnySOCqK8lCiUIZiuuDy7/XlK//trHXP4s2tDQQBM9N4
	zHoFNyOxSOcVPy3A+cKCJoGBqq3iKZu4BksuAZUdRMaHvEc70R8WwNKVl8xBRtBw2v+
	ZFz8qSPt4CIFj/FHzu/7IBQNayy9ZBHNkrChtFSU=
Received: by mx.zohomail.com with SMTPS id 1785256706925299.4133527307748;
	Tue, 28 Jul 2026 09:38:26 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:29 +0800
Subject: [PATCH RFC 3/7] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260729-k3-aclint-v1-3-aef88614d3a5@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=xxJBjasiMZ+1Jxh8z124ViP0LvG71u4txqqlAr/OhW8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybl08toZV+3B0h9ZTWb1lE79eOBfC9/Fav/n+YvfWa
 88q56+q7yhlYRDjYpAVU2Th8hf/Z63D8+2IQOt9mDmsTCBDGLg4BWAila8Y/ntFLVxhm78gQO+L
 WuEXgbva8drZJZO3BphNeHa1J8jOyYKRYc1kebnf8n9iOf4+XrRhyc+MDe/6d2yO8qooKjSX4e6
 PYAQA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093835_187528_6559F5F9 
X-CRM114-Status: UNSURE (   8.85  )
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

Add support for the ACLINT SSWI found in the SpacemiT K3 SoC. The
hardware provides a ACLINT SSWI unit. Adding riscv,aclint-sswi as a
fallback compatible allows direct reuse of the SSWI driver when
introducing new compatible strings in the future.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index d02c6886283a..529819258054 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -34,6 +34,10 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-sswi
           - const: nuclei,ux900-aclint-sswi
+      - items:
+          - enum:
+              - spacemit,k3-aclint-sswi
+          - const: riscv,aclint-sswi
 
   reg:
     maxItems: 1

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
