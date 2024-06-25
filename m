Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52840C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imqmaYpS+2Mthj//GJAyJBXzOnFQSr874doC6Ozq8fY=; b=kfpm12QIyeF3YH
	zNl5w5Y+jDe/iuKJyXDIdHYDEZr6qmhvRZ0592/6EvgsQbgkKa7Z9C9/bCYrfh5WuO+DLfJ6q4p4i
	mgOV7if5ed/T8ZsFsKxufIXfe/zMD27tZ2r2LAHAQepgwEfBRNGliImjQtDn1eS9z35GbYD2avr8m
	Whm40E221pyuruuJOYaeIbyHMxhPw2RgH2I0aStQla8+cs9ZV3nWR+RHRbX8fWjfzmg1f00JHQO03
	jVqab4t5u2l1Ntn8dBQHOCYHJAUylkfprERDwHWvjl1BKt6ebYF08FASmAltsv+z/X8Mboj43StRh
	DoqpLlRrJDMVlmM1dDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9OS-00000003lPj-2EJe;
	Tue, 25 Jun 2024 16:51:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9OP-00000003lO4-2PST
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 16:51:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2c8911c84daso1579021a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719334301; x=1719939101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZXJtegesCoNWeLT3fyH7pcXdAcWRPzbJ/UkKvHn+vg=;
        b=R7aTK6+/rutLe0NLeOH1FFpJvr44C7i92Ca0lH2Z76ShOMjAQ2gI1KUbeUg2WgQME7
         IrEr7hWhmKn4FYlhIwlk56H4O4teAtmb2udNTu8Gl8OkrICjNbQ2vtWYuaYLFSR6p98A
         aRuAo1HM9qjKRbbJXuZYfiaqApzBEUhcJAcNtMwZnk/2RCTKMePcs7igR7z2OpPkAyzn
         GOODLpJ2hN6sDDM3oAeH/y5YkPcXX2t1h50Uugv/ws6fjGPBYqIZAC/WgJo8KlaJMo3N
         Zk+hwmIBjjW0LxKX8Djcl91feol60lyAVMPV94wEec75ePxOazGwao0nc5L0MQWta8R1
         Pk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334301; x=1719939101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZXJtegesCoNWeLT3fyH7pcXdAcWRPzbJ/UkKvHn+vg=;
        b=txvF21v9qkz20IdJzUO7SfA/ELPL0R9U6ucTeYfAK7XdVCIiL7x5++dZqcqDn67cEP
         h3Ja4YDsaATwxF9eNq+G21Ji3dY2rEUfFzO/kPcDPFwOpemEOT1RC0ccjaTAhxGch9d4
         IyBGWCWr80xKKugPbJb582clcUzsxgHTcBp7fx/ZxSHxC0WYXAuQ99DryFXMsBZ6YCQu
         yKY4AxPZlzdDMY+DB6PtBhGChdPjmHKcU1oeFv701AtexGGs+eiEyTi3jZr04osv5//F
         FGm1jrE79PjHfWt21l2uld9AsTvx1JOFK8Ijh0Nshizd50d96XH5Ye/3RdNUwRDQbyKD
         jDiw==
X-Forwarded-Encrypted: i=1; AJvYcCVfwtCfoNI2QWT49aG9ChzRiBqdbmVRm/XpDPhBNG2pSqfUJBQdjG6q0Go/jp+7IT1IHA3zu/LJmLhnI/6Rzm9JnI50x8Z83DmxCY5L6V/i
X-Gm-Message-State: AOJu0Yz5PjEs+fG2ZvA3Ot+9zLAFw0aURLNclsOkQbvwutsj/QRqsJo8
	jIz1UnE+ovx+/m68wvc7fzOa9uHMgsszRA0kr6QTLuC3qzx46dH1bjIKUecYrAE=
X-Google-Smtp-Source: AGHT+IFgmAX/NR/Rny+7cxUhqpzJmnRfgk5/0YiE5Juy2IWGyJPjWd26T9/Jdru1Y0LXwKSKowzy4A==
X-Received: by 2002:a17:90a:de86:b0:2c7:af97:ccfa with SMTP id 98e67ed59e1d1-2c861297f4dmr7174509a91.10.1719334300631;
        Tue, 25 Jun 2024 09:51:40 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a623a3sm8991226a91.5.2024.06.25.09.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:51:40 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
Date: Tue, 25 Jun 2024 09:51:20 -0700
Message-Id: <20240625165121.2160354-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625165121.2160354-1-evan@rivosinc.com>
References: <20240625165121.2160354-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_095141_733750_F613AD7B 
X-CRM114-Status: GOOD (  18.07  )
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

RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
hwprobe_key_is_bitmask(), when in reality it was an enum value. This
causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
since SLOW, FAST, and EMULATED have values whose bits overlap with
each other. If the caller asked for the set of CPUs that was SLOW or
EMULATED, the returned set would also include CPUs that were FAST.

Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
returns the same values in response to a direct query (with no flags),
but is properly handled as an enumerated value. As a result, SLOW,
FAST, and EMULATED are all correctly treated as distinct values under
the new key when queried with the WHICH_CPUS flag.

Leave the old key in place to avoid disturbing applications which may
have already come to rely on the key, with or without its broken
behavior with respect to the WHICH_CPUS flag.

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

---

Changes in v2:
 - Clarified the distinction of slow and fast refers to misaligned word
   accesses. Previously it just said misaligned accesses, leaving it
   ambiguous as to which type of access was measured.
 - Removed shifts in values (Andrew)
 - Renamed key to RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (Palmer)

 Documentation/arch/riscv/hwprobe.rst  | 17 +++++++++++------
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 13 +++++++------
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 4 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc015b452ebf..c9f570b1ab60 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -207,8 +207,13 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE64D`: The Vector sub-extension Zve64d is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
-* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
-  information about the selected set of processors.
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
+     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
+     mistakenly classified as a bitmask rather than a value.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value describing
+  the performance of misaligned scalar word accesses on the selected set of
+  processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
     accesses is unknown.
@@ -217,12 +222,12 @@ The following keys are defined:
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
-    than equivalent byte accesses.  Misaligned accesses may be supported
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned word accesses are
+    slower than equivalent byte accesses.  Misaligned accesses may be supported
     directly in hardware, or trapped and emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
-    than equivalent byte accesses.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned word accesses are
+    faster than equivalent byte accesses.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 7b95fadbea2a..22073533cea8 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -66,13 +66,14 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
 #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
-#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_SLOW		(2 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
-#define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
+#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	0
+#define		RISCV_HWPROBE_MISALIGNED_EMULATED	1
+#define		RISCV_HWPROBE_MISALIGNED_SLOW		2
+#define		RISCV_HWPROBE_MISALIGNED_FAST		3
+#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	4
+#define		RISCV_HWPROBE_MISALIGNED_MASK		7
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 83fcc939df67..991ceba67717 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -217,6 +217,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
+	case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
