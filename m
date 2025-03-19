Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1947C36000
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQTD/hD1pk/SSfAjm5nfvpQWTByDOBcaK3+PwGKITbk=; b=NwtPJTHbsuYsol
	e/bkP5md+4wFuToIm/v/0o5buTGAyMIYsip1TBa/VwJJ/PqUXlsMZuSxcoP6XhZVwntdU9GifuOmu
	u9pnJCIkSdrKjZcub9uGu/9bLcQA1wvF58d9WsMkZKl4oyXUMplUTCealLqKwhsnzjffyaw4SMEhp
	jbxvtVJ6VHMwor18IjmJAwpbW1z3YXhJehm3+h+DDaKQunu+YeISQiWtku6ux/BjmGgRiK+nQHqlV
	MCVch+xC4sEw5nCNjrm5QFbgc9V8Lm450EWvTmBdpXMnxnI35vnD9/Kl4tVjBGCP+DasFpSVZuzOd
	jCFG+V+S88iSa4eA5JvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0g4-0000000A7Gz-03OY;
	Wed, 19 Mar 2025 21:10:16 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0fz-0000000A7EN-0r4V
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 21:10:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742418607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jx30pxg9oOR6nK0KXgwwQMSrayULAmeIQrbjbt6XfpE=;
	b=WUSESR84P9kXilOMPoz9WGZPL3LVKKSCtXgxCzs709k1SWHPtoaIBS6AAv0I4t7RbaEu8I
	M1T12YcpmrgvOP3JgqGhmGs3cxntNrUFDdVIo7HA2JdKZDrBKNPpq8fIAJAmf3afe8217y
	eUoBGdpwf22W65enMsP0Ew9PYzh7F9XaEIQxrI0XkAv9/07AMmJSIlPw6H5rBQ4vygbRLq
	mA2DJAFb+AU+Id1LLePuLWOMUABaDz0hJisf1uBO9339WvsXL6Yhxm3M0MP9XXkxAib520
	GePaM1eVtP50vVAYrjjkF15ozB5vc6xyV2iXujWgMeTVlTZNiZSg8tGEtTe3gw==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Wed, 19 Mar 2025 22:09:45 +0100
Subject: [PATCH v2 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
MIME-Version: 1.0
Message-Id: <20250319-riscv-swab-v2-1-d53b6d6ab915@iencinas.com>
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
In-Reply-To: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 linux-arch@vger.kernel.org, Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_141011_536264_B3F9BAE0 
X-CRM114-Status: GOOD (  10.06  )
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

Move the default byteswap implementation into asm-generic so that it can
be included from arch code.

This is required by RISC-V in order to have a fallback implementation
without duplicating it.

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
 include/uapi/asm-generic/swab.h | 32 ++++++++++++++++++++++++++++++++
 include/uapi/linux/swab.h       | 33 +--------------------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/include/uapi/asm-generic/swab.h b/include/uapi/asm-generic/swab.h
index f2da4e4fd4d129c43f904c5f1b6234036b57cc77..43d83df007a6fbfb0011452e12e71f429425cad5 100644
--- a/include/uapi/asm-generic/swab.h
+++ b/include/uapi/asm-generic/swab.h
@@ -16,4 +16,36 @@
 #endif
 #endif
 
+/*
+ * casts are necessary for constants, because we never know how for sure
+ * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
+ */
+#define ___constant_swab16(x) ((__u16)(				\
+	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
+	(((__u16)(x) & (__u16)0xff00U) >> 8)))
+
+#define ___constant_swab32(x) ((__u32)(				\
+	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
+	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
+	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
+	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
+
+#define ___constant_swab64(x) ((__u64)(				\
+	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
+	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
+	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
+	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
+	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
+	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
+	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
+	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
+
+#define ___constant_swahw32(x) ((__u32)(			\
+	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
+	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
+
+#define ___constant_swahb32(x) ((__u32)(			\
+	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
+	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
+
 #endif /* _ASM_GENERIC_SWAB_H */
diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index 01717181339eb0fb5128668ca13f38205c03fa28..ca808c492996f810ce417ce9701306070873847b 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -6,38 +6,7 @@
 #include <linux/stddef.h>
 #include <asm/bitsperlong.h>
 #include <asm/swab.h>
-
-/*
- * casts are necessary for constants, because we never know how for sure
- * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
- */
-#define ___constant_swab16(x) ((__u16)(				\
-	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
-	(((__u16)(x) & (__u16)0xff00U) >> 8)))
-
-#define ___constant_swab32(x) ((__u32)(				\
-	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
-	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
-	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
-	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
-
-#define ___constant_swab64(x) ((__u64)(				\
-	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
-	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
-	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
-	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
-	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
-	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
-	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
-	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
-
-#define ___constant_swahw32(x) ((__u32)(			\
-	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
-	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
-
-#define ___constant_swahb32(x) ((__u32)(			\
-	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
-	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
+#include <asm-generic/swab.h>
 
 /*
  * Implement the following as inlines, but define the interface using

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
