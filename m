Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052B2606AEE0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yqlhuo8c;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPfwjEMe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MM3eLArK1mGtdlURUAJm4p+uq/UsuBY9SBVBnOZA08=; b=yqlhuo8c78Bt1y
	a9xmc308SKTEeFQSMtWT/vOCwP4xMJODeJawxt4zcqbctTgNWbnjlOu+srFgUNhx5Cc9XBaGzYP/V
	/AUk5x8V7nVLpp4UBC9Miak1oxVBoCYPYudd9JmJLIM5SZIjwRV1Dw2a1sGfwHVQUP9oxJ/t8f1Pw
	eIOil8/jNsqCJUSur2b0RQKjh3zVQlmqQW7j4TNC+rK0n4Ej81J7hr9fjmfzDwPIhywOXIE30XLFA
	e7+I9GYPpVndLjyCTlHYoZSateAZIB6CzBLS5WGjzKlEGvH5NJURSMrzlbF1iRPpOwxZoyEGLqopP
	UzHkU4+YsWFPiN9KBQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNV-0000000Cmez-12NV;
	Wed, 21 Oct 2026 19:53:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNP-0000000CmYh-0wE1
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED40C447F0;
	Wed, 21 Oct 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612410;
	b=wU19URPxEb/F+3tVHnD5lryMI2DZlMQztsmwoOiQjw4kbenR4+0hpPKCrCnArf/i+EqE
	 GvewF4R6AqeyFULNCniCDvkTlNfJJo19mxecdzu1+9dZ/t2doqB7CQubxk7o+DucMDnnQ
	 9N9s6gNz/IcB4aRrp3Dje2Kd+PWiqb0cFScYVb9uvQKaw3vXUTM5CDoXMcUYqgB2D7gFe
	 L+OdXk6RfHTLAZ8lZY+MLUOZwXJs8/RRuKTyn5bNQF0dXqviWQ+k2u1U89kNuGpNgG50Z
	 Oyqj7Koo564ms+haANi7qVY6mIdhVP3XQZomOr6KtO66f+lM7nWXObCkFLfn+iX5IRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612410;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QShVkM2LJ8JPti4P3lg9N2gtK9rDsPbvy7dUhJpdWr4=;
	b=NpTNrsYId7rwv7GsKQsaE7tRkM22puxP/XJJHN5GSLnsAvMi5A0Mk1Le4FGITLoe9Qbg
	 SQm/eI6cWzN0f5tdfquW2eHfyzrVva+bXNGr3W5VMkQ+LtrGRVrLFcG8+xpA6jjN1ii2k
	 Kudz/J6td8JcmWkA7XHD8KhD8Yw435zn3vpD7FS+gU54Wqb2vVX/cBqC5bkiaxtvQP5q+
	 fuh/5mpJiarUYJJ8PZplSByBURbFh50qtK23cBJ9iGk2gCC/DX/2LzkSU7Yr6ZkbruGdq
	 kCAzYZyZcHbNnMN+nR0PnFfm7auUDIkVtUz70KDn3tJcdicnhBEd/oYEpYcBGs7dY8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF6461F000C8;
	Wed, 21 Oct 2026 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612410;
	bh=QShVkM2LJ8JPti4P3lg9N2gtK9rDsPbvy7dUhJpdWr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nPfwjEMe0A//ZKjNJM+m2UfQeFnC+AOY4ak23jBgYImOtaNInEKW4pl9T3xaRh9lZ
	 oqkPvgMGaMWBCSX19UsgCddByxicFRzaW14kZXlgvj4Wq2g5wBRMmP3hEB2cahv9uj
	 P+KrlXRMdpeZZ+OBsXnJuGM5VBaJIbNOIyd13dahnn73/DBB2fmWZ//hcF2dHQh/oL
	 KzXDJDpR4nuwKE+GiboSsQancdNz3NJu86o2E/4VJb8HMF6FkVvc+Tc34wF/daCnhu
	 sI3Em/gOvERqMMC8yq3rKxS3kYfLOOcByogBbzsmKpRVREq7IPGShVFp38NkdjunEK
	 v5Q+3Qrjxzhpw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4057F43454;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:31 +0800
Subject: [PATCH 11/18] dt-bindings: riscv: add Melon Pi V1 and V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-11-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=1321;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=h9FV4C+Ue58b+AWtFVeYgWLXZsICp/RdVjsM7aslrBo=;
 b=FyZkG/7EMGlH5rLs/4pVUzVuPA8D/5pT5B2N5IYZsWtpb0f97bTEwPuPt18NpmyW+3OR0D+Cl
 F22zotnYH2zDzjx+WY/5kyHsxj95Pm+2gq+OsNZ8GMXfDITFC1MZtP+
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add bindings for Melon Pi V1 and V2 with the A210 module. V3 uses the
same board compatible as V2.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/zhihe.yaml | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/zhihe.yaml b/Documentation/devicetree/bindings/riscv/zhihe.yaml
new file mode 100644
index 000000000000..92ac0a99a687
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/zhihe.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/zhihe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZhiHe SoC-based boards
+
+maintainers:
+  - Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Melon Pi V1 and V2 with the A210 SODIMM module
+        items:
+          - enum:
+              - zhihe,a210-melonpi-v1
+              - zhihe,a210-melonpi-v2
+          - const: zhihe,a210-som
+          - const: zhihe,a210
+
+additionalProperties: true
+
+...

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
