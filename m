Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48C3C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 22:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTAf8RSY0RiEPEw4k6k+6GpZEekP7U/7fYS9vGuYRmE=; b=iaRCOtkdwJ9uOA
	Azb3TwetUZdo4lgIzPW2toF6PxZKRyT6n/rFkNkp2rP7OMnBatn7KHq5FrW8OCgLA9Rzxv6+AJXU7
	UdKs0PYfsP42sRtfQ3rcrZtHdT04aUYb+Yl07r9w24fWjHMEvgON5y1PDuS4iH9bVaKAkTYn4L6IH
	dlzt5ANwweyzX4eiXvyZFoJy+ryT4TERWq/IjRL858DFvch8If9ZQlSVUghcjg+yIZBrQ8el3ZpSq
	G4g8y1Yi3cf+U4zpp9j4YkSPie/0cxBue4pRfYYpfFpFuSxHoZVjmRjLeZJOflU/BPqvFK+TtBq6F
	3zh3tF3BVP7aNxsrlqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7ak-007RKe-4L; Thu, 14 Apr 2022 22:05:30 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7ad-007RDW-AY
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 22:05:24 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso10417906pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 15:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=fGuiIocTsGNeGfljFQBqIaq8z11faA06QmkOS1ZNMsM=;
 b=R6qB8EHjaJgSIdCtMKhdYuPkgsZWKZJvItsuxrvYJe66b0kWr5qEcaypbW8fVsbM0X
 FhUqRtspmHufGwN2FALekT8CyXJm5S7kjyMcktlGU1XrpzbtotUCXZuO87tkl8dzpRsU
 rD7GHFid/eI0LZmwYI/csFXmn3CvJN7DaDKvJaMLpPJ/3/P4dIfleHYvn2zvLdnkO4tP
 7bShSmxTBQk2haxc2USQ9dtIjlVAIPg3bDRc+xVXDklpfpHWqfjPqU6sgkCSldEnbFhC
 TWJSMeobIJFf8xFLlsze9XxDtvdwjGCazEbqvvXoqURGpeC9W8m/Vt3E4JkUOM5Z3ckq
 eeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=fGuiIocTsGNeGfljFQBqIaq8z11faA06QmkOS1ZNMsM=;
 b=1qdLlaRx7hmcRN3tQmUtYoVH86r9dlEm2ITD4WoHLx3vD+9428nS8RrtONv/ENs6uY
 Hxjl2hGo8yqPoRQOMvc6IAxjoG/zzAXw4SBcCSR8eDyvfZmwmnfp/+E/28kdKKP4tDfi
 dTA+rK1HDtsbNNmaNiLnmpWuzU7qmamOflUePBgskwjJo756d1CujC17/SxsczfGrMyt
 QVdtmqpfDNe83ChkO5PxaEUL5V1BhpEkQ1/1oChurHDaOqzy1Bv2eBdRe5BHXRO3PwTL
 3AObvU/A0yukA8exlRQFZLPIr3241nWbQ4k318kplNmkzjmEtZ/UDCtDixgHwH1kl952
 ipcA==
X-Gm-Message-State: AOAM530KPPqpLNBP8g9nQaGCvAF6b9kXsBOAxpKBiv35aSeHzsFcbeXH
 nuJI7QXap1i/RaQNA1bkyVyWQQ==
X-Google-Smtp-Source: ABdhPJyAzBb8YxpknFCk5JeSfiuwavmwv/MB+OUr9ESYgO7bJCkViBS7KMaonnUZ91p8m5wnAMzoYg==
X-Received: by 2002:a17:90a:4294:b0:1cd:5524:cd6a with SMTP id
 p20-20020a17090a429400b001cd5524cd6amr716857pjg.212.1649973919487; 
 Thu, 14 Apr 2022 15:05:19 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0024c500b004fae56b2921sm805319pfv.167.2022.04.14.15.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:19 -0700 (PDT)
Subject: [PATCH v3 4/7] openrisc: Move to ticket-spinlock
Date: Thu, 14 Apr 2022 15:02:11 -0700
Message-Id: <20220414220214.24556-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: peterz@infradead.org, mingo@redhat.com, Will Deacon <will@kernel.org>,
 longman@redhat.com, boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk,
 Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150523_369326_25D94552 
X-CRM114-Status: GOOD (  13.95  )
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

From: Peter Zijlstra <peterz@infradead.org>

We have no indications that openrisc meets the qspinlock requirements,
so move to ticket-spinlock as that is more likey to be correct.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/openrisc/Kconfig                      |  1 -
 arch/openrisc/include/asm/Kbuild           |  5 ++--
 arch/openrisc/include/asm/spinlock.h       | 27 ----------------------
 arch/openrisc/include/asm/spinlock_types.h |  7 ------
 4 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 arch/openrisc/include/asm/spinlock.h
 delete mode 100644 arch/openrisc/include/asm/spinlock_types.h

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 0d68adf6e02b..99f0e4a4cbbd 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -30,7 +30,6 @@ config OPENRISC
 	select HAVE_DEBUG_STACKOVERFLOW
 	select OR1K_PIC
 	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
-	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_RWLOCKS
 	select OMPIC if SMP
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
index ca5987e11053..3386b9c1c073 100644
--- a/arch/openrisc/include/asm/Kbuild
+++ b/arch/openrisc/include/asm/Kbuild
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += extable.h
 generic-y += kvm_para.h
-generic-y += mcs_spinlock.h
-generic-y += qspinlock_types.h
-generic-y += qspinlock.h
+generic-y += spinlock_types.h
+generic-y += spinlock.h
 generic-y += qrwlock_types.h
 generic-y += qrwlock.h
 generic-y += user.h
diff --git a/arch/openrisc/include/asm/spinlock.h b/arch/openrisc/include/asm/spinlock.h
deleted file mode 100644
index 264944a71535..000000000000
--- a/arch/openrisc/include/asm/spinlock.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * OpenRISC Linux
- *
- * Linux architectural port borrowing liberally from similar works of
- * others.  All original copyrights apply as per the original source
- * declaration.
- *
- * OpenRISC implementation:
- * Copyright (C) 2003 Matjaz Breskvar <phoenix@bsemi.com>
- * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
- * et al.
- */
-
-#ifndef __ASM_OPENRISC_SPINLOCK_H
-#define __ASM_OPENRISC_SPINLOCK_H
-
-#include <asm/qspinlock.h>
-
-#include <asm/qrwlock.h>
-
-#define arch_spin_relax(lock)	cpu_relax()
-#define arch_read_relax(lock)	cpu_relax()
-#define arch_write_relax(lock)	cpu_relax()
-
-
-#endif
diff --git a/arch/openrisc/include/asm/spinlock_types.h b/arch/openrisc/include/asm/spinlock_types.h
deleted file mode 100644
index 7c6fb1208c88..000000000000
--- a/arch/openrisc/include/asm/spinlock_types.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef _ASM_OPENRISC_SPINLOCK_TYPES_H
-#define _ASM_OPENRISC_SPINLOCK_TYPES_H
-
-#include <asm/qspinlock_types.h>
-#include <asm/qrwlock_types.h>
-
-#endif /* _ASM_OPENRISC_SPINLOCK_TYPES_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
