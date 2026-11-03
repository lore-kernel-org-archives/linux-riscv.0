Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296F606EEA7
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bfFclg8D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqU5XUxD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ooBZjZdmzA/4/YkKYG5GLbiRkX6A7sEHhofw6yvaSew=; b=bfFclg8DSR0DNcvJUnW6tSP1N4
	HoCKx2OefVNTJWieCiKKeg0FleLEGRXO5b5e1um7WfC+kGBNxWVj11H9eiacO2OJh9YXy1WBSlNsl
	SRBacLOpr5q6ihNDXjBqtuRsKLcfTZqF0+Vk8gHfmRbq+Sz1nHNH5MCGVn5VqRnKd6ugNglGGWkNm
	cfvZPCUb0IgmL5mB/ZV6nX8y+w0GUCSltEANJhYAzR73yJu3R6E6WSkFxPeY6agXGucOx0njmVcVM
	cUyO/5FbwvqJ1G7XTI4UEo9RO1/3ZfeFkqQQvbEVXfSkQf/Td4W9ClYl1EnduRLMU2r6DRI+oCGA8
	u7iyc0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAn-00000002s3T-0svf;
	Tue, 03 Nov 2026 15:11:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAl-00000002s15-0e6Z
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:11:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D386043F9B;
	Tue,  3 Nov 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718698;
	b=xCNgjWP0U5m4sK6WpNSmbB+J7mAeIWnIdQx7QnPkHeg+ls7u+OLImZApr3dlkHqbc/1K
	 WDqI2zFbKTnmqzitDNZP+PUyUiSNTEBe4qYI12qW9386qPvDZWoKOpFgiwdcI+nV7Hno1
	 41T2hmOicmo5BtJOYGPdRhsCCgL1PJ3bdTxhmbHQrjS9xyBM2TsdABiRhe25qCz7SqkO2
	 kkgr3N5L70Te1iNZrloJvZcnmHOXlpkljIxBKxgMdADp7ripnIgzSbkYXq9cY+Bo8cUw5
	 ++ufYImFTXuCdDGNCVihEwDaTxjSLoqmv+w1Nj5OG1Bx85u9lUZfu+ouBgS0FWVHzIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718698;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lVINPUnVFyp80WzNRasEKVXCIPOnOL2uC+s7FpulN3Q=;
	b=0aeszv0qTvTHkeU8HQk2U3tblPZAAfzFcl5ttiFXVMDdSaEh5YSTBHfZeZiHvvbjJv72
	 GYM61B6UUOjh8BZKe7U/6QHu+Tb4wJlQezM+HR9awMmD2dFkLjetRfgOOWt9gf6k0i6AW
	 UZKjqorouDYIT8tY1G01mwBDZiylG8jyie4Xns/3Quue46aVepZYY/+qfb0JiN0q270mr
	 udIuc81POZdHIRF53vSEOCUxd0Q+KsvKvk4ecwr9UVLcfMDTT7RJ7EWam8j7ADJz4VMth
	 X94BHtXdAAfojEPKtLwWrTQYZxvAJJfUQrCWCzfa1uthvKGfgE5DfJD2joFJQsi8H2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8660F1F00A16;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718698;
	bh=lVINPUnVFyp80WzNRasEKVXCIPOnOL2uC+s7FpulN3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RqU5XUxDOYFEjEEjUEKEtk+QP56ifvsAD0Jua6pWenq7w6Gs0F/3UwjTqFwNaGM+J
	 1KHN1V5RmYvomK7/RZP5F70wzQNryRIsf4RBbMtDiPFHHvZrQIfxkEKLPF9pgFUjB4
	 CUHDJSVrkRk/RKGr2WZvdjhAYcEHmunqcGJHw9aUFV2R3EDc2OZDxXUsFkJ8jEaxwR
	 aWU1MCua0unwLoCg5PRs1jb5DQsZacPamlfMwnLq+Qw6QA8oucrOZrfs4nmUPUddN+
	 pwebv6rOTW0GWuJHpOiM9McYH8LsO+AZEYH5lUwmYxqbyDV1OBpnBFAw9tDQApU4A7
	 mhtkekmMMLKuQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0D559469D2;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:28 +0100
Subject: [PATCH v2 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-p8700-dts-v2-4-3ac5d49f2c37@htecgroup.com>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
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
 Palmer Dabbelt <palmer@sifive.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=863;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=2lms0SOqaM4I4/vPB5czylxQz+VKnxBbKrzIdfMCocU=;
 b=kKWd8oBLvuphCeyGao17aOm0k1IHXVSc98UPtxe8GOpg5lvESDYnzC9TDjZCer1pYVuBzLQ7Y
 15A+fqIXnCgAyNjFLYN5oRyDBhjjp900w241SoPz6asxkXeAocqYKwC
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

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe535075111601b80e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - gf,mips-p8700-aplic
           - qemu,aplic
           - spacemit,k3-aplic
       - const: riscv,aplic

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
