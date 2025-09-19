Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D424CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2CidBBqd/NWYcdIfNMTygqV82ZSBHvhC3YNhmf82b0=; b=H/jAfm9gsSNFdL
	vW7VVuSbGK9xF+B6++pJZ6OVUv5ghSx09Sm0U1s3h/SmaSUYiSk67cKbmESjdUSVLpkgHHLmEXueF
	TZcmich8ZPCOeQ6VZ67BW5iOrlm0CF74hPlYV/kBT1vw1/tUL9R/etigohb2qe7W9cvLiaWnZtHRg
	I7HWeQYWlCTlxj4mQn8LQia0azi5gQh6jReCNCOSnY4JlkTAXKx4t+mvtC03QnhIJMrPwZCVq7G79
	/k7BNAu9FgYLjnY0CGEky2ObznpHvEhMKAclqehuC7Vk86VnRxdiwuRjiD4nLmGinkqhb+MKVPotn
	ybBLR1GrvRGMrhEJufWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVh8-000000025aY-0wuy;
	Fri, 19 Sep 2025 07:38:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVh5-000000025YQ-1xZr
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:38:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-26a0a694ea8so4654285ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267491; x=1758872291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=kiQ4IPARFhf2e5jP774y9g3jQTa0WE17KUhI6LvJwZuw+HkxNFt2PhoDa7bpRWED6i
         6eoRVwLCUjZbmf/D3I3cdIMkiDKfjahJUKAM8g0ZfzdKsoHJAqceNJV/cQXL68+6W7IB
         3ZuxvGXf/yC7OlnMqFq67TSc4S1riAGs9ndCjsnNjlONuU8NCsFJ4GeytF7HOVBC8Thx
         LgXmOTZLIIqsF9Slgz4CuYd0Ecbxy2GPUBe6b9fZv64gPUIRdwXUP+/xM+SizjDJufs2
         EZ+z4xQS9kGXUfnxa0X81S5luU/ClOIZy2DnLs8FwjlRnajo31zA+8+jYdYRcmc3MWV7
         C7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267491; x=1758872291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=i2+iRCz28gBx4DV7KWzoPzwY83LqyxsL7IK3KdkKuGoez1qT0ltZ+eJ8iOzmvM3PTR
         rlMuaOaaAryk7iqWfA1il8l893RqvRmVQu0iQ1nJUTMuNGECEraJ7Kog63fVoqcXhIi1
         7GzFr4foP+Dbsa7VmgIboZNMoNf9XTCJIasrwmR5pZ6TTcSAgOgBA8RYO1RgZc2i0tAB
         yTlDKFY7VcwWNwPtOasl8Awe+oCV4qDFGzVRXM41SRmnQAyzKGpzTNV/YWlMVF9ZWnP4
         tWK1yTnV8/3bBv+RXNGoHEYZogH3LDPql/bssNQG5VXLDPkpTTgP+nZZGpOL/HCBWuBP
         v8ug==
X-Forwarded-Encrypted: i=1; AJvYcCWep8/pr0Zpsco6sCeti6VfM+6B4ZOa31rbSMOdOP5HIWnW8Hc1x/9tOXR2vNcAudygsAcqbOrKQLA8cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynaAnC3O2Q69CGGR5WIdcgWPmm226qHpHUsUJcsd7uNQSNGd5x
	07FcH+L7f5ornByDbDOy0MbO9U2d2Afi7VvulMnhCDwj8Jq2+a14fuEV392MiEu4Mm0=
X-Gm-Gg: ASbGncvKUsNq5GLFCX0frnFT0DkLgx+l3uCGcQWEsMZPLg59RDkHRKJLqUv2lx9Fo3O
	TQysaKgU8XcUHY3lDyxX07a9DVYg2UI/BPfs3gaMYv5w3/4Pd7pbi7kBfNweCtfrNYwxg3LnQwf
	xmIFOEbVv40pRyFazFWmWAZsRfORLXt5R5ZIEp1YTtj0nx1k0vd59M3BVYUnQS4fM/VyNC4rExq
	tlDXJ6ypLYj9Qn87hWtcaz9nrRpZCmd1M6JDGQpJbcFMwk9tcg9Y67ig0yWC5XwJ73G1H4ssB0m
	8i8C/yIaCjRWZOP0F3yUpUqXt4RkjzjL5tam5K4/h9YGr3Zyl0IZADG3HGafi1GOeSq7ONk/Aso
	SwVtN9cBXPeEAJSmyY6MQ+opIEzAOB12jNccY/0PxyCCcWsK9eZrELi3ufGD+YFnegsuVxhU2ho
	AwAEhkyU1T3x78LHLr8WJWr3RqOFcp6L2E14T5KMF82A==
X-Google-Smtp-Source: AGHT+IHSeUWZ1h2FvilomFO6LKlK35LvsEHQvldORE6E3obR4YCYcFLQha/I1fqdofri+zuG0ncN0g==
X-Received: by 2002:a17:902:cccc:b0:24d:a3a0:5230 with SMTP id d9443c01a7336-269ba54c1c4mr31455485ad.58.1758267490633;
        Fri, 19 Sep 2025 00:38:10 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:10 -0700 (PDT)
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
Subject: [PATCH v3 4/8] riscv: Introduce Zalasr instructions
Date: Fri, 19 Sep 2025 15:37:10 +0800
Message-ID: <20250919073714.83063-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003811_528012_B2C7D519 
X-CRM114-Status: UNSURE (   7.01  )
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
