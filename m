Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D5BCDB466
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQaW+77HipYHhyC6RlvfdKRmsDARjekSeG562eYyM/g=; b=MrGzOYW5hjvlv/
	ADEZs0xFF5G0jQ5AA0zLzxpRGOaiZb3USHGGLnyWp8SLYlBSyCZYO0c7ooNtSUioX8iNSueYEv/GQ
	DGAb5tOUs6zNDuZa6IG2aXaCo6vKvs1U+srjqOIQX0clOHNbTDDXkT11eateM4VzlIdS7QJ+8uvYT
	LrQccyzUbsTTB3cH5AZZjPQjlJLEk11TxWhY9SGzGT+Kx5OKTKVGpUNLBnOeARZXAVhoqGLlIkyrw
	XI26taWn5BkHMt/Q0BmU/ft1ySjQisKhAvjXwSfp4oQeY0inr0+FZXMB9/wiWYIgYFS7irzYe5znv
	rVY1eW/e2wA0Q1jFjctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwZ-00000002Y7q-0Dkm;
	Fri, 19 Jun 2026 14:11:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwT-00000002Y3x-1EuA
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 14:11:36 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781878290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cf5lKrxlEZdIDx8VteWkG+UEdshWTao+zsy1tpe0Wug=;
	b=Wq5q+7ov51+7hUh83dFFteIQwoBLkJDLAacIIqTyKsEjKMug8cDKtT2h45pszgizfEaWc8
	RmK0v8R5KxwyL9iMAGSz/t6kyKMgunYp9NIu+OAtFtUV7IUQfJc50DqLSfZbY/wldPix/L
	4QDdyJraJjr8+2YCb00MG5It5oRc1bpdjwpBz3ivd14ZWtqDLCblC+3MOhN7AyCn3AF+g5
	vEoJ59+cplcKrA8Ya5ns0HdhGwHb63WbtaXJyaJ4RciYrSnUwueE00T+heVdBPh5IrJ9MR
	pGdSLnl+T5Lc50cZHA3ff/tsG3cyXtrOQg2gpAIf65RaaFXKBsc5aZo/KpYCUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781878290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cf5lKrxlEZdIDx8VteWkG+UEdshWTao+zsy1tpe0Wug=;
	b=ru0zay5EhyqUQJ6ozvhyxmNRToPbAl1yNImpBCFro3RYsR7Pp3PQsGN+8GKe55C/Vdc0tf
	6tEyOQ9heDy5jZDw==
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
Subject: [PATCH 1/5] riscv: compat_vdso: switch to standard kbuild rule
Date: Fri, 19 Jun 2026 16:11:17 +0200
Message-ID: <183ecaa1486c45173dd28246425dab77f41a0d4f.1781876501.git.namcao@linutronix.de>
In-Reply-To: <cover.1781876501.git.namcao@linutronix.de>
References: <cover.1781876501.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_071133_479787_F4E4E023 
X-CRM114-Status: UNSURE (   7.49  )
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
 arch/riscv/kernel/compat_vdso/Makefile | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 24e37d1ef7ec..52a99c7e41c5 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -43,8 +43,7 @@ $(obj)/compat_vdso.so.dbg: $(obj)/compat_vdso.lds $(obj-compat_vdso) FORCE
 LDFLAGS_compat_vdso.so.dbg = -shared -S -soname=linux-compat_vdso.so.1 \
 	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
-$(obj-compat_vdso): %.o: %.S FORCE
-	$(call if_changed_dep,compat_vdsoas)
+$(obj-compat_vdso) : KBUILD_AFLAGS += $(COMPAT_CC_FLAGS)
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
@@ -66,7 +65,3 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
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
