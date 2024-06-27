Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B555C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsGY8/uibTOkOIVYHXa92YWDNJz6HUHIp9x3k3A42Bw=; b=YuC0SPLydmd6dj
	YzIqm2jrQs/MsAmldyjyb300aI6kEQpyGyHh1fGL7JnIhlDHUaO1JxrB7hqYkdsGJ7/RNrba9Q+k4
	yKX/s3J8jaoqqfPq+zb+6X6SrgayYq/CAgFmFyXp4kFyAGmcejHdgYk7GCdwxlSdNYDqFdzjCoNFM
	63DzFZHIsWemuhpVkUspY6cGqU+IkFdxkAJ5DT79xbOpmfmqFwWRz+xojCKoR15buIRz3xLFqizkw
	CcCZPdNB/phWKhG5+yj95DQtxk53xom0aNTbR5xNDqNoW69U3X8ct7hNWObwRqoBb47xPyNSqH33Q
	wnke0qzZyz8bMtG1CxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMspu-0000000BBgq-25pp;
	Thu, 27 Jun 2024 17:23:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMspr-0000000BBf3-3zU4
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:23:05 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7066a4a611dso4066399b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719508983; x=1720113783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBy/I5g30Afg6Ip53Uvr05h0yboT8uG6AlPNhdgJavA=;
        b=SJ6/ns6iBZIQ+EAZa2+GtV7Y/quiMZ5EwRBxWhpnNJnME8wuxh3J+9xxtZxCQjN0CK
         ekq7TiZxM+W9/T8rSn4YTot+t4cdNCbSy7Wct4yXM5UAhH235GsJBD+WNn+JDtqGHHrP
         UPIYuC/aui6xLoOwhEjafnqZRhuKHuxOSgKPFzCXsd2lH8CXqNfVW373SQvfNuJ/tT9G
         eAx+/rqAr77ZWGF4l4jCnLoSG+A1ybffJg/1T9GkYkqqLQhI7uVhJZ2K+IuZwX6O/wPr
         Vr5yK2osePpzzpsB06szkIDe7gatB+oDxov9000GWG2c5gKeDLwYv88yRiI1fCNaCoZD
         5BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508983; x=1720113783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBy/I5g30Afg6Ip53Uvr05h0yboT8uG6AlPNhdgJavA=;
        b=dgFzr4fO8DkL9Vv+9nKysJnbQkJNlQ+xn8Iso2S54wD86XcVSJHIeke37eFZA3ljnC
         cnfsUsNpjIJg0CeXtbbfOU4vkFPCGVBCqaONeEjQwbCxL3oiKlKV8UubfEXlP0t/Ssjp
         uzoqrG/rtX4wdG1iYn/yXfjdKo9ieAmMeqI6IDHGJolE4THX54kxVZlRILafxUWOCUCv
         WgonzTJF/m7pMJP4rjoakqjuODieHMRP1xoLgg2KVyklkq3kixS5/X05/AiG/iAXBc8x
         FtJodrbxO3oc2KDVEAMCG/B25+1OGKU6TPRQu9jyeTBZN6uhPIYhB/XdQo+vKPbIPgBW
         F07w==
X-Forwarded-Encrypted: i=1; AJvYcCX0PYT6x/BYjBisKjU5fg8Ri8DWHwGDOePbR8HLmYEfRFgJffJ463WbeNGNUMQ0VjgM3R3MFQx4jsz87iDbIrIdBeK7jOXg6gFeiv7ifa5D
X-Gm-Message-State: AOJu0YyZPNxFW7JUL9o9mS1XmWRJ80vlECUdx8cZTiKiDZVCVuA+tmqe
	jkk2y3HqF4J1zvrv1Yjdt6iAzV2zThQEvUrAxmzlBSX7GvGOVAtTVEWB3tIuRMc=
X-Google-Smtp-Source: AGHT+IHNzwD75G4DCcfJ5H0IAezjiX7N7H3o7hyu24co/DPv8hD7Ygm2LVOFxEE4oALKKKYJb0dY1A==
X-Received: by 2002:a05:6a00:1d1d:b0:706:61cc:577f with SMTP id d2e1a72fcca58-70674548227mr16032428b3a.3.1719508982671;
        Thu, 27 Jun 2024 10:23:02 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a58847sm1617843b3a.186.2024.06.27.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:23:02 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf defines
Date: Thu, 27 Jun 2024 10:22:38 -0700
Message-Id: <20240627172238.2460840-3-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627172238.2460840-1-evan@rivosinc.com>
References: <20240627172238.2460840-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_102304_020544_9E303951 
X-CRM114-Status: GOOD (  22.33  )
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
include the term SCALAR. Leave the old defines in place to maintain
source compatibility.

This change is intended to be a functional no-op.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

---

Changes in v3:
 - Leave the old defines in place (Conor, Palmer)

Changes in v2:
 - Added patch to rename misaligned perf key values (Palmer)

 Documentation/arch/riscv/hwprobe.rst       | 14 +++++++-------
 arch/riscv/include/uapi/asm/hwprobe.h      |  5 +++++
 arch/riscv/kernel/sys_hwprobe.c            | 10 +++++-----
 arch/riscv/kernel/traps_misaligned.c       |  6 +++---
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++++------
 5 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 7121a00a8464..0d14e9d83a78 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -243,23 +243,23 @@ The following keys are defined:
   the performance of misaligned scalar native word accesses on the selected set
   of processors.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
-    accesses is unknown.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performance of
+    misaligned accesses is unknown.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned accesses are
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned native word
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned native word
     sized accesses are slower than the equivalent quantity of byte accesses.
     Misaligned accesses may be supported directly in hardware, or trapped and
     emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned native word
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned native word
     sized accesses are faster than the equivalent quantity of byte accesses.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
-    not supported at all and will generate a misaligned address fault.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misaligned accesses
+    are not supported at all and will generate a misaligned address fault.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 7ebb2f2cc4cf..bcb2d91241d5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -80,6 +80,11 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	7
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN		0
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED	1
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW		2
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
+#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index b18639020c61..d5541f6c843e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -176,13 +176,13 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
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
@@ -190,12 +190,12 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
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
