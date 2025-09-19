Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1C1CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBD7LeH7e80yGp8wFfv+dGENeZ+GVqeKuEuPL7dD6/o=; b=3kQiub6DB8cXk7
	A3aa6nTTsppGmlWK7ryT6ig9WLJkGChlmusLKvXzFAq0yM/6AIdAeR6aZCqVAye275sLbSmG91wTb
	2s+N5DSPsWJOfPDQCYuIfIpeo0/QidCiCQLdV8He2BMY8Sl+gca49593Ju8VMcrHvufOAA4R4HIrq
	hFwIob/yQgb0EcmaTzQsIyoAOJA0AMbPAJv0veLJGXhmSqS7arhbYno41OpYYpq8LdNfFuzT8UJri
	tgEqQGvTLi6hQ9zh9CLmT9V7SZR0CkdIYphtfUsJ+PuJ+WzN+P4FBhHP+RcvKH3hh22caCzle0BOW
	6XPbllOxEZac/hPeCBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhH-000000025gg-2Lur;
	Fri, 19 Sep 2025 07:38:23 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhF-000000025fA-43fm
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:38:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-77ddfe29cccso882757b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267501; x=1758872301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrUXReFmfyicqjIKReJGDbVrjEBweEul9LJXTVHzmk4=;
        b=ew0cF0iaSHrmAaehXy0mC0MMtnlF73DT45RuzZdezDZr7I2GEVCwyIjcLiysEB52Gp
         kgnp1Nyt57ppF8E7KyYR20cATzxG1YN8BhtQxgv7BDRELOXAkLoqAWTgRgM8lg2hYKq3
         zOaJYe4ErCU8e32FioMVtm+IVLQhwyjY+nCpf3pK2+0JcrKC3IhOA7rpzo747TyrFTg4
         TXmgyYo/QNju/O8flZqWtXAdnWjVTMDMzX6eO+gbwbVv3IjaHYbjjksmRrv/XRhwrBBA
         vJj7BemuZ8fznSx3XVeBmFGK1x0kei2QzXSIjm4H4v8fvr8ohK/O4SJXS4QAEZ8plFe4
         Eghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267501; x=1758872301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrUXReFmfyicqjIKReJGDbVrjEBweEul9LJXTVHzmk4=;
        b=Mbi0hbWaJ9pWTaYpXL6kifC8y12wJ+B4w6YMqYKc7a3iMHlqNfg/toB1S0txcbbWur
         pHsUisfS0vmDrwDnVae94+OFWdHAqDEHivX8YoEfkZnS5pSJWoHMlYDsIDXHVdjP5g1b
         kzl/oLXJiXcyobNhJzepDs339pXzYabMRgl8VDC+YYXOkgm9Cw1r94gqUfYvNZQay/eN
         ZUQqcj3QqV3vTQyJPIs+0UT3Qkr9wHY3T2nLzHWgGbGdyXxNMHhMCphcdNsLLV/yzX4+
         PEUlxMFvPXppbPqEiiwUsy6X/TXBj3AytpCiTkRA8SYwnidGI9/GPGrb4uVsniWjOnY3
         Pexw==
X-Forwarded-Encrypted: i=1; AJvYcCXkqrrAOqeQe7+yynO8zt/Rsb2vEI141RABDcNIZvvdw52rLmqmUHhWUaougFzokVR9Njs1XjPQT7nLDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1IXkw+BZK8PbRhnlaOUd1wm8YePUbSO/pKbiTpqsbrq9yehcN
	d8qaBpSMgs+xKhVy3MAQ00FyFd8mhXTKyrFyS27PdGGOvLLS/PfMAU3Z9CldRnAu7ik=
X-Gm-Gg: ASbGnctX5cNWSjr99cs8paamvNIxQhS77K3+yDZ6x/18GJc2KXv1rMdvEViBAJGCF6x
	SM7j9Vr8dbWy1oQ29RzsDpvVLkR9ZT3qjNSHBn4XIO+BleHvt3pAd9AyJfVaQs0KZHhvsgah5oV
	9RWdx4bBVePN+07BVoXxtN7IH/gRq+1UGGripIOEQQqpDGaT9EmVT1+PokxDRMCGlX8/xbDtRPY
	ATkAw3lGk/lMaUFfrUy602TLzf0ZSjGJd4jbwE1oMIWhWsV6dugXzYBK1ksxrzpImKCfhyznZhX
	pXtdz5dIZ1muWM+COE5lU7jEOkauD7OFPF3lVHLbhy7brS2RQBBsQw9cdt6wxfwBVS58KSWRBKY
	YnbkAz7WSx18fKYxKRioBljCa60JXeTwwqFH3JvQylSLv9P4snY5M0zi43UTZrSjFiuJOdkZGc5
	mW8mjPSYshzaKjEfkHr/q6WTzV5BYsrbFR5wyy8VXV/g==
X-Google-Smtp-Source: AGHT+IHO/IBu5KluVEBZTCVVCP8FOuGD/BwTuyZsvB1MFOiJrJSLMwCJJx47GpnoAoobwSIeA0YuxQ==
X-Received: by 2002:a05:6a21:6d9c:b0:247:b1d9:774 with SMTP id adf61e73a8af0-292588a2f9bmr3836926637.5.1758267501051;
        Fri, 19 Sep 2025 00:38:21 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:20 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 5/8] riscv: Use Zalasr for smp_load_acquire/smp_store_release
Date: Fri, 19 Sep 2025 15:37:11 +0800
Message-ID: <20250919073714.83063-6-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003822_017194_461E6B25 
X-CRM114-Status: UNSURE (   8.77  )
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

Replace fence instructions with Zalasr instructions during
smp_load_acquire() and smp_store_release() operations.

|----------------------------------|
|    |     __smp_store_release     |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| rl |-----------------------------|
|    | s{b|h|w|d}.rl | fence rw, w |
|    |               | s{b|h|w|d}  |
|----------------------------------|
|    |    __smp_load_acquire       |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| aq |-----------------------------|
|    | l{b|h|w|d}.rl | l{b|h|w|d}  |
|    |               | fence r, rw |
|----------------------------------|

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 91 ++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index b8c5726d86acb..9eaf94a028096 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -51,19 +51,88 @@
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
+	typeof(p) __p = (p);							\
+	union { typeof(*p) __val; char __c[1]; } __u =				\
+		{ .__val = (__force typeof(*p)) (v) };				\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
+					 SB_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u8 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsh %0, 0(%1)\t\n",	\
+					 SH_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u16 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsw %0, 0(%1)\t\n",	\
+					 SW_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u32 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsd %0, 0(%1)\t\n",	\
+					 SD_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u64 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
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
+	union { typeof(*p) __val; char __c[1]; } __u;				\
+	typeof(p) __p = (p);							\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LB_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u8 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LH_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u16 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LW_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u32 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LD_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u64 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
+	__u.__val;								\
 })
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
