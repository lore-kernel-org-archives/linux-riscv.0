Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A452C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmwyAnXyO598RoLDOP278MfHfOnYclLVPvlJVTmzWRU=; b=WfU8CRRn2ZEoOf
	g3SCUEqh8xAoAgKpVjvyLNLH4knjDVbwP1HzuivSQTLHoTlPVbKOon6kgQVgFoqtG8WqZ4jgPFpXW
	uU22TiKDYfR4twEb9XC5X2cKeEoOeHk7eMev1UYOq0jqSFGBoWt1Ot6vVUtf5JNkWfp8RZRSov46i
	WgCKlbQLOXZcS+IYcLdjS94aREp8v7/yY1UVmFQawsvQh7lXOkjL0EFwSaGEmcrG+arERWk27lynI
	4yWshu2us6kZkOrkkTgWi4JpebKy171HYwIxjif3j6j5suU/0/Zmk8YHaCf5Jtx8+xJrd8fkZcRGs
	MA88n4GquryGRsXG/E0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBib-003Thx-DP; Mon, 06 Dec 2021 10:59:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBiY-003Tew-1v
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:59:35 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 293723F1C0
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638788372;
 bh=Mpf1+wFXToHvdF/Ol73oVGZ3N1s6PxZDoxH3qziN9eQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dXCclNLRRCxEQOKbjzWa2rm+ng7eVoFjD6nrXqW89zYC7fQd+Ecce6HZ7m4dGyAup
 rpIXJ7+PsnHAhU928rPQaLz1jwIWIg8TjSIUVD9M5Satq3pEaYLt4C34oWQ2TnyMBv
 /UE+TmTJk67k9KwHWMw4CR9u0+Gub34G5IK7V/UAorPl7onH9CtzCV1m21fmJBdtWN
 XQMoiEql8dbgCdj7Dktx3qdQ9oNqJxxGheZxyXHLC1hTMAl0BqwPsIc58ubn5j3w6x
 nHBBTpdBjkiznYq65VEOeIB5Y3FFTF6q89XNHvwloGt2ghxIOG9U57SW+GGeuuaZNg
 6cyu737DL0nVg==
Received: by mail-wm1-f71.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so4320709wmb.4
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mpf1+wFXToHvdF/Ol73oVGZ3N1s6PxZDoxH3qziN9eQ=;
 b=ONjPtgZHSndc9gurq73av1qAC25/qQ+wotIJ8P9m6en+zOZf6D+OrGzNx7wVKxrpAS
 8JzknC//xXkdJODVfGXah/LvsACIbxZ8mVksHhDWP+nib+vW1gfv21VHx/OHSBft/X6O
 aF8zmg6DuWvbMkxIjGcBwDwWE6KOTJfAF+y1qrl0wSxkTOYpQw785H3xn63uCjc0/uuk
 NbKP1WPzvXQMEFysd0YnP7r2eHseyjSnxsuhNHcLgN6oo4LI8X6hkUm/SQhtTWqA19kv
 YCzurDw3WgA3tbsvNX5OjSdYzxpb3aSrLrWBARkwBS8waAn3CxICorKH44/syYtP8HP9
 5x3g==
X-Gm-Message-State: AOAM533FNuqJPLmZpuArN+jXahbvTcPeO6lcNwQKOqNQAQHXjIRG+5Au
 efRv74L5fLUpsI9bbygG7bk9X7NGdbFs20EPpjy4qacSvQpNz8egLdbfiWjU7v7q0PcgOa2YNCp
 EkB8eXahGykGGF5kraNUtICHsPeyCWrETz7pJUkNK+h5zsw==
X-Received: by 2002:adf:c146:: with SMTP id w6mr43633014wre.541.1638788371829; 
 Mon, 06 Dec 2021 02:59:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXPF8JNT/lii3k1vlfVVxG4fHHOfwgSDGLo6V1yi6JZC+9G72g0N+X1xsL2m+r1nRvWrUGCw==
X-Received: by 2002:adf:c146:: with SMTP id w6mr43632986wre.541.1638788371627; 
 Mon, 06 Dec 2021 02:59:31 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id l15sm10625964wme.47.2021.12.06.02.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:59:31 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v3 12/13] riscv: Initialize thread pointer before calling C
 functions
Date: Mon,  6 Dec 2021 11:46:56 +0100
Message-Id: <20211206104657.433304-13-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025934_281506_978E83E5 
X-CRM114-Status: GOOD (  12.45  )
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

Because of the stack canary feature that reads from the current task
structure the stack canary value, the thread pointer register "tp" must
be set before calling any C function from head.S: by chance, setup_vm
and all the functions that it calls does not seem to be part of the
functions where the canary check is done, but in the following commits,
some functions will.

Fixes: f2c9699f65557a31 ("riscv: Add STACKPROTECTOR supported")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index c3c0ed559770..86f7ee3d210d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -302,6 +302,7 @@ clear_bss_done:
 	REG_S a0, (a2)
 
 	/* Initialize page tables and relocate to virtual addresses */
+	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
 #ifdef CONFIG_BUILTIN_DTB
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
