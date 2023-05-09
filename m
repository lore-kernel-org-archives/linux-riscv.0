Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADAEC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYWUN742+jrBKv+d7Ti8s1n8JNJmG0+9q2iWV9icUKI=; b=EGaQIN/lx+/E4k
	IS5CHUCI35mMOXY3RfmxC0tw1wiSSDQfJOf+rOUGMtg0Vc94KRUDEBRxMmZwAv2VbkROe/Sg00Lkk
	uhdJAyQwRBmjmAIJx62/sf0dXWyvK6tx70VBQi1qkuZGmmW4uRsTPW1rZLu3acAHhOxEy1UPUt5X1
	GOTjsoVuFJ8PWhGOptTCHdBAqybjTbOYOONuMdqeWLp63EoUVGmvexPwwaLjXAn78ioAS5DZ2ZAqA
	zSN3YO7JTDPrlZ13wVdovU+xu+FGR/odNaUVUCLv4PMXG4JsXfRyXLqXhBK1VEnxGuOAZ+FO84xx3
	oJzY6yZqfZBf+nhpAYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKd6-002sqG-0Y;
	Tue, 09 May 2023 10:31:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKd3-002smc-1z
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aaef97652fso39103005ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628290; x=1686220290;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HI4TRg2cuwYEsvBzmibkE9/BpJFs4hKp38ctSqfVtcI=;
        b=V+hcuVqSf3DOnNLL9zUwE4nn72OzWJhKaI5ymGHd8DnVmthAG5WaVmjgu/966048s6
         VUvhUfxiyeQdOO7ElI3t1hidGZaI19x7wWqA4wGHL1ZNfnBqv/p3iSErW3fxn0zugI1P
         0FoVXf95WCjaZJZZEv/HkhPxCPj+arzTKg5mKBodJM4IfrIjqnYSwKNosXDIFZGmMAO/
         /5TrHdjpjp+IUXiCGW6Pf43nmfCAhMIa2PHU9qNX4eTQGKILlUQLIpMG5ZhjPXtHO9lX
         hBk7xK9LhpN+oG5TgJzNebaHDCQIQ41mM1b4lZ/o0P7W+1PiNynjtZu06GQ4t28jLRkA
         zgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628290; x=1686220290;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HI4TRg2cuwYEsvBzmibkE9/BpJFs4hKp38ctSqfVtcI=;
        b=MOPTEly5Eu6U0XTLoW4L8KI9G+wwPOVlA6b7O4XnLirZCXZDTaCZ6pEhEVCdYoz9Ol
         HtKyFNiNgkcJr/CdBnG6sqxhw3VKci7AZ1JrjXcc2ig3UBiejks/8MY/5U/8eqInkErN
         EXeLJ3lXbN4M8vVm8VEyfEKunOKX3h+Mo0gI8F4bjv6KAq71RH2oShzmTHALZC7U+7Gp
         Z4WTnfm7/Ue5pjl+H/kji0Zo1tPsyEu9PczMyz5AcuwFm4Z2F5tb7WnKmpB8Uzyfwbyi
         WLRpY0F1SlKDZMa8W3HtWfXRtymVFk9H02cTcCEmJfvfH//4V0xeo56PDZau8NEdhkvS
         VdlA==
X-Gm-Message-State: AC+VfDxMqmzCtVoprXxuNe850iTH5huQy1O5GF7zB8ceM6uC7dfuGB5Z
	ju5W0oZ8J6rKOUPZkJsGXhIFFajRgzUs7JbWALQORm8Eu4Xo7XyVp3iq+TqbrO/gTrbTT2/I7Tm
	9zNZFrkFF0/ZJIjzy7yvRJkrCms+XDgkhCV5+Xb0pnGlPXRm5LRcMO53tg3se1Ik1VFT8mKSbWF
	Ir1ejAOo74vBWK
X-Google-Smtp-Source: ACHHUZ4yDs51/jrzt305XFV64RxEA67yxjmxZFxFkfsTsm5LIVITSI6vKK9EGNi++sY/Px+1AIGeog==
X-Received: by 2002:a17:902:b78a:b0:1aa:d9c5:9cd5 with SMTP id e10-20020a170902b78a00b001aad9c59cd5mr13572335pls.11.1683628290049;
        Tue, 09 May 2023 03:31:30 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:29 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v19 03/24] riscv: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_V
Date: Tue,  9 May 2023 10:30:12 +0000
Message-Id: <20230509103033.11285-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033133_664555_4DD4817C 
X-CRM114-Status: GOOD (  14.89  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Probing kernel support for Vector extension is available now.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 Documentation/riscv/hwprobe.rst       | 10 ++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
 arch/riscv/kernel/sys_riscv.c         |  9 +++++++++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..b8755e180fbf 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -53,6 +53,9 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_V`: Support for Vector extension, as
+    defined by verion 1.0 of the RISC-V Vector extension.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
@@ -64,6 +67,13 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+* :c:macro:`RISCV_HWPROBE_KEY_V_EXT_0`: A bitmask containing the extensions
+   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_V`: base
+   system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_V`: The V extension is supported, as defined by
+    version 1.0 of the RISC-V Vector extension manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 78936f4ff513..39df8604fea1 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 5
+#define RISCV_HWPROBE_MAX_KEY 6
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..93a7fd3fd341 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,6 +22,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
 #define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_V	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
@@ -32,6 +33,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
+#define RISCV_HWPROBE_KEY_V_EXT_0	6
+#define		RISCV_HWPROBE_V			(1 << 0)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..6280a7f778b3 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -10,6 +10,7 @@
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
+#include <asm/vector.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
@@ -161,6 +162,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_V;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
@@ -173,6 +175,13 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 
 		break;
 
+	case RISCV_HWPROBE_KEY_V_EXT_0:
+		pair->value = 0;
+		if (has_vector())
+			pair->value |= RISCV_HWPROBE_V;
+
+		break;
+
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 		pair->value = hwprobe_misaligned(cpus);
 		break;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
