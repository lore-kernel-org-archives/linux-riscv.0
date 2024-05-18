Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41462C25B74
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDRnacdBsNlCdtZrfz9BZDmkn0bmLFx4Euh2aTKuR4w=; b=0zb61cyvDRSh8G
	l4ZjLOZ09wH5ycKYfPZqsbJAmhWWD6FX0Yy+7yRk9MU+wTlloAS9hFhRVnLVvbVpiMfFJc5LtplZ0
	3YJx+vGfiDY2wzpSLrEZvNCT8q1ShNeuyt1MdWT1NucI5Az5UL/CGTiIGabWlhLNEMBRMYL/ofZ2K
	yWA0mzNhci4OjuVogVJVG9UGYhOC7P5HgT7VWhMqUPJXMaGuYOcUk+aFQIPDZbQXjvLtkGAd6BgfJ
	IlIqOgejCeIFo2mhcq6YwntOFtCmMLCSVvSgXxFKz53pQn0HXP+MDzrkH38vqIMUVR2DL+0YHfYs+
	UrZy972/byiXPDjiKQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8MUG-0000000AM9l-2Oqa;
	Sat, 18 May 2024 16:00:44 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8MUC-0000000AM96-3k9q
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 16:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716048032; bh=r7ksz0jh/Cq1KNFdh3J0kduhB/g9x9RXKtULXiwHTl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kDBCzJo0MOpBQZ9MfmYXir/4+x3pkt1cl3R0DjpJTABBb+quUROObVVFE4ROEtCur
	 +a84XwiWL6M3p3fRAmtdmVUt4dnbhcT+TLx619JidnIngU6ab9+RLrHWT4RscsWrIT
	 kTP4tgaqQqr0Aa9KDX3XsP8WJa+khmr6hxLOy1+8=
Received: from cyy-pc.lan ([240e:379:227e:fc00:28c6:7f50:fe33:13fe])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 198A620; Sun, 19 May 2024 00:00:25 +0800
X-QQ-mid: xmsmtpt1716048029t4krshmay
Message-ID: <tencent_338DF690631BAE788C4CC858233E9FBAE006@qq.com>
X-QQ-XMAILINFO: N2/jAoEINgTT+556m0Y/CLzFdKzIbL/OjFBlzd6z8s5fsIaUFVkWc6r5qmIUu+
	 zpMdi0UeMYXHxTO0aYfG2QRCY8YFtSb7NzkuySsvlIszhXRqPKwm5m/2NpCnQ2E7F8TmjmvAqfSg
	 gwmuYWx1l9OT57W0DmfmKdOhihQ2Qh/sD2qY/rT0udvDKG+sBjGziIbzwIBd/G1kporVEK31Na7t
	 B0l7Dgk2beuq9QOUcpb3Bm0HPBolFdgEhi9o+rdmgnz6328hg0PMX+dobqW73lfeheYxZfK66/Cd
	 EINUjrsZ8nNZ4c8PF5mA6BcYyJzdcrzzgXVbk1n67/ARSwVLOBAkFR4dD7uA/Q2wuvAncBYUiWKP
	 eYde063DabJueVH0aOvqBLHNR1FoPZQh30cadownYEkq01NYmOA/bTAqjmcfXPYGcJVKr+p42loI
	 VmWHzJFBjaa16fXvjnpDz4rQSPY42MZoqP4N/WSTl9ZAT3bJN/URtg/h1UQkWFcfJYydFkPNjPn7
	 /QX5WUPQb/RSeNQrJ2OndyKzPkDtCtYEJs8h3eWh9CpK12V+gvRwYU+Rtfhf/Intm4lCgUyZUQNK
	 gCI7pXjWnsqU4RtbP9nT/EHipIEB89IHnmFQlM1p3VXEc2vheoWCbpb4L3EDMtrB0Q894hL248kX
	 lZRIb589q9BbIIzk1GSe4JV6gBUbQbx/rgactGGVkxvy6fan3UKIA/e7aX3OD0nmBn+JT2X22Ntn
	 3zdh7VoUDohVk5wttDuqwZH/dakM0dI0aILF6bJCH8toYnbBR8cH+JMlCitBLXMIDrteb8+QEMP8
	 2p253mJGZzEZfuzORYk/dlZ26qjafpnZTQuYc7MRBxHwBMXsU/v+RGhElaM2c40Z4uJYOltplBIP
	 q4rgSRz1r45NM2E/kAKHeLgaR8ACl1H7vQHERTlY5zKfmmSf11LggeoAuj16lpAfu49akqOdvKn4
	 eA9LLhfT0Z/pwqqoj22V4ALk3TucITY/7S9iS6kFJtFs/i+FK0C800T55sspIi
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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
Subject: [PATCH 2/2] docs: riscv: hwprobe: Clarify misaligned keys are values not bitmasks
Date: Sun, 19 May 2024 00:00:12 +0800
X-OQ-MSGID: <20240518160012.892135-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com>
References: <tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_090041_390040_A13B80F7 
X-CRM114-Status: GOOD (  11.94  )
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
index 239be63f5089..4abfa3f9fe44 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,25 +188,30 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
