Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C8CA0FEB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2CidBBqd/NWYcdIfNMTygqV82ZSBHvhC3YNhmf82b0=; b=RCnlJ2IeLJDRim
	8h9mWfQ9pBTBdQEun0YaZciP1S1qRcsp/c5MTLQlfm0LNK1epxT59rgi050YjDdGw5yNeSz7zxH0j
	ifIjPWhCN7+CWN8fsHqzHx90N3E+HE7wQaMm4NrChuWW3u+RvcX0z2WPMQVjcB1MHau3ZpI+9+AZE
	o+YG1ghjMgsghCukcbz2hW7o2GuIpIGiEd4QRhW4xywAA9dNayiyKHpWnnMG1YZbI5R2eaA3IOkTN
	Z11f9uFe4r4kARbeWEkbG/+OrrWps5CcPqR5E7WZ89DAXtQJ8SOt2ULrI7RAcBV/ev+j6eaulmDbs
	Z+s9HhTImIJveU0axSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvBw-0000000CNJ5-0f9t;
	Tue, 26 Aug 2025 15:02:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv7k-0000000CM3D-2ugK
	for linux-riscv@bombadil.infradead.org;
	Tue, 26 Aug 2025 14:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=; b=B9e/BsNAa2dqHl5mgaqt3dvnzh
	7wNZmsqEy0i2TJLNdKdJYlphLvsKT9uXa0xA4Lrcu7iClUdAp9o7BhiEmTGd8FOLqz+A1ox+rU7cN
	XP4DUu73q5BLHfbAlBG8beyTQ4oy5wGNcFL2kpOtGxVlB3xF8rgRnv8X29EECTofS+nuTkt31JmiF
	1Rtt2UP7Na7pq2IZWrJIG62lDJ7Q/fV40UXBEATHeQ96i3ocqPLRPEp9lRyVz/xmZ75IQaPfK/NFs
	3epYqriu5GimLF501tAkCzYWhi0GhvVxEljmWmihiTEpx1u67ZazcchAFIfpy2XtArwrxHOmiFfB/
	zV7NAq3A==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv7h-00000002Eat-0TfV
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 14:58:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3258cdb7253so2837736a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756220283; x=1756825083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=V4B/RfzjBru/XZ6FlT2AvFK8Ck22lCtyj24K4BydiFXwZv112LKHobxIvW5hKmNCIx
         0AtCrzIiLaNZFq+nukryPcsM00zqyWrYr4nJ0ePAQXy2n8T8QiwQc54AkzOFKsphcEx0
         iYugQAgVpOjPeKZHwL+oFa55JJlQlt+MOFa4pZnjQt2JssBvk5U2ky3gH+RHiX/zpLL2
         i/SC59CFQlqH8A0AgPbDeRLUvW5LtojT4jieMyTUq5CnLyhzxdjo3WJWk8o7hzNMy/yB
         fxN5gaRmngdGAftv4bSl8H0l28wUS4iDFQTd/S6QYtAKeArGY+RpQpggcMJPZMW2k5Bj
         I8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756220283; x=1756825083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=OVQY6gmavvWwdPjYC9veCo/SpJuf+wmLqSVldVF2lcrmPDj2lUfB+K3iUIwrP7govB
         Ec48eCvg5QhEMa/cZaKecWvxUaUN8ApG7elOw5U4tVe3AVMjNtIn80IwPWdOxSHTLL+5
         Yh+T+pIOvt2vSs9omC4ohdWo8IMor6rG0seG4E/rFV2Y+x0ZZpg2WsrSaEopNKM4hRpx
         RFDbBipZlMaCnX1hwml/Bx/sJWocKxafxFeQ9BpZI19bV5TUOibkC9MpwBszRgoVtCc9
         QTz4enkaCef+G52FmaUiDhuyZHf8a58sWeQLagF7Z+HNziNfRXw5xPaO1T2Lf7DnKzfS
         KsuA==
X-Gm-Message-State: AOJu0YxsGy531XBarf8oUsEbnLXa/a7LYFxb8+p8bj8Mp3UJJlWWUm3j
	TC43tM4lSUJ7rI/hdMdM4c0ZU1B5ugOSCFIlmN+P/+U69HT/knotKODluBaXklv72dg=
X-Gm-Gg: ASbGncsA/vu/X8eI4iKxxjQg+FQAiYQJr4QwY8KAfmN/I6OUiL1k+g/H4qObK5qmD8x
	cQGB4aJfcLUd1AUH8ntyd2v1ht6Ge1+YXfNSjpgy3BAUSXoAbpSXkAD7YXIVN8WMKac6TgxS0pO
	2d22HLLSCBgKJGYOO0/FfMa9w5IkqgB1mNBVyRuH/+i2R71OZyy48YZ5BdinkyS4uO1FQ7Ai9LC
	QXGjnzZdXteFq789Ti7LLkMklp8jrCTZQG6zx1ih+gK35gFM/1w+eWcyNrSaQiqnt+yCmNqKo4P
	Tci9DJ3oj8Zk41Jifa9tlHrwCgvj6pzIj9/7OvChkOADm/ly3xeUMRbkOqKDR3Vtj70a6qoy/+S
	jg9GEBXf5bx4u7pi9jT7n+WFtW9MC1lqv1F7mhrGCoD67sx6GL7LtPPlu0miLmwvVTUuVF3zyD5
	FcftJiPYJN2P9DcN6RkYJRyoZ+Ef76x/xUx3NKx3rtU40=
X-Google-Smtp-Source: AGHT+IEK74/H7i+pm+ElxdqKUAWaljy20bQHmKN9LNI2P2UnYFqvX6w5e2Ez76kdAVKy0Zr9pixfFQ==
X-Received: by 2002:a17:90b:17d2:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-32515ef7240mr21352988a91.12.1756220282060;
        Tue, 26 Aug 2025 07:58:02 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77059928c5asm7209799b3a.1.2025.08.26.07.57.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 Aug 2025 07:58:01 -0700 (PDT)
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
Subject: [RFC PATCH 3/4] riscv: Instroduce Zalasr instructions
Date: Tue, 26 Aug 2025 22:57:39 +0800
Message-Id: <20250826145740.92276-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250826145740.92276-1-luxu.kernel@bytedance.com>
References: <20250826145740.92276-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_155809_698340_B515447F 
X-CRM114-Status: UNSURE (   6.28  )
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
