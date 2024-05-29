Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A412DC25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bXeXD1FTBmMfgbyx5g7GCNgtX/UMbYN/K2NCncmMJmk=; b=o74TsRdU1Wwmu2
	OitA/TYkf2qSHDIquucYu7v2heOGa8Sg+7DU21iblYNnk4NLif9xafSwvmJQ3Qqwv+NJbI0ix0VvP
	Shi+MF0roSJnP23rt4IP+Ju9dxWveHElDnxvEW0QTsL7yniFuGs20DVeVGH+GbZQ3Z6v0pEXqo9X5
	q3Gmxv7fYo/vD+v6qYQOfFC3FwiS9fKYnESJfVIdOJ18pFsdcMRXI80f6TycagufQ6tw5cLy+o0DT
	GXNTnfrpimtj4PwqyRScv10jqQ003EIbv8vQAEs6l41Dd6Drjn0DXXPUINWWWg5CXV+Y3ujp0FQtw
	tXLgLeBrt2zG8NSRiduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCO0s-00000005CsB-3PpJ;
	Wed, 29 May 2024 18:27:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCO0p-00000005CqC-2tU1
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:27:01 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f44b441b08so647955ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717007215; x=1717612015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wV+9Ayl5aIwRvmUk+4xjSCYb53pq5UWCKjYVecZ6q8o=;
        b=qO/plJ6q0oeMMDKob4nNdAagz2xpqJ/rUEt2xLjVtqlPuYgo4NYvx7to2aXHiovehb
         jL1NT9KYqj4Ktp+kNHegSuUg9O9q0YiDqS5Cmu5yZiYjHkzsTUiVJGwG2v2ybbLKOBwN
         /Xchey85FAxn4V05LqvvssqixdNayfFc1p7xeeXwXA+kCbjSPSvcGJcx6P4ZYQiJVwyw
         UCl7xS9SgVpnoqK+lP0prG4ywH2/AXDXNDxHwDRba21G8Vn8TZ8ylSX5B5G81M7Toy/H
         DdirbIvVvHhshEDaWqnpYmPUuYSdjfmtK2w2Sqn33AbhQMpveP4FU+vC2ffZ2fCPXxty
         qcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717007215; x=1717612015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wV+9Ayl5aIwRvmUk+4xjSCYb53pq5UWCKjYVecZ6q8o=;
        b=ZGNmSTi7MGxtFvodWlvutk9j0R9etvX+2kiaISd6vuKBVh5ZfljR0PzZZaocad5wZy
         Qve+jhzQj48yOdFQXHcPB+uvXpMxO+Pi94W1FDO822Bp4JkdfO9Baz/zTy90vv3XDbud
         FraE/eStQArBor/yZ0QokTIZIym3MdNAW2qSAEqmJk68+r/gA7+B+rfkeIHu35eaF3GB
         uXA54121LHsUnXEGWipFaeaVfYAhKnYJ9dRldbnU5bjbEafkq4ehso7W0WK5CAJ8pbfZ
         8lLKhumLPbuoKwygrh0tMKhLfbYFQHp3bQyeGCRfa+xmCBbBIr1mxr7HBTWy7P6lgubD
         RTIg==
X-Forwarded-Encrypted: i=1; AJvYcCUiUdNoqPJCMJDoLVQ+2PrX+B9o5DSjGae62zPwnuaY2sX6mFBint/zztmmCwpJNl2KbHlaA6E63xrXzJhhXYXZqi+EKU1Z9vFNYT8wE5RB
X-Gm-Message-State: AOJu0YwOqQPdu004jBdHkz420trXponKi9zwbKLj8HnGTvzKlmkJ5gvy
	nwhB7ZZmMOERRFJsLDwdGbsIP8duMgUkhR5rD0IdpeomTSsLzPZX/PJnmb67CrofW3xXo21I4p+
	j
X-Google-Smtp-Source: AGHT+IHRDxLd9IHo/dFmgMfsngSBbOAxErYqY9dIxF6DeOkxqEZJH9H0vaoSPZZqTHcOxtdRx28xqg==
X-Received: by 2002:a17:902:f645:b0:1f4:5278:5c19 with SMTP id d9443c01a7336-1f4527863e0mr151718295ad.49.1717007215144;
        Wed, 29 May 2024 11:26:55 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c96f67fsm102981055ad.154.2024.05.29.11.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:26:54 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
Date: Wed, 29 May 2024 11:26:48 -0700
Message-Id: <20240529182649.2635123-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_112659_758100_434899D4 
X-CRM114-Status: GOOD (  16.65  )
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
have already come to rely on the broken behavior.

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
Signed-off-by: Evan Green <evan@rivosinc.com>

---


Note: Yangyu also has a fix out for this issue at [1]. That fix is much
tidier, but comes with the slight risk that some very broken userspace
application may break now that FAST cpus are not included for the query
of which cpus are SLOW or EMULATED. I wanted to get this fix out so that
we have both as options, and can discuss. These fixes are mutually
exclusive, don't take both.

[1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/

---
 Documentation/arch/riscv/hwprobe.rst  | 8 ++++++--
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 204cd4433af5..616ee372adaf 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -192,8 +192,12 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        d8ab5c78c207 ("Zihintpause is ratified").
 
-* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
-  information about the selected set of processors.
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
+     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
+     classified as a bitmask rather than a value.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
+  performance of misaligned scalar accesses on the selected set of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
     accesses is unknown.
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
index dda76a05420b..bc34e33fef23 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -68,6 +68,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 969ef3d59dbe..c8b7d57eb55e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
+	case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
