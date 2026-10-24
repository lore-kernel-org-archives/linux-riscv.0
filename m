Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41428606BF3F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRdEANh+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeJFFpOs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S80OpsIgPqh0Js6FeyVGyRFNhu+X0WXAsWgRqNhpafE=; b=BRdEANh+4lSr+xsK0h0bSvQCiF
	JzbEm5pcErKXIf4A4Q7ZoVMckhnRZ2p4XYgtgiBm7iGCkXJLkX+Yi1pGmX1Kre9pXAqEUUdIrnLi+
	iGwmW9ZkIUPT/ZsxrZdv5lm5c47aN1UXRM3HVdCcIRYmlI3x5abv6RYQXR6lL5Jti7d8o3q8BuV2n
	zF370ESwaewRUteZX7yTvotSIvLMbqAgUB3khoV+WEj7u3JUVuUSh7NHTn350SBztdi1traU2LmeF
	Oo0K+VyX9EqOESvgwfFohO14FCpjv7SEQPl26fDEf47D/cFYhuQVrOudmFcBj417MQGLYRQVQmYk+
	NGKcbkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY2w-000000003Bg-01kw;
	Sat, 24 Oct 2026 09:28:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY2v-000000003B1-0jCa
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 09:28:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1613D60A75;
	Sat, 24 Oct 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834091;
	b=22gtAqLmVUCzJQ2eIaWXuJPBluzWG1WkK6MH3OdFx5icVh5Y7QXIWNWrdJp8o7uley1e
	 Sz8EIelJ6NQ78DnczQrRmmRCSG1nSpTO6JEvNqKVVpkr8/WOXGJXK7FNsIJOOSA+aHsJ9
	 pv1d/zsWAwkbTAQ4725vFx4gTOd19TGQbLTOOAz9TS3xZc+z8EfndcuzNBNd4/71MVAq+
	 m7QUHZ/T9/IhTFpA9r8OUBIPt6534DzgM3+1ei5/aBlE9x7CtnFDpJXIa7099Y3OmS4HY
	 lpQDGRN4jul3M4c87LJrkl6ie/c+W3RNbf/DGBdFPgcMiAQbB7r93K5BrDAewqUYr3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834091;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	b=toAT+XVKsSInGuhhHdMzCJ4N7HAAfLHZ06eJONvnvoUIs+U7sSeHq/zWg5nnao5TwzsD
	 V74xqLeX8RQIigKewbvZgPow2sCpqOBzr7ySXMJzFVATgG7A+/NojAu2qW/bXjSVKBj81
	 MAPMnyZqtrWl0sY3bZSFpSSTCaGxh+Q60MWAadiTGD//Yz16D6bK4wPLgnRLoSKvrqKIT
	 X3p20TrpSASj7D4ro0IokqnVRR5RRqef/Uq45JO3ZMO9ahfkQ1Jy0eAgagr1qqmCdet/L
	 u5eP+xoVhTJtS2/Bqit5NKGPZILdk/84i7pA6weAt3ZFw9s9Iz33hSCBjmq13rD9ISw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B7701F01825;
	Sat, 24 Oct 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834091;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XeJFFpOsJoorhfqoMkIco2vWEUb4PW+qokBw+J2oUmJuyrifcg1emthMgS/sw0+OB
	 gH8jBciXqjru35XvH5y/vtDVsbVC4/Ze1Ffj7DKqcvRIq43I+zHS31K7atC/ZUcq3M
	 PnecjvVJf/UHQdgu88mfOL/QaQVmZ0q8pHjQirUzP2L5jl3stPdHXJoJl8pOXrbHXk
	 /1KJtsNWZwqx5pi6eG6UKxbN0ifvicwTiwmFdffToJxQQF62jYgcVbKts6Qr0/v6xT
	 RgrneKYSeyxyeVRsC8/VhTvSlrV+dt7hE3v6nhQbJZViIjGsMDHZBwVSwic6E7Oi+A
	 tAlsBg+r82FPg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B15754477F;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sat, 24 Oct 2026 17:27:52 +0800
Subject: [PATCH v6 2/7] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-ultrarisc-dts-v6-2-c62994d8a114@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=f/Z6uMfHMGFDJscFuj8+khVzYGXItUBHmZl9/uSGKequeJ1h+YxchxeMwuy0SwlxUoMBWgBPr
 jhIgubmNsqTDPIVwkpWN7OLFv8Ws1/4HkFjWQrRR2/6/gmKKTPf1TQl
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

Document the UltraRISC CP100 CPU compatible.

The CP100 CPU is used in the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..85adf72899c9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,7 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - ultrarisc,cp100
           - const: riscv
       - items:
           - enum:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
