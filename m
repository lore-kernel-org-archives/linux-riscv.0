Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DB3C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yOGlGgp0fKZf0aGUYCm1OoekHVH5WLBQPpS1yBG9MrQ=; b=JguIDmDYG0sItz
	mMgbIIozdlecVVakaf3EauNkDfSCIMjomKC2vek4hrarH6IA13ePlYYHrSDlfagE1D6/Ah19h9huK
	oiez4f9NOfYXOla3VHpJH+bzcn0ahGMT1PQmZY92WBGecrMP9ujs6xP/0dOfo8hRWg8ctV5z9zI/A
	5XuKD4pUNLXNTcYfcMsOcxwaxeA7VlfQCKn8gtzc82aaddmbZDlbSlbcestU53ohW9mQsmeT9wzvW
	fVwONvU6bzIZf/KnIwi7XwAfp+0MdboaEMSl3BvllXIEN/7yNaIVp6jJ3l1P1w1FEdVnvI3uRTtdq
	H+HS3xuiKA/cyXW07TPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1JG-0000000DfNx-0AJk;
	Fri, 14 Mar 2025 09:26:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1JD-0000000DfNZ-41MW
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 09:26:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224341bbc1dso37847985ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741944387; x=1742549187; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIomnUM1ObwovI7+jMPD5tnDDFMcgSa79cSje7Mcl24=;
        b=Q4KxwG3Ze5IR2pLdcehWJ4xg2zMKNLFsedrqIb29iHoORyMRgGBYduN/JlNVAm+XFK
         h4QbKv5YOPbTkO1rn3EFOI35rLlfYug6+icAAkTVRl+8Mh4ZGahhPM3ofzocszCG37cQ
         xhDEyCk0q0tjs4Wfdocr+NSw/Rk/mrcAOkLzC5YNCLz5/jEiA9ZL1oUQR8IsEJvfqxpf
         IJinHced45jH5vr8zy1JiIt1pWd2zy0sUWj3N3wontgK4umSzBqLoEdRwu/EtV3JEAgX
         dvAj1ocyF59Lba6jk3hHvrZPMNhO1exyKU2UkJhgiuw6GBIh0yTPC9xRKM8M7KUrUF0h
         FWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944387; x=1742549187;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIomnUM1ObwovI7+jMPD5tnDDFMcgSa79cSje7Mcl24=;
        b=Mb2Ab0gAIdSKhevPsJQ14obZ8GaFFkqY26UEtq/TOsegSOr7Yy1rsvzOtQLtu85fiO
         IfDthg21mlO3K/M1Iouvur90RQASNzOXCEwTIyr/zMXIm/E2hhcy2ZfINk6Iyo/n237v
         qeffVk40B2hvJnLSDhBR1Nv/2pwyALjhPwF4qPKO1FHlXVWFMr1qGV9U4OITEuFr43tJ
         7hHJV5W6qO70FeR74Kp6h49l38872wnC5wVkx3pJX3QhnhGtCnuhv6Zo8kSH9/FiodkN
         1VZJk+anaVI1cECC1Wt/9LxVzKKROinSQlr2uX+P1EfMDZG5s+M4n5Ll92rU55EdBAqN
         vYbA==
X-Forwarded-Encrypted: i=1; AJvYcCVeOFXiLsQES04mKpSijI0BnoSnkyfSiL30WslDDIfn/o8mFVMTjKbGwm1kXFd6JufuZL/NPM17wurXvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgIX4siLTBrngnTgm0iJHvY4p0Y8W4KEQ3+QH61c0M508vUccM
	s4XleZ3zMVarkT8Q00eBtoZ3cWt7yMwFvZ+9FE1h07t7iNF5GOYCPwrmiSNPoDk=
X-Gm-Gg: ASbGncuTXKyxCidR9fzl64PT5jVHFzWGLyeq3DJwgS48GaCBcTILwyHmc00pA7z8DVB
	K7w9mL7/qr0bMtrsQlF7M3BnEUaP2BlDUFL3MAnUgPO0r+8/FvU5ibDR1bxlCUg4Xkz4OEseB9I
	7tWtyiTj/4pnPlvwdqyoNg+kg2wNL8Z/k4Rw43zhurbmy/bDyZw4x+c4/iK7g6HWA9HeX2ft+Ln
	mULAZRO0vlcitzCJbBBu3o4g/cNPG3WTniWOYijW3F8LtdvWopEAKE0elR457MPYXv2Gr5AiblO
	SLoVGhEgX0F38dDPflg0Jh3Ho3bfhRYsn0MLy5+h56NeZb+RVnW4xpl3W3rmofmPWaY=
X-Google-Smtp-Source: AGHT+IHiGiOU9ohAlsLexvW8pavyjjMgJ95S5cWuBYJBZm1j31219a1vu4hI7Lz1u+vTNN/5fDQ2pg==
X-Received: by 2002:a05:6a21:38c:b0:1f5:769a:a4c0 with SMTP id adf61e73a8af0-1f5c11f2c72mr3167518637.22.1741944386953;
        Fri, 14 Mar 2025 02:26:26 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e4cd5sm2467828a12.31.2025.03.14.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:26:26 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] riscv: traps: handle uprobe event in software-check exception
Date: Fri, 14 Mar 2025 17:26:14 +0800
Message-Id: <20250314092614.27372-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_022628_008313_370DCF2E 
X-CRM114-Status: GOOD (  11.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Handle the uprobe event first before handling the CFI violation in
software-check exception handler. Because when the landing pad is
activated, if the uprobe point is set at the lpad instruction at
the beginning of a function, the system triggers a software-check
exception instead of an ebreak exception due to the exception
priority, then uprobe can't work successfully.

Co-developed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---

This patch is based on top of the following series
[PATCH v11 00/27] riscv control-flow integrity for usermode

 arch/riscv/kernel/traps.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 3f7709f4595a..ef5a92111ee1 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -386,9 +386,12 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
 
-		/* not a cfi violation, then merge into flow of unknown trap handler */
-		if (!handle_user_cfi_violation(regs))
-			do_trap_unknown(regs);
+		/* handle uprobe event frist */
+		if (!probe_breakpoint_handler(regs)) {
+			/* not a cfi violation, then merge into flow of unknown trap handler */
+			if (!handle_user_cfi_violation(regs))
+				do_trap_unknown(regs);
+		}
 
 		irqentry_exit_to_user_mode(regs);
 	} else {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
