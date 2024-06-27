Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3007C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVKezmzQDcjZdcbdtzUVHKUwdvPTToI9w9AamwXrUtk=; b=gZZCFdmJBlACb2
	2KPM0SWE2DNVvPSlhBKtkGvfLqs5xF0A8BzgleLZXvDFaA4zIl5gyfeHgZvfNeZ6ghZs4ixkeEa5E
	DvsV46r1ZU6dx6SBSeQ1P2+PUp4Z0oNizF5fnS5PZkilepbSrhSeORai2yP2XFgIDsGd/csLu7Cr5
	/yvkQAcxv8yXt2frtWS7XVcGSCGbczZzEmwQwBunNFMndEdAc5nPf77gJp9OZTUJFt+D637w0bjAd
	6cz5lL4g0uFDjSgEQASac7TwSbDBhLhAZF7tjBW7xk0ylUO4qDKzskn4M2IWtQipCpzcHZtbKFen2
	yVUZouDjTC9zm/TrRf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMsps-0000000BBfS-1X8E;
	Thu, 27 Jun 2024 17:23:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMspp-0000000BBcr-23vO
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:23:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-706683e5249so4501286b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719508977; x=1720113777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP7jtD8GMMYgLKsWgQuz0MWj++7gT6SNnVpQZDX9lDo=;
        b=ay5W9+rP3KJny1XojlkBEfwWqRTPIPPuFtDoPTbd1b4CC1kTM96esN1A989r05xU0c
         sDbKZfD60EnXn5euCNbHky8RdBB+TwGXZKMkqCR1MM/rM2rbhxlwLsBd897JATYREXXd
         raDFfNWcS0nI03pPhXjQDHO9cZtkHPaxJmvSU/bJRWL50VoMDWWy2FQS++OqJR4Snjg4
         GJcKmqL6pNAuIt5HQzXXPBY/meg+mRobPl5i4u7Cbv9KTmtSqWJvf21G3GmSYMyhzI9u
         LnWr5gCCu7Fp7rwa3uyQEC9d4EZwl2OvzdsyYbpd66DKLRjN34a56BWzvzUXuR1YoOTe
         dO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508977; x=1720113777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WP7jtD8GMMYgLKsWgQuz0MWj++7gT6SNnVpQZDX9lDo=;
        b=vda0MXSBleukV+1ipjEp52pmY2I1SJOx2beatF8QPHnEXmq5bFNgp6nAg95OtGqdza
         yp3072QgE71IAmHTDdY1LS0BOfNiZJ8E6uuLcv2ESL581cikcwYtqBQiYJ3xPT6kqc7M
         JBUcUSvZliOflcOPj9M3r6IZesbA/2nX8Lgarp2ZqxCdbbnecIlqeoKTnNPyIifs4/0k
         FdVCjY/lQKxr0mGF5oU6BhEoEZYCMJtB0eDkmdHPrvUxV16ZWdxrd2FmjVOH/jqq7V9f
         3WOqCzy2eX5ZZyvbO0F8EiSZUtVIyyLS3Ds4NuTRzyK5RmdSMWl9FTmJpsYJ9Aqr7Wp6
         d8CA==
X-Forwarded-Encrypted: i=1; AJvYcCUGS8hSHeHQQR8ttinkDJl9WBcKvNv9vqPhjAiwt/SDxOtfUnGaU4027PfKlMkJzty3x4tBNEMhZgsez7CJ/5SEB5IdhgRDCfFFqHzlcpIW
X-Gm-Message-State: AOJu0Yz6IPNOqBOX5pjDOwfVE3l3mC4yyM8BzjMUZN3R6l3Rqfs9TzfF
	cFoUaOLoPAXe0PVfzr7DUKfdhGzcW24zGOx8A6cgwL0LBr0rfXOBtOKIJzEqu1s=
X-Google-Smtp-Source: AGHT+IHWlzW7b9dIzeFM1UaPGPNDnj9mj0+synWhNkTAZT9w3SowrsNm8Dr6wgU1vaHYW9dDDvMM4Q==
X-Received: by 2002:a05:6a00:bf0:b0:705:9aac:ffb8 with SMTP id d2e1a72fcca58-70674582b1bmr13224247b3a.9.1719508976537;
        Thu, 27 Jun 2024 10:22:56 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a58847sm1617843b3a.186.2024.06.27.10.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:22:55 -0700 (PDT)
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
Subject: [PATCH v3 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
Date: Thu, 27 Jun 2024 10:22:37 -0700
Message-Id: <20240627172238.2460840-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627172238.2460840-1-evan@rivosinc.com>
References: <20240627172238.2460840-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_102301_558969_37ED8FAF 
X-CRM114-Status: GOOD (  18.22  )
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
index 25d783be2878..7121a00a8464 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -235,8 +235,13 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        c732a4f39a4 ("Zcmop is ratified/1.0").
 
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
@@ -245,12 +250,13 @@ The following keys are defined:
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
index 920fc6a586c9..7ebb2f2cc4cf 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -79,6 +79,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3d1aa13a0bb2..b18639020c61 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
