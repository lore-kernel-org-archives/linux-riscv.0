Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FC5CD128E
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qaXoN9rhDHHzey/PsHz0Cp5bbz75s4s59RlfPnyqWG4=; b=pkUTEXw5CC6DGT
	C/537bKIWAAnF8DVFOb940LOfPtt5CgFsMDtskitx5THxBKddHi5EoZXsajsHFFtyIoLXqDDM7fgR
	O274DsTdgV1M1rGSh8tIDC4fccm/MfCCvBEcAcbXCtkdfQMaDD5MCqv7rLO1yjsjrHwBVWprYtXuq
	G7B2A/MbNymbwHcA1y83LyY3JS40upGMo+5V5v2OlcQKdQDS6tBG6KU+Ml1nEQSVJuaZTUjSodfLW
	ITkBAyiOBxxIdUIwtUToyWDVLrTTCXReba1oO49h7QCrdxSW9YHMXA+wDW+kttG/eq6+ajxnfAVoh
	+CKdiWlWYkCRcuO+GL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqWeS-00000003KiY-0lkD;
	Sat, 30 Mar 2024 11:13:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqWeO-00000003Khl-2BjR
	for linux-riscv@lists.infradead.org;
	Sat, 30 Mar 2024 11:13:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-41553b10600so5053645e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 30 Mar 2024 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711797206; x=1712402006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGpbD78cy/B/Wyutkg4e7jIuut8zfsGFclJfJk2FLE0=;
        b=kmMClykMfaYXJ74Hce7bsaVvDU6eH9C1gT/6LshmvZGqI0hKs9DqrhFJEx86HpcTjB
         frsiQWupuQ7Kf2ZseJJXHQMO3BdnKfvW6JkY12FlatI7iJnEnsuFTkNcae3udECJEK69
         A+aDg1haH93bjvETexHFsRiOLVXwoZBGthKF1YNai3L0uUh2oxvfNxxVh8G9S2zqvLMa
         LK62kU+LxKtT4uI1oBORm3dXZeoCH6OIR1vjLTtyXgi71jBwqUM5OMWZTmPEoGzGmstG
         9uC6xhWlvm0GDaSMVV4Wh782nfEmWK6ictjXlO48k2rOURN4FhW0Ulq9BKI7JicYIzZT
         BlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711797206; x=1712402006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGpbD78cy/B/Wyutkg4e7jIuut8zfsGFclJfJk2FLE0=;
        b=eRoOKSlsXiKc2gUOxFo5fTvnta9qbYJa381iH+ZE2dHjNLVHtegI1QbcbdEOEFU9ls
         khosrmvG/XMIZEiSeVzFLKzQ+vDx+SnZZKquI55gF635MXZREBVJu+2mjGMvkx/prBJG
         QucDLW6oeY7JAwawxYILliDYC6FhswkR31qyb/6FIiQggY5+kyb/F9ra00Ys4ZREELL9
         mC9THnRYDE1h9XJLIKblurh+PZAIxY5uV0GONA5mbEgU6U86QJj/xR6smQqRpiqivlat
         v/EQqXh16N0CLcmQI6oVSdF3N6tsCLQ7IBOL8m+TciVdE6VG35oV6aR5FHSZWBqxhDvM
         KsRw==
X-Forwarded-Encrypted: i=1; AJvYcCXD0IWnCt7sQNbR3CKFfL3NBkKUSkARVLEoHnfgvMA1jjwjhGSBMYMU0kDA/YRCCsRYgDSXPczME223iqJSLcz1R2ROIqVhrgmEP+21q3KM
X-Gm-Message-State: AOJu0Yzx9KTy3J2n3si1GqUnKO0un/snVe+eOP3R5N4Ft+86BsnX65am
	xF9JyqYAldgwzwz51lJ+jsBOO78tKpdAY/1oqKiMzyAFYM19/bbZ
X-Google-Smtp-Source: AGHT+IGmDWnORx0RBtHiMxbOf2bpkh7ue7o9cHmK67DxnOZd8Su14ZYemdeLPqvUgOXN0iVund05vg==
X-Received: by 2002:a05:600c:b55:b0:414:73c7:a8d8 with SMTP id k21-20020a05600c0b5500b0041473c7a8d8mr3340049wmr.24.1711797205724;
        Sat, 30 Mar 2024 04:13:25 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id k33-20020a05600c1ca100b0041409cabb39sm11280288wms.18.2024.03.30.04.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 04:13:24 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stafford Horne <shorne@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: Remove unused asm/signal.h file
Date: Sat, 30 Mar 2024 11:13:05 +0000
Message-ID: <20240330111308.2053965-1-shorne@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_041328_586182_FDCA5499 
X-CRM114-Status: UNSURE (   9.77  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
---
Resending with reviewed-by.

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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
