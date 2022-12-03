Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755FBC4321E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 03:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+LafzDhQHs/OiT5JJHQtoZnYFBV/Ki81btYl23er3o=; b=GPVtbUMeUVGT6p
	YhOs/mnth7cWpqGLRGBSZio7aUhimSVhunt0HDd5d4zm8eZXgQg7ug9wvFdNMBUnYBKtt3EiWtomz
	3z2KqlTWexssMncdV6MH0JcP+mmliuPFf1geLd8ZWSQhnWyqvCJ1mB74dSSA1zslRbQN579cJhmu1
	tMozl3WVll9T/H+8zQR3CflBYJDEWoXtdygTOD/3ntLygvGUEN9eoh6zS2S95Ci6NUJf5trHP8B6b
	of3j+UXduY/UidCAY9VhwKLTI8H0NKC+K2AskQLSoPHG7vSYkcIIiClR3/5pZVzDQR1cA/O1JHrub
	+4hZ91lXYhvNRU2wQPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Iqk-002AjX-3e; Sat, 03 Dec 2022 03:05:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1IqW-002Adk-N4
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 03:05:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id jl24so6276281plb.8
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 19:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUHGCrN2/GzmAYwHPUyKBA8Ge6xsvUhA3e+Vb+bqY68=;
        b=GTPXNM4I8XSeRWKFJbfehEVG870eOYMF/pKY9yMWeVjzuXAmyGPMV5Nuhgkd2Rpezc
         s+BSs8uV7IDAeaosxWjvuIEHbnwRyildLgIAk88UrLwNCF86OOw+gvsvp87gvdO7j5yY
         khg7Alr0W4R4/KHofpJ9D+lLwLem7Qb0wpi6ArvXA+llBKDEm0aE2tH//UDUW/zvNNNy
         gfVSZqmFmW+aoOXgq4s35qIFSAZ9WmYlvLQAEJEUCLULeQimBikv4W8YGE42LNgyHFBS
         veDXzJC3LeHh7Nnv4F5UhC6Q9SyzW2T+bBN93Ioth3DJNcJNlGBAnbsRy+dlZx3PTjOZ
         6m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUHGCrN2/GzmAYwHPUyKBA8Ge6xsvUhA3e+Vb+bqY68=;
        b=YxU1ZiOR8cCOoGp39UDdC7IacfE/gY1lXa+Hw4QFX/+aaN6iVwckIdw5Bqcz9bWUkv
         u2fAU/bpn0FD49v+SeOlBFRcxwXd3M1OEseIfGnCEaOkYFU7e+066+OKArDFZ17BFvzZ
         8ECp/uh6kJTji6ugdFPLrAJEF4DN7lyae27pA+E2kWADkJvoV0mJA1HPWot428ZcUUQ+
         +webQa4rEXfN7HjSJDRm5WQbvfww2sA5MjFrtynuSUywSWdW0PEhsPwMZxQDuNdFdj6r
         WlP5hLHHEdBgs1KpjiyKWns8ZDb/TgCWMYNIDE+MsEMOagBJampPokvXNC8yMDpNCEfX
         M0wA==
X-Gm-Message-State: ANoB5pnDFhQmamodfwcz0B5AOCY+zOWLOgSl9L8z1k2eN/UWhabsT9xR
	PkTJHFFc9zgJeFzHDm5YSN4ZTQ==
X-Google-Smtp-Source: AA0mqf6uIzMwjns2LD/gQeHWIsS+ZDiU1QORTWoif/bzBJr4V+crCrb3KCajLaMXkOYnYMNn1jPFyA==
X-Received: by 2002:a17:90b:609:b0:219:3ad9:64f5 with SMTP id gb9-20020a17090b060900b002193ad964f5mr29166277pjb.138.1670036743958;
        Fri, 02 Dec 2022 19:05:43 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b2-20020a62a102000000b005745635c5b5sm5713256pff.183.2022.12.02.19.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:05:43 -0800 (PST)
Subject: [PATCH 2/5] mm: Add VM_FAULT_ARCH_* codes
Date: Fri,  2 Dec 2022 19:03:53 -0800
Message-Id: <20221203030356.3917-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203030356.3917-1-palmer@rivosinc.com>
References: <20221203030356.3917-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_190544_770916_5F49DDF2 
X-CRM114-Status: UNSURE (   9.96  )
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

A handful of architectures (arm, s390, and soon RISC-V) define their
own internal fault codes, so instead dedicate a few standard codes as
being architecture-specific to avoid conflicts.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/linux/mm_types.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 758eb70829cb..df1aa8d58444 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -880,6 +880,11 @@ enum vm_fault_reason {
 	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x0002000,
 	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x0004000,
 	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x00f0000,
+	VM_FAULT_ARCH_0         = (__force vm_fault_t)0x0100000,
+	VM_FAULT_ARCH_1         = (__force vm_fault_t)0x0200000,
+	VM_FAULT_ARCH_2         = (__force vm_fault_t)0x0400000,
+	VM_FAULT_ARCH_3         = (__force vm_fault_t)0x0800000,
+	VM_FAULT_ARCH_4         = (__force vm_fault_t)0x1000000,
 };
 
 /* Encode hstate index for a hwpoisoned large page */
@@ -903,7 +908,12 @@ enum vm_fault_reason {
 	{ VM_FAULT_RETRY,               "RETRY" },	\
 	{ VM_FAULT_FALLBACK,            "FALLBACK" },	\
 	{ VM_FAULT_DONE_COW,            "DONE_COW" },	\
-	{ VM_FAULT_NEEDDSYNC,           "NEEDDSYNC" }
+	{ VM_FAULT_NEEDDSYNC,           "NEEDDSYNC" },  \
+	{ VM_FAULT_ARCH_0,              "ARCH_0" },     \
+	{ VM_FAULT_ARCH_1,              "ARCH_1" },     \
+	{ VM_FAULT_ARCH_2,              "ARCH_2" },     \
+	{ VM_FAULT_ARCH_3,              "ARCH_3" },     \
+	{ VM_FAULT_ARCH_4,              "ARCH_4" },     \
 
 struct vm_special_mapping {
 	const char *name;	/* The name, e.g. "[vdso]". */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
