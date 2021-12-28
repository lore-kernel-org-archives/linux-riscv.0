Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C78C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiFNjO8isQBHovqrWWDCqlUCv5jSZfUnPY1gJZXVIlw=; b=uC4Rl9Wt4OxKhx
	C+MLnIam6Ov+H0l+5hQ7o8fwwQ+qxviKt+FbuH/2yJVcHscB6mOkvNB9cfyyS5YTaG/u6hauT8t8i
	A/Q7a44FOX2kX6foaxrFttwRyPdBJ+wTdHofJWQL0txumpRn5YBml6zlurs2Tmv+EhihZyYGdZZiz
	gfANykRpZuIZpi4fAV/uilQolGt5YwUSOYylhrIM2n5VjJiczZGA1r8BDFV/GeBA7M9iRPGjw6zO/
	UusvHJIs7h1HcDydxcBUJrkpiEuf2ZPHTuHu6Sb7c6as/M0WmxkKb2Iq12xPi4LBJ15Om0hLz3j4H
	8F+Z64i+w0mOUEX4QsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26JL-000I9T-PV; Tue, 28 Dec 2021 06:50:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26HR-000Gxl-0Q; Tue, 28 Dec 2021 06:48:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9248C611A6;
 Tue, 28 Dec 2021 06:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14BCC36AEC;
 Tue, 28 Dec 2021 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674095;
 bh=16Xsifca9wkKUTK9OpCC6J6+WJoRfyl6c8OE6ELYn1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0E07KS19qkH/0CCH5Z8kDC5HG2hLHXJ18r+ghFJA6w/xWOXVCuE6NWt3soxf+5vD
 DDKIXKXo16qlV8VF6keVcb5Bqtx0iRFpFa5NnSmr1+Or7NFatWIV+110jsZ4KMJZas
 TNLMO3O4o+jS97FOYgboHWDkbFzSDT0mt18CQk2+e3wa4TDVrd97JPB5sJiDxH34fR
 w6aB6sluGKhydx76A+3AEQjd5THrEKQIGLTPke3CdByKbG7s+4Wkd0YMeZc0darcto
 sCRTIhL9v660gGK5IPsu+sLR4NHJpG9q5ArXxeVsu1VFPexDOcllHxTFyVKJozjfOn
 NOizjMG6O+zjA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 6/8] sched: parisc: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:27 +0800
Message-Id: <20211228064730.2882351-7-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224817_132421_E0D2CE89 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/include/asm/processor.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/processor.h b/arch/parisc/include/asm/processor.h
index b669f4b9040b..d9c8dc76ee6a 100644
--- a/arch/parisc/include/asm/processor.h
+++ b/arch/parisc/include/asm/processor.h
@@ -23,8 +23,7 @@
 
 #define HAVE_ARCH_PICK_MMAP_LAYOUT
 
-#define TASK_SIZE_OF(tsk)       ((tsk)->thread.task_size)
-#define TASK_SIZE	        TASK_SIZE_OF(current)
+#define TASK_SIZE               (current->thread.task_size)
 #define TASK_UNMAPPED_BASE      (current->thread.map_base)
 
 #define DEFAULT_TASK_SIZE32	(0xFFF00000UL)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
