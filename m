Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE16C83000
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0sH3jhphX9dsC7vQvwKUwO/klndCcu9WQAOWHUZnjk=; b=wapsEOJLalFzOy
	y2sieQzbmgxUyjNZA+AOVG9YZOLgy5ixK+Bud2b0/Kx0m1eCJsFDUUMRaeHUPjPxzjh4W/Q9je4er
	CVG62i7wxIPj3cnX6699flf6Lvy74iS2zbA8LT2IxBf8oI1uNIaYVpIkqFBqLIV+275FCO2x5JuFt
	6Uo6TixrVdnGu4k6zjieXBHgLbJHTNA/0DUpQcQp1WnC/vp6xXg47s02dgAwDwnXU/S8nMWLzKv8q
	3D0Q3cyZqsCtYSjrtSzTfrr8mTBYc8yAG5nrOHBOjJ3nhU7JCvaznJt8kxEh0uyyr9jBtschEUSN8
	rRSChRakUOqInlDhyCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrj-00000009ZJA-40ah;
	Wed, 25 Jun 2025 18:28:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQzl-00000008wX0-0NZg
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 14:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45B394A680;
	Wed, 25 Jun 2025 14:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BECA8C113CF;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=MUzSQxk+uv5LHDef99dQW3jjbO9uT/OkYjA1LD8vXs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oFfCTGzvb4Bl6w9ywnJZTx1aXzKR3gwgfv6u7wB07Es6QWTqfqW9cRH/1PgBL4SFk
	 bZQ+htWAiQr5A1sViXdUafNvAb0O+Sx76eUBxjKI8+HZ0UJ69fcm3tM+dsTpEV2D9H
	 e7vxu7gyunNTk5Oqn1Z12BoqJMKt0S/GlgO2wACq4mbjvm8S5M1NJPQ1q3nidVHXU8
	 M/bBj+6Bay1xKMFEI7vLhTNr4ViVwhkqYvTRoQilDRqmfjGtQ2T2zn5Y6aj6zu45r2
	 PX5BuYLc0XusREkesoIiBC9YvcE+drO5kpefQmSbYJHzUHWjtd6Ob8v6JKSyux2Enl
	 uYfg43FZ99/4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4976C7EE3A;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Wed, 25 Jun 2025 16:21:00 +0200
Subject: [PATCH v4 5/7] riscv: hwprobe: Document MIPS xmipsexectl vendor
 extension
MIME-Version: 1.0
Message-Id: <20250625-p8700-pause-v4-5-6c7dd7f85756@htecgroup.com>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
In-Reply-To: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861258; l=1433;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=ONKDrupJVIvTuOPl4HYtUjJG9+vS9PioyKkmG/eBvIA=;
 b=lB3maqHxBHGl1G03VPK/N0rQBhStz3QP5CAL+JiHBDDtytrfEuPLDlOiUTcZ54+Wunt80Dc/n
 VTN80isflIeA6/Zvx9uUZq8VhatdJ0LTU1vbFSaPLzkjJx/eqQBSufN
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072101_174368_B2CD30F3 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document support for MIPS vendor extensions using the key
"RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0" and xmipsexectl vendor extension
using the key "RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL".

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/arch/riscv/hwprobe.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5de1c15559a978a956bc36c34de81c..2f449c9b15bdd6b9813c9a968deca1a4c4ff9b14 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -327,6 +327,15 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
     not supported at all and will generate a misaligned address fault.
 
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0`: A bitmask containing the
+  mips vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * MIPS
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL`: The xmipsexectl vendor
+        extension is supported in the MIPS ISA extensions spec.
+
 * :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
   thead vendor extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
