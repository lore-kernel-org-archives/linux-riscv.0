Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512E8C7EE25
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVvTHMhjiIq8IhKaNtMNcpmPGcTVkulLxaDeCc/wS+w=; b=qEFiO65uLn/0uH
	9DzHf2gjEyBUhuCj9sHx/efMx4dlKODbsEgQURLKEpWooAoTaxouLnBYl66zvgRZdRk8y6260an6l
	j3wFmlTLt4gNg9CD9WaKm2eu1ZFBzzQT+/OnoHZl9BVolpndZWsT5Eaevu6bjTuHT3jBwmSZyCyKb
	/JKgY59WQXEPGnHlsycThSv+htn1egxoxFmk8/2mLmb5bUDYiPsxOMDg2gPBY6TGgU7u5DiSWKLq1
	VKJ4O7wqS+oh5vSERpzrhhjWVviDQkK/n25pqOUmTFp6AXfv+/+1DoCf1BBLM3wUIcX8s9wxR0WGg
	QrZld4L0yiO+1DUOucxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhSf-00De09-01;
	Thu, 18 May 2023 17:30:45 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMh-00DQvk-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:20:32 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso637624b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426829; x=1687018829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UCneMDdINnXxGFonqkgOoODJ+YC49qYwF4COaw1Z14o=;
        b=GUxVbM4pzCCxfmJ1sLQJe45OkM/xPmw8ia4snr3DB9rSBBUbWxqdqg5SGaL3gt8QPN
         BNIPca9Jfoopz4JHgr0zUAv7BuNZE6UkJwsmqwjiehqioQCh2wxQHM2PKymqk9ucIfqE
         61abNkeWmBu+m9qNDu3FgPK+y05UuYLDbz+y+l8CuMwLrMscJ1d8c8kfyXQDct5UooUy
         Swtwk8CLKzJkzePV67fpwq3acbGHNarB3PUhB1Zq4dab2VM43eocYiXeyJe2dqBmcXJx
         YjyZy/gSP6Lvcg5hPqHFdXLOD3ylpmIN+/56R7P0ukMm4/JIshLodNko0ZRdEoWYTTxQ
         4cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426829; x=1687018829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCneMDdINnXxGFonqkgOoODJ+YC49qYwF4COaw1Z14o=;
        b=JF6pR4cH1sYSzeL+A3IRze7LbnYDzzKDkmtRbulCdPKM3kUNZMgSgDVkKFApsIylYL
         m7fR7u64oQIgvXKBt7MvIROAY8OFxiB1p8JxtRzNKdZds40tiag8I9hyKmsOT6rlrDb7
         pFM8ig8HSconWg2lcbJW4rTuRdKy0SttA7gRH7JS69bZJXweO8OXEQetdyiey6EaqvNk
         i6xITuueFtTF8MMsVUJl9+KarxUrw2kNCMyTUfuQzS2yHgwzkwBaLnI7SXHD1pFqW7WC
         4CPd6lY8sjsktgVO61sQCzxwbpr3vPgJy//7elNLzocGrlydB36z0bozexNbIPoBGA1S
         rVdQ==
X-Gm-Message-State: AC+VfDwebGLSnRPVDrCev0t1xNI3WYXpzkRlImOiIC3S7vtoA4bcOhSj
	sMOr1kiBrlI1hJZqwcq87VpPkpnsoJCNKzkC6ubIc/jl0VkZzIIu0H67HwuXhCb6LyMLLXPxpq7
	w4sz+ExvGkl9b1HDzSEBolIa39+Qoq7pXpsiOHAqBvyiueXxeYR/CVZQr2FTLOco2NNZ2XIYrHG
	6Ciqay/dMNcEwp8Sc=
X-Google-Smtp-Source: ACHHUZ4gHnZwEo4v5N/LppQGYlH/FEjfcRk20N94BNcL2iprlv2xnz7gkTmTs7GcCM6dtPmNeMDIqQ==
X-Received: by 2002:aa7:8885:0:b0:643:59ed:5dc9 with SMTP id z5-20020aa78885000000b0064359ed5dc9mr5814862pfe.12.1684426829473;
        Thu, 18 May 2023 09:20:29 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:28 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>
Subject: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing V in RISCV_HWPROBE_KEY_IMA_EXT_0
Date: Thu, 18 May 2023 16:19:26 +0000
Message-Id: <20230518161949.11203-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092031_487261_70C63C0A 
X-CRM114-Status: GOOD (  11.96  )
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

Probing kernel support for Vector extension is available now. This only
add detection for V only. Extenions like Zvfh, Zk are not in this scope.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v20:
 - Fix a typo in document, and remove duplicated probes (Heiko)
 - probe V extension in RISCV_HWPROBE_KEY_IMA_EXT_0 key only (Palmer,
   Evan)
---
 Documentation/riscv/hwprobe.rst       | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..7431d9d01c73 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -64,6 +64,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_IMA_V`: The V extension is supported, as defined by
+    version 1.0 of the RISC-V Vector extension manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..7c6fdcf7ced5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define		RISCV_HWPROBE_IMA_V		(1 << 2)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..88357a848797 100644
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
@@ -171,6 +172,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (riscv_isa_extension_available(NULL, c))
 			pair->value |= RISCV_HWPROBE_IMA_C;
 
+		if (has_vector())
+			pair->value |= RISCV_HWPROBE_IMA_V;
+
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
