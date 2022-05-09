Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF4FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpMVXH0h+XrTv7HiKrl0KGtQTDpu4kjpo+Hp3mVCyqc=; b=v9dO6qAXOnpWiO
	yqooODfa0T2OQpKnzlwCI/J420fjtc6Kv4lv5fdDf6+z2RA3iIkcZE699/pK6phVrVrt5BwQe105y
	AahW+oE3UvLw1Kn4+PmRJVjdAfNZ2McoJjfgK0la2Pgum1U0eMJZXBMC8v9MfRmzf9bNy2BnpKMa+
	A4KU03QHqQd+Nj2bnN0Qnp+2d31QoemH5KKFEn5Uc4vkAl+V2DHphCpzs82OsaRRXaksTnM1tEz8U
	wp9tnZMUHwFE6DlokkB3b9hlNlyKuKyEDB4NCIETSAk+N0PHVKCtZP8mgtN1eXARz6k33rOZcEwVx
	fxfuZbtGM72crSbsnqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBvj-00GZDF-HB; Mon, 09 May 2022 22:32:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvb-00GZ5Q-A3
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id y41so8594729pfw.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=tZRB3zIhTe4/kb2F6h0EyN2enk/ffsUfIt+uwvi71Kg=;
 b=J+qsV4sWyFVIgrDABezJovYhrW4Jzg11JZEk3WHOu3XuH7ze7t8fja6VuYB/Q9+tvp
 hEGF1icNSsM/0iiwFW281ATk7W6c7j7aGjBVYF99/u2B+jtb1YPKidpHvOTI9Jz4Lxh0
 6ez184UbojY7hhrrt0T6FZE8HWD85dHmAjAnZ8oC2Zoi0XQiqEUxOtwdNZdV12X1XPpb
 eOYtED253uK5GFiuWQ0wMSV73xWdJ5eHnN6WbBvwyOEpmAXVeAgkp/8WXuJtj+PnD01O
 qpc9n7G8viwouPMU6f6ZYvZjxFGQ2Vre7sEym/xdvKnlQk1eXINRDKWRRUAa4P4IDS/e
 ukRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tZRB3zIhTe4/kb2F6h0EyN2enk/ffsUfIt+uwvi71Kg=;
 b=ac86pTOMKATd1rI5yT1yg0nEvrx5Ej6MXAbyu1fpcf51TCxTYK+h1oK3jAaAzyUJhM
 aP78+gHq8pL1h1vw8sOlP3MK/CwzNVZU3CqaQMQ6wpufTggabXsHnDVGmkOG/+o5ZYFx
 8gWghJCmWP7osA5Aj3g2V6Ifi5R7GUFAwS+wUqi5xFzfmk+sq4w4MyHt4N477gYrBiJk
 uGtcakVf7TQcH9rVcR/uAC9L/ii09F7jAMV0LkoM4W6+SEDrUAck9W95caq4X1jCmIz5
 mH4f1u9/Z4G5WP+VqM4zoeDM1nrRQagk9xOqxYbls+T+DpG5qwrOrqb0O6HsryVoh5c+
 xbyg==
X-Gm-Message-State: AOAM532dt8Cje5LHCPB9+5iPRSABnQ/uGKbD4wnnsfSootKoc+uJhZaJ
 AJeZnTFj+k9nCIx6eroihCh0xQ==
X-Google-Smtp-Source: ABdhPJwTvHuoY8QbgphQvJH1puYeHk+wgzU1cmj+NdWGbUsi4eAleYRwVAU4/MCzw+CVlQAM7BcJ9A==
X-Received: by 2002:a63:8749:0:b0:3c6:aa1d:bd3c with SMTP id
 i70-20020a638749000000b003c6aa1dbd3cmr7379146pge.403.1652135548093; 
 Mon, 09 May 2022 15:32:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 20-20020a630d54000000b003c14af50627sm9008129pgn.63.2022.05.09.15.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:27 -0700 (PDT)
Subject: [PATCH v5 4/7] openrisc: Move to ticket-spinlock
Date: Mon,  9 May 2022 15:29:53 -0700
Message-Id: <20220509222956.2886-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509222956.2886-1-palmer@rivosinc.com>
References: <20220509222956.2886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 jszhang@kernel.org, linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org,         linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153231_379501_E7443E2A 
X-CRM114-Status: GOOD (  14.64  )
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de
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
