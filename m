Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7C9C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gl0Z9vO/fJKyrmgJLcHgAcWPfBkPgt27x2WwMw+fjCw=; b=mWh/Enuf1jOAY1
	zNEZpMIKAUZ2YccjvuOTRaVvIaQ1D0SnZdSXoPVG6NrVKGfeiCh1uHX9igGY1TvWpv1QLNkGuM4P5
	CSrp1RmFH+EnL3k2dDewYDsoMLkjrNJ090CF1mInkWFjbQmjfpol00igeNvcWT1McA2xXgokRc0As
	gr/Emr3dbHY0U/NJ/xFZMKUKkga1Kngp+NbzhIGoXCkBMTot7q06WJyqxWu3R6uUxFmXYxfkXVEq6
	PnWtmBbT3bSlPmmrLvcfvCpcYxm89CvzpaqyFMGMGZWFTlPMZxM18a17f1nfTPZKG3TjlXwbOZ/RQ
	+/B5qBy9uCnFnF2AR44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUr2H-00000003MAU-1gpT;
	Fri, 19 Jul 2024 17:04:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUr2E-00000003M9y-1OSE
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 17:04:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3685b9c8998so596578f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1721408684; x=1722013484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJsQB3K4aYcr7ECu1amll0XjDhcSFISeUeXPoQ4bleE=;
        b=PASJUx1eiRMmRMSsEHVBsJqUNg7IrRMUNc6dnYc5XpZNLtFP14U47MkrHUTiHcr+Vj
         VJjLDSww1ro5FZYI/xPxlFxV1wNNRtSr08e2jmmMCADCzhyu0MDUmunJ4y1Imqwu+8Fp
         5Y5SEGVZSDSKmwE3FbrEMyhbAN6WeaokRYsu6zUEAQvf/xv8VHWRALlnO663JibbUnQ5
         +TtZ0XCD0rNvbKPnxPz0RFRlDjR5Jc4pR4kCS2dH5Yx6yNHktA9ZnFNcismUZ4bYXjwz
         RgUFSClCUhJfyeIWbdnWg/CisuWe/eSnsQcXDT8M56ps8yOhMHKMTSwykTxWZIAg5fI/
         gAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721408684; x=1722013484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJsQB3K4aYcr7ECu1amll0XjDhcSFISeUeXPoQ4bleE=;
        b=qafybOBAqmtiNQyw6jzBUfh4cJCtU+mcmkf3VLvsbAt5qBmy/I/rWhXCtE4On25F4U
         I4fux8mMte5uKxSORZLM8yWn82LcLIjn7wFruV0/KinhDgMWikL3hUcA2zatT84i1Oeo
         8EYiR15pf3rSsEWNf/kygmLNUXhbZ9pA5uPikKvT+hwGdG5JKi0vbYIGyLXKBdCJj+Oy
         5pMQ9tai9U9sP+CNxZl33siWL7E5mPFkns18DCx1sKZOyxKRDlcWGUER5J2ClGFOvTX3
         G1H3WyfR/L58WRuk4oy/CJTYdrjwKzDPOzh4y8vmLJdfZ2CToNzfyWl6Bfkk8ZIs8gZV
         rGfQ==
X-Gm-Message-State: AOJu0Yxl+V0YKlOPYpUgu7gwqjHzzNibXmjIknsUN+3dU3SU6QvzF30M
	5ogNpIJyW93+d4KcpwrjbiUg2JTZtDe4NHT9coidAqRIv08U0ok=
X-Google-Smtp-Source: AGHT+IEwKlsXOWagamBmvuhnEj7z/VAb08YPBXrOvrb543FPO0IcSAr1GBWC9h4tycFYDRqB+tUj7w==
X-Received: by 2002:a5d:44c6:0:b0:368:7ea2:51c2 with SMTP id ffacd0b85a97d-3687ea25209mr1252617f8f.16.1721408683863;
        Fri, 19 Jul 2024 10:04:43 -0700 (PDT)
Received: from localhost (ip-185-104-138-52.ptr.icomera.net. [185.104.138.52])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-36878695a52sm2104405f8f.64.2024.07.19.10.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 10:04:43 -0700 (PDT)
From: Daniel Maslowski <cyrevolt@googlemail.com>
X-Google-Original-From: Daniel Maslowski <cyrevolt@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Daniel Maslowski <cyrevolt@gmail.com>
Subject: [PATCH v3] riscv/purgatory: align riscv_kernel_entry
Date: Fri, 19 Jul 2024 19:04:37 +0200
Message-ID: <20240719170437.247457-1-cyrevolt@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_100446_411987_ADD76654 
X-CRM114-Status: UNSURE (   8.92  )
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

When alignment handling is delegated to the kernel, everything must be
word-aligned in purgatory, since the trap handler is then set to the
kexec one. Without the alignment, hitting the exception would
ultimately crash. On other occasions, the kernel's handler would take
care of exceptions.
This has been tested on a JH7110 SoC with oreboot and its SBI delegating
unaligned access exceptions and the kernel configured to handle them.

Fixes: 736e30af583fb ("RISC-V: Add purgatory")
Signed-off-by: Daniel Maslowski <cyrevolt@gmail.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/purgatory/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
index 5bcf3af903da..0e6ca6d5ae4b 100644
--- a/arch/riscv/purgatory/entry.S
+++ b/arch/riscv/purgatory/entry.S
@@ -7,6 +7,7 @@
  * Author: Li Zhengyu (lizhengyu3@huawei.com)
  *
  */
+#include <asm/asm.h>
 #include <linux/linkage.h>
 
 .text
@@ -34,6 +35,7 @@ SYM_CODE_END(purgatory_start)
 
 .data
 
+.align LGREG
 SYM_DATA(riscv_kernel_entry, .quad 0)
 
 .end
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
