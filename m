Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A660A6F7D
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quYUZM+2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGZi8Z/8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLRHW3xWJvjskBJ0h5IN9KQUDrVIBIkcveLQY2VHkEY=; b=quYUZM+2+x5kfz
	QAjIQuiePaZzxFfmpvDvKIIslPv1lBx+5Mb58uXGCQEBATnGQkXgmQE2gJHD8o71qaxHvihngk4+9
	AGl32serOYc4fN38H/RvLeKNUTEHSF6V0G2oVPy7ppL5FPp5QyupEkz7HR8q8obsRVbARu13aVZKm
	sCZS7859bT5m8+XEPYG0FeFIf3Saz+8ZxzH0097sC0bb69HL6dyHMULJNCxA12VAHLB80t+dnR21A
	vqhEoi8VG9WC88/Jwk0SZZ5Vkp18hlDe3y1EEVyr+EZV90qzvXfNd0/oti45CmOIGpnci7SJVo+uK
	X9rXecCPL9XgCxNVkO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNP-0000000CmZ9-3271;
	Wed, 21 Oct 2026 19:53:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNO-0000000CmY0-2LNU
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5D0F40558;
	Wed, 21 Oct 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612409;
	b=Xrft7SAN7GeVq2XZSs0jhqovMjWCqVVTMaSoPAc1yCLLQiezu+gEmebEQuIUILvoT3OV
	 u0RMxrpTqcJ8Psz7DOLKKMvYShixzsL+jUhLzu1TbfKObO+cZ0IoCFymluJWdkBCxf4XQ
	 U9+QcF2KTW1q6odM+Ml2kyK4rkC2yOXfjxGlCokfFXX90+36pr1C5mWdxA3MIOVVUuI+f
	 Zfp2nRnGkKs9yegqCSvyL+ey7G2Tf8KhXf8hTvi07EJnUiu1gbUffsQP3KQ7COdokevCz
	 fXIY0tPxcZlGWLBphhJcpyFCxOgU8QIY4k+8q99HyGmgayBzUZrZQM9ZzLERwT/MTZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612409;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Wg/4rCc9Y69RwQr7t1OslmfPJs2UBZmRz8gauVCMqkE=;
	b=aN4lIABhGqQkvlVBPy/0jBxYffrqu4raHrDcYvXDY9uDSD2DkxNzvtZW6gi2w3mjlfh/
	 G+I6vbzZ6IKBowpGTKfbKs3cMQ3uc/q+px+NoNSNNkneISzNi78EOMEECJlG7qwuHwUmt
	 z5CjbvgHYLF1l587QoQsTivN+25iGcKcgFWyjvM+f5d5KQnHlfDzz9X7W+dwlP8gwxMNm
	 nL+/BD28g38JjKCfzO4YJTVvcJKL9HxydZKgN0VbAY7edvI2OfO64WwWisQSJD6ZK6ZhL
	 V/6JzP30HK59+FuLXLpirHdARlP87NW3AP6HxszU1oHDAnNYlbby/j8AkFCqMocxKfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D66B1F000C5;
	Wed, 21 Oct 2026 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612409;
	bh=Wg/4rCc9Y69RwQr7t1OslmfPJs2UBZmRz8gauVCMqkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FGZi8Z/8qStcK4FTj7AX1MZTTcibXZRES7jbDK53tJwRY3f2SvMQChhbR3DN51rBC
	 fmF9VXcVAs4CIO3pc9C+Hd2BpkmUAWs4D6NaWKpZRrtlRYg71h4x02trPP/nSWDJhv
	 z9HUnwC4NlOorN16CdCryU8/su5hImjLEvS/Bq6D1PMGch/2mLr3BCN3MPuRXkA3dt
	 epBhkCnRBbMBNtEJFm2JX05NrTYDvrSOy9xCVR9KgG7DpCZ41RR6ieYESd+SuTtKeK
	 iXFoI43xa1WgSt5FwbvVol4uUYLin2ziZ5AE8LPZc/4Jj8gUv8CU1nDVhVUTkSD5hg
	 N2hGa7Gp90Psw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 37E3843450;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:30 +0800
Subject: [PATCH 10/18] dt-bindings: interrupt-controller: add Zhihe A210
 PLIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-10-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=961;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=MYmNcIdDPzIqU+lFcft+1pLSNPlzC5ZsJ4TFo0L1GrE=;
 b=JH/hvz1BV8NhHBfvKeZmb1NH7G6Ps7BCo3G43K5vi0/E0sdkdrtnQHEC3ydCp5x5lpMyPPUYZ
 e+aje14+RJdDZtMfLiyyLbyAfpm6DcmWIxCM1H8BeMaq+hrlcjbVR4+
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

Add the A210 PLIC compatible with the thead,c900-plic fallback.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb691897..fd5b61db3f5f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -80,6 +80,7 @@ properties:
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
               - thead,th1520-plic
+              - zhihe,a210-plic
           - const: thead,c900-plic
       - items:
           - const: ultrarisc,dp1000-plic

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
