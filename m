Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EA1CA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 04:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2CidBBqd/NWYcdIfNMTygqV82ZSBHvhC3YNhmf82b0=; b=W9ZLO/Bv57pB4b
	H7zVARV6Ak3mAYMZkjL7IwnXjj/DkGckHrMrOae0T99kClBtuGcjw5kriuAgbmpWLc8Ms3s7YtZ8H
	99grM5TrF6bkYI/aettQc/yMrmqiWhSnutCOrR3wLAOI1cMFETuEB6aTHD7yL9oCNWBLHz4mnUa2Q
	sSJv17rqyiuCcl9+2VyrKGTh1qb09VrpPNrCkIDnQM6PuB7SkBdmteJ7hz8CyDW/Q9A9tiYZPu0tl
	O4uRabWFGYft6bdW/lraMP9ehUrb8ChQ6fm4yyqDQfo3wprRcNU1Taag21jFMjUG9mQ2Azqrf7QO2
	mB/EKoOk0ylbgrBMtrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZp-0000000FCc3-3Qqi;
	Tue, 02 Sep 2025 04:25:01 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utIZo-0000000FCaG-0Ugb
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 04:25:01 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-328015abe0bso3019124a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 21:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756787099; x=1757391899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=a4FEMWibhEDPufNJjmv65pcw8AtzcNF3kWteLCKVmRvQV/cAth0r74E2pVPSkd3ORo
         a44BoL3htIqw8mjqRVIS6I6E/xsmzIAF0U8VmyjzdJpBbnwx4ab29hOjGho2+Dqy0+wK
         Lik8EIqgWmBoFWGhTJ2kHb1hVfquEtJxeQGe6ypPKcxrY+rst8gj0eFsOSIy2/NYGhy3
         gbjms0UTuWlZyJ661JetSXC0MQ5sbpkDblVGNR4Wnd/FFbq3mlh5ywNv+q+36e6igdcz
         cd2VkqIQcqmL5gFXIyWpxer0VKviTrv+WBmcmLpCtVWg+EJ/r3Hz3RBkZr8Y4U9vgkHl
         EkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756787099; x=1757391899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=QArO+wkVpklikx/lyPdVPEzbns2QXT2tajR4b4XAgQQHi+El7GEPJkCqplACbgKG+1
         IEY4vMz+1F98M+IVPCs+MURBwv/W+Vs9eukSncPeFhiLZVIadJMF7R/DjFCvtUS2gdXu
         MBqkfpApIXQeNOuF7E2vspnu8rfkkH67XN3jrqtae3xIcUq3jdRyDJ4xiW9lbBsOWUbJ
         aCj8AL7z8Z/EeA/czibNDnbDJN0k83MZGgNySDayguzo7Z1jQ0WsjgZwC9Ax5KstDqdp
         Ts+S5k4fLXYowktYnXSIOqBtsJxVjFR+IxuoeSC8R/qXAVoCdNNbBfMADqR3w0NMGgU+
         wigg==
X-Forwarded-Encrypted: i=1; AJvYcCW3tKIvRa4O50S85v0eWJWN0XmeJnk7u13I9dlVUbnjFQprt7f5FmkeVZno4/sDOSepjUGozYQzlQFMWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLIvOKPhRM6vyEKjilKQkRE16fsiEFvwxbcmDeAeHi8bmnAZWu
	q4W1kGvSozCJcGvZyljH3URFd9eLkhTbt3GmgzkozROl4en6XK2EeHaLI4jEz7luxu4=
X-Gm-Gg: ASbGncvvIWg3T7ZCjSoLi31rQIPaFP4XGzYZf1nJkQKkS5Xi1rSIyn/4qXRmFFzcXVk
	l9EMH9u0YHi+oLRA1W8af3rpo0B3ZLvUjb+9+dVzMhIyVhGPLn4wBzOdJfgZFn8w4aKwyYzLew2
	0J+qRnAX54i0D4NpzWEUhS/jplBoOY1GADmR7N5G+vJagGuOBdl2k0Ot7X0GA0wKzvpVAaOrldT
	yiMEZn6nkUkyR995S6tPhOqW+/v9gwRMWyWQ8AwscaY00xV+eaiDKYDb3fISS6rRlg/VOVHwDvZ
	VLDbr/p1xAVUkAbNml8w/EdSuKcVn37JjOlm7Uo+/+gEoUCSoLVNF9yNCabNhDYKPNfnxyIzM3Q
	FGMZIZ75BTjK9Nu04+67lbwbdVdy5atmRsK4BbaPov5PFurjbQvK6srMixRKCMJ2FKk0KAnXWU3
	b3fmwVR0dnFKZxFxEo+yb3LurWZO/bLvjBTQ6DiJw8ARM=
X-Google-Smtp-Source: AGHT+IFv/BZz+oSuV4r85o4JJ2VFlCeRdRpWZ7vxfc7IdiLIgnvMDvIfeMquYk/s/EZmpJpPE1uOBQ==
X-Received: by 2002:a17:90b:2692:b0:327:2589:7d4d with SMTP id 98e67ed59e1d1-3280d364babmr13673655a91.15.1756787099420;
        Mon, 01 Sep 2025 21:24:59 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e21d14a8sm12216706a91.2.2025.09.01.21.24.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 21:24:59 -0700 (PDT)
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
Subject: [PATCH v2 3/4] riscv: Instroduce Zalasr instructions
Date: Tue,  2 Sep 2025 12:24:31 +0800
Message-Id: <20250902042432.78960-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250902042432.78960-1-luxu.kernel@bytedance.com>
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212500_168815_B3EBA17C 
X-CRM114-Status: UNSURE (   6.76  )
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
