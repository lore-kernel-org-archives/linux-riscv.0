Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3424FCA100B
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2CidBBqd/NWYcdIfNMTygqV82ZSBHvhC3YNhmf82b0=; b=Jfnn+yTUhfX9VM
	LKG47msXWnf57cu0ea79ijdnbk4XCp3IVlAMAySzyixmMalkBexS8uL1GzsfzWHNGaje2xn7Fpm40
	fKcAKk0rSPfnbRtTc93EbHavSn5pCuTrEJBG66HBQzwCiHYz1aiJ9lkKdKyiHOepRZgHm4iSuD0pn
	lmd+CI3EtoWgPcDVqdzkWFFn/HcKjddjT9UkrZj38xjeeiK7aAVIr/S1u/EEJ8zzFgwm6QjH7i7zs
	kOukwqJxC+wcxFPL1GX76CDKJ+HqfK0RHyKmmpK+brNHDH73U8YvIzWeVp9kOzi1kc0Jb+fj3YtWU
	112bh0QNBCDBE6009FwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uV-0000000CkCw-3uK3;
	Mon, 01 Sep 2025 13:49:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2kO-0000000C3uw-0dVU
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:30:53 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77264a94031so200782b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726251; x=1757331051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=BSYmrwv1ZC1YsZPuj496ECElf19OT3DImgar6mSZ60CXbKtlTUAPMoBKGVT7B0Ph8Z
         YrlVhWxRkvUrlxODeUtNJhZvwfdU05iP0cOaW3RUsMNSX+VGZg7SNhifd3Td1rmCgFba
         ItYcW65emQ3hLWlEu7H5gN7MlZ+jXJWssjPwgrn2FayxTKLK5qsQN7oH02F9R48qKOT4
         cdbdBR5YbzjlPiCFTu1zz9+sPerxHYl33oaIFL3Y2BMeDCxKdX2tizyPGHzPbRL6WURr
         GCHESH+8A1LN3KAwDd3e8tVxb038Ogv3baXcXHt2dUdGmCdcybJeZK/q14vprK5IZyOx
         9+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726251; x=1757331051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=TN3+PoU3+Alqacyvsi4pfvsNk13xJTY/zX+RU3UNgboAPCcRQpTpTyED6UvlBdUZ3h
         ONdgf/GHMn0dL12up1S0XoA03bx5EoqPWw1U+G4BFtWgQWdLg+cq5bpYVmKns5HVvkld
         3IS+N3dsxd7LjHCh02ovquxkkcoXTwKkapoWb2JjyYjnZ7nSSqTidEH3lfQmFEb8s2+a
         uXFfw6vadWeat83HCokCSSGL6YxTE5RgMIXgEGOsLAk3IsExl6gzsJBROiDOETanW+CL
         c+3zqs1FLO7YlOHE+5V1EZc//FhBdmgyJM2yTKq3GrW+dXENdgupbGvsbaAtkDcTiWFb
         P6sw==
X-Forwarded-Encrypted: i=1; AJvYcCUc3cUnmKaPas2pROHTAWY923eSnE6y9XGwNqA5KPQldIPaFJucxP3BnvlYvniw11sBztNhitmOiS0jzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbex3L880DluJHMIn/WAh0Xpra4NMM2WcBdwPeqOa6nKjwJ5+I
	wEWqFsm7LjwqAGVJkpa5XP1EiMiSjbU+evMFL6M+x/bzSXD7XRPbJvQSPr9VlI0UsUg=
X-Gm-Gg: ASbGnctHQUmvolkF/UJWjeCoHefozaEqgV1Eax9wxKLSVkniU1V8ZZ3WT8Ie/RU6lsq
	xiCnh9E9WI8PV5h0ItP6fyurc0HkAWfO6JaQiOkjpvN1uyAh30xaZDssPo9xC7x3MerC4yW1/1j
	jWrc0mkiVetRmsy8AqJj75t1zYrzxw74GpOripGDMnaqOQ3KttWnNUxjgGa2sclamfCjknLmtKQ
	A26yLY7zlBbUnR92W3xgQHT/ouQ7ctX6HOQf43UzY3vyzABqySOxwE+u6719lfdl4RPDazf9adZ
	vB6FbZOhJweLcvwsmPrdzgVcS7gVMVqp+5Gbc17sg56EwLl+keMJDLWcr2YnnOvU2suNqe+9Y5p
	g5mCeLLNEGXJbJEnxbKtKr9bx0CBv5fuf5e0mJRVoRvmgZ8r3l8+KiVZRmQKbu599wA0Ha+coZ+
	9wHJhnr847M4BD2fW2EHTQqCZVKKP8dZDKVzbiZNCXAn0=
X-Google-Smtp-Source: AGHT+IFCGJaLcCEzCVNOdtTW8pBozzJLUjah4C4TeBuR9DV82igkvDHYVTkOUw8Lz1MGfFCTLIHESQ==
X-Received: by 2002:a05:6a21:32a7:b0:243:ba10:66c7 with SMTP id adf61e73a8af0-243d6e02262mr11191065637.24.1756726251505;
        Mon, 01 Sep 2025 04:30:51 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e9afsm2911441b3a.11.2025.09.01.04.30.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:30:51 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 3/4] riscv: Instroduce Zalasr instructions
Date: Mon,  1 Sep 2025 19:30:21 +0800
Message-Id: <20250901113022.3812-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250901113022.3812-1-luxu.kernel@bytedance.com>
References: <20250901113022.3812-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043052_190932_0030BEE8 
X-CRM114-Status: UNSURE (   6.72  )
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

Introduce l{b|h|w|d}.{aq|aqrl} and s{b|h|w|d}.{rl|aqrl} instruction
encodings.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/insn-def.h | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index d5adbaec1d010..3fec7e66ce50f 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -179,6 +179,7 @@
 #define RV___RS1(v)		__RV_REG(v)
 #define RV___RS2(v)		__RV_REG(v)
 
+#define RV_OPCODE_AMO		RV_OPCODE(47)
 #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
 #define RV_OPCODE_OP_IMM	RV_OPCODE(19)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
@@ -208,6 +209,84 @@
 	__ASM_STR(.error "hlv.d requires 64-bit support")
 #endif
 
+#define LB_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LB_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LH_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LH_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LW_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LW_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define SB_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SB_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SH_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SH_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SW_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SW_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#ifdef CONFIG_64BIT
+#define LD_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LD_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define SD_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SD_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+#else
+#define LD_AQ(dest, addr)					\
+	__ASM_STR(.error "ld.aq requires 64-bit support")
+
+#define LD_AQRL(dest, addr)					\
+	__ASM_STR(.error "ld.aqrl requires 64-bit support")
+
+#define SD_RL(dest, addr)					\
+	__ASM_STR(.error "sd.rl requires 64-bit support")
+
+#define SD_AQRL(dest, addr)					\
+	__ASM_STR(.error "sd.aqrl requires 64-bit support")
+#endif
+
 #define SINVAL_VMA(vaddr, asid)					\
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(11),		\
 	       __RD(0), RS1(vaddr), RS2(asid))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
