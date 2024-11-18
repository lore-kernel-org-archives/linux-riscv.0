Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F73D60CFC
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 23:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBUrMERK4IerC+944gzQ3TjVte9GTkCHfPQYExe32g8=; b=b+3dVmyMx5DI6S
	ZInIV58u1rlw3SE0487tWueO9yxnQF4psG6tp2UDpedwHUqU9MzJ6MD4TcK4VBmhaC6atyMrt+OV6
	+OTAcAu32XjRq60AYkHxnjno9BVC8uzQM5yr7ramjrO8k3Wyw0MURbE7jFITw/wvrQS378JISdQOn
	RAt5AQJOw8sUPlqHjfdLdFTKKYVT+tky9BkvOd9+eMVbZQjzINWYyhe9auoaRKilpVaYxWQ6ah3gZ
	Hw6tDSniyY+fCltiEsHfLj729BRB3R9MqpUus9aCGICTsPhTG8rRCx2wjQVfR9CTz2nh4kWbFtdcl
	rYCU2gkLSCak5UUycoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkf-0000000AoKd-33sU;
	Mon, 18 Nov 2024 23:01:49 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkL-0000000AoEa-3fwf
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 23:01:32 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a775b207b4so2576525ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 15:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1731970889; x=1732575689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFqjIC8plnN7ShAhD1wilwVRTqQH/DMgtflcfXOVYkY=;
        b=MtTg7WVT8w8wFQu9Ef74vo2KDuj1zh51xj3u1UGaCGLDKUIKo/teU6K/8B2DSsUGE5
         afdWSZTy4WNSyDswsULAgEtwAnO7p9ixaJPN14NcjJhNUe15X3WO1VDoMZAlIUAfoHD1
         zLb6tceU+H+1bsw+PUiVjF+L+VMR5ztLldaqRVSnlvCzm3DBuicQ+AgLvRRZEEqpVZtm
         XvSLOzxQCQVfAK+fZMNLTP4UKD2HkuGs0JvLbFIVhxa5FaT2YjEpTOMd3/Ous0b4iFSR
         2wvRokzr0H1nw9vYOyN3sUmLgUm6HrUNpBZ+OXVIsaS2+VJtMkBOcJTdLZKZEDjEDTDB
         ILNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970889; x=1732575689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFqjIC8plnN7ShAhD1wilwVRTqQH/DMgtflcfXOVYkY=;
        b=wegKlGgLwH1wRK/1meVoP+E43AEet6RnNxBHBxOPdLu6yJFR9p2j9urA4cqbvCPtYu
         nGPvWBy5xXAr5LdKswIld4b/vIOUki4SsVGDeBgv1C9aMNto98NhXYVkCAlDk8HEUDjX
         rp3jFtAplM1TkSzMsRSWCQrjm+Y4Lfg9EgurMOvI0tGzy+9TiDtp3DylimmT+yFyq/+5
         QCTRXgdJL+QWU4LjO2+J0E5xwfjfe9s85BMWXala9qUUkBgRmsccuOhfMEaicojed+/L
         thJkGDteS10jHn7wkpZb1goiE04PJIYKBdzyPMngzCwpb3EP5o7BwHOeeleLzEpfJTFo
         rYOg==
X-Gm-Message-State: AOJu0YzLdff/iXZb2MIX3JHREEpeqHneWTF40PlQdEpv1d3JXVUaTdE+
	RpNoAVYXbcpBz2WKFmvVHXnD3cBxASkHkdnCujmRahDuSOVHt5W5oDDMN7gSfg==
X-Google-Smtp-Source: AGHT+IFvCHXxvHQVpV+bK5VdC3xSTjSvs5zHAHvFSeEEYYdE9811W5YkCAlHdEbeZSHxbdsnrW17KA==
X-Received: by 2002:a05:6e02:1949:b0:3a0:5642:c78 with SMTP id e9e14a558f8ab-3a748082c35mr142193715ab.15.1731970888729;
        Mon, 18 Nov 2024 15:01:28 -0800 (PST)
Received: from aus-ird.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b37a897eebsm35344185a.94.2024.11.18.15.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 15:01:27 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v2 1/4] riscv: implement user_access_begin and families
Date: Mon, 18 Nov 2024 23:01:09 +0000
Message-Id: <20241118230112.2872978-2-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_150130_157210_877899F5 
X-CRM114-Status: GOOD (  14.80  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Currently, when a function like strncpy_from_user() is called,
the userspace access protection is disabled and enabled
for every word read.

By implementing user_access_begin and families, the protection
is disabled at the beginning of the copy and enabled at the end.

The __inttype macro is borrowed from x86 implementation.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 72ec1d9bd3f3..09d4ca37522c 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -28,6 +28,19 @@
 #define __disable_user_access()							\
 	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
 
+/*
+ * This is the smallest unsigned integer type that can fit a value
+ * (up to 'long long')
+ */
+#define __inttype(x) __typeof__(		\
+	__typefits(x,char,			\
+	  __typefits(x,short,			\
+	    __typefits(x,int,			\
+	      __typefits(x,long,0ULL)))))
+
+#define __typefits(x,type,not) \
+	__builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
+
 /*
  * The exception table consists of pairs of addresses: the first is the
  * address of an instruction that is allowed to fault, and the second is
@@ -335,6 +348,56 @@ do {									\
 		goto err_label;						\
 } while (0)
 
+static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
+{
+	if (unlikely(!access_ok(ptr,len)))
+		return 0;
+	__enable_user_access();
+	return 1;
+}
+#define user_access_begin(a,b)	user_access_begin(a,b)
+#define user_access_end()	__disable_user_access();
+
+static inline unsigned long user_access_save(void) { return 0UL; }
+static inline void user_access_restore(unsigned long enabled) { }
+
+#define unsafe_put_user(x, ptr, label)	do {				\
+	long __kr_err = 0;						\
+	__put_user_nocheck(x, (ptr), __kr_err);				\
+	if (__kr_err) goto label;					\
+} while (0)
+
+#define unsafe_get_user(x, ptr, label)	do {				\
+	long __kr_err = 0;						\
+	__inttype(*(ptr)) __gu_val;					\
+	__get_user_nocheck(__gu_val, (ptr), __kr_err);			\
+	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
+	if (__kr_err) goto label;					\
+} while (0)
+
+/*
+ * We want the unsafe accessors to always be inlined and use
+ * the error labels - thus the macro games.
+ */
+#define unsafe_copy_loop(dst, src, len, type, label)				\
+	while (len >= sizeof(type)) {						\
+		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
+		dst += sizeof(type);						\
+		src += sizeof(type);						\
+		len -= sizeof(type);						\
+	}
+
+#define unsafe_copy_to_user(_dst,_src,_len,label)			\
+do {									\
+	char __user *__ucu_dst = (_dst);				\
+	const char *__ucu_src = (_src);					\
+	size_t __ucu_len = (_len);					\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
+} while (0)
+
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
 #endif /* CONFIG_MMU */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
