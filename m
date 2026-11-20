Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079760A3801
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gvp1bvD8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYThZ1a4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6lAu1JOVba+YHMnhmS6Vct/WNWBsNWME5BDAeWg4TLw=; b=gvp1bvD8bnZh1aADgQdKvTEkiR
	wU6PTsRjQObZZVdMed1k4pVG/wqmoEqeFSuMS0+zkCwD0RBZDi5Cwmj/kpy22TCP2eqJCzmbq8/DM
	8LwQnwTqOcgqsmsldtwYb3W9jSqYzx/ilsB1Lg1xUYXjh2iUjD7ukaPFkSCyFyybaD7r9PUDC/6DT
	+RbJS7KcyoWF5IfOHkcQ9yFtOEGTDcuZk/75vTyl51PBw2Bkb8FHp1yvl2g4vJuWpZ/vlUltwJJlb
	SEWfAI7/mHXmEDs8W+9qqG+o3Yi1QvtqCsbigaI/PX+NXQjJpMh9liOViOdOGCt0ZMmv9C/+fWDxr
	fDt/M1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6M-0000000G2H0-3OYT;
	Fri, 20 Nov 2026 19:16:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6C-0000000G2CX-1eCg
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE14941AD9;
	Fri, 20 Nov 2026 19:16:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202199;
	b=xMdV4tPxKGLlN4M4JzxNVRvWUoj7lJOKZUPklW9UdnevdbyJSdF7KYWkIyUS7DfXiupL
	 VTOjrvzX8p+HntD33yOI2//ks3CkyqgxcCo+0I/7+GzMT90AcwER/Dnn1pNml3wRRqD2J
	 5jh9RsRrkEtDiE4+gfxB36qAAOAEo9WP5QRex+6a2AQZqd3J5zOmnre7O1bs0cbUwV50S
	 cVpW1okQOosHZpjUAwM0ch4hURHv6msJUJ+hOpBzpqrimpRAdXITuAoGQlChccWITMoTO
	 2poeEDJ86QP6lOyhrAkhXHmVEG803m6P7chTM7h3JwO28NEvlId9daFrRuIjUUWO6pQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202199;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VoO5psaD9DFnzn5bc1zZcOjZ9Zx/iOn4te5QyeYQEoQ=;
	b=QKNdG/ZG5SBYRCZ+rkIm565YCmZPVC7js6ycsW2Jgv1e+5arSuZX0ehdvZ/OxpT8N8rR
	 yyZJ36khfHfUbQvHKp5Una/tttJ14IXi30Y5Cnu42e/TVJRDI/bwQeMppGfdoR2mx6NAn
	 eNkDLL+hsMu+kiw52qRrCf7UJKQ53YrDJsZ0OSYHlQsuUKX/4t/lCjarTZKo9eNoGgkN3
	 TU2i7rV9p25SkX5lV4S0qP53u7VNGDAtoWrk+WsT1WfZGsPXbiGTYpgK9Dqy7RU8QMKDU
	 G7syU9D4WPkHevuD5SFvWx2STauStnPE17pHKPF+X7EJ0EvUwUrTqBb9ZtVRmky8oig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0D201F000EE;
	Fri, 20 Nov 2026 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202199;
	bh=VoO5psaD9DFnzn5bc1zZcOjZ9Zx/iOn4te5QyeYQEoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HYThZ1a4hOsvvs+Tm7y5zXG0JNKf3bpbTlhg4Aiyip0tZ75SZYc2RsIwucIhNLyFE
	 qZdpdlXHsja3+O+JitKRL40rKrHimL5UY+k/z7QGRZkGsplC6jAnk0JjApD0IsT7nz
	 iknPYLMEdoNhd457fnq5xHQG3GEEiGcWGU0xaxsvjdvC6O7RW7YA9ZLAZ1why+ds94
	 v1QZihaHuPJmZuLr06RLdAC6augh7dsKXCN4A7bs6amGNPimrks1q6aat8TfFbOYSY
	 wW1Unx7KnhElAYeKQ4zyjXa3/a0wSZRbmNuZIuk3UQb0U7lAKlyJ6zPSJlhB6Xsi2k
	 95mdnI4HVwhSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A405B4B9CE;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:52 +0800
Subject: [PATCH v4 06/13] dt-bindings: timer: add Zhihe A210 CLINT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-6-4a795a0a9fc9@iscas.ac.cn>
References: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
In-Reply-To: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=860;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=xDW3mj4crTCYIjLMrm7hiotLvXuQDaJfNmGBDmcpw/Y=;
 b=ITBUMLFXVAn/LcCfHEiId92uBWlW/+hUYxiLBH+Nd0AXOKYmT7nGjh7oKSsVxvXEKQMhLFEH9
 VTz6tspsrugBjsPXew0KSTSRceYGa87N9F0L2edOzfzWv1JPwEOM17y
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add the A210 CLINT compatible with the thead,c900-clint fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d88..6480c8dacf6b 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -55,6 +55,7 @@ properties:
               - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
+              - zhihe,a210-clint
           - const: thead,c900-clint
       - items:
           - const: sifive,clint0

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
