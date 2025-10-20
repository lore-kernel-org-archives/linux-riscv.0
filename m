Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C78CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2CidBBqd/NWYcdIfNMTygqV82ZSBHvhC3YNhmf82b0=; b=B0t/TR65dQ/5NI
	ASnUdRaQCOre+OWydspkn0veAPOAff5rG1D0pWxvd0DUMyccMzV4aLmnPqmeb8f093ljqEpfm94Ak
	2lvfUZEnyT7XX4g9fqiWIbxb4fflDsLOZMxpvcS9ikuBj1zptBmHp8yMAgsRKNiCxxRp84T4YHaFH
	1184Fo+LI0kO5eeiQthvEZQk2UeeDvSd7sJdmOZGCnLAs1PAgx74M0ihNUBl5PUExbC+JMlQGnaTF
	z07EJxG04J6MqKFZceOaGLuXedu/ISWKc8/vTszYO52XM/OKP+F9goaRhnaebAGi9Hfk9luRYOaEe
	cH23O8u6/jd6GTNn2neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhP2-0000000BpyR-46qS;
	Mon, 20 Oct 2025 04:21:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOz-0000000BpwC-3kJM
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2897522a1dfso38754945ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934105; x=1761538905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=GWXeVZQSOvjAb4AzbAYQSAQSptLWo9CUQVp/RCl0DSPrBdW1aJwAlaIs3CPoYYfwYa
         gWUnDvBbMKBOfa4AuJgDoKYmkMkzBciYOT5yloVeXPhgRMBCh9SYXlidPzz9bJ4RGvr7
         ZcV9SA2n9m1oK9bEbHJGqItrLA8btua69quATyqT6fxcZmRjUYnmdlCxo8S1a9B23cP9
         72M7MrxvM4I7GJcc1KlNcTCwKJ/VdizRlN705ZHaXHimKJ1wXjQYATSrqU0FI08c967K
         ab9je2jiu8z9Q6q/vzmfv3cB60MGg4UOyod69OToVqiguUPsOC3WAkfSvF+6w521d0xI
         O2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934105; x=1761538905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=TS6ROOsfqOw7qH3ZfV95c36v6wUoaGB0WwSWw0mfhs9M8doF3Alot52kNc1N89vu3L
         v93RKN9dkZoxEznZ5Lq3XhTaxhukch7ERk+Z2IOYvD0YgOLc26Ry7WKxPds7MPKN2wmC
         ETgfx3+LtMsUYX3h3LqyF5Nh/OGebNZLBP9iuDGa5V0lW7WUvzFZ1B/A9NKD/evvNFCr
         Vw9KYxnJ5uGUB3f3XRuI6HyxvsW94z6wANSARpYDEOUjVT+G+NPPWvvpcA/SxLzajHSq
         d75PbDtEm3Ta+tX6r8r7DS/SEd0fEy7ikZ4jbWgaFZCJKo/arbXqlgLKgj974fmSF8Gw
         ePLw==
X-Forwarded-Encrypted: i=1; AJvYcCW27T20fMcPx0jzhHFQCHCNbKzuDTc+0TwieUlcoIXmFBw+gh4bXGFebS3Vo65RKlXpeLn4XhLUvpz7/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCd81b+OqeEroqHAKOJHiDySvIi676zwYowdUS2r8932K86L7a
	2tn380PZ3HIkS6N81XwQXbYqWkKU70kks+TW1K54eJaAD6LBHoBqWW6pZ47BJDSfQFs=
X-Gm-Gg: ASbGncuW85qofG9f0U7/lpCCXEjZndtaDZkUzsg0B+N1bzEcS7Z3E9fgX9UBac5qlBd
	7WCXAsQ6xEeAE0VWPx7Hd463/P/GJLwOWAXgGFEVlTRo+57TXQQGiLu/Up32Nj8VC/SqVt4lDPX
	tE+OsLdJVg6DijjIp+xb0IargxAswO+M9zInfd06Weoj8IHGdz+pj6XhSc+UruAg0nhTKwA/MgD
	tDFzF5H66AJKNUdyqZVXAP0CX2LBhz5aSzqmwI35Nsf9FYFA5/AS/nXlrCmqL9zOuXv2ieCARQr
	v+hkOP6vrG67P22xnYdC+goZGA104CP8vaMexGXGnpIQoHP4o+gp3BzWjWd6PStRR4QYa00d5g/
	Mzjwebu+Eluvmt/zZliyUnS2DGqmR7p5XlKRvrBNDXPMGkvknhS6ogW3Mqk4Z8nKuCnY2OlrKPJ
	5F3gd/UJYrRM4eLaghSEaQhgk4L0UGpfneL81p0mLdee8sGSPUGTrbObuGHtDOzH8=
X-Google-Smtp-Source: AGHT+IF2KqRso1vGWBuxjKtXDzGr3i1rYvJFvWFqIw1C4cToJJg4q9dybEBrOykVwphfwE8jll43DA==
X-Received: by 2002:a17:902:e5c9:b0:273:daa6:cdf9 with SMTP id d9443c01a7336-290c9cdd599mr133996615ad.22.1760934104704;
        Sun, 19 Oct 2025 21:21:44 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:44 -0700 (PDT)
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
Subject: [PATCH v4 04/10] riscv: Introduce Zalasr instructions
Date: Mon, 20 Oct 2025 12:20:50 +0800
Message-ID: <20251020042056.30283-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212145_943695_F482F549 
X-CRM114-Status: UNSURE (   6.25  )
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
