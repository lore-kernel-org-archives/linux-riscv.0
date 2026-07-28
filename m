Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1981EC54F4D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5s8YGLO2TbidNPEouWBII6/VAz7cAix9lwP5LP3rq4=; b=avhXGo6p5E3O55
	OeecJkZcbSYqDyvH/CNWlMG7ROpDyIS4EG9ly3pM83h62nFAskxfUKcbsAnUfu5wO0dhIwukYrRpH
	4Nr8xNHF/uQFbgZGgHY18fzV21XQo19DmpM5jF5Q8i7FmhwOFQ9ik+2MjTW1dATEMVa2cfeMsoCDV
	SJXsx4rbVPH5cF1kh+Rcl2sTHUpRVE2+4OVgbilswYOFN5pGQx80EGp7vUYuVpOsAOwNB1VRTtraB
	eJ8juJO+DeqSM72y0mbPD95o7jhsvjV0qpjtdUuklqjv7i49EJ/olqm53RqQp7H9bMpoaUYkmzbXb
	s1uZ/G061ZzqjOIJoghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokor-00000005qCV-0sgm;
	Tue, 28 Jul 2026 16:38:17 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokoo-00000005qBV-3hNT
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:38:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785256690; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gtuVlS8jE6weiIBLWg+KEoMkEHT1geascO8dYPOHeMxXrGa6vzzU1gxaLT7nU2gycbjvPJ3ao8Rh0zduVi7aB9R4YGGcc0ssC2IJGztd9oqZwBBtlAvnX5TNV7yihMF4I8NWQImScxl+T6C3PD06nnuHsWImZmnLNV/TJt9mygU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256690; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9qRsFI5qSJbVI7G3iUiLm7Rbu9EHQZmcbEMF8jjImyw=; 
	b=HkdO/zEH0PCaPzKzJTtgM9xsgE9/3HqTG3PPBb8tEOQwqGBbOjdeAFQBCwhMK31GrDuAzYc+XLrChx7k6RbtfE6aDkm0VMZT9FHLN2i7qK3P7+5o490q2JeiNEicyKht2d8l0aJNukvvCC5ubQkRbJ5agS+CDlbzoHoGUHG+bUg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256690;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9qRsFI5qSJbVI7G3iUiLm7Rbu9EHQZmcbEMF8jjImyw=;
	b=XIb9yVEN+rBZPjr+FcBFcNJDW6OAOwLUR/DxAodnmB0jRVEqcnAJPEvT4XNiEbm3
	Bp+Q0LzUMRCmwbeE1EtKb6RzJUun3psfy3xf02242fd0/Wv1gIIUJwctIyExUtsi7fv
	k7IXPW1RdxWE+u49t6ig6UOPqjoOzcFFkNImR2NM=
Received: by mx.zohomail.com with SMTPS id 1785256689184465.8660851625341;
	Tue, 28 Jul 2026 09:38:09 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 29 Jul 2026 00:36:27 +0800
Subject: [PATCH RFC 1/7] dt-bindings: timer: thead,c900-aclint-mtimer: Add
 SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=+5G8cvlJjulcmfNzDKWNll7nfoUV4L6iexOHRij9dqE=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybp0y5VFrdBaOjrMuOFhlvnaf1mflhqUdN0syDrTmd
 V6vf7azo5SFQYyLQVZMkYXLX/yftQ7PtyMCrfdh5rAygQxh4OIUgInUJzL8L7ugoqlUqHjolsX+
 6M3L8uWt7k3kWXT7geKsx5/qtqrdM2Jk2KL06KDq58jLDFeY1mz7GbUvauHeTfpRFqIh562l80T
 7uQE=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093814_972607_A9512371 
X-CRM114-Status: UNSURE (   7.76  )
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

Add support for the ACLINT MTIMER found in the SpacemiT K3 SoC. The
hardware provides a ACLINT TIMER unit. Adding riscv,aclint-mtimer as a
fallback compatible allows direct reuse of existing OpenSBI driver.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f6..c9429a2fa364 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -21,6 +21,10 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mtimer
           - const: nuclei,ux900-aclint-mtimer
+      - items:
+          - enum:
+              - spacemit,k3-aclint-mtimer
+          - const: riscv,aclint-mtimer
 
   reg:
     items:

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
