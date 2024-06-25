Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D70C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eB1S7U37GULerQse3fheD5Xs/q2mpEynTa/yy2zh/Og=; b=HBtXLnQhBvHW+3
	DgsMGVaXnbrVfnegfPvAjFy/xo24v52eVHbCJ8eCP8BYgEr1gv4l/2zlyTG01Ywv2PpA4m+dtO5EY
	eD9dK40lWl73NEei1HsMv/YJWfAKC0D5QUNow9VeI0zUPWKFkALaaXil4cbGjaXx6SaKkRj1aVMyg
	rjDlBkcJDuVFb/ujEQ7ynk45vmDJ1ntzGvyxwmu3uX3FiKzURlIL+U76D7HdvlXncUTuhMHGfKqsj
	yscOjFXAjxxdwWmzkjQA4Xhc3VqYVg6lDTPl4SF0hPxYvZrisBfmfYfCNcL8ayiD1S4qkHOPZ/fYo
	ZAmnt+Q5Ly3E/b/pR2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9OW-00000003lRn-44pH;
	Tue, 25 Jun 2024 16:51:48 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9OU-00000003lQS-1CEW
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 16:51:47 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-71910dfb8c0so2226218a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719334305; x=1719939105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBsl83KViobbjzgTpYKSwJCRy5tn48PEO/PrLb9sWCk=;
        b=ZebMLWVreJje2+ejAY2TMZn8GxbXQ9A71nYc5Ul2vC/rZRSp//EHbfVyx5vkcM+w8i
         KkWmSwC2YCZ6MCpKlgal5NAyh1pKAlaxtWmB6x6/oYZEfpiVeuX44OFxHVpP82rVd6Ln
         8Fn1ORE2hzSOkYKA9j+5PkkC82WHLnOeQqVdZ+aQI+1gDkqz7F0343QxgrI47XjMtFmY
         Cy9C3p5HC/n5PC988wHK38oI2T5YuEFbb+7qw2tWOLI3iqGwVYD9PirVaSfIkgDVAJRQ
         7r4q5CtrcpM9CyK43cb5hRyMRAcIrtVwUHoWV0v54adrVdM7/njAd5w6jkpViWAn+bY1
         88wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334305; x=1719939105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBsl83KViobbjzgTpYKSwJCRy5tn48PEO/PrLb9sWCk=;
        b=ixmnLxUaUsibW0h23Tq9+JNDlCD5YlcCewh2NGhohoGCx8MC6ZgQI7mw88t4Q5AYBo
         k9ACioPy/pHOU8GWrRGmclVtLQcKg246a7YiPi9Q1Xu8lZ+A/URMrPTX8s6WuhNrZmrm
         SzNxnSfotSmboSIMmDip0SB849Qkeq3mH6rkHxfzowVxgA+W1iqqGk8Rh09ASIwKxDoi
         o9SIpAUswjb6nMvxtmglVgbO8rzF7Kg4L/+rzK1G+Ngp20MW41wzUQ9VpQTiqjWVoIPS
         plCwd+TsIHzV5B0DOtyJQ48SUlPNVg544bT+CgVRb7EwPRME3CcY+tJpmyAL/cETMEZ/
         80wg==
X-Forwarded-Encrypted: i=1; AJvYcCVrB3IRf9/K++0B2Q5ufNNRlw0fgo1TpCm1ESiQaLHqS2758HUJXz9I3hQOiWmJGZPcnhXAc8Z2bAp3QtojOwRYkY+wvX9ADNqrnoXrxw7k
X-Gm-Message-State: AOJu0Yxfd2Wx/Kv2SY4yGnENpADREqZaLRAruogUK8c91FgSQ0/UYLWR
	o7f9AV55b8Kw71ZDJRz36j2v5yWqxKGepTSZbaYgJPhq56rvoY2NwlWnfqIfwuU=
X-Google-Smtp-Source: AGHT+IE/pbTAB9T+wN/dOZUlkETZhHUJOt2kPyOUdL0NwwoaoK2tmhf6yg+9Yyrto16N7uIezKnTqw==
X-Received: by 2002:a17:90a:34cb:b0:2bf:c6fb:ec34 with SMTP id 98e67ed59e1d1-2c85819f561mr7071899a91.8.1719334305291;
        Tue, 25 Jun 2024 09:51:45 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a623a3sm8991226a91.5.2024.06.25.09.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:51:44 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf defines
Date: Tue, 25 Jun 2024 09:51:21 -0700
Message-Id: <20240625165121.2160354-3-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625165121.2160354-1-evan@rivosinc.com>
References: <20240625165121.2160354-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_095146_352896_9AF05201 
X-CRM114-Status: GOOD (  21.99  )
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

