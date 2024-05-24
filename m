Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98DEC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 03:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAPCv9DJSj2cRQE4u9MI9FL5V0M/dRGkPRbPOpSpEg0=; b=kqFx4D9S0eASkQ
	uYic7PJfDXFjaaZGcdUPtWdrRaWCcovOdKocaRghDdIU4HRdzoLoT4ZjNZFVOoV5NioDQYcNyZMQ2
	jJBY8Bqa7iGzvEKnV9iHauQ9FbCsjDrp15qVBG8vdKiwkTPRBwui33xHq/uJ435Ab8Zgkk0/6+YFs
	vWC95cdffk3wa55pemKnbJkD4cgAv8syhsfVj3wZOad5w/M6XbDd6Dj3Y7rt/rR+Dm+QawgPeUEwf
	RBpah0MdRLEpMHhShjayLtSJC+aaYSS3J4mGVNM1rokjfImwS8+lTPVBF8rZdf3F+ZLUf8Ntauh2Q
	lsjwTC2N3VNMx1mEjLyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALjF-00000007w8c-2IN1;
	Fri, 24 May 2024 03:36:25 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALjC-00000007w7o-2fib
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 03:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716521776; bh=PHefl7GbkUI/lnsq5076BDrmwcyZfLe5+uejDUD7Q1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FIjiSVY2r0wC6UZ+6OArZ1wa9qUpIUtypswrpIvmHLJRELphJXGI+KRrlq7ANmTZI
	 nbLfvqPfplqGd6cgR9lTDESppzCHjVFRKFL+PhSIPuV04NUctb1cHwWIG87PCQkTxU
	 +ktn4eeJc1y3vlTR89LCQu/1RsDi9cicntBi/vsk=
Received: from cyy-pc.lan ([240e:379:2259:4c00:b652:79f2:d4c3:c8a8])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 90C8A481; Fri, 24 May 2024 11:36:12 +0800
X-QQ-mid: xmsmtpt1716521772tub1unh7p
Message-ID: <tencent_8BC6BC8798373AF1AD09AE68D338FEE0620A@qq.com>
X-QQ-XMAILINFO: Nci1v0XuD9lFXEbgY5GllxLw4rKsvUSbqDMc2mN0rRE83G6Nz7ghR24HOvk8O1
	 9n5OW8MBMqMNo8ZqA6ZbaM4S/5iTYpUgqFTRu4Ks4Kngl2yEpUa4ZuKZ5988ygxdsitfnHP0kcEL
	 jBQhSC2/lGR4jNyQVTUV/XM72Uv+oT1xsAyvoVHLOXekt0dDEwROZOun7S0RFJCH/nfDyAUgJSVm
	 GRVVPUAIYIK0pGu5a6ov0pAJvNXki9km5euByYAYmtWG4HdGknAUl5nT5JJo4XkWyvrquukdOkqd
	 3VF0g4ZMVV2/ZrgxamHFP6bqVpEN5cn5Hnn3xXMwqYygz/t3Ih+Gloom264HlUjm1h1YpAiYtlUB
	 b9Rq9ZwCdqAEW8cyrVsCmvk8uwOffL0/FlYYmy7LN9sn6qMTyGQsr4jSZKekTSMOoNE+Vwj9AeF2
	 R/Co7YrAA4JEqqU8hktFoqleMAZOu7BQOAefZwKpu8E7JjJ0WBuotrGa/k04weGdELynKlxdltTN
	 xPOWQgG0JfbE/Bqos2J4q4f6hWHcQ5p8GfEYU8CQVbtjGS2L9Jeuvn/ESB6mYM60mggCqqmxNLjn
	 tM1qWT1HxLk8ARvUoz1DhhJQnoCUQoBQeuKPToWI/cDGs4NebFKp55dvmzOIznxibQdPGMPuXAez
	 Dxw/+0IEWFBre/yJzzAo5gc0zyzBPzSCyjSzYNajC4pd7EHdhUYAWtEaH1bguKCHSZRv1j4k9Djn
	 8VbBNTJ9jR8umPGLOanNptzhPvsQLz3vVChYuDSBQqm0PTci4DxbUr8F9evgWKxJQuL4WXp+RqUA
	 rhnkZ2H2/fAahHyntHJ6vJuIq0g213USKj7oF6gS3821OEuDzMQ4QYf7zsdR/l4bSF2yYBn3jJ8T
	 00N+lKHRS21z8Yfou9hbXM2PLfbbCfY14J+Mew9GX23cTQkLppSqEZuYUbR8ccw8OndKdMa+3LOS
	 GP5rGo6wsSvI6kyd/Q2A6AWrdZxmuu4vgngSvQfX5HgG3vVHKNiJ0XWO3m911JtMlKOzluSJ24n/
	 LEcTjDgg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Elliott Hughes <enh@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 1/3] docs: riscv: Clarify risc-v hwprobe RISCV_HWPROBE_MISALIGNED_* docs.
Date: Fri, 24 May 2024 11:35:57 +0800
X-OQ-MSGID: <20240524033559.298935-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com>
References: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_203623_040204_1C9BCC06 
X-CRM114-Status: GOOD (  10.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: enh <enh@google.com>

These only tell you about scalar accesses, not vector accesses.

Signed-off-by: Elliott Hughes <enh@google.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/arch/riscv/hwprobe.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 204cd4433af5..d720712e9734 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -196,21 +196,21 @@ The following keys are defined:
   information about the selected set of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
-    accesses is unknown.
+    scalar accesses is unknown.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned scalar accesses are
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
-    than equivalent byte accesses.  Misaligned accesses may be supported
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned scalar accesses are
+    slower than equivalent byte accesses.  Misaligned accesses may be supported
     directly in hardware, or trapped and emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
-    than equivalent byte accesses.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned scalar accesses are
+    faster than equivalent byte accesses.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
-    not supported at all and will generate a misaligned address fault.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned scalar accesses
+    are not supported at all and will generate a misaligned address fault.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
