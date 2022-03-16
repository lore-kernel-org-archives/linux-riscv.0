Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3548C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 23:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdF8D0OcJvVpoBzre09XxF17FzzBpp6Cw9n2FjO7cb0=; b=xBMWXj5sZwMVOn
	UT6xYjBScOMONOUXsLQBer8xK91r34ytQzSAqYDtfnWuqzX8GQt+g2uwpPLR9/7YAGx/rDTrAABHz
	dtYk1XrTXHjrCvIcxYVAB1OWGj+QsauVST6ytXMDEdN8OGYEQhnLbq+CDCpUiEwKlBCsecnGZAZxR
	f1Clnq0jGFeo7ZKe/G66m7c0bn47DU503TIvB9aDkigLlSwnZWqPo1vzjdUN3JJ5yUE1iEk7aQSBf
	HuZxJ64fS0tTOR2aoXvffIk4jy/WbkbkOVz4GxsE4ue47O3SfKuu4Pbc39QzKLLswWrOriHxTRy5s
	pAZCMg4Zh35kb7inYLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUd4J-00EUFI-VM; Wed, 16 Mar 2022 23:28:39 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUd4B-00EUAY-HY
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 23:28:35 +0000
Received: by mail-pj1-x1035.google.com with SMTP id m22so3499726pja.0
 for <linux-riscv@lists.infradead.org>; Wed, 16 Mar 2022 16:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=llt+unTQxxB47mMK9cTVf/sVk7YwdP8ahVPZ8vUzo+E=;
 b=P13QgI0zd+4RAOt3pbwZknViRr2CVhiVAFIRqM5bOGjAu9nzvjSnZusFhYRC5h9qSQ
 9JCxra+cscVH+cq1tVm8CjiuMJlxW877K2j6AlCHNuh0DRBNi9EE4AcotfiNoC3XOOLK
 dhnYjAvGq4qBYfG/ws5BM4JI/1zMJoKWHl+gPx8IkFDWC/CuJ+vSOxvmg3M8IpV/BOKi
 Oz6nK2qVkXNZ02AyIkvsE3D3PHdimNMIXmdl8ruKlmv4JHoGQeGhFIjnxn/Mq7G4QX+y
 2JDewQpoUe01b9wf6IjFRTdrHwJVTBH6ES8hoo446YGPwdfpUHyka6ajuquwNdtxfM3P
 F7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=llt+unTQxxB47mMK9cTVf/sVk7YwdP8ahVPZ8vUzo+E=;
 b=eYID6HUJNfsgoTFfUav9HC/C4zNCgBShcXVfy6JVRiOE569ToOxUE60swqC76kFvWm
 YEhm9wxNfB79XpQjOlE7T3lNXR4Da8ZfCbluzJzFvNn6ZoKhJXfAg8ij1CkHMd+VOoj/
 BcewXTnjZrXiZaKNgK8cZzzDQ0UnqI38+Rtsu/ELlg2DsyQfJ2ML74/d01AnFvrjUQC9
 g/ZQcglRlhdmHxXoTXMtWE11Oz9SKEUVEz04605HFQ59QJyqzbgYljUWYbWCw4bcgEAN
 Vp2ffzHJkjFf0vY80r/xgvRfhFx3BTnQmQFpDS7H5MdnhPwngbschEpWSsWTkxnZ/WiK
 c6jQ==
X-Gm-Message-State: AOAM533SSkhZNKJvE1URuVwWmP1KBMpLmnIJNvOstcpwohFw8HjUZ03B
 /0f7pjHVzmqU134cQ7BPnLL9bg==
X-Google-Smtp-Source: ABdhPJzyPV7prsqRJmPgkY9DrfVu2bdBaNJER6RIDfsjbbPdF+/QlL1mJF+2to5VA22BRA7tJfuvxA==
X-Received: by 2002:a17:903:11c9:b0:151:9521:d5c7 with SMTP id
 q9-20020a17090311c900b001519521d5c7mr1923340plh.73.1647473310711; 
 Wed, 16 Mar 2022 16:28:30 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 o5-20020a056a0015c500b004f7988f16c3sm4696034pfu.30.2022.03.16.16.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:30 -0700 (PDT)
Subject: [PATCH 5/5] RISC-V: Move to queued RW locks
Date: Wed, 16 Mar 2022 16:26:00 -0700
Message-Id: <20220316232600.20419-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_162831_595212_5B614AF8 
X-CRM114-Status: GOOD (  11.65  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

With the move to fair spinlocks, we might as well move to fair rwlocks.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig                      |  1 +
 arch/riscv/include/asm/Kbuild           |  2 +
 arch/riscv/include/asm/spinlock.h       | 82 +------------------------
 arch/riscv/include/asm/spinlock_types.h |  7 +--
 4 files changed, 5 insertions(+), 87 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..feb7030cfb6d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -38,6 +38,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_USE_MEMTEST
+	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 42b1961af1a6..e8714070cbb9 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -4,5 +4,7 @@ generic-y += flat.h
 generic-y += kvm_para.h
 generic-y += ticket-lock.h
 generic-y += ticket-lock-types.h
+generic-y += qrwlock.h
+generic-y += qrwlock_types.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 38089cbdea92..97dfb150d18c 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -11,86 +11,6 @@
 #include <asm/current.h>
 #include <asm/fence.h>
 #include <asm-generic/ticket-lock.h>
-
-static inline void arch_read_lock(arch_rwlock_t *lock)
-{
-	int tmp;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bltz	%1, 1b\n"
-		"	addi	%1, %1, 1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		: "+A" (lock->lock), "=&r" (tmp)
-		:: "memory");
-}
-
-static inline void arch_write_lock(arch_rwlock_t *lock)
-{
-	int tmp;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bnez	%1, 1b\n"
-		"	li	%1, -1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		: "+A" (lock->lock), "=&r" (tmp)
-		:: "memory");
-}
-
-static inline int arch_read_trylock(arch_rwlock_t *lock)
-{
-	int busy;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bltz	%1, 1f\n"
-		"	addi	%1, %1, 1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		"1:\n"
-		: "+A" (lock->lock), "=&r" (busy)
-		:: "memory");
-
-	return !busy;
-}
-
-static inline int arch_write_trylock(arch_rwlock_t *lock)
-{
-	int busy;
-
-	__asm__ __volatile__(
-		"1:	lr.w	%1, %0\n"
-		"	bnez	%1, 1f\n"
-		"	li	%1, -1\n"
-		"	sc.w	%1, %1, %0\n"
-		"	bnez	%1, 1b\n"
-		RISCV_ACQUIRE_BARRIER
-		"1:\n"
-		: "+A" (lock->lock), "=&r" (busy)
-		:: "memory");
-
-	return !busy;
-}
-
-static inline void arch_read_unlock(arch_rwlock_t *lock)
-{
-	__asm__ __volatile__(
-		RISCV_RELEASE_BARRIER
-		"	amoadd.w x0, %1, %0\n"
-		: "+A" (lock->lock)
-		: "r" (-1)
-		: "memory");
-}
-
-static inline void arch_write_unlock(arch_rwlock_t *lock)
-{
-	smp_store_release(&lock->lock, 0);
-}
+#include <asm/qrwlock.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index 431ee08e26c4..3779f13706fa 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -11,11 +11,6 @@
 #endif
 
 #include <asm-generic/ticket-lock-types.h>
-
-typedef struct {
-	volatile unsigned int lock;
-} arch_rwlock_t;
-
-#define __ARCH_RW_LOCK_UNLOCKED		{ 0 }
+#include <asm/qrwlock_types.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
