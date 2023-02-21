Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD43C64ED9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7RPQLlI1+YDAxT1ZdJQK0our+dfrzbJ/L+O+jfcmtY=; b=eLL8z/BKrX3P0L
	uINkOKKt+dHWAa6BFZOxUepH9xR3E6vYg5AAINBXCnva4Sy5xaExeU3GqJfmMg34/M+okVOqupCDz
	Jl6/GFsU1ud9cTYmCnVxJ10XQkiUz+jDVSGEE81RyvoWVX8ZrXLKHRFbjyEGL2MEyDtUmz9rkrAej
	wJzjpLzNU5H/wcJWN54W3gy2DLCF656M40zktQrxV+1DzVDv0FcuTG/DuhI6Sq+lioCz4VS9H+p4b
	44Sln88Wc25Hr639QR/0D5Br8pQWFSdogvODHOYKjwI27uVuhgUQuBAHpRUvjabqCtI8Hf7kTTIqI
	lnRW1AMfrFKAOKvkCrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ39-009fmR-Ao; Tue, 21 Feb 2023 20:15:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY15-009Uw7-Jj
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id z10so3035995ple.6
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7/hoqMIAepRETH3jO107eIeJ+UfvD3eJMNfG127+yc=;
        b=ML/TqptG2y+VNZ2s/uAwCExQP7/61kxgdFtDZ8nEq3wGRDEc91VdXGlefahRUf+5Ev
         D5bFiGPuRxXvq9M/OSE55rY7CFBgzaxJVRtT9+py7Pc7cumJvItPTNJ/4BiGcKB84xKG
         K4WRVNELN9VHiSRbrqxnlpC7ffrBBrKfm3jMVlb4b9sATIkqgm/Wx5MlTmuotddpmRXa
         S77iJPdrZqZeC86zfBY7ahCJ+ny1Jj+utqMW8rQjIehGx2eo5QX2S6H2jSJTrwDYZDNp
         +3znT9hpdypBkXtX+sBYzU6Yywt8GM/ynhJBMJXRPoH2gkhEYk7iOImshHWzdxTykrFN
         BvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7/hoqMIAepRETH3jO107eIeJ+UfvD3eJMNfG127+yc=;
        b=FBwPip2Y+H1uaCeC59G9oL8mC8PLKqLp9YBvrXnfdR1X8yIc02h8uCLDiulStMfntI
         O+tvvpPSsZkHAHVKFZIXrMtgQQJxc378A3n/97YU+NAXGGakYjzFrWmKGRFGfLS62yYN
         bEd4CDVfCSifErP78jM6+J84NejqVh8BNgMEl0F9+gZkkg1P7PUAAhiyMohRGQztiUC9
         RJ98vmMc72DHJwf7qM8REmRrB9TiJjmdtVVu225wdScRoGryY+buKdWqEXdV3eivxTOm
         2seJlGcFKu/sAikoL1S911y+tj1CccyUeBjtJYyFc9BOTZiT2Ntxz3uI/zJ11AgyeYad
         4Yog==
X-Gm-Message-State: AO0yUKUyYzGknzGAKG22Zk6xIVziJRdNVutksQTqRLGvk/D4iWpDQB4a
	9/GGJp+vx9Fa5VtKQcj47okiKw==
X-Google-Smtp-Source: AK7set982kHyTiT0GJPk7lv5utET6rOdXXqJdN+FNbr7Y9VXQETYIeB8bJZmgEP2rHoVE/dpxgWkBg==
X-Received: by 2002:a17:902:ecc1:b0:19a:8680:ba86 with SMTP id a1-20020a170902ecc100b0019a8680ba86mr6821900plh.50.1677006569611;
        Tue, 21 Feb 2023 11:09:29 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:29 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	slewis@rivosinc.com,
	vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/7] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date: Tue, 21 Feb 2023 11:08:54 -0800
Message-Id: <20230221190858.3159617-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221190858.3159617-1-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110931_708236_3C27E4E2 
X-CRM114-Status: GOOD (  18.40  )
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
---

Changes in v3:
 - Refactored base ISA behavior probe to allow kernel probing as well,
   in prep for vDSO data initialization.
 - Fixed doc warnings in IMA text list, use :c:macro:.

 Documentation/riscv/hwprobe.rst       | 21 +++++++++++++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  5 +++++
 arch/riscv/kernel/sys_riscv.c         | 20 ++++++++++++++++++++
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 88b015a2026e..9f2da414fbf8 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -37,3 +37,24 @@ The following keys are defined:
   defined by the RISC-V privileged architecture specification.
 * :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
   defined by the RISC-V privileged architecture specification.
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
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
+  that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
+  base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_FD`: The F and D extensions are supported, as
+    defined by commit cd20cee ("FMIN/FMAX now implement
+    minimumNumber/maximumNumber, not minNum/maxNum") of the RISC-V ISA manual.
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
index 02c2f1f7417e..f2b224550923 100644
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
@@ -124,6 +125,25 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
