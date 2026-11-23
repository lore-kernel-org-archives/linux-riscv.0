Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677FF606A6B3
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fpVAJrCw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UeQWyCP8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1EODZIVPaAfCdXoD7qT6wzn5cdYAz5kXV/cX6HHX9rI=; b=fpVAJrCwFd+aPNQRI4cf9Q5zGp
	6l/38lSTMsMcl1CJewRh3fA6GSrLLo0K7HWER1zswN58yvb36bi6+RAt9od3NAlk224mKrOB2KpXW
	YeFzi41i1lh/5CBAVEZBH7Dq8cHvZkxqTdHBMoPvOhwLkdbUH4PfmFJgvFD3iKurUZTiQd7v0p3E/
	/guNS+jhM3eVDvuZuq0OkvHZuYGPn34VA1YlaRv9Yhilb9JmL5pUcTObD6+gA53i6yZan1aklWsV1
	3KBJ9pbC0bhJLdyNskMaPLIm8hlbigUDwRf/+NwEp5+V54cLjDP517lidzzc8tlmffSzQQLih4DsH
	/QEuCBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKd-00000003mky-2i89;
	Mon, 23 Nov 2026 14:47:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVKa-00000003mk2-3bik
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E7C444D96;
	Mon, 23 Nov 2026 14:47:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445264;
	b=xJUk6m6F/p/0NZ+HPseVKYwGMr+lBPAmuap+oetUr1PL3HH0/TQKiVQ+lXX+ihcRmp7W
	 6/nePq+fNQHICWICU9/B9XT8gATOl5qDDAb9/tTPYeTXNq/EqeAnLVpOZGGLwjpVlQNwe
	 OaevplQ8ddq21FowB+SflGs8CL53QOQ65lGeIAL0zlO3ET6w3pkbe7LZshZhZTKdV9Ty0
	 JdpYUJAfalafI/oktO7xiKr/hN6/1FhrwUJcz0HuDR3scyJyywUm8fWFsQwmD3RQ0L3/w
	 BfyO1nqltAVU5y/8v4Sx+86Kfus8Aq2A4wRwKtnkjMu/vlZSmfmPKcNAklx71sZUopg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445264;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WWM/XkHqroywPq1Y6qjpupk851Qi+MmSf1AGGFT1YEQ=;
	b=APvkCm5JkwuQVSs1cffuf1tmETPxyzZeUkBmWvedD1lhs7zON+sy5wJYO/VASZXYebEs
	 WjWsx8sIX/IVMLYFbrJHzQn9xlNDCOT1+qRLnEqrJfxsoz0XcE1ErHA+kSJ4hNvFVsr52
	 +q61W0ZCPy7BChhUXJt0BNhXmFhREXIkiqYf2VqNJ3ZzgjMjYw3jlVw4Fqp5P803E0+fP
	 FN6A478AXp4N46I5Eea4SBZ2YDqdxEtfmhbhe0mLRmK/+3Vrh7aILIu4RQH3pKRrSHPlZ
	 rOKvmrJIhw17wRmg+FjoKs8W4QUR5lMHSPq22uCaZWIaPtXaR7Mic4y3fajk7+9n+5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C26A11F00AD3;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445264;
	bh=WWM/XkHqroywPq1Y6qjpupk851Qi+MmSf1AGGFT1YEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UeQWyCP8rFJGzlRDQhiUS7SkgEWxMtH0rqk657XLqvtaGuWMXVG3pyCuhpmKvPPUQ
	 J692clGR//Vj18P8kDw9PiW3A6CtTwmbY7irjAr8FuAryKWa13nO5YmUGfraeHvGrU
	 R69X2qwakEjlouDvdYR098gyUnZnWEarZcQAaP1k6PYFrRjKDeI+XOAIVVksuiSWWS
	 C6FZ9eywxEk1LL59RHy+mpH+XE6rxVPnO34pQFV0da0f3cUuSHr1hovCVzGSAXceAs
	 HT3b87tB+XmrNUzxxBeY3lW8VYMWDYZrYmsHS72po+bfVRw8VO7R0ARX+KdRMUq3XX
	 r2zQptBgOxyWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 530DA4C503;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:46:58 +0100
Subject: [PATCH v4 3/8] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-p8700-dts-v4-3-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=913;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=nrrwazwcP9azGUHCUTNRCM9hJiAPuvFJXrmCXH0ud7s=;
 b=zYfG/z7OXsCc1U/IubAYwOYWKyPHYTJJj6PlqO9VZgJ7XWRAs101FOzUpJl64727FDT8g7ScW
 p55b8uA3ksmBlso/dzRq1Odwc/ipmhxQE6DhY8lbcUXyVUn/mog/5Bv
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aplic compatible for the MIPS P8700.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d29fbfa36283fc9666e8cecd6f77e7..2ab60031ac5d2379a361dfa2bb334796472cf039 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - mips,p8700-aplic
           - qemu,aplic
           - spacemit,k3-aplic
       - const: riscv,aplic

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
