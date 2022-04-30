Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E6C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5U6SKivA3O5bgHtS8UOJltshvj3TjHELNbBpHzktFI=; b=2uhvMPKTlYU2J9
	e1h2aVZ/Ob55874DissUfV5r+A6Y0jcTLjlw/LP3dWLHGWMB9k9ABGaUCKvv+aRYrVX2u925NM6NZ
	Z6rXRukmTLb7J+4n1jVkUtsExiJ3p+dhj1/Bz1kM1vKvv08LPtLIUxjUvUqztkZJMKH6ylsQFVCYk
	IHlbCQI9oyV0ixKkPxgGDpJdvywROoMJhdLgx1Rh+T+NIALta9xX0zn3pHJL6NZgIaEKUicqdoiV5
	YXUFeBd60MKk9FosNR6FGxT1QtuXzpnQG3xwDmbAYQqFwlT5K72ePkvVfr5C04fKRMOe3HZjjAogM
	DxfCzcqZRcg27FZT2T5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkpAc-00EZEE-8Y; Sat, 30 Apr 2022 15:38:06 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkpAU-00EZ8B-JU
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 15:38:00 +0000
Received: by mail-pg1-x533.google.com with SMTP id x12so8652423pgj.7
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=z3KLQgMj1TGNiy68N/+4cjWSftL0fQ46WdCXDumEo+g=;
 b=OIjS69Rysux2zOuPu+QGyQyEdlRWBp2cAHY90hMkRDcU+740wg96FctIHu6gimhe37
 lz3jiYHZzNFTdx32AfsrWEbeDRWge1y2JeufrIPVxrl4eUYhH7+j85QUjV4yTlpew1Qz
 O/Lwal75dK7+QounVjK9C7dYqAFShV4gJMNyJ1gWPoAIdrZQYBITK18BbXnd0idplft1
 QHNO3WQkZIuBSzo2GgKyrMyVdDvBNibHbD/fYMkpOV4gf5DDYvB1VFIuM6r8Hp6RMADH
 N/4tYcc94hfUa/k8OhPS1Z3ZmLWbtys1gNxrDGeNmBnciOp1mBgdO5PLtUf77tbM7NSE
 nxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=z3KLQgMj1TGNiy68N/+4cjWSftL0fQ46WdCXDumEo+g=;
 b=OfCpJ+FSOOkDSQSuGyy1gW9sUIk0ElXf7d0R16aZ79ueJjsRmCqnflTQfskE/Cspr2
 3Y/ZdFVFv4RaTFrBqyanaqoNNPO67XXYoK+DRVERLEHhLCmw0axRvrtjjbtJnfbpj/ZB
 lZMbeOVT/HBUPfWlGUXT0rnJuq5oq5qiSnqrP9wHLF5xmOe/Db6odflialT+SY6OHLaF
 gvNaYfuRp3Kat+VRh7eVtW0sGwhXzqTkgE2QSaHefW2Sdb/5Ak0BKQ2W4C8RcbNaQrGg
 Qx/OGzkVaGVqTTb4FQxgXtTWe0wEJJ85Frkyw769naHB96spZ14sQhG75w7WK5aptoXZ
 yZlQ==
X-Gm-Message-State: AOAM53139ErzN8714+JNXjovk4wMWF/y5cUjTHxSd0+5TmEqNpCzwQyY
 lYUqRSiTUkZIRiSmeiFHoj6P0Q==
X-Google-Smtp-Source: ABdhPJwQ5vPL3rfJKlBBkun+N1EkTvaAg1pnc1AebUDuMRn0c3hata7ORS3NhPRk+anvBJZz91htfQ==
X-Received: by 2002:a63:81c8:0:b0:3ab:6025:f43c with SMTP id
 t191-20020a6381c8000000b003ab6025f43cmr3472832pgd.189.1651333077608; 
 Sat, 30 Apr 2022 08:37:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 g11-20020a63110b000000b003c14af50614sm8108129pgl.44.2022.04.30.08.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:57 -0700 (PDT)
Subject: [PATCH v4 4/7] openrisc: Move to ticket-spinlock
Date: Sat, 30 Apr 2022 08:36:23 -0700
Message-Id: <20220430153626.30660-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk, jszhang@kernel.org, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, 
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_083758_691025_0B0431C9 
X-CRM114-Status: GOOD (  14.27  )
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
Acked-by: Stafford Horne <shorne@gmail.com>
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
