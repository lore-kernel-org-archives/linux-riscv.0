Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9CAC44514
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipHeHbJ8fdB2ewe5ec4Vpda7U+q75qdii5HHeY6mDGI=; b=GK9F6banj9Ywfy
	WTZ/1FShn8+mIQEJi08wjzGUwH6ADAq2h9jmJGiiFdDiB209j11bVKSUFdEl2l9keXpW2bnMDkZnJ
	gQHVYL28U+Fxn9EIyGSHeWWJeyu5wmLThU8O6+iqJayOv+Z9BVqxLbQLUrLBohbEiKSRUIiy1P8au
	ZophwWuldiCGWQTo1Qqa0MjhidfnktKKRIkwJSmWus+nkh3vk4PL+7XBSlgaVOriIICHd/TXoy8aN
	d1t/JdMdkvoVlHE1p/nzmFp9hO8yGBMVhtUV52m7TY2ZAd9cedtBZPtvTu03ir30EfSpQELqUYn2Y
	Rd+g/wtcgrnzQqcQBEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkday-00000001Z2R-3iNH;
	Fri, 17 Jul 2026 08:06:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdav-00000001Z01-3NLd
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 08:06:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784275610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH1Ph/iNnvbnyeD8/iV1ti1OQkX07oDM9rVdvOySvPk=;
	b=et8fywNoRqrFW6gEfyis5kmBILAozgP9q/8H+2cBn/3Q8/4hTTjShSIdNIP+LFXG/rSSIH
	HIBPOUenk20MvFDB5PoC54I6Uyt206LIpVhnyKyoQZhUFjuIPa4Qu0amdSk9wq/yF1lEE+
	gw35WmibJpVL6ixd68Fwad+aq8pavOncA+u5rivnLhsqURRPpAINWEpoefK3l0uBz03I7N
	cMXzr09QebLr8EW6aYkXNgVdZGigDZAOxDwL8Z0YUPVoqLWhZ102nBui8o8sGn8j0XdU0i
	QKV76H0VzCZGLqxYMf4OBfPxzcI5w9x3cF/K/lrLjaYBkeexsqKJqbqPk5QILQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784275610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH1Ph/iNnvbnyeD8/iV1ti1OQkX07oDM9rVdvOySvPk=;
	b=/vrAmpzJV2z90yH6e59XzVW6FUAo8a4CQUv4LdbnHXfHefQ/NZxANCOteUeo/ztSTFzUyM
	6d2BjLjC+lE6GECQ==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v3 1/5] riscv: compat_vdso: switch to standard kbuild rule
Date: Fri, 17 Jul 2026 10:06:34 +0200
Message-ID: <0bf254c6a3a6070938d78bebddd67b3093ac811b.1784274927.git.namcao@linutronix.de>
In-Reply-To: <cover.1784274927.git.namcao@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_010653_991902_FAFA3612 
X-CRM114-Status: UNSURE (   7.80  )
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

The compat_vdso Makefile has a custom build rule for *.S files. This
is unnecessary, and makes it hard to extend this Makefile to support
building *.c files.

Switch to standard kbuild rule instead.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/compat_vdso/Makefile | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 24e37d1ef7ec..8a395b5dd037 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -8,7 +8,6 @@ compat_vdso-syms  = rt_sigreturn
 compat_vdso-syms += getcpu
 compat_vdso-syms += flush_icache
 
-COMPAT_CC := $(CC)
 COMPAT_LD := $(LD)
 
 # binutils 2.35 does not support the zifencei extension, but in the ISA
@@ -43,8 +42,7 @@ $(obj)/compat_vdso.so.dbg: $(obj)/compat_vdso.lds $(obj-compat_vdso) FORCE
 LDFLAGS_compat_vdso.so.dbg = -shared -S -soname=linux-compat_vdso.so.1 \
 	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
-$(obj-compat_vdso): %.o: %.S FORCE
-	$(call if_changed_dep,compat_vdsoas)
+$(obj-compat_vdso) : KBUILD_AFLAGS += $(COMPAT_CC_FLAGS)
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
@@ -66,7 +64,3 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
       cmd_compat_vdsold = $(COMPAT_LD) $(ld_flags) $(COMPAT_LD_FLAGS) -T $(filter-out FORCE,$^) -o $@.tmp && \
                    $(OBJCOPY) $(patsubst %, -G __compat_vdso_%, $(compat_vdso-syms)) $@.tmp $@ && \
                    rm $@.tmp
-
-# actual build commands
-quiet_cmd_compat_vdsoas = VDSOAS  $@
-      cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
