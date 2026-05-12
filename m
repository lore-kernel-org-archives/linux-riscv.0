Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48109CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=039UpEJWBW1U4+Y+Dh72wVxkyu7bSfUIfkcB7AZFuBc=; b=JvQpBHmCXanVew
	cm6tbOSbC1e4I1dvjjAlcizBnagJutUo9wyh+1YhBZNmAGXtPGNqteNooHXp95AmQEQZtwoGCeXOn
	FwJk5j88IHxerXpmKc2dY4uiajLwcHRGoXtHpdkex+G1JndFn4emXZLyC6uFzcQTl02jvdZebKsX+
	O7VOBsJnX6BLMHjh3RMOkXaNpedYdl3+WPcmam+wmKKZWeltuiKVxng3z8DI1dvrbzykIcsYFAH67
	XalCxMol+MkxxpoxmfTt1C/2jZFf5p6yUX+0VmiE6++E/XwKzmJWxAKapXUjPtislI2zo4i/Oha60
	wEYBo3abLLsWhxPvsJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoY-0000000Dlp7-3q7J;
	Mon, 11 May 2026 13:36:54 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoV-0000000DlmP-4BnV
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:36:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-368977e334eso249879a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506611; x=1779111411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7GyZnvSj+meNOJSgPSxs0cFVvDT8MNweX/dQpEyHMI=;
        b=XrpahAMlR+blNKTRl2AnAHBnTQ1Da4rG5GAnQFRy9KaF/x0wlW01Z0xW1gvHRE5RR3
         yZ7/u3IAqTMnoXsww+Mgx2DVqMBbZg3EN95DoHJv1KAxAzh9QpFVRcT1ezLy2EbKZ9UA
         PMZ+DWTyqYCB0fuHLZ+AUiMmle9ayMSKwguy1maud4bqYz9fSaM3hXHKnhVPYEGZIuBG
         MGwbV35InFYISx2Z+Xn9IqLxR3R0xLffVISxDsZJsBZmUWPQvjOCS+Paj3SOPAzILc/U
         jej8VI2VdLJ0p+jNo0ntFqAAjb7EWK+jo9Ktv+Y+vR8OsiYrSqifT3XTmLZlS6aCnj75
         TNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506611; x=1779111411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7GyZnvSj+meNOJSgPSxs0cFVvDT8MNweX/dQpEyHMI=;
        b=HiIAjScepVrup2uYuYaj7NDsmXpFSKnfTLAH/FU+x5l5wk6EgD/GPKCWa2XiINmQZC
         oCKu4uqCPV8TsNWn/vyFikaDGfODVtfekoPzQsoTt3Z9hCQI6j6YljyH0nMtbXZHPypM
         EuFrTtrB02EEkn6GVOPPb6bkn89s9i/QqH/4BoH+SqjWCXG8qHbZCOQcjW82RimuODKd
         4ooodvc/6avt1FiTWPI6zuiaRSqZMcSHp0MEGgtJqG4VIj8qUlz69tszg2h1geTd1d4e
         UCPchnHnXis0cnqYODmlv0t8pmckYXvMhdBGldizEFaA3NtHfcIAkYCLQtSFmtnkBLHQ
         r8TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S/RLkayZj3L7psNy4k/HGnbTLMDFnueH+melw0v8DYoEfm+trO6CnpyE8c6muCmxvYWupIsykJ0ovww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp0KISv0lIu2w1WUJsaq9Yuu8CeltoV7RW2Fe07Hxri9QZb4AY
	cnJc/E4VNv1vSiB/vZkYjNTpR0v/3bVt0qjQ9amPOMt+aUlYpslKkBvjSjIoOnDTGA8=
X-Gm-Gg: Acq92OF8MDYphufKcP76BDbFJEcDLYFWfQ7lZ+XFM/1sStLsMWSte5iKXiGWc3OZehI
	GrpxSry2r4sZgTY0hTzKH5bpkXt9VFG2iqUT2i/CHKRkpFCHzA1RoGf+V8amuCU8U0nMWCOihx5
	WD+6hWRh1WPQqMbWmt4CJNCKFfBWZ/fq+7POQ8MyuKpEyuCvCqzh2vqlA50ZskKfIuFJiTP8CQd
	cycfeM6aTYEZd6c4w6eOcPpOQ9JBZ3xO2lcNkULat7d7kRIGwLhNHg9aQsOiPjkKY/ca9X9VuBi
	EUVHbMsthBf/VpFymoXAdBwc4VL5YaKZvPFr0bG7pGObqJFE2SHHlHygZBcNtlkEHHwxwxrij9G
	pv4WjcqyjTbk6P5deLzMQMJlPeFAgbn12+UcNaCEwSFQnt9xyQLNIzCC6s4Urfuv7hBXi+Vd/yv
	16kZfhzhIqs/1cGJ7m/1Od3thSJvqBKCAzoqvkAKo6774=
X-Received: by 2002:a17:90b:4f85:b0:368:5367:d67e with SMTP id 98e67ed59e1d1-368536812b4mr4487165a91.10.1778506611016;
        Mon, 11 May 2026 06:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:50 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:49 -0400
Subject: [PATCH v2 04/10] riscv: Add Zicclsm to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-4-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>, 
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_063652_077832_9F64FD1B 
X-CRM114-Status: GOOD (  13.66  )
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

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>

---
v2:
- Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
  allocated a new bit for it
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c3bb26d70c748..05f746061f679 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,10 @@ The following keys are defined:
        defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
        load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+       as defined in the RISC-V Profiles specification starting from commit
+       b1d80660 ("Updated to ratified state.")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44bf8c7d8acc5..e8f4a7dd96a93 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZICCLSM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecb..6819df159c51e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5cf463570229d..4b4a8157277a3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index f8f68ba781b45..9cf62266f1890 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
