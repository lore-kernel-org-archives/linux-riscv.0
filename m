Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1BA60A2609
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 01:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CBAJMiOE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehxK1Whl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u6uDQHh0QAwo3/pThHYwO4yuj2m8l5kKqruU0TZNh50=; b=CBAJMiOEt9dfP8FVoDZIZHa6f2
	Y+MJpyvfzmhf5SCVMKe/dhGlwnsOAOEE55OXn/+4hiZ32n27nnvZcxK8LjOophwWnS3BJe7YqImGQ
	PYsW214avJkikvhDjzlM1JIsEMA2iMTLcx7zzX2oIwOlQpD27luCZCX0FxGaQcZSLYJmeFl5H6x6l
	XPgwByu+KkxOAc8brqQaIzmn43wkiJxL9O0jEYTZxbm85SXkwNIF6AtYkiCZ39z+klMSYQR1FqMLK
	7F7D/9xw3eAcCfm3CD8PdKnqm+THC+8neZ9VZd41qlDdOmGYUgbg4bpUmNP41WsC3RwEe/PrvgfdX
	DIY1hryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wh-0000000FIUX-0PgM;
	Fri, 23 Oct 2026 01:56:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wf-0000000FITo-27oX
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 01:56:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E425863E66;
	Fri, 23 Oct 2026 01:56:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792720616;
	b=Kn8KSKvl5LrQjGfrzJlQKuebQVWzTg1MN7U9ruHTEh4IJ5zxQpkH4Rv/QFaXtMODpX/j
	 aanMpFO3p6uxour/F2+HJ07aCuEgn/cnJpU9/G89YGZ3s9uR5WQsFai9+1UnfTCaSN2hj
	 qhH09umNwDXDdTUsrwZsxsj/gSznDJb3VciAfll9MOGh5yUYmc7UhWaubCr6Qu7guHoXB
	 +Bs5o2DjCTsqWTTX1BzyjfwdzPmoWapRYC6UCYYDwBv3qokoVkPtQHH7Jmedrus8SKSYs
	 V4E+4lLWHqrmt78vs+2hqvFuMZ37zxU9X4K8CEbYHIOuNuZzmvCYqjB3NFInC6fTEsg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792720616;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=3N0eyWDL2whyQlOyP8JF/bPq/l66NM2Yd9fD3jDdY+mXtvHBO0ORPci2b0X7qtJqkRn1
	 UHhBwGaJX+SwHpLELWEwF5OfsV9k6xNTPXuW0Phgsdoj135TUwWzGzAHykurAYKqmIYEr
	 o9+c6nsfM0ys+bNoinoi8kNM2r27Lowi/oBU3aqxAKBdy0g8MgWWppdc8cM/iASbQ9CBu
	 9WDXk9MPUKPouEyX/ePZQR4fth7h8+66108a/87h9lprWERbJgtXYu/r8FWiY7iUCkFZA
	 lq2lqWwef2b9wHljYA5LbhYRuWAVWzqOh2aj4DRF6gd/PlyzaJ0TjWjA0ydVhcb3aiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BCDA1F01825;
	Fri, 23 Oct 2026 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792720616;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ehxK1WhlIK9DU6dBNyjrgsIEsRnltRg+NI+QuIM5ypIXNwy20ABvloWrGyRgjbx6O
	 7G7NQ0VmshJnZfQ1p9kiiChMDLwHt7GPrE2RzMoh18HqNS75ccSCwcblJon+qeGf+L
	 FH+bvSCoxExmgqlMEPA0BTk7TCXsNwMxaM4VkPvhX7ju1APIsQm5WhTK1kbah3aV1r
	 O+YJDvSRQ31qVtiON68Md6F4eRa46FdkMj+RSXZfc4gHHMRB3+QSybEswaGxnfwiMD
	 FTIT7mML107DxOTWEU2O1aoVLKnbs1I0wEeeduGzMsKC8u6CZj8Ac8EB4q8+UZWxgA
	 ynPOBXJW3SKWA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF6CA42114;
	Fri, 23 Oct 2026 01:56:54 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Fri, 23 Oct 2026 09:56:41 +0800
Subject: [PATCH v5 1/7] dt-bindings: vendor-prefixes: Add shenrongda
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-ultrarisc-dts-v5-1-af79dbd6ccec@ultrarisc.com>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
In-Reply-To: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792720613; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=ZALZ4W6hYaJRZvUX0ihX5C1JJUjIqOj+UBs91zacodYTvH/Btbh+9Corbw8zhKdnyUUJJxZg4
 AdZE0IlDrZqDn2+lDS+YvdX3VJJjhyiODse2PDGbE41cqMqLTRTnln5
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
