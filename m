Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818C4C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 03:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnLAJfgLxiGazYHL4lk76QcQxHZPE+5273QFMT3YDdk=; b=p/EmRal5dKiB/Y
	zj6LnFun6o5XLVEyxdLQk8FbZ73841u6PdpMgsgHmNsx7CfkDRE0IOemQG/ppPXgejTUd7kNdtT4S
	dQvZR5eslDFi2V4AEwkXwxt8yjK+c7OH6DKYyjGItgsX2KiTqIimteLmAT5uTYJqQjEwW9uoDAiL8
	dpkUq94jeX50zjYMXX3FQSI2ftxvCm+T+2LoXPt/zPpB+ROHSK6zn4MqIR/xC+aIM0Qfij+hTOfsS
	gF6IX/eS6t1kc/97tX0lYo3ln0goKDwwzdsm3Vf+iIHfn4oQzYFLs+Ww1Hwcq02KoyuWNiFnBhJBj
	mnVHOVdZ9MGW1wkDkorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALja-00000007wGl-10FI;
	Fri, 24 May 2024 03:36:46 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sALjW-00000007wDe-2lFe
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 03:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716521799; bh=F+wpGwccmcn6o4Ew+LaZ6dWwIWr+GXbaYvvVaDRhjFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nLgSHJ8zUsnI27wgIYDDZs0bv7kHXNb+QoPT3FbmiMinGB5hgJwS+wVTPE8qO1FMQ
	 74npXRlGobJDzn6tI9HzbiEZSqw8RGogTaADjzEu3pvOK5duzvsKYkDw7NcPECtQm/
	 HG4Vr0NKXBz0Y4QVd2roml16QufsKMr8Tnh+oJFY=
Received: from cyy-pc.lan ([240e:379:2259:4c00:b652:79f2:d4c3:c8a8])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 90C8A481; Fri, 24 May 2024 11:36:12 +0800
X-QQ-mid: xmsmtpt1716521776t16vwkpjg
Message-ID: <tencent_AC4A216B8D1B7C7882DCDA648E1AB8653108@qq.com>
X-QQ-XMAILINFO: OaubouGXmhNz1eavt//OG67W7xDtIvYLLMONKHsz6+IiIO4dHYHDqnoCwbCZPI
	 okSz/bJukyevJNvtVzbzOHiS4nNIrtxS2Mykj2dg3/lyLU2ewATOcco0IQfceysIqiHu2TgvyqRY
	 KYLbWGMEViuFuoEWrtK5j3BQuhmkLddFxnQf0uZltF1B60xGsHFadstuybh25U9iiIEZHViFhcHh
	 pAHu/MWf0HQtdHHi/bN5mN27ij/fpMFEZYSkSfcHtyXgsVVIqriH3bZVOQzsojADprZOZfODKdyT
	 7co0MBhPGrFOqjhC7bV7ZPEyClJ6Oul2ZZANoFkRnGBxrDch7bGMBuAv+ADCXXBV5LOz7pvUQsXp
	 68YMle8uV54DAGsNxVHkiy3Qyp9oW4xbb67UoUmyknFtZdIyj0F5DpspU3d3srI2VY822KSSWuAf
	 sp2+3Sobn82hAgA/1t6G/MLhGnLY7jPfv7Q3Aw+l+Njxihx+1TAY4/gfVfbQvBwFPNV43Eem2/Gc
	 AZts+FNdAVyXvd8pJkq3z8y6ryOhWNxwXAi208W9yajlH19Pdj8TP157qO3ENqK77ZGjtRdwNmdy
	 +sPlQ7/YTG1AxFnJgYhEbTzq6YJNHJEJf9rk8wxaFpkCGSelyHAAWiKxG8zjtY4Bsc6xaOeJtAMy
	 Qz/7kdaLTARX9cSdHHOBkAEo3HMfQ3egdlTedPGISdKK4pLj+5hiBsvF9L4zVclYfkAa2YxJNIdB
	 316KlTSM0ux9K0ekDqQ/ibn1bY7J+PzMhhwfZMQ/eeiyv7SMFBJZ6UfY25VUi8hrmiwJd3zR7nZE
	 0k/lmSO2CBSEe1MTsRtuu/ES992Z132BrJgF0Z0BSubE0/O5c13IUoFnDfBsX+NhKjASroCKz99S
	 5AZXp6QjjrF/Zo4m83h44XwDdtKbAfv4qD5fuHhA4uoL49YZFlV7zKOAifscEQyKCuRGfEgc1aF4
	 fy7Crj7XYEnMMMJRu4+pK+9cFJveWciofCv50c+3Y0x+FXJSMBNytOci7IMbF1OqCvAXaLq0UmiB
	 B7tCvrnrH33xVv6szV
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
Subject: [PATCH v2 2/3] docs: riscv: hwprobe: Clarify misaligned keys are values not bitmasks
Date: Fri, 24 May 2024 11:35:58 +0800
X-OQ-MSGID: <20240524033559.298935-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com>
References: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_203643_046433_B58258A0 
X-CRM114-Status: GOOD (  11.74  )
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

The original documentation says hwprobe keys are bitmasks, but actually,
they are values. This patch clarifies this to avoid confusion.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/arch/riscv/hwprobe.rst | 31 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d720712e9734..2e212956185d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -192,25 +192,30 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        d8ab5c78c207 ("Zihintpause is ratified").
 
-* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A value that contains performance
   information about the selected set of processors.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
-    scalar accesses is unknown.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_MASK`: The bitmask of the misaligned
+    access performance field in the value of key `RISCV_HWPROBE_KEY_CPUPERF_0`.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned scalar accesses are
-    emulated via software, either in or below the kernel.  These accesses are
-    always extremely slow.
+    The following values (not bitmasks) in this field are defined:
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned scalar accesses are
-    slower than equivalent byte accesses.  Misaligned accesses may be supported
-    directly in hardware, or trapped and emulated by software.
+    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
+      scalar accesses is unknown.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned scalar accesses are
-    faster than equivalent byte accesses.
+    * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned scalar accesses are
+      emulated via software, either in or below the kernel.  These accesses are
+      always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned scalar accesses
-    are not supported at all and will generate a misaligned address fault.
+    * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned scalar accesses are
+      slower than equivalent byte accesses.  Misaligned accesses may be supported
+      directly in hardware, or trapped and emulated by software.
+
+    * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned scalar accesses are
+      faster than equivalent byte accesses.
+
+    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned scalar accesses
+      are not supported at all and will generate a misaligned address fault.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