In preparation for misaligned vector performance hwprobe keys, rename
the hwprobe key values associated with misaligned scalar accesses to
include the term SCALAR.

Signed-off-by: Evan Green <evan@rivosinc.com>

---

Changes in v2:
 - Added patch to rename misaligned perf key values (Palmer)

 Documentation/arch/riscv/hwprobe.rst       | 20 ++++++++++----------
 arch/riscv/include/uapi/asm/hwprobe.h      | 10 +++++-----
 arch/riscv/kernel/sys_hwprobe.c            | 10 +++++-----
 arch/riscv/kernel/traps_misaligned.c       |  6 +++---
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++++------
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c9f570b1ab60..83f7f3c1347f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -215,22 +215,22 @@ The following keys are defined:
   the performance of misaligned scalar word accesses on the selected set of
   processors.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
-    accesses is unknown.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performance of
+    misaligned accesses is unknown.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned accesses are
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned word accesses are
-    slower than equivalent byte accesses.  Misaligned accesses may be supported
-    directly in hardware, or trapped and emulated by software.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned word accesses
+    are slower than equivalent byte accesses.  Misaligned accesses may be
+    supported directly in hardware, or trapped and emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned word accesses are
-    faster than equivalent byte accesses.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned word accesses
+    are faster than equivalent byte accesses.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
-    not supported at all and will generate a misaligned address fault.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misaligned accesses
+    are not supported at all and will generate a misaligned address fault.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 22073533cea8..e11684d8ae1c 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -66,11 +66,11 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
 #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
-#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	0
-#define		RISCV_HWPROBE_MISALIGNED_EMULATED	1
-#define		RISCV_HWPROBE_MISALIGNED_SLOW		2
-#define		RISCV_HWPROBE_MISALIGNED_FAST		3
-#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	4
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN		0
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED	1
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW		2
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
 #define		RISCV_HWPROBE_MISALIGNED_MASK		7
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	7
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 991ceba67717..fbf952e7383e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -170,13 +170,13 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
 			perf = this_perf;
 
 		if (perf != this_perf) {
-			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+			perf = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 			break;
 		}
 	}
 
 	if (perf == -1ULL)
-		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+		return RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 
 	return perf;
 }
@@ -184,12 +184,12 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
 	if (IS_ENABLED(CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS))
-		return RISCV_HWPROBE_MISALIGNED_FAST;
+		return RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
 
 	if (IS_ENABLED(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS) && unaligned_ctl_available())
-		return RISCV_HWPROBE_MISALIGNED_EMULATED;
+		return RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
 
-	return RISCV_HWPROBE_MISALIGNED_SLOW;
+	return RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
 }
 #endif
 
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..192cd5603e95 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -338,7 +338,7 @@ int handle_misaligned_load(struct pt_regs *regs)
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
 #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
-	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_EMULATED;
+	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
 #endif
 
 	if (!unaligned_enabled)
@@ -532,13 +532,13 @@ static bool check_unaligned_access_emulated(int cpu)
 	unsigned long tmp_var, tmp_val;
 	bool misaligned_emu_detected;
 
-	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
+	*mas_ptr = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
 
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
+	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED);
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
 	 * CPUS uses emulated misaligned access at boot time. If that changed
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index a9a6bcb02acf..160628a2116d 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -34,9 +34,9 @@ static int check_unaligned_access(void *param)
 	struct page *page = param;
 	void *dst;
 	void *src;
-	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
+	long speed = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
 
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
 		return 0;
 
 	/* Make an unaligned destination buffer. */
@@ -95,14 +95,14 @@ static int check_unaligned_access(void *param)
 	}
 
 	if (word_cycles < byte_cycles)
-		speed = RISCV_HWPROBE_MISALIGNED_FAST;
+		speed = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
 
 	ratio = div_u64((byte_cycles * 100), word_cycles);
 	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
 		cpu,
 		ratio / 100,
 		ratio % 100,
-		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
+		(speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST) ? "fast" : "slow");
 
 	per_cpu(misaligned_access_speed, cpu) = speed;
 
@@ -110,7 +110,7 @@ static int check_unaligned_access(void *param)
 	 * Set the value of fast_misaligned_access of a CPU. These operations
 	 * are atomic to avoid race conditions.
 	 */
-	if (speed == RISCV_HWPROBE_MISALIGNED_FAST)
+	if (speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST)
 		cpumask_set_cpu(cpu, &fast_misaligned_access);
 	else
 		cpumask_clear_cpu(cpu, &fast_misaligned_access);
@@ -188,7 +188,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	static struct page *buf;
 
 	/* We are already set since the last check */
-	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
 		goto exit;
 
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
