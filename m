Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FF2606A324
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 01:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vmJOvBdV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULDCI9hd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S80OpsIgPqh0Js6FeyVGyRFNhu+X0WXAsWgRqNhpafE=; b=vmJOvBdVuKVBaejos8GeHFFtO8
	3A0jsK9e6dnJ89N9N9I1SwWC4N/loE0fD5drPPRc5itZ2hJusIMo3qUNtCmbbInm2YdiRM4KKZIDQ
	GbgO2R4RQr5mugjRlsed3R13ltgU9/FJ0jxb5FTnJSXygeIfGLJoa8t2YuH3sOhsjJs0wJR2ciknO
	qyIFR58xQW2IzdF1b/INZniPT0i3KBOg4/9a4anM5iRGQY++nS12UsUe8BQhO0+wHCMcCST27AVBq
	/qorie1Kw+P8wwt/w8j8JSXof+Fkd6eVuDpg2LwZaY9Tbtat/jmF5oRzQPcaP24Oy/Kwr+JCLyalR
	KACHil7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wh-0000000FIUo-1gNf;
	Fri, 23 Oct 2026 01:56:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Wf-0000000FITp-3Oip
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 01:56:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4093F43FEF;
	Fri, 23 Oct 2026 01:56:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792720617;
	b=joVie6nvAZvkAUKNKgZvQ0Ftq8ZJtWwwssLZn45cY1wAEnIQkvLveakusuBTk8rjrJYM
	 iHV61lFvf8eCcgMjS0c4Q/8Rcfp0WrwrlJOvwFsh5ahg4pjMfb4+73bBvdHmLGtjlgVXD
	 XrXCS0WKRCpMadxLzGuKwZVwHzjji4CPWuOTIaAaK8R9k7cEpez6CArup01zEQpvpjWHL
	 gPfSau9bosXvm5A4aFrmhLuWfXBaKSpsbv6YUNevfn1EO3qFjUL0nqYIMgIVuu7n97R4q
	 yz3qut8Jh0Trrw347MjhZvL9XVikwyCtLa4dunqV0su0PwUmYVHFa7c9y5MKWPh5feQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792720617;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	b=fDV+sfybjDpc8ZCWzA/HRrwOrduwtFEQ7uxpSK6MykOaE+7/7L3GLEhZByTfDsr6hfz8
	 HZyE4D2rBd8MaHvDOGGWza71GUE/Y6eduBPIzMe71tyqd58HTURvQ254iOHpUJPRFTE+s
	 X7CF/hckk1S8oENuEURqZZpckQpAeY3lGeC/a0BShwHYi2WC5FSdH4VH7zJ8tfvFryORH
	 b8aoaBQ6tRPpusYpbYgZVaOPerTz+VTVA/Db6ydqLzO9dKMF3bvaO0Jy2mlg7Kg9+7eIO
	 5kvw6VymoLNDOF4ACCrkIrp0bUIcgb5IAWf+N7cgCpJXFv69NRrab7CMJvBJ8RPQ2ZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C7771F031E1;
	Fri, 23 Oct 2026 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792720617;
	bh=0UzY1m+EAyJWVSs3KsoWgdS/aUibFQ3ee2IxYj8gwaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ULDCI9hd6iTcssAkWVbQPgnIV8Mju/4Ih0FMYK3WYbmjN9Wp3b9YOiV7qRmaD/iyQ
	 NmmBPCt5SNYQXfjR06xpiayy56GZZ2B8js+wr8NUuPn86phqT8zpyEu6ixvrLSSUqx
	 CGz+2fGj9LPxkrSErw53l1bvUg8hA8nzVoLU5HH8xPXOF557tFn67RDISzRL03Tmza
	 05YiFmzXyc4PbhGP3tpluPFVZCVZre3a5rGKoGXT3vF7IUkU8iboFOjSpENzvbCbUy
	 izjVwwSEnZqyK5AKNks13Oui9/PPee5o8/NwwYlH33C3DX7yOQxGI7pVcFrEoz75Lc
	 HqDEL9oxXlXrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8D0942170;
	Fri, 23 Oct 2026 01:56:54 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Fri, 23 Oct 2026 09:56:42 +0800
Subject: [PATCH v5 2/7] dt-bindings: riscv: cpus: Add UltraRISC CP100
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-ultrarisc-dts-v5-2-af79dbd6ccec@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792720613; l=804;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=4TAyfkBcv/s6Kdb5vlK3fVOCoBkGrwHfHTtS6V/To4w=;
 b=YPRsvZ3JyFQbubm76Vv+Ad/0G02ACXs2KTmN6BbbIT9M51nVhWN3BIOnd2QvZntJCqCIn7kx1
 myOEpd9gN5nD0O+wx/eTdgixR+rzHtGEJbyYk7SqUagJz5pomKIMbcJ
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
