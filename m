Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC2BCA0EFA
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1f71ftdVKhum7jM54lCXCcG9rs0o2TvvlTSu8ZsDrA=; b=h2VshGJAGzOOsZ
	+v0egJIWzJ5dCqsGdo3wU1vTgzPKHj8iHRfBPaJke9/CozLXyXn3RURbzbhZGSYTHtvEEE1l3Fbrq
	kIsuojWRad4+JKozVtN4aQ+3ojgC9eYIj04ezXLVWfmCTPRtFg/5dGhhpv3tto/RH9HZieCRYFO5d
	mzZMfnSERz12qqyC5taajl5d8hs3s4J/2EToFGVMpghm2j2VnIBC8X3Dbdi9eutfOTRUh1e06WgFF
	PKocPGSlBUCzoBxh7mUngafb/IjpHOdf25qJ+AGiCx3xbP15c1L3Oh17StNO8/uIxxOJyKDpTxTMn
	x+oT7LLP11pWCjRlbJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvBv-0000000CNIi-2EWE;
	Tue, 26 Aug 2025 15:02:31 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv7f-0000000CM1p-2UqN
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 14:58:08 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-771f69fd6feso1333465b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756220287; x=1756825087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsWJ8LfQ5pRsnjiKNBF8VnH1ORJpnctEr1VaNmcMPZo=;
        b=RzPU6pOkFhmojc7hVn1FdwSzloO9FXWvr0qiZEpfXx6z7VDGw5B4H41iFYaX4kHn5O
         BUkgJg/xFshBRUsgMXfdUKj0cCoVW8ygtgMl4K463Af/vpqLz4PVI22X5EKCsJQOBRJs
         cqxe1iSWOg4OzFJiZ/hjZuUwnxAO3mN+isqwRa89OfyF0QoNwvkhSdPWESoDo/mnDiKX
         mwoqeqKLBG04eBtiswt7r5891a6foQL61DNIm9TkiswOv8bi3koE0NbpWrc0u22wklq5
         xKetAzmjF457V/SINTNRPggufs1KB2rc301Did1vhQ8ii29JKNMzUE/2EyH8SUAMtUQG
         LfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756220287; x=1756825087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsWJ8LfQ5pRsnjiKNBF8VnH1ORJpnctEr1VaNmcMPZo=;
        b=RWiQKvQDxZ4g7dC/4zX6vTbbOVPpDfMeAMRf0T22kHsnQiFnruyABh8N09JoqfZ0vP
         IhrgNQDOLSwStXiib16wb0tLvYDh4IhAfjNUSfFIWAlaC+oldFDXKUsUGTtIUrSBiNd5
         PQBD2iCyAfJYFm780s5c6oP0y23HJB0DW0C0isV3C5QgwyPRc6XtiEKaqpstS3ArdFFC
         6rk5XK7I6c2rcOB0TUZX7yHBTmIzUbq8jkfbmZ62W5JAASPaZCrKeGjghcIyvbk8NMa0
         /MHOUuxuPs5cUurxSn768YxWw7lkYklbQBLc8L/OleEyex/QaUjVDbQ0C7Ly4O6wbVxp
         D0sQ==
X-Gm-Message-State: AOJu0YyLLphEfloJBOC8ZmklS3eMYbQjZ/NT9I86f3k2LHF6d9PHmzgz
	eK5YygCAup22D4AMM7vLn3zFbVoxmsGQVfB63JP9htHuMHW856wwauHd3/gm7Ir4opvqWT32cJV
	5CuB74tw=
X-Gm-Gg: ASbGncubUqa3UGTZ/LkxIBD0noQ8Vu19dZZyONR3EJ+VqU9Kfd9BnP5SKY7yupbpLAy
	TdAU7o6x5IAIM0OcwpOusEWNEDebYhxGLUfpm7wBINipvhgYF/s5x8NfL/OoPj9hf/Sf5GUhX4d
	MM8OPuX7g+qbgd3bta1fqMajbgdOo3jwb61ww2un2X6LDUFO+ZNWKqst4UAzfYtlREUWg95bFBe
	eoH8lBqLaHWhWRXcdcRblKWORatco+ioKP0N4UtADf68Jtxc2KsMfQKXEXwvY1kGazqxuq0Fv02
	rKq4va83IFdUEFc80+RoB9OBHCmUgRtG5rReeWhnO5KvHJYJiYc/KORCbZWjKpbIITkB+xrxOOh
	ut5NLnQoNTnoQv5LVvkx/QdHn5grgE/RFWljIWi3/a9/xLRcaDtHIWXvkRd+SV9Q74jhzRnXTbw
	UR9UaWgZ0axhB0jnO/vEtWgT7+WmDNOBSL7/+vIv0ls3h29erPji0BAQ==
X-Google-Smtp-Source: AGHT+IGce0JQH+7jy1z8rLOiE3hj/ODdqdM5pZya1dvpwjYNjHu/6OJ1qk93cuk+FgxpNT18X9J8HQ==
X-Received: by 2002:a05:6a00:852:b0:771:eec7:a725 with SMTP id d2e1a72fcca58-771eec7eb56mr6685172b3a.8.1756220286726;
        Tue, 26 Aug 2025 07:58:06 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77059928c5asm7209799b3a.1.2025.08.26.07.58.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 Aug 2025 07:58:06 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH 4/4] riscv: Use Zalasr for smp_load_acquire/smp_store_release
Date: Tue, 26 Aug 2025 22:57:40 +0800
Message-Id: <20250826145740.92276-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250826145740.92276-1-luxu.kernel@bytedance.com>
References: <20250826145740.92276-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_075807_632772_E741456D 
X-CRM114-Status: UNSURE (   7.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Replace fence instructions with Zalasr instructions during acquire or
release operations.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 79 +++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index b8c5726d86acb..b1d2a9a85256d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -51,19 +51,76 @@
  */
 #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
 
-#define __smp_store_release(p, v)					\
-do {									\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw, w);						\
-	WRITE_ONCE(*p, v);						\
+extern void __bad_size_call_parameter(void);
+
+#define __smp_store_release(p, v)						\
+do {										\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
+					 SB_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsh %0, 0(%1)\t\n",	\
+					 SH_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsw %0, 0(%1)\t\n",	\
+					 SW_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsd %0, 0(%1)\t\n",	\
+					 SD_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
 } while (0)
 
-#define __smp_load_acquire(p)						\
-({									\
-	typeof(*p) ___p1 = READ_ONCE(*p);				\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r, rw);						\
-	___p1;								\
+#define __smp_load_acquire(p)							\
+({										\
+	TYPEOF_UNQUAL(*p) val;							\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LB_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LH_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LW_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LD_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
+	val;									\
 })
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
