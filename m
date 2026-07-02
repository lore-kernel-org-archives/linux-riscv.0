Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A0C43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCetlb/eCplrLlEyQkjtuM1+pNWcROd1cOBeNnu00KA=; b=rt483iVwX7iyJX
	OCDDmo4iMn5chpzBkcEf0yZcJl9iyIR37Hc4pNYfNUB7nwZI5FR421LO/mkWhztuIscayqNI76JgP
	rJviuKPqR0ugOCLxyWdAaVHIOshUvEz6RU8gS6dBIYnFchQ9WA4Xe4HyzOBQq7w5rBPvBXomhyb6O
	lVDXxn4NbW9fDbwqA9KG0gVIw2qtYbAjS+jULKpe+/XC+qz+arf0fEynf84IsNaMuRYMQpf+N7SkC
	FrZIurB5gC+knYY83V3yVWQKLB1CRO3fTa+V8PE6aXh4T0GNuV66A/pzz0vm6SpHiyPB8yLuZzk4M
	Uhfpvhy6eECWzGuJOuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZA-00000004WvQ-36qb;
	Thu, 02 Jul 2026 13:34:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZ7-00000004WtP-2IW8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 13:34:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782999291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NG6JIULwe8wy/ye1EBaAbIcLezxqJJAlgHFLjbP0wy4=;
	b=nFoMuYLbwBU37oyB1EfNuScW4ylFxJ0DKl9eVkBiYJ2rLnyBiyvsxWmWdkmSxhqeh1eW+Y
	Fqf+0nujvm23VbHD6Nr5wNFXsZt1nbEnf7NLerLQUV1ABAuVavLfT/VFuWoXNsNNNUTZ/z
	vQgbTW7zbtc5jZ4K0IWKhPcMNJXpWbD8w2yC7NC24kNRagOX3tlRFZsoZnxq1/+v83FWka
	8OEvSoxQYsTtau25BYacd5973JppBbWC40MW4wdmFCdYihQIK1VM0u0jFr/EBaDzx15ShL
	vZ2mgp9G48yUrj8dfp7twQqtO/ou9MiIOXVNvhvkN0DXV8fzfPO494G8MXAhDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782999291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NG6JIULwe8wy/ye1EBaAbIcLezxqJJAlgHFLjbP0wy4=;
	b=belrRZYX3EDFMi8PbAC2hT+tyygd/U51i7AxcZSXOmLLGR+ZvDJJOT/L3LjWjxvuO24Zjn
	kjmd/dniPwi5WACA==
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
Subject: [PATCH v2 2/5] riscv: compat_vdso: Allow *.c source files
Date: Thu,  2 Jul 2026 15:34:38 +0200
Message-ID: <ff8d8ef5f530fada1423cd7c3f7651fe64d28fbe.1782998849.git.namcao@linutronix.de>
In-Reply-To: <cover.1782998849.git.namcao@linutronix.de>
References: <cover.1782998849.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063453_728724_C8FB32A4 
X-CRM114-Status: UNSURE (   6.47  )
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

Extend to support building *.c files. This allows adding futex.c in a
follow-up commit.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/compat_vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 8a395b5dd037..452c623d1a44 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -43,6 +43,7 @@ LDFLAGS_compat_vdso.so.dbg = -shared -S -soname=linux-compat_vdso.so.1 \
 	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
 $(obj-compat_vdso) : KBUILD_AFLAGS += $(COMPAT_CC_FLAGS)
+$(obj-compat_vdso) : KBUILD_CFLAGS += $(COMPAT_CC_FLAGS)
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
