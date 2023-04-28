Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31878C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0tYpT/tl4FnYuKePrySaZUXkhUw/h+eB2OP/5CI9GY=; b=gPu7Gkjdb5powK
	UlL1g5G5mm8cR0tIQSUAQioqEm2i12r6xmpLT4P7ljYy0FkOknaigJxTOFBkwkFw2D6To6mLcOCLW
	7ai4NvtO5RP53qrQNhZCN2JNZha+wKmRuqbIJZUnCOi6siV5MZZppWHN5xNV6OqfYWrekXgU3GM/y
	UfZO0GTqL8kPABRIdkCaTEYv8n6eGYr3Op73ejjUr3/dcXPHHny0TtCS8Cm0cCuv/yhSnjuV8ZNkn
	3yjmRfeUZ1/Us2OV5kMJ8R7v0nJlBvXVGiQzxb4dRxclQA5DPa9HjIBcEWpJWjhZmyCXrdzAD6tz0
	uIEddKuGF26ODmB6VUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psTQM-00BbBx-2n;
	Fri, 28 Apr 2023 19:06:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psTQJ-00Bb9z-3C
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 19:06:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a66888cb89so2577415ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682708786; x=1685300786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFqKaSshbd38sYLtbvsFAsIC70cXgzSexspJ+qNkyV8=;
        b=XnAwbOcj3oIdGm5mgK/A1KMo0zl0NXPLsK6Ex+j8wTHj+YS4AYBq7F0FGQ9EepC3AF
         f4g18o9k3NnlNok/OmbZTwiPhH7Xtpg5hYXbZPE7BppyipgRFvEIyb3ORWx46F3Zl9NX
         YRdibn90f2gEVEtCJijmmlViY71zsqd9e2JsieEzo7eK68Onw032p4Zw7kKqhC4onVrM
         fnwI1OUbLF2SlPyb8Qeo80sjBjkeZGskUE6W1tjBTUUsoTkMf6BDwclOUA2/DAs5IoWh
         jHfKhpJjHTjfMGJSZcgqE6rUGXD34lTbp/VA/OWdkOgPZD/kbiB/uQofgLQvPeZcNGZa
         9R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682708786; x=1685300786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFqKaSshbd38sYLtbvsFAsIC70cXgzSexspJ+qNkyV8=;
        b=RDzJ71RbaBGF60PDquMgYTEpOeALOT6R/rhjS/hS0rn84+Ux9eaqjTxcUn+xivVEj3
         LeR8Zr9LXZADyMMkX57e2WDmyyOdy6FI/Z6EFlmfyDLcA91eHr2fhieQEHFzrNbVmGxx
         e44QbW5Hm7tPtKEIkx//hQkhuYkew8AkKehSWMf3H9kAl17mEYDiKoxitCG1JGsY+j16
         yrRIjaHt2RLGEEfdIrULy46UmbIhd+TpJgjGq5Wtiv7+KAs3VCQAPAVbDa3NdfwQ6eec
         10PFWJ6mxNdnctHvYoCpNf7DYgJgjRloeL1xyFNETAFM6VqaZlisG+3r/8gOwnbKw3im
         zRwQ==
X-Gm-Message-State: AC+VfDydMW4d3xgWG3QcEQvEWVOlW73hPLf/DON9T6xOXdGoAI2k1Ixm
	VodKrBVAALMwZp1FVFecf6d7oQ==
X-Google-Smtp-Source: ACHHUZ6zsK/rXeuvueCzLKmEwUjIV1KR62eq0QfUEx2BJ11PBtuHXRuJ+WOwWqzn3qupChOIwIMv7Q==
X-Received: by 2002:a17:903:228b:b0:1a1:b174:836c with SMTP id b11-20020a170903228b00b001a1b174836cmr8128192plh.16.1682708786587;
        Fri, 28 Apr 2023 12:06:26 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902d70f00b001a6c58e95d7sm13580733ply.269.2023.04.28.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 12:06:26 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] RISC-V: hwprobe: Expose Zba and Zbb
Date: Fri, 28 Apr 2023 12:06:08 -0700
Message-Id: <20230428190609.3239486-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428190609.3239486-1-evan@rivosinc.com>
References: <20230428190609.3239486-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_120628_041534_CE43CEB1 
X-CRM114-Status: GOOD (  14.74  )
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

Add two new bits to the IMA_EXT_0 key for ZBA and ZBB extensions. These
are accurately reported per CPU.

Signed-off-by: Evan Green <evan@rivosinc.com>

---

 Documentation/riscv/hwprobe.rst       |  7 +++++
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/sys_riscv.c         | 43 ++++++++++++++++++++++-----
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..21f444a38359 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -64,6 +64,13 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
+       supported, as defined in version 1.0 of the Bit-Manipulation ISA
+       extensions.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_ZBB`: The Zbb extension is supporte, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..ef3b060d4e8d 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define		RISCV_HWPROBE_EXT_ZBA		(1 << 2)
+#define		RISCV_HWPROBE_EXT_ZBB		(1 << 3)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..adfcb6b64db7 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -121,6 +121,41 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 	pair->value = id;
 }
 
+static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
+			     const struct cpumask *cpus)
+{
+	int cpu;
+	u64 missing = 0;
+
+	pair->value = 0;
+	if (has_fpu())
+		pair->value |= RISCV_HWPROBE_IMA_FD;
+
+	if (riscv_isa_extension_available(NULL, c))
+		pair->value |= RISCV_HWPROBE_IMA_C;
+
+	/*
+	 * Loop through and record extensions that 1) anyone has, and 2) anyone
+	 * doesn't have.
+	 */
+	for_each_cpu(cpu, cpus) {
+		struct riscv_isainfo *isainfo = &hart_isa[cpu];
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBA))
+			pair->value |= RISCV_HWPROBE_EXT_ZBA;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBA;
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBB))
+			pair->value |= RISCV_HWPROBE_EXT_ZBB;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBB;
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
 	int cpu;
@@ -164,13 +199,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
-		pair->value = 0;
-		if (has_fpu())
-			pair->value |= RISCV_HWPROBE_IMA_FD;
-
-		if (riscv_isa_extension_available(NULL, c))
-			pair->value |= RISCV_HWPROBE_IMA_C;
-
+		hwprobe_isa_ext0(pair, cpus);
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
