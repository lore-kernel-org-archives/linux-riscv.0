Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58235C982D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCnZ+82By1SpVBbyDC2Ip6D/qw0+QXqdtuVWLIlZlX4=; b=MnrvoVzJHtX4YQ
	yWuCBsknR1IxeEO2uuhXB1QxJbN9x3Zog/sBvb9gCm3MpDjyGUnn9vwZ7bpTp/KmSWTeLLoRj6wOK
	uUglXq1RJve8j+TkWk/ndolhgeflh/9Gc98o+wsciOdussGuTvZlH+ZeMq2dQo6ZpJSrm+q2MmsvB
	PKA0Utb7rWW6skjxmyZ7IBo0/8pkJcWm9Lvboh06B/i2dmeTgutr2WLWG4H/jDVzzme8LAkg8x1Zl
	hqH4QRS2dAVuloaPBxpx74zkd6D8/h9wt91td3Yc4p8GNKwYgbLYfLBmxE8q99ef+Teu/beikfRDA
	/n8WEDLUQo4tles+IUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F0x-0000000BuXo-1zfm;
	Thu, 17 Sep 2026 16:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F0u-0000000BuW1-2isV
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Sep 2026 16:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q4svquE9ejzTbVcSMhFnWV43R6UH1UzFkaHKI2NgWFw=; b=Ypwwx1C35PitbzZWu8Q34v/CXo
	GxMfOUPCPd8nQA8jO7I/DiNRDiGCsOd7tRFGsM8JBTgFB11ncQ2kUNAZ8nzcywr4LtpCe0EuM3+km
	icfwGWlxBxBY4fdRCyQlAZRmIaZTVrvpzS7moNKGA/V0cDlB+PufnttyHDXMvEpOk93yx3nXdok1k
	6ipjU0RFdKUzQPp5weHgqTrnGlFRgnlzafnYZ498NE3kcczV++TyTsL6p37txg5NUVpYaWi22B1qf
	ZPNEu1iPTDuV1O+7poRkPouQsf37bcrDKdaqMKsCQBPCmaftiKeZcz3qBr90g06WeDcNvjgiWn8bd
	Aknjc9FQ==;
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7F0q-000000092oW-1d55
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 16:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789662653; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lvxC/orxBvwnPvsI+Ac8QvpPGiQNL+TpN7k9oEBdOWWBS4uQCp0dPn7WkzAJNOPLESkQxN4LafpzrIRqmRwWhFCHgmFgu1pA27cqQrAtzdIzz5eE9sLpeI2i7u3Nr85bM9Di1G5Zp5U08ZpOaB3PFfRsSKPYeH0Ujj3MigJeHD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789662653; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q4svquE9ejzTbVcSMhFnWV43R6UH1UzFkaHKI2NgWFw=; 
	b=KAdQ4ZsXgeX+cjhNyg9Nf4FdfDgphYIn/k6b4uVu+6YSl3j3eYY39HLtoZa3LiQQmN7wbCmhCcZxM5srsK4ckJHLONsSrBb4ieUmNt2Vj8KYj931O1opT7adRUFL6ZXm61823/cy/NR+ajMLrCQ+RGh9xBOgQlsagoBtU9Ps7B0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789662653;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=q4svquE9ejzTbVcSMhFnWV43R6UH1UzFkaHKI2NgWFw=;
	b=gdaMO3UILilcJqtqDTi9EmNLYfhBw2QO/SXyzz/pADst7LQfH6/OsEYaS9Sm9aWn
	C5Bu9kZrbXyLAV9Axw9krJPmYGyLQIgDx9OGT3q9V9hiR9SoHoD1tcGuMe+t7V87V8x
	yEeJIAMQGXprtzZPSPt46Ibzt9WrXA93nH6LG4ig=
Received: by smtp.zohomail.com with SMTPS id 1789662650992187.68536933248265;
	Thu, 17 Sep 2026 09:30:50 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 18 Sep 2026 00:29:35 +0800
Subject: [PATCH v3 3/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
MIME-Version: 1.0
Message-Id: <20260918-k3-aclint-v3-3-cf4fd4050e14@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=5SW1nm7vQ1BZK//GUhTsPrMSo+O35uE26pwaraXiyH8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLWiHawrfQ50vglwTKuRZOBU3Zb+yfllzNMJ242P25x6
 AP3/YeKHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAExEZB7D/5qN02QZrgb8j14n
 KqJl+f5z95HulGjTJV7RidzHw1qlMxgZ9sQ02ZUy1q4NkVZz3HZoQ0tPkf6+0Lsl03VCzmakGa5
 nBgA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_173104_806711_C9AC9C7F 
X-CRM114-Status: UNSURE (   7.79  )
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

Add support for the SpacemiT K3 ACLINT SSWI, which provides
inter-processor interrupts in Supervisor mode without calling into
Machine-mode firmware.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index d02c6886283a..0b34ed5b4639 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -24,12 +24,13 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - mips,p8700-aclint-sswi
+          - spacemit,k3-aclint-sswi
       - items:
           - enum:
               - sophgo,sg2044-aclint-sswi
           - const: thead,c900-aclint-sswi
-      - items:
-          - const: mips,p8700-aclint-sswi
       - items:
           - enum:
               - anlogic,dr1v90-aclint-sswi

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
