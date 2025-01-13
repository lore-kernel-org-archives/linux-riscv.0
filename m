Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA6BE7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7mYpNKJVG3d7A4RaES+DL11FnZ2v/ejGOLcbBtPrlE=; b=A3O34UUg2mvQ5X
	mbauCwyCRq4Ti/AHtQzE/xbvyDM1nG+oVASHgws2jv3htd4RJhkhGrFbTd/UZVLt4Iuu6sJvtE1o5
	VtzWP7SHbtkD7018/K7wGQGbhh8L7bop/eSmN90VK2JYxzr5nCCplrpB2g5lT/ROrJieswFcJilnw
	5z9kuIsFW5+XfaXg21cMb0XyOENMCswfPlNj1LnDyiO1yGb/P1h0FRovI4OTzHXgiyCAKJsHUpmda
	3y28Z3J3YhUQin6M9ptAL9XARDus1xOCXRCE745mFA/rupwXWMc+p4iJ1a0MppHi3vfdEgJiSRfHQ
	mfc93Kht0IGqZUBiRR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFxL-00000004QCo-0ZTl;
	Mon, 13 Jan 2025 08:37:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFxA-00000004Q6l-0g8V
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 08:37:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21675fd60feso91511585ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 00:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736757463; x=1737362263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJXI8b6ff8wiNA8cdLu9hBvsj5PggOwQ7lAxRYtj+CM=;
        b=dXJBp536hm++IdEAuNfn8Rty7cu98BGJ3oK6fVonh6kwTvNeT5FEBpUd08b8GPOz8z
         OXoHVyj9YGQFKEug9Yen0G1gbe/yOBzaVcHhfcRhJJhthe5Ls26SU2OGNcbZyH2LytRD
         5C7rTngCOJvoiyFWe+E52GDyXw0ZcrCjz95fjE9g5MiexBL91P7wLzUcwk5OKRv6CHI8
         /tGTLpcbUQ79UbygyTgUywFNKrssd4lFfsfE7EsyiMw8wod7LRXbgj8cdJ2oo3W9ANpY
         FM7yTharik50wWib4ZvNzDz+Ny2CmpW1gRsyP7f4JV6PxxYQizI2m0qeNmlAjMlKWBcU
         Bxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736757463; x=1737362263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJXI8b6ff8wiNA8cdLu9hBvsj5PggOwQ7lAxRYtj+CM=;
        b=qUKiRtaQCyJx3oLaxNjmfuKIXaqcPPv5fhZPYbclo6ssqm4w1VRFWuoHB8ViJiWRSX
         CNLHpvpv5ElSowOoCYIB1NHL/qzAtMqpyT2g1uh47dzhb9z2+yVjowmKstZUkpMP5QaC
         zMbdOKZBZbZqdvX3Ofsq5MQGINVJH1Gul1Zd3sNYfDQYmNa3JvM8OIeKGAbh2GRhWq/c
         akIzu9TaZqZfXClkhGPGiMIMEQDhQm08qZdUsPsiK/++Qf28JyC2l+gVjFqDmQW8GznC
         APadR0KPRXvKqde08c7V71t5IM6ndqsXYn5FizfedrsAiFnuFHlUk5wT+P2Ndh/dT8Pk
         5P/A==
X-Forwarded-Encrypted: i=1; AJvYcCUt7TGDrJfIvNQzJVBNLzafnJh0qPwIeV+PHpitCFpzKlgl2ytG9UfEWz+uAbA8Gk9N11NvAUqg/0zJ/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDuFZcQ6MEt3EwxZ8c84y2YqkuJST8dhVBTbyOuloq5vzFr1eq
	qlZeh+kvIgHTtc8tvFFzz3Te2QKm0Cak5ouUfeRts5cT94027lximASpYS6NBFo=
X-Gm-Gg: ASbGncuKtovg+VaKhF4RQ3tIYMNeba5iR9iPiPXAl2Eem7hCpz4VFVNx3Me0OnqvfQ7
	50G7L6ry8B1FxRHLCkDPIktuFaaYrnWsXQ69uKcmtYSRBloRbzEWijTg2t+Ux0ooQ4eGDvgOZdc
	VA5cyvUt/1iAAZPOGoICe0t2HwN9Tv6y3SAqGK09yZy8XRDhEJ+R35mGlFg8yGZcFBR2FSjx7gC
	qh7d1dM6EoF3T9KJU/juHiqLUBcyrYxvkXhZJ+HY+SwtZx3OgyHoLTcAA2P0hGqVPGppZ7xzp1W
	36EvIGyheRiu3KA=
X-Google-Smtp-Source: AGHT+IFtz8wCzJ8bWXX/3s5qBZWyQyvLgQzl4lgPk6ejyOwy8z7pnyLJogLi0etOSTCHQkUeGmH/OA==
X-Received: by 2002:a05:6a00:2e97:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-72d21f1ac4emr31951733b3a.3.1736757463405;
        Mon, 13 Jan 2025 00:37:43 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07ceedsm6427433a12.6.2025.01.13.00.37.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 00:37:43 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
Date: Mon, 13 Jan 2025 16:36:34 +0800
Message-Id: <20250113083635.73826-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250113083635.73826-1-cuiyunhui@bytedance.com>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_003744_200262_6C7B9D4A 
X-CRM114-Status: GOOD (  11.40  )
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

Expose Zicbom through hwprobe and also provide a key to extract its
respective block size.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 955fbcd19ce9..7a47cbdbcf8e 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -94,6 +94,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
        ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
+       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
   * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
@@ -273,6 +276,9 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
 
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbom block in bytes.
+
 * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
   represent the highest userspace virtual address usable.
 
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1ce1df6d0ff3..89379f9a2e6e 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 10
+#define RISCV_HWPROBE_MAX_KEY 11
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3af142b99f77..892dd71a3793 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -90,6 +91,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
 #define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
 #define RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF	10
+#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	11
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN		0
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cb93adfffc48..affcc3e58df9 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);
@@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
 			pair->value = riscv_cboz_block_size;
 		break;
+	case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
+		pair->value = 0;
+		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
+			pair->value = riscv_cbom_block_size;
+		break;
 	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
 		pair->value = user_max_virt_addr();
 		break;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
