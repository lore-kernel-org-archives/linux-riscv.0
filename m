Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44F8C83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HGfSZtiskBaYwkNjgQtWcCFDa/7pxkPlcniI+A3FCU=; b=u5w0lOQZcdVzNG
	tDtmL901LAmDlK6WZ7UzzURkSKls+2fCxnPxLhMsBuuZ7M/Rt5DGCCBbGDl2n+PuQlzxGZZcawvQB
	aFdiNgeBRfQq8dmauwpmAue7MXCPyPLtWkTyl5U/ZYxFrc9uXkDUcOCwb6lSp2RaUTUiydzAX0j2C
	9R7Vus1ZD6E+vSB58+060onHWghYFbmOSbMa648Bp4soltBJzLA/GaUH8umIxK6p39cAQMIv9aaSz
	QRBdYhIyfM6UWyUwB7ruWDfGlJxc7ST8eNRBUnTPmLCp6aU563MpgyLFS9P1xlsSDz0n6Dfs34goC
	NW48uzo/WHwZbWfJuh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezVU-0000000869N-1dQ2;
	Thu, 24 Jul 2025 17:13:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexnD-00000007pqR-2zL2
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 15:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 323415C67D0;
	Thu, 24 Jul 2025 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79BA7C113CF;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753370614;
	bh=+G9z575vTobmVUjKbLCcfdy8/4xi8CShYXQ+DuPWIUw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aIWdVFnTYsrCx+rrS4quwpf1AtTXC2GwkDyT9R+Yeh6yvXtFESCLvOkXHsiOjjDz7
	 mrFuoysv5A4QS0GHY5ORaD+yyB2rnZ43VObUZt85/gCoMScrlTDulUXKnjRKGiAhdA
	 jSfTYUlfvloywELYhn3tsDFSl0r8sXKw82DPx/hYK5ZfuvJfKv2ChcjsCVRtFyha+B
	 vvJPScpRzUEWXV/KJzQ62xIvvkTjEfpbXlEOba3rDd3f2bPQ+8cJk6fc2vcUWu2OVA
	 Ew9TZTjSg2YuBt3B3x9dVY2yDxuVVi8FLt/+DbJqaNjEqP9Ab3VZcf39YfiTFc1p8s
	 KxFKvQ1cR6iQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705FAC87FC5;
	Thu, 24 Jul 2025 15:23:34 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Thu, 24 Jul 2025 17:23:29 +0200
Subject: [PATCH v5 5/7] riscv: hwprobe: Document MIPS xmipsexectl vendor
 extension
MIME-Version: 1.0
Message-Id: <20250724-p8700-pause-v5-5-a6cbbe1c3412@htecgroup.com>
References: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
In-Reply-To: <20250724-p8700-pause-v5-0-a6cbbe1c3412@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753370612; l=1488;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=+gPZ/fNoQiSSWPCUqLgBumEM1NqDdXrfNQZR7V7bk6c=;
 b=0ws0HFUQbx/6OicMmxR4Fty6PTdRa5VPTDzN+7p1L2+GXfXmDi0Cglc+Jz2IZhzthF5KpPaYr
 V7ZHPYn1xI0BJSotFQJm8XlvfzYKVQ6AJQ96cK8EJk1zAMVm1SCIj2Q
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_082335_849472_30104E03 
X-CRM114-Status: UNSURE (   8.20  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
