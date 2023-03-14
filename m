Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204DAC74A44
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 18:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUhAOQkz59rAhh8YZ0NtR8fMnr0roH+VxnhpfQlL2KI=; b=xCHsRLuJeKYmxx
	tucPmoAk4oDM6d+sa0tTPyvybuIhrMkKEVbJfBJW18xaa1sKOFMsx9aT8vYkRWpaZWSRKKfuGi18g
	YMpDMHUA4T0vZ09NtMGqfI5g/V/3hrMvqBuTkTFo+Gv12Qi/M8yIxXWOZUD39mxEM8N4GLrkYOT+e
	zq//q3eVSsWBS3N+nDvg33aR/fhPYRK41i1X0SWskyXnfkA5jnrzgYfkpxLK6NoxHU61TOlAXmdPi
	NznrzHYiwImde6LXrYIfdE2hAWCp1/ustNn/k3+MlvdEcZk/E/ezuLxu3cnTGsTL3svQ6ptcrS860
	h2ulAyowMB5rMv2T4o5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9S7-00BCO9-05;
	Tue, 14 Mar 2023 18:32:51 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9S2-00BCKs-21
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 18:32:48 +0000
Received: by mail-pj1-x102a.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso1737328pjf.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 11:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678818763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gg5yhIsRAGMuaeMyFJ06s8c0oFC+MQHoWhWknilX1Q=;
        b=sBtSlB+lZsAsGllgiJ9SAhM2pJxvABPKjHR+PXydOZfl00x7fYbhWEmek9Rl+3Cj/U
         zhtdv1At3d4IKBkkDGSH1nrM6LSJmK5yfjW+MikxAxwAhV1CbOtVLuQX6spjHh2S2c8c
         Dc+00eTZ/QiwzmtgQtwTBap+1T3oNzFhy9y84DMOFYAgtvaEnJCY+ApCe4QtYI1a3wwI
         shLW+59aonY8eqW7atE8CnmCA6TqaQwfnMis3ypnEloX4AD1WeecLhfC8L3VHDEVIToV
         46zBzULSp7/ozEichcyM44IC3dsFCz3KKw3ZdS08bdtgVgq7N1TS3i+70lg1N93iXSv5
         i7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gg5yhIsRAGMuaeMyFJ06s8c0oFC+MQHoWhWknilX1Q=;
        b=tX7ydAxF3fwiurUkjjeMin9O9rxR8TSj9iGQsF+cg5OyjOxoq7o+Pqcce5D4DXT2Jz
         p99UKPB9A9+gCavZeDmJi+zTmKe+P03Wswj6GWO7YhonSKcoIBS8QovLI4BOnEC3SxY3
         qJb1c/Gdx9wjiZIa/sC/AvvSn2cgYxOS3R/T9s3vCSwpvc73T8howgbUYTjrYRljp6e5
         94pwlJjfiezApyqJKnShzZM29jpe2qxJAVEgy2xJF9G/qSkAbimNmpKZXtZaYT1O16Zc
         RacXhuROiAr2awmBJeN8UgJjKnmFakARrXFJcVJ0PzxJu7/Q8c4FYeFihHmCoMH5e5+y
         FeFw==
X-Gm-Message-State: AO0yUKUxpL5MlSBf8rQgaCAOAjAVrxtEPFaxatvsLxOSJB4YBDsnRxt7
	+WJJvysfa6dmlqWMqskMOo9TEFPAtqN/qKIcZTA=
X-Google-Smtp-Source: AK7set9+xqikL2wUga0QqTbqna0f4KaIShGQoOHrfjpuM1uSkcKKKzH0akHZ3/0/gSHEVEyio7wiTg==
X-Received: by 2002:a17:903:1105:b0:19e:6c02:801c with SMTP id n5-20020a170903110500b0019e6c02801cmr48114plh.14.1678818763557;
        Tue, 14 Mar 2023 11:32:43 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id kn3-20020a170903078300b0019d397b0f18sm2072019plb.214.2023.03.14.11.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:32:43 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: slewis@rivosinc.com,
	heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date: Tue, 14 Mar 2023 11:32:17 -0700
Message-Id: <20230314183220.513101-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314183220.513101-1-evan@rivosinc.com>
References: <20230314183220.513101-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_113246_665241_15EB8EB2 
X-CRM114-Status: GOOD (  18.01  )
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

We have an implicit set of base behaviors that userspace depends on,
which are mostly defined in various ISA specifications.

Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v4:
 - More newlines in BASE_BEHAVIOR_IMA documentation (Conor)

Changes in v3:
 - Refactored base ISA behavior probe to allow kernel probing as well,
   in prep for vDSO data initialization.
 - Fixed doc warnings in IMA text list, use :c:macro:.

 Documentation/riscv/hwprobe.rst       | 24 ++++++++++++++++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  5 +++++
 arch/riscv/kernel/sys_riscv.c         | 20 ++++++++++++++++++++
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 211828f706e3..945d44683c40 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -39,3 +39,27 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
   defined by the RISC-V privileged architecture specification.
+
+* :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
+  user-visible behavior that this kernel supports.  The following base user ABIs
+  are defined:
+
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: Support for rv32ima or
+    rv64ima, as defined by version 2.2 of the user ISA and version 1.10 of the
+    privileged ISA, with the following known exceptions (more exceptions may be
+    added, but only if it can be demonstrated that the user ABI is not broken):
+
+    * The :fence.i: instruction cannot be directly executed by userspace
+      programs (it may still be executed in userspace via a
+      kernel-controlled mechanism such as the vDSO).
+
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
+  that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
+  base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_FD`: The F and D extensions are supported, as
+    defined by commit cd20cee ("FMIN/FMAX now implement
+    minimumNumber/maximumNumber, not minNum/maxNum") of the RISC-V ISA manual.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
+    by version 2.2 of the RISC-V ISA manual.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 08d1c3bdd78a..7e52f1e1fe10 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 2
+#define RISCV_HWPROBE_MAX_KEY 4
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 591802047460..fc5665411782 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -20,6 +20,11 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MVENDORID	0
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
+#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
+#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
+#define		RISCV_HWPROBE_IMA_C		(1 << 1)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 981d23457f13..1c118438b1b3 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -9,6 +9,7 @@
 #include <asm/cacheflush.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
+#include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
@@ -125,6 +126,25 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
+	/*
+	 * The kernel already assumes that the base single-letter ISA
+	 * extensions are supported on all harts, and only supports the
+	 * IMA base, so just cheat a bit here and tell that to
+	 * userspace.
+	 */
+	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		break;
+
+	case RISCV_HWPROBE_KEY_IMA_EXT_0:
+		pair->value = 0;
+		if (has_fpu())
+			pair->value |= RISCV_HWPROBE_IMA_FD;
+
+		if (elf_hwcap & RISCV_ISA_EXT_c)
+			pair->value |= RISCV_HWPROBE_IMA_C;
+
+		break;
 
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
