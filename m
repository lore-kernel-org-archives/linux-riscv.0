Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A460C48286
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CRzhC02Z6EPU9eAusR/aRYQTcQ6wXxCoeIjrLbjrew=; b=hFa6Jbd7Po7MsH
	Ob9HDQq4gM9/XhnZOx11xMSD6HP6LJvIoKlWz+oQpP3EXfnn7DEBx3rVA2GVv/rKEEcv5yBfrg1qC
	biOxVX3sUHvmNo8ef+/ekZbkHMtqNq15Demlkjb4+St83/30SHch0TZY0893xixPgni0/I5KxNc2Y
	Lba9K6m3dvy28pE4mK91Ntr30lmkhOKAmNNQwTkIDrLWQUlKDsfX+wr7s3q6xcwnijCakqlxm4R3E
	jM99e03YfsxxNO8ZSCW6aKAebDC2vrAF10+8BjbLAlq3s0DB6lsuaIQPehFYZqA7Zg/GBPJd7Sk/S
	9a4UCTuNeJvK4lhHOWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUz4L-000000016MZ-3UI7;
	Wed, 31 Jan 2024 01:07:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUz4H-000000016IQ-350D
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 01:07:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d746ce7d13so38369865ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 17:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706663225; x=1707268025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISQ44kMse6Lkn35EK9G7PdGD5a4TdSkkmzrVy/QiW8Y=;
        b=0+4M1xD5vc+me6BzR1DmkIoBkeJURd7xzfNDkLQqNEHz4TAZIQRCIFx64F1Hng6hpB
         FZwcYwU6Iz3X5RhHW3bnhMQVJ79su8jfCgvnpppQ6apN/yg/Ef2a8SVyniQU9mtU5X/d
         afXVEONoaF7FT6iNzSmSwWG10DGPhGyxgssDq6ALgujYvGLAfaSxqfKyMSktFqT3P1F8
         ExAxs4ha4ssMSKa0VmJ9Vq0p536iz9KPIvL19sbCCRs1Gtfna8AFxzf5CQAgs7ioAzju
         HTGHmSWku0J3x9qQrnq5c29g741ys8D5qKPyroUL0wZoSTKO7WyQH4VTrNFwbCcJORgY
         6u9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706663225; x=1707268025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISQ44kMse6Lkn35EK9G7PdGD5a4TdSkkmzrVy/QiW8Y=;
        b=gog58wAYijb3fIKkrFuWg/6BQEUw/5pDXvqQoLiO6yqCfZV72lH92459nwC7hO/eGw
         wrsd6pP7U/Cau62sWDawdh5g098V2cEeszbOSXE/mTY4ZulQRvRav7Mk+IWVLfX6XdYk
         jt+hHHn7UtaHjsu9kui1G4l8CWWpxoM9bvyuYFHE89aNiJZ9SifA25SZS9YgEzQ7arbK
         OrHWjLwftCpMdBDGXCFcqGBrgB5vfBY3o5XdcMiO+i0/0PoWALmUNXO4B7n42Q4zAch+
         pR5nLnlOlfAEPMAeImkhzhKc8zUXCRYe+KpnJiyg3GRSaCWVrAiFIz5SQ4HaTVRoGt7+
         5ZrQ==
X-Gm-Message-State: AOJu0YypAz+scdxxNR6ENuci4+41LxDqg+4LYbGBHcmTkB4ojC+jpeMD
	jbzDB2U7Bl1vDoDQpIDGOLYUYdGYmO48nPHkpjrFxAAALpjCp0G3Y0vWTCV6H4I=
X-Google-Smtp-Source: AGHT+IF1fmnX78HPUX7rmBRccz3fIS+KOj7NE7osYGz6T48qtTIbzBRbCpuh11u5YSinOA7TvL7pUg==
X-Received: by 2002:a17:902:d891:b0:1d5:36e8:9ac0 with SMTP id b17-20020a170902d89100b001d536e89ac0mr323253plz.50.1706663225597;
        Tue, 30 Jan 2024 17:07:05 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r12-20020a170903410c00b001d8d3c276c4sm4970822pld.35.2024.01.30.17.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 17:07:05 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 30 Jan 2024 17:07:00 -0800
Subject: [PATCH v3 1/3] riscv: mm: Use hint address in mmap if available
MIME-Version: 1.0
Message-Id: <20240130-use_mmap_hint_address-v3-1-8a655cfa8bcb@rivosinc.com>
References: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706663222; l=3095;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=3agc++PZjt4adgBO71Cp8EyaaOma0q0miHLEwYoM4tM=;
 b=AIKMSezNvXcphAUCcNCg21BBdaXUpcacXo54uEbl2OdGKMHckPpGf4N0pTfpvOAZ+GZExeI6t
 yXu3KlulVP2CvsGt2kGidzgw5nA924NJE/B8ZORdKYgHBzunKKkQbuk
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_170709_817117_1E4C9FF6 
X-CRM114-Status: GOOD (  15.85  )
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

On riscv it is guaranteed that the address returned by mmap is less than
the hint address. Allow mmap to return an address all the way up to
addr, if provided, rather than just up to the lower address space.

This provides a performance benefit as well, allowing mmap to exit after
checking that the address is in range rather than searching for a valid
address.

It is possible to provide an address that uses at most the same number
of bits, however it is significantly more computationally expensive to
provide that number rather than setting the max to be the hint address.
There is the instruction clz/clzw in Zbb that returns the highest set bit
which could be used to performantly implement this, but it would still
be slower than the current implementation. At worst case, half of the
address would not be able to be allocated when a hint address is
provided.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..8ece7a8f0e18 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,22 +14,16 @@
 
 #include <asm/ptrace.h>
 
-#ifdef CONFIG_64BIT
-#define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
-#define STACK_TOP_MAX		TASK_SIZE_64
-
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 ||					\
+	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+	    ((_addr + len) > BIT(VA_BITS - 1)))			\
 		mmap_end = STACK_TOP_MAX;			\
-	else if ((_addr) >= VA_USER_SV57)			\
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_end = VA_USER_SV48;			\
 	else							\
-		mmap_end = VA_USER_SV39;			\
+		mmap_end = (_addr + len);			\
 	mmap_end;						\
 })
 
@@ -39,17 +33,18 @@
 	typeof(addr) _addr = (addr);				\
 	typeof(base) _base = (base);				\
 	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 ||					\
+	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
+	    ((_addr + len) > BIT(VA_BITS - 1)))			\
 		mmap_base = (_base);				\
-	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
-		mmap_base = VA_USER_SV57 - rnd_gap;		\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
-		mmap_base = VA_USER_SV48 - rnd_gap;		\
 	else							\
-		mmap_base = VA_USER_SV39 - rnd_gap;		\
+		mmap_base = (_addr + len) - rnd_gap;		\
 	mmap_base;						\
 })
 
+#ifdef CONFIG_64BIT
+#define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
+#define STACK_TOP_MAX		TASK_SIZE_64
 #else
 #define DEFAULT_MAP_WINDOW	TASK_SIZE
 #define STACK_TOP_MAX		TASK_SIZE

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
