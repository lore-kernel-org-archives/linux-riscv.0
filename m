Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7AB6071A08
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R07zj8Yy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aroiUfdQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c1e+xoWgSkbVNoGGB5OYVsp43xcB5yy2yUSuZyRUW+Y=; b=R07zj8YyaWRSYDqk5zHsXTjrhz
	TF9ipyMyz5ut0PGCet2/ew6QnDmpLyzuHl+PuXdRvwmZHMDrxQhVs2Iit7Y81W7AjSW0ShyLDXjHr
	j41B8K8hxr2F9ucwWGPjPLXayNifhW5fGikS3BAnJStfkhWrM5afg7y5qkVHjGbK4yHeztee5m8Aw
	JqxhkxmByDd0YgDkxNJ7V2ILMIbco56lh0v0NWLJQ17o4f/jdXjyhW4gQTl3ce/eDhLKXay4W2G70
	+kQbS/KsKCV3hIKGA3BLXTgzkl3PTz72L9TjHu3JKaxuRbBb45uWYi5ZJ8J9afaANjDM4G7ZF5F/y
	+r8dNlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAp-00000002s5S-2QmX;
	Tue, 03 Nov 2026 15:11:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAl-00000002s23-3mBj
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:11:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A657F43FAA;
	Tue,  3 Nov 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718699;
	b=juVuWjLOt4jvxADm1maD6JxsJCkHX0r2yPefw43Dj5gOK7fvyGtADx+uF8l4w7A7OQ/k
	 XP1dyFPOky8AUI3f5YGZoYOkMqE1cbCNOfeMCgmluRCSIClTRl8HIBjHYyF95O0FBhCs3
	 Jj/ww48oK55rqM3h4db3IuPnodG55xJs2MAVPMhuQcUjNAkD5rXdnIH/cWPA5vKBJ0qaS
	 VVN9BG6AUrdrvSGIcMdFIKWzw1hGAEjvCPIGIm/k/xKXNus8E9N26iUSnTy7ph3F+xNPX
	 +Wqegr3z+N+Ww1PE+DzLXCnkK9tdzV5s4KL4QedXMY5HjiMP6BkqfJtIblNFwjfAf3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718699;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZhxFxQVBSsCCwVBEhg/3TJFmkdSch9FDXhPkOUs2eeI=;
	b=JMxP//A8KHhilrdT6yrGIQ5bbWgcgIhx8Opbp9PHF2zL+UKUuqTVbdf4KQHias+jhMu9
	 p+FG2fAT1fHA+by5cfX8rCTLOBBmj5OBJeB0+tBq39Nya/09+9qI2rkc/7f8ZeKpQpe4n
	 NIxQe6F7V0N5fgXMhCi0+sCLLy32e7756+4yVjcWB8PpyLKZAID/XP+LPST0Ul52o6h7G
	 VDep6KBIdhr0kKY1BaVNltWnygQyR4JD9oVPN09phqxjEyr2XxMPh/BJJFdyqPVd9HcqX
	 O2NaM9vwKsuBpVTSlRsH/DxkQNdInEAwJ6F4bESTp6a4kWIVX17twhgxLHdstlXLrhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 813AE1F00A15;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718699;
	bh=ZhxFxQVBSsCCwVBEhg/3TJFmkdSch9FDXhPkOUs2eeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aroiUfdQyYT9DP9COsC6ePlxaS/u60SEiMPafuYZcpvZTYK0virRvLj3SZqp2IP34
	 MlQzxvVeTUV9YEE0zz72JrHpUsWsD/cEtMCGMHT97oiAx4xJUpnG4mJj90KQGcKIfY
	 mC/7U/cQ6PkjnBfUppNyfoGwwRL//92dO9N4sJjkEdUU0GT9sh888F8+YORcl72uUQ
	 i25MpPbCVtoYIIMup1x1YQlBgZTIXf3ALIK8iT1Q6arNPP1GOxVASKtMeN9IbGubHj
	 0wV5XhXTez27Hlj84sPq9L/HAbXpetaFOv47qaahGOlEN6xA7COiHcRKb+ZtAo+uZy
	 iVPF4BMu9yIQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E89F0469C6;
	Tue,  3 Nov 2026 15:11:35 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:26 +0100
Subject: [PATCH v2 2/8] dt-bindings: riscv: cpus: add gf,mips-p8700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-p8700-dts-v2-2-3ac5d49f2c37@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=791;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=9r+1zOKPzU+i4ZT8EB9T5a+EqeMioNWwz2te9YRWjxc=;
 b=+BnhWHkCTSsdtLXP13Ak/Ol9NEC55TjJ/xC9Uk3KZQb8Z2yNgjZsLYhToj/zwDsME5s9L70aH
 b5RbdLs5bNvDiKC7c/OxSdJE4ODCFPTigCot+Y2CJwjAXAKaST1oCX2
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

Document the MIPS P8700 compatible.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769767a9b7f41f179a3559ae7160d69..c7f1cf1db6eef5b25403d53bca7cffd9bc1f2240 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - gf,mips-p8700
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
