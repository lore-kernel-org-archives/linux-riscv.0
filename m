Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E99C531DA
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbArEly3r8LXheM9gRRkIz8dFqHfaGTPZsBpLvEtTGw=; b=ngPNq7KxT2gli0
	kPrJEGACngdJzNWwz0yCP30YGWH5ss/yhoHR1RAUzvtad7qFdsRMGJLf4LpgMN4PDKYPDyPAlTK3L
	74mf3qteIi7mN5jEeee1GCwfV39TxbT2RGytNBmxVOLRyYrlr0zGd8IPSgtkhH2MUp8iXZDUt6TQ9
	owrznso7PgVCeiow0nBI/vwJYQX19LafFNC3oGTiBLP58EDAYbwavHW4CNmmwF3GwO3PmFO6UEuuR
	SY8MqsA/YnOlusTbUiMFQqoXokP2xROlaoBSQxhm07CPJtTsHV4m1UAW5D7lu7k0/Fgw1GCaPdAmH
	lxZEii4oB/OVAG9E7ZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXPw-0000000CcGp-0CnQ;
	Fri, 09 Aug 2024 21:45:00 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXPu-0000000CcFz-08HW
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 21:44:59 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso2004714b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723239897; x=1723844697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAMfKx1oQo8YE2iR6NozF/j3f+Ura3BBtPQS5J8as2Q=;
        b=LkY37pvoqzIN9zHCyJaJr7L41FzGQjcfvXzVS+BY9Nl2VjRmau09undzJ/Yd/mljy/
         mSVixSKmkSZCsopiiWB28klhdYzyOssGTJl8oI+OqRiuz08PUFLN58gkiTS4HnnbT6BQ
         3Ajj462yhjWZpuHsvoIjB7M/JH94H9u705TmLwWZeSIpJ72CNDnv+wO/FI4lHuv4anto
         ss6Lg4TLXaWyNh8FtOjW0vZdnNkGZD7vypsZaeMbaiohDD82J2qnrAqUNTNlQI91vQky
         h0cM/YBmOVQheNLTRfxAxJ8k1RQHtDpKEhS20ChCVrh0QGR8CU13adsu0KrC+NHGo9rX
         +g0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723239897; x=1723844697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAMfKx1oQo8YE2iR6NozF/j3f+Ura3BBtPQS5J8as2Q=;
        b=TuxlqX1/EmJcXJLAb7CIrq6qQEIxHyJao9lOXoU2MrV4+KJbJfUnS2bBBT3Ctq/A/b
         wb2AUovGrMH4cvZ4YfMWaLobUthhwQ7MIRRPeRNuODgUf7z6CzFKVuxxZFQSAkjD/bCm
         MadNUHGDgJTxnRIyM73YoxLpYc2gtHAYIt4O9gg/VzUsHMiu1ZWRKqRmS3/F5S7tw0ze
         DSIbhUDlfjdAnWloT5V+67n8JgU9prJEzEiM0COBRDAcw2GAJUqayaO5ce1AU8c+RPzs
         Igq+hPB8jac9KmDmdfxruqXx+YpeK+7/FHbZ9N9MUA2I13lX+uMegfQfG5U22ljoQEr7
         YSPw==
X-Forwarded-Encrypted: i=1; AJvYcCVL3iLUPZ+pNuXjRWsGWMgiIded7DqUyBXslV6T5CySm8LEQBZM+wy91KdSx8lyAViG92Be7kUdQiHenQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTsTsafYnypgLPvknZLswKcpXa7gUOa6VLyrc2wW5QTyJqm+qZ
	gN6o7oiqaWLGNXErboebMbj/oeIVA/BPBVUpKvHVECX3noWJJqYFmdmmQ3H5ZK4=
X-Google-Smtp-Source: AGHT+IETL5ADV1/Vr6Ds8AZje2vtkmmfFXXh7EZ78E33vbBCrTLO+WnE2if/EUwAUCYEUfaHJXsEXw==
X-Received: by 2002:a17:902:e5c1:b0:1fd:acd1:b642 with SMTP id d9443c01a7336-200ae633590mr41893135ad.64.1723239896920;
        Fri, 09 Aug 2024 14:44:56 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7e93fesm2073905ad.43.2024.08.09.14.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:44:56 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
Date: Fri,  9 Aug 2024 14:44:43 -0700
Message-Id: <20240809214444.3257596-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809214444.3257596-1-evan@rivosinc.com>
References: <20240809214444.3257596-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_144458_097839_3D23378B 
X-CRM114-Status: GOOD (  18.65  )
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

Changes in v4:
 - Rebased

Changes in v3:
 - Further documentation wordsmithing (Conor)

Changes in v2:
 - Clarified the distinction of slow and fast refers to misaligned word
   accesses. Previously it just said misaligned accesses, leaving it
   ambiguous as to which type of access was measured.
 - Removed shifts in values (Andrew)
 - Renamed key to RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (Palmer)

 Documentation/arch/riscv/hwprobe.rst  | 20 +++++++++++++-------
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3db60a0911df..a994eed75bde 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -239,8 +239,13 @@ The following keys are defined:
        ratified in commit 98918c844281 ("Merge pull request #1217 from
        riscv/zawrs") of riscv-isa-manual.
 
-* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
-  information about the selected set of processors.
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
+     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
+     mistakenly classified as a bitmask rather than a value.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value describing
+  the performance of misaligned scalar native word accesses on the selected set
+  of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
     accesses is unknown.
@@ -249,12 +254,13 @@ The following keys are defined:
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
-    than equivalent byte accesses.  Misaligned accesses may be supported
-    directly in hardware, or trapped and emulated by software.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned native word
+    sized accesses are slower than the equivalent quantity of byte accesses.
+    Misaligned accesses may be supported directly in hardware, or trapped and
+    emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
-    than equivalent byte accesses.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned native word
+    sized accesses are faster than the equivalent quantity of byte accesses.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index ef01c182af2b..ffb9484531af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 8
+#define RISCV_HWPROBE_MAX_KEY 9
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b706c8e47b02..635753084275 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
 #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
+#define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	9
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8d1b5c35d2a7..2d0f4f6a32c3 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -225,6 +225,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
