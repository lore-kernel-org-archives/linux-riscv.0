Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A78C54E58
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2024 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sp2cSN/VVyFA1eZlLZ2xVt9tyl6Z3Ufj5i+4TQOGaLw=; b=tpKJ2cZx6n6Wca
	n9k+nysm0Yc6jVt2xc7CBDzy9XR3aIbvu8mrsy37imcN0pc2cbXjVUOA7FGx6AuSt6pE9rWOZ6O8o
	B2hwBBCfgCadnMjED00homF/geA2/KWX70LipO7a78jZUhsl5y1tEy1yw5oeTmHbqDKRYcnyoazKZ
	7Tk6cv6NQTU327pZpJyKjiyiVeCRpCsKRdO9Z6NHJbXuVANmpl4Vwm+hnaFVCeuP1qVPHDEOsZylK
	GNfQirj4Z1daXzwofZXr/Lly2Zg2/tHgVSBcFszxmSwJoapy8QwAn5yU4T3veWLbJLQISMbz189jZ
	cns7SD9oyAfusJxyikcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjHFj-0000000FcWQ-1mwr;
	Sun, 10 Mar 2024 11:22:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjHFf-0000000FcVM-2zix
	for linux-riscv@lists.infradead.org;
	Sun, 10 Mar 2024 11:22:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33e7ae72312so1608824f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 Mar 2024 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710069714; x=1710674514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYLKnCQ+boTnvHIesYL7Tn/a9S/O0zd748SDOPYnP/0=;
        b=El9qX/UGbaZNZ7FbulPXCg/JqgaHqVbQQh52wKTBStbTxekVEdy+acvu7ocrCbYhhd
         oXQyFTPkRqMM1jwxuVq/bpnQal90EGhkiqTz+FqTCaTCrn80tuvd8OTWQk0a3NqStUpf
         7net1xr1kxa2be+Z2BFBNKeBRy8AZ+ANhDVeyaaXr1M8rPpRJinkyNo3Qw293JxayT3v
         HeApYHaFjteXTCZ1GQ/XrP8KricCyuScWReJlVuE9IzO1nuRxgIg+S28vw18+pYggh0C
         WA9D53Zl+dwD6JBk4P/7e7fzn+NDIrj1SwTbf3YVk87pKFzGgmb4BBedCkrBHpV2cAtv
         bChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710069714; x=1710674514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYLKnCQ+boTnvHIesYL7Tn/a9S/O0zd748SDOPYnP/0=;
        b=g7gjNuQLu2AZODe/V7zka7Isg298xwo1Z0AJRlyiePvMZnj8aijQ66bGrOK7Bhzz7Q
         g1vxI/b1pNdYSO9u3aDHtWl+vbnt+epk11I9XjDXoMnLyp9CeYuI7iYVYMIJlsFXbm2X
         TgTm9N3LVEIWPHfMuJ9ml8Ahm/9rzmp8tpPMQazxF63cFvi7gZorh5sqCa/bb4AaxY3O
         jvKheMI0Mm8sUCoYOp0p8ChLoadvfhJyIimnUTCocF5Cm6T8/XBExF2UB86uAr84Ce0v
         RyEI7vjNaccc0mCWAAzVuKI1d5JqIZBsRC9GhBdiQhB2yui+fxG4I7qgCJFaG1KXCEO9
         2dBw==
X-Forwarded-Encrypted: i=1; AJvYcCU5NGFHu2YbHes1TY2+lZSMs6esvL4s7ZdZv8PmYyrFOH0s+XYTd1g/6VOHhglCtSvHChTIG7clFKEfofmLaxMKU3PSWkkX9eSJNCE57Fdb
X-Gm-Message-State: AOJu0Yw0j1/cuSUprprPlYc/rbyjI/d7z3YROJNKipToJh3iC4JS0GuO
	tiiEUmGJzlIBfc+9gpSaLOOBYS6W3FPWMJNmwjXGcbAeOc7DWVSBL0xerghNDrbv2A==
X-Google-Smtp-Source: AGHT+IESTdbtcJfx38eBuDs4OoN6CRhqQNHqQYLxjQ2Qu5Q+ItfkC7K28QXNPe4PiZTsTend2glLjg==
X-Received: by 2002:adf:e98d:0:b0:33e:7029:96bf with SMTP id h13-20020adfe98d000000b0033e702996bfmr2860785wrm.58.1710069713316;
        Sun, 10 Mar 2024 04:21:53 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600012cf00b0033ce727e728sm3788144wrx.94.2024.03.10.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 04:21:52 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Remove unused asm/signal.h file
Date: Sun, 10 Mar 2024 11:21:26 +0000
Message-ID: <20240310112129.376134-1-shorne@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240310_042159_852558_27A6F067 
X-CRM114-Status: UNSURE (   9.53  )
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

When riscv moved to common entry the definition and usage of
do_work_pending was removed.  This unused header file remains.

Remove the header file as it is not used.

I have tested compiling the kernel with this patch applied and saw no
issues.  Noticed when auditing how different ports handle signals
related to saving FPU state.

Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/riscv/include/asm/signal.h | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 arch/riscv/include/asm/signal.h

diff --git a/arch/riscv/include/asm/signal.h b/arch/riscv/include/asm/signal.h
deleted file mode 100644
index 956ae0a01bad..000000000000
--- a/arch/riscv/include/asm/signal.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __ASM_SIGNAL_H
-#define __ASM_SIGNAL_H
-
-#include <uapi/asm/signal.h>
-#include <uapi/asm/ptrace.h>
-
-asmlinkage __visible
-void do_work_pending(struct pt_regs *regs, unsigned long thread_info_flags);
-
-#endif
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
