Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4016C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzOQGiK8iIgt+tWqN1dPCVzsx4vfCfKA1bAtWmQUwQw=; b=Y1lfcNtVnVnDFG
	4LGzQ2TybCSKH+xxaH8me6PaQnBxg7/nx9E6C/vGyRqGDCOJKyMleO0DFOjPFHY+/7wMZH3isqQp7
	meOOxmHE4PmXjQjiF6/RMY/xZAwDa1lxykuK93rp4rfHvdw36hj5CuTYcPl8Z/6QvvcgTZk/+009V
	Zo/oGFlB6v5W6FZwjIvDcgA0HjvVzF4daAvpf/UjaGSD/l7ikkuTWlKyoNEsUfP9GvCRuyoD/nQv+
	9VzI+8GAVFllCGhStTTI6Vhcc+cc+E/s6ZfmevQoPfKKlW4/cRFxHvsa5S2hIorbjelCJOJKr2qbc
	ghLs36I1BOu+op3/tRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1f-0040c2-0J;
	Tue, 09 May 2023 18:25:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1a-0040ak-2c
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:25:24 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so4197450b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683656722; x=1686248722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26y59v9qUKc2CpO6S7UVQsEMURpLsKbwKkIt33el4rQ=;
        b=DLepPrV+ewXWR/9YrNdLZsky9GdViwY78UMcLP8j0su7F5/fgByJg64fORBjd2IOJn
         baXSJfWCoS84zI5g4AKPEviwFoxWDo28hKgTsxXDlKqNt2cvtpiDtxqGDT24IyaWTlzD
         FnfD51zlWKvj5VLu8Rc/FFtHOH3uNeC62mi/YWw3Rjn9Oot+ZYAqX88ZxMsWK8z8yyiR
         LibeL7cF4bShgGhQs7y6ZW2yiO46kN7/2rQEUNM77IdNMWcUshAIbv93HuNR+cQr6YxQ
         1za0EaBwOeLdGnDvu/tvHk5EDsUQ2yXfuUPderpKOYp9leoKqfAN+i/sDjr5C8H7Upon
         EuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656722; x=1686248722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26y59v9qUKc2CpO6S7UVQsEMURpLsKbwKkIt33el4rQ=;
        b=PiNWLAb/CCyHxZwNI8HyQV2f1fd8Byi/Ixvd2JhdoVTCnj2IrwJLd+h02BzfglBsps
         4FCuLc9+CX5GeIYuzngSYYeQaHh4gyODBs3mNriiDnYEe/QxLo5oTT6sOZuCGbyICzCN
         +LS97kf0nTeTQEqC/QPVUmyEgE/GxutSjd+S84gvV7796Ln66ZNUztSsfWLuURR4FJMT
         QzKP4DmVAx5nC3ttgbiS4ugAC3KwzGnoHQc9TJf5KtN/kCjQ/e+E0PfK4t68f/MXi0XQ
         BZru5K5PN056rrFrHmTmpEFxLkuIMGNXfCxXNuAOISFdz3dC0DEPEgvXTLzQHd2J6hsh
         ZNlw==
X-Gm-Message-State: AC+VfDyy6kRTh2Bmn+G19rCegGHD5Gr2tKlDawedwB1x+/PHDI0eN7/n
	q4TAimEv6ttB+1E/T2o34QYrHnBPXKstlCUkOIg=
X-Google-Smtp-Source: ACHHUZ4Rc0x+ekHb+pf/Jq9jIVtRwLVZ76o+axXE34SjBCZ7M6BlLSO316QuMtQlI9a78xap+duh0w==
X-Received: by 2002:a05:6a00:2401:b0:63d:3339:e967 with SMTP id z1-20020a056a00240100b0063d3339e967mr18559445pfh.19.1683656722049;
        Tue, 09 May 2023 11:25:22 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id q12-20020a63cc4c000000b0051eff0a70d7sm1633559pgi.94.2023.05.09.11.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:25:21 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
Date: Tue,  9 May 2023 11:25:03 -0700
Message-Id: <20230509182504.2997252-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509182504.2997252-1-evan@rivosinc.com>
References: <20230509182504.2997252-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_112522_845909_F877DE09 
X-CRM114-Status: GOOD (  15.99  )
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

Add two new bits to the IMA_EXT_0 key for ZBA, ZBB, and ZBS extensions.
These are accurately reported per CPU.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

---

Changes in v2:
 - Fixed typo s/supporte/supported/ (Conor)
 - Fixed copypasta s/IMA_ZBB/EXT_ZBB/ (Conor)
 - Added Zbs

 Documentation/riscv/hwprobe.rst       | 10 ++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 ++
 arch/riscv/kernel/sys_riscv.c         | 48 +++++++++++++++++++++++----
 3 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..fb25670ef0e5 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -64,6 +64,16 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
+       supported, as defined in version 1.0 of the Bit-Manipulation ISA
+       extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..853f8f6d9a42 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,9 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define		RISCV_HWPROBE_EXT_ZBA		(1 << 2)
+#define		RISCV_HWPROBE_EXT_ZBB		(1 << 3)
+#define		RISCV_HWPROBE_EXT_ZBS		(1 << 4)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..fe655db19ab4 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -121,6 +121,46 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
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
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBS))
+			pair->value |= RISCV_HWPROBE_EXT_ZBS;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBS;
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
 	int cpu;
@@ -164,13 +204,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
