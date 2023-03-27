Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A4C77B62
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8Aq58BBLicdEMFkus6f4zqU7DZ48vII8CDkzTvlSnY=; b=D3Bb0ppUGWXwM8
	bp0QLpN5POD1SoMivo0BIpPwRFHfujMSxHTsZyCbm3mhVIBgFAFcjl9muZFac8IMqgAJXHNd97fh7
	+o6IW4xVaRPzfG4DpS6IuZdXHbbEkTjvKp8B9V0lbMqio93PXho2hiKJN/4YgIsYlIWnb0MfLX07i
	thX5RDWJOJxpUhOSAqKUqPlGVKr7DlYUXu/yyp4ueY0o1gvIGirmS39Nyr8IkHlNmZItwcaqQteQH
	Ndemt30lR33CHFMp1+4qQeKvdNTJNqxVgo4RWGfIu/s63c6asYLiYO2Hp2HFCeOoEp9az+z6aF2kM
	AvQQH78tEMW5VDCuo45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgplk-00BiU8-22;
	Mon, 27 Mar 2023 16:32:28 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpli-00BiSC-1I
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:32:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so9478497pjz.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679934745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DS7/SOsXai4Z1GKznU9FqGZtfi0arBEE5QT+dGbkbBE=;
        b=3lMM3H8U18ZqUbaeF2VJRt0lHe7jyqdRt37VFG5QO2VrYaw8TBsbbgAiIX12YxDlxl
         REAoc3qfyltvjObTtNm8Zzd5zMmT65U9utSxdOO6yJWzGvjnD2IKq9WtNkDq4I3TkSEb
         lg2XTMMR6QYYh85ZN2xD9Q1WyTQ1nNvDwNiE00WrFI25lDU8xOw0l6MKR9PW8OqemJKa
         JuOAqmnvJIa6aMNFJnZ29YIfezY3Tx3BW1NAsy/kyYdwqAHqNPvrt+YSW6WdplM2YxJS
         NYmZUwF9OFQ4cX41uS9kM/3qo8UfPoWDNw+XLURqvvvLZGZU/O/k7E70urDAOCXa74am
         ajGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679934745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DS7/SOsXai4Z1GKznU9FqGZtfi0arBEE5QT+dGbkbBE=;
        b=Qp+Pd5Yzzsmiv0+eknKSrv0ikrxhVesKR2p+tbxCskEfD2h8DIUHlSU9uVDze1+0N1
         eFXU1pIimtZ/ZjXL8HszeHmBWICYal+BmCpJAtCHn74ocRpmfgtBfUWg2I9ZBM6wMaiJ
         Yuh2DYvYpIfmuk0YkbFbPQTbKy33MNXt0gt9uYYG5UTJtyLaJMzQeX7jK5EAMPBOh/hG
         54QR02+IqMPLwibUZlzAClZyh594jZUOz7MoMoRiYrdI+kKLDD0Ix1sNND3NsWvcsJum
         M+/FW3pdkeB8lX4YAcuyJQYyFWj6kwrQZ6mkeeybZWlsal0VH6VNi5JgwZYT0Pfu/99G
         SnOg==
X-Gm-Message-State: AAQBX9f8ODo3nbZKSgz233K1kmlkTC94ornat7KwIkUNg/ROeaLAgyq0
	Y83fG21aZl0I0gj+tdBqbIKeoQ==
X-Google-Smtp-Source: AKy350Z6lmWh84+PK+zp0auYZJ6hFzt64IzvMQMXjMMnQ1plLYt7qTpC7cqYDdnYX4Y4tnRTo4K85A==
X-Received: by 2002:a17:903:94:b0:1a1:b506:6fe with SMTP id o20-20020a170903009400b001a1b50606femr9617322pld.29.1679934745233;
        Mon, 27 Mar 2023 09:32:25 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id io20-20020a17090312d400b001a1faeac240sm8963524plb.186.2023.03.27.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:32:24 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: slewis@rivosinc.com,
	vineetg@rivosinc.com,
	heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
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
Subject: [PATCH v5 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date: Mon, 27 Mar 2023 09:32:00 -0700
Message-Id: <20230327163203.2918455-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327163203.2918455-1-evan@rivosinc.com>
References: <20230327163203.2918455-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_093226_443337_F69A7640 
X-CRM114-Status: GOOD (  18.11  )
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
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---

Changes in v5:
 - Fixed misuse of ISA_EXT_c as bitmap, changed to use
   riscv_isa_extension_available() (Heiko, Conor)

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
index 981d23457f13..c83218a0db02 100644
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
+		if (riscv_isa_extension_available(NULL, c))
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
