Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE139CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LfMYgM22HnGCv5e2D3vOfF8et1SYDfoEcIAQ/OJ/Vio=; b=bViuM5Ec2B9v1L
	PX8GMr62Bnw1BdlkLEK6vr7+D/uxdjHsSlu107AQ7R0I44D3+LBJEm3WZOk7M3NVJxgDqkwcUnzlT
	B4m+L2cMU5hSHd2+RgDYVNHjtzE9W0i2hOIHxN2m5PYRg/VaUi+oi7c+oE10IrmlcevLwUX+1bgF4
	AG6L3wJdS24gl7sm1keq9HMjjqUfwGKuIe01ELi8+lAEwWKO5TtnkSmSzSLXucCHsAuOk794MMzr+
	dXsCCzNKHHWAnUciO1kRvrQXc7jj9Up6plNH+ZTXk3vykj4kyKa9jhNzFx8SyWDbMX4Duy9MZ8/WH
	bKSaZkALQUto5EU2jtiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSM-0000000Bqa3-29rf;
	Mon, 20 Oct 2025 04:25:14 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSJ-0000000BqZ4-3DvJ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:25:13 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so2531164a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934311; x=1761539111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPcskIG/1ay0sXA6LTmEjesE/nyn+okHLSoMKeTK/t4=;
        b=bRPkNhITh8CUQl6K2Ymf+hjH8o+O2MFOgVMUIV0RFRYxyD7dmkoXKed/sFLJbNGd8n
         hXx5+pa3OUlH0zAyeIUn3MFOCz5nQz6HurgeCKxOrIo6eUYkUgQX4c3A3878JEu9sDSd
         UFXbiH0fEoIfsklScE2IZQ7W3VjJIPvW/nAb5g/c1LEKZvHTDyhnQFYK+Uh0xSOBGJkG
         XP1NtiBS8z986OFkBH+V27HlVYsKqT460U5GjTkLSn7TOwpeOE/6B56k+/nxHe00jl5j
         1tZIK7uyJgYJT6xVHzN6dz0D8z5nzlSrstSuWvrzaXNfiuvrnxcMJPGFqKUZaYHNPfk9
         GkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934311; x=1761539111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPcskIG/1ay0sXA6LTmEjesE/nyn+okHLSoMKeTK/t4=;
        b=u2usbPsmiB4ulEOoKymWkBbLiozMfyQtn+f00ILAFHJv66dkDBCIOEguoMc/kDIXaG
         31eHwq2Ht6JYlsqw+TfpwhlVkJXBxIf0ohBzt7FpwjfO4t7fWT05IZt5P5fHmxkKXq+U
         kTYOG6OPKeLMN0ma0Dvn+qTM+lwvN3lWdCl9W7tQhFUp5bNtuf02ea9tkV1zmqx7A/FC
         egJjQ0bTF13dkDxl0sflYRl7EtsTc0HYJVIGTpbyUTV7al9lAJ+Eg3REgsN6yRdv5Wzt
         o8HmBW1c0WJu3TWJPoFnY5XOCiib+AQZKWtFchXaczvjezNUsxmwKaQFmKOYIhjeMIzW
         +5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDGQfGaBL9y/RAacch5LUozhhwzoPqg0h6jDKO00BkzIXZIneGEJmbaI4JrsaFitNRoosyoft1WA6iLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjwBUTCB/ImN2S6hgArlTde8SSEa7Vi33ibgpzZ7aUk7nxS3AW
	zKdcSWCOR4h9V08Nx8Ig1zIi3ImI4zC4rZZGSFBoYj7ZwmRoGVqbN4+7gUOJXfwH6B0=
X-Gm-Gg: ASbGncsQTOEWHfyP4/OzEiX4qm0B6sztspMhyW9g+TCZ8v3O71dNY7UvAQLXoKcuGuw
	VE/LVDE1GIoOC4bb2KddISg6ifltRenFVUjsqi4BUfHHYBFz7ZrOnLxX7SH6pFGl0abkqOuw7S+
	IkZG8XDmWQMMypHpXG2y+v87hv2TK/E/yrbiXL/+uuFh6P+Srs4iV9QkEtdjmMnkNZg+WLp2jug
	rDCwg79w4NXsc8HoJp5um+opeL1ljTBU1JlsA1Cu9VfvQ7bKMis2ymkvhBEyGyUn9+mU2qj1X3u
	00SGvtHmYjDf63MRYx2VFGxtb6CSQaG9bmS/qlLVfxvGz8PjL5c2RnGjRPu069Ss0j6GbAquFH5
	xJtAavxd8gOp0VAUE+ycck7b213LXVihZ0CLaNPPY2cKBBAWUCYpU6qdbE7sXCkGAlTWTFxLXL5
	HvH2HMSZAZteOHZ/gavLpUlaJxAXN1lirsQwQhECtkUYH2nPnMi4YdI08z0m4P56ICknqQToZJS
	jD2RIUxqAyt
X-Google-Smtp-Source: AGHT+IEujhnClojcicPbj3y6ytDrc6WWv+RwekLkEKlFozxNxVRIRtmsdedEqStzjhfQZMJDA0LXfw==
X-Received: by 2002:a17:902:f647:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-290cb65c5b1mr125810595ad.45.1760934311032;
        Sun, 19 Oct 2025 21:25:11 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:10 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 05/10] riscv: Apply Zalasr to smp_load_acquire/smp_store_release
Date: Mon, 20 Oct 2025 12:24:52 +0800
Message-ID: <20251020042457.30915-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212511_836417_FD017AAC 
X-CRM114-Status: UNSURE (   7.35  )
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
|    | l{b|h|w|d}.aq | l{b|h|w|d}  |
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
