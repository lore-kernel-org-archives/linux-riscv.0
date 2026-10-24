Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED78606CA12
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4OXndZvE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZj7Qg+F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u6uDQHh0QAwo3/pThHYwO4yuj2m8l5kKqruU0TZNh50=; b=4OXndZvEJVyZmXIPrG2T9LaMJ6
	9tpXZk8RBYpoIpV2Q8L3IXECvHMbZX8ZKcNdOm/1xbKngeq+ugmwd+iOonCHq96iiw8fYLcH5B+dW
	snaHwFn+NQtcNuPejvyxkfzPBry9E2GYy8qEN6JsEIlRwlIgBW5TCneZ5liLcnbvZcKOKX6m1LCeD
	Zed00Psu2B0enmwviVZqotbtEY4qSdYb0Z6jme46rAMbuPw15B4N2EKSvMGI0b4QKPur8gdP1LmCs
	LmyQIYCs3QpkIbepF0nYT48ztveRCbgHEERLfk6qdT0Z1wjvONHQq6z9HDZUX/MICBNscrFasQUqh
	gvt5pn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY2v-000000003Bc-3hao;
	Sat, 24 Oct 2026 09:28:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY2v-000000003BE-0jOD
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 09:28:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A31EB43A93;
	Sat, 24 Oct 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834092;
	b=csLVj7vy834liiz578zpST847mYfLfJMjTzRodGGWu1+igr2q4wLPXH9dm93EkNNKCLK
	 t2tkweHqs4ey2jPnpJmWwUzFvOdXQ97+h4a0sYNKhdiu+HLLc6F4+7nUwpfUBJpEZmVVZ
	 djMu3YcXQs/x2A35CqNjQ8jVqKO1LjCY+cC+PVIYoTP6gIbjru0JyRphZ9NXXS6DzTsos
	 GFXilpkUvOXiz5wyfdMF0OnnqVsayQmWhkbFtkvBQqK+eJ4gZrOYeNqBWc7ybyQv8zMyD
	 U2dwWgVgq+jLq03EKF0T4qttkrPVyDDcj10lNP5BNtir0nuyGSx8jJOv4TN3RDlAjgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834092;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=TdIwwdCCjTVWTgR9A5L+/Mip3yiYQKEekJ8+7MWn/hIoTq8p1tXyHyHJN2uB5scydeg8
	 6t8PzMcz6B8FlVh66IP9SmLlO8kUWhJdqa+O15eIfL0F8fZ5A1KGvQSdSZTu13lsrzXcP
	 jHDLSlMa0pUiYcsFDHXQrvWt4cn7D6xJz5UZPgbzKYPWh1Kv5fixOzzmyUX+XhbTHRuso
	 YoqKmLOKSqKARh44aUDNYIxZoMFdq2o1d9p4dib2BY5bbf8/MSRRuBm55/WqP7CJqQyiq
	 k+5CjDHSQSwHAbVDppAK/uiRnqchbnp0qURqp8lDyhZk7jWdkBxYYthO9/okSvisnKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B7AB1F01829;
	Sat, 24 Oct 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834092;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EZj7Qg+FgRFS7s2UnGsI/wMIPWpjswUsGDzZB/X+bQL4oivL/30mrq4sxkVYZjv61
	 PtFO6/wNGP7Nz1eBaCAkRRhBTogzFlLfd3IwLUKBaVBUZCB1X5IPdFHQzS1xFTUy2y
	 JM3ooShXvTYnhsIErkjRCZ2X6h/KLZfIYXnxqZFgelaJJJVqyNQxQ1x6aKGFW3lrnm
	 Bd9kEPNt/CdE0QhMlIdo5aVc7YcZb9zInH16tfgWwDJIspw5SIXAH2Q2SJpT1cKs3z
	 gLToJUWfzqwUu4b7eAiKzMnsLgoJVe7jF7gOwNHKFz5F5kdATWV7eqUlfAegHmTzdK
	 MfZBKZMBVaPfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A93034475B;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sat, 24 Oct 2026 17:27:51 +0800
Subject: [PATCH v6 1/7] dt-bindings: vendor-prefixes: Add shenrongda
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-ultrarisc-dts-v6-1-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
In-Reply-To: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=M1oCnUDesQ4ns+QHD9orP0jx0k6sRE8c2K/0IkZA2Cg2wCtFOnD3jpfDn96WVdumd7S4nbKj9
 pJQ/MT1WNLvDXOzs1RgvypKNuQwba+PuY1c1ik/jvT1SV5Rnl0Pj5Mz
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e100f3993e57 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenrongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
