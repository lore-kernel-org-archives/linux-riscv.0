Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC9606A326
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J3tdUzXs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArehMx9K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jfd7DQtmehAaEREIUCkKvHOyY9ss0PmLwaFja555FII=; b=J3tdUzXsqcJeMxC5yVbHbhEmNK
	sGEdcb2cAsWysSLiQztwVCh4Q3f/iQmO65tFE6pdfHPqYPTSrT2+uPxuRhMtL4K4Ps/u8T09Xy73p
	gCAWNqQM1CD8O0Hh31pIENltnHwRB2oRxQjaQLVYbzWLIqH+vX2Px/xAk+a6cP44gl6bCUs+qfgSf
	K3XB8ByPOdki8JINpih6DHstE22u/fQovGfrYfvCWptCoFGeur9Ai+ABROx4WfjGZcYA2PvZ+CR2b
	4I/1b6b+aJeBsQWVWsNA1YlAu0Q8IQjYsNHsebn4cZ1UtN+htn5d1NnLLXW+fEWTXCjzqG3HisfoA
	wmBFjtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVii-0000000EXcf-3fdC;
	Sun, 01 Nov 2026 13:35:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVih-0000000EXcK-2c7L
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 13:35:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A732743EB0;
	Sun,  1 Nov 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793540134;
	b=1VibUrp7guCfLHkf3ibSBskhRcp0O8T0J8RIbovN5oYbhOaEcXB/yyHfp5jP2p4MNKoH
	 FB1PV4Ap8I/Nb3HtRk3nRDtkUMacJ27b7u29Q5zoQEsYzgtKTSCJB4fwjBeSrpTIf8A3r
	 ZIL5Ts92739Kkn5jpD47oJvcyQItCb2kKB/53HkAex2/seB4bnGzEDWMmoyqYGmJI5bjA
	 rF7tS6j637BmoOte5sK1zaoQEZLGkRDz3A1XcxLGWrlI7xBMjwK8mRwGmEvYJSGJUZnU2
	 chWUfb+CF7I8Spffd637e39lAe4pGDrpNx57dMdcuK+sAkiUmBRASH6En/dWuIFVVhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793540134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qEGrfial3d8eZGApdMDGhFV5rb/ELjCCG6fHhOpnOQ=;
	b=vuo63auuB2x5DvHk6/g30bAcXMZFCeN6wyAoOoX7tjOTl+pzTkJAlnUO8wABEHTn94qO
	 mfarDWHnbZBWnNxn2pJU4fCzxYNkO7D2xUmRsBzBMyp/5beNeAC5Ce+H1A6P4KP70YGaU
	 bddKNbC5B2fvT85AJHrAX/Ery0SUJITo4iigJpn3OBJWIlxTsfKKCxzy74LvqQvYIq3PS
	 aAdmHH8VfJi1i0Drt3bJJNc+LEK20fK9tkfEkSN99nKkQ8TSQDBsSoq73XIX7M8Drs1OK
	 J/jP3oQxhM7xS4E0JGi0lIrXlRDaGZNPMODEaDLdJZwolNWnSuyi/QWrC79WuBcQ5eQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EE0E1F0093A;
	Sun,  1 Nov 2026 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793540134;
	bh=4qEGrfial3d8eZGApdMDGhFV5rb/ELjCCG6fHhOpnOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ArehMx9KPDh6FCXwPjFi42DnEp7zKoh9iyEFpHXV3A/AKKOoht5CBh3vW+XfajY1P
	 fN2r8ktRhfFRMWhlGnLQc71auVvdeeR3/NsHoQa8yXJFiOwy3rF8TJVPvcoXtdhRiI
	 uBuQ9cHGA/YKPw8/rF6SZkH/GL7z1fl0N/D2KL/QD3D7w2X9uNdRTNZkkIzqlamGYI
	 UrPZDEiQDuFVPQFVziGDpNQNREQYqJNBP/UEPeZZMuAFx5UOZN4P44GKjefGY0vD7u
	 tCRcRwuiheyKaICsUrWFlAwAHnSelFFrpfTSU5T8uw5Nl/vd218FOJknQLoBJRshG1
	 YP4yo69vgbt5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F1ACF460F1;
	Sun,  1 Nov 2026 13:35:32 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 01 Nov 2026 21:35:31 +0800
Subject: [PATCH 1/2] dt-bindings: timer: add the FU740 CLINT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261101-b4-sifive-fu740-clint-v1-1-b4821199a733@iscas.ac.cn>
References: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
In-Reply-To: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793540132; l=1006;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=VwCnzE/4MZz2gbGvZGs9P9obrlQjk7zxT+DpHDQL0Gg=;
 b=nICmxnHvq/ap74lRCP7Vd3qaf3i6Oa2kxxw4daKe6HXHkRD+6qk7p3gq2AizwI5a3zXQybX5L
 NEEGeCPbiMwBpYAeRsQnKtZYJGJa1lRSlirw+HfHIg6nwZ8jKxtIKTF
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

Document the FU740 CLINT compatible.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d887b40c0d20049d86867c8a5b6fae2..13a8638f6b08e87bff3e37f947b0fe5458ebb38d 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
+              - sifive,fu740-c000-clint # SiFive FU740
               - spacemit,k1-clint       # SpacemiT K1
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110

-- 
2.47.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
