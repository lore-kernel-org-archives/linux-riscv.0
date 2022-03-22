Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13380C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LBeT6kJaxqsQl5kXUF5/OJeosuRKvT0bRqFyCn1p11g=; b=32CEu5sfKQ5/NYWWfKX2jMVa/I
	PHXOMci/0uGHDas6v4KNujXtMqNM9WUnJyk6pFJMxsdOuqpcn7EzjV5CC71d83Qkj5bVNS8lmPc4O
	D05yNmZxf9mdJo5pryMPekyvZxOv3zD3DPPC4a8MXWm4bPJvl5hK/2AJ/LRgkK+zKewvBUWbHsHxC
	jqnNDuCkt11mtNKrF52w+R91n1voCSJF2NFhpwJykBgXfrEZI8Ddk3UD1F8GFG/g3PymEDaUm5nbw
	RraDx0ZHKAnKU7LY3qM3kZznESAXjjXHRW6xNkxdt4wvPMbkykUxny1B7HUNW73E481MdSo0Ipxvg
	b3OO8iHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWTI2-009aul-TP; Tue, 22 Mar 2022 01:26:26 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTHz-009auB-Da
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 01:26:25 +0000
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2e6479e153dso26073347b3.10
 for <linux-riscv@lists.infradead.org>; Mon, 21 Mar 2022 18:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Zcfus1hr4rL4+XSk7ZeSMnR2CKTg6P0EKLP3F7c9nb8=;
 b=i8x6bw63C8CnBwNWToBn1ejwhs1I5sT+Qt9rGn8CdzD2q5bI6ajCe3oOQ78/3FZGIs
 qmXDGKtcf8+1xdLslk9ffOSueyPzSySWMSsk5Yq8Ly0Wd5PeXu0lxN1YBt84AS2iny0Q
 A0fzfbjqIHB/yamvOOvVSOO6Nx+KjZdAEe39VS4o1cjeZId+2Y0ZnFkqrcKqcS99Xlrs
 Y79QpCoATrBt4sBO6s619f0NsNV3loVUEwp9wTNb0aPu41sSSH+jhAKIOjE1W9ELy2l3
 Adh+H7EmKMo9H0/LyE/2qeSEKHxHjskBU9fCJeJ1yYdC3WyJDhOm4FnonjpV0MsT/W3m
 vaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Zcfus1hr4rL4+XSk7ZeSMnR2CKTg6P0EKLP3F7c9nb8=;
 b=Rhc3wVeZ3BMXME6yPtLIOIrtVuTULdkSaa/9Qtk1K+fOzWo2NKZY8doNBYBQ+lzQaW
 ycEX7zwXyiBP2UU6IfBDiVPONgrEkplV5U+J6vQpaSftU1K83OPnqagKuRbtfh2OG1Iv
 eJosRGFcJzlcw8o6TmgmBuFCq9l34g6HRrbZ9PDGD9E8c5gTvQRgk8qSn+kDy2TnNOeX
 M9biaft/TxhPo+jamNxEPJylcSGmi3+zWDYjzzZAurfOk/OWTTb0yV7lljlka8AdV01D
 m1EO8a6gi7/X91Ttpd442umoOPiRXBkXzFGgN3a2haBHzhUS6uO9lidws4IvDjgezFPF
 vrpQ==
X-Gm-Message-State: AOAM5316HqOpBhnzO4haTrOcpG8wByHWJ94Vq+9G4XWtGmkkQrY7Z5/9
 cNdmzlEQMYm6QdgVjF0vqWgZhVaRrWA8
X-Google-Smtp-Source: ABdhPJxWQf3SqgA1tT/yCHPjgY7eRo1TW3y0rLfi2WTbwvt3o1LIklSxiCpYdgBDhAGwzIqiHVsde/KU8+bJ
X-Received: from maskray1.svl.corp.google.com
 ([2620:15c:2ce:200:b489:622a:ba50:950a])
 (user=maskray job=sendgmr) by 2002:a25:dd87:0:b0:628:e822:bd with SMTP id
 u129-20020a25dd87000000b00628e82200bdmr24014508ybg.505.1647912380832; Mon, 21
 Mar 2022 18:26:20 -0700 (PDT)
Date: Mon, 21 Mar 2022 18:26:17 -0700
In-Reply-To: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
Message-Id: <20220322012617.3517297-1-maskray@google.com>
Mime-Version: 1.0
References: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
Subject: [PATCH v2] riscv module: remove (NOLOAD)
From: Fangrui Song <maskray@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Fangrui Song <maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_182623_511094_8093D4A9 
X-CRM114-Status: GOOD (  10.52  )
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

On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
inappropriate for .plt, .got, and .got.plt sections which are always
SHT_PROGBITS.

In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
and (NOLOAD) will be essentially ignored. In ld.lld, since
https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
customize the output section type"), ld.lld will report a `section type
mismatch` error (later changed to a warning). Just remove (NOLOAD) to
fix the warning.

[1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
section should be marked as not loadable" on
https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
outdated for ELF.

Link: https://github.com/ClangBuiltLinux/linux/issues/1597
Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/riscv/include/asm/module.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
index 4254ff2ff049..1075beae1ac6 100644
--- a/arch/riscv/include/asm/module.lds.h
+++ b/arch/riscv/include/asm/module.lds.h
@@ -2,8 +2,8 @@
 /* Copyright (C) 2017 Andes Technology Corporation */
 #ifdef CONFIG_MODULE_SECTIONS
 SECTIONS {
-	.plt (NOLOAD) : { BYTE(0) }
-	.got (NOLOAD) : { BYTE(0) }
-	.got.plt (NOLOAD) : { BYTE(0) }
+	.plt : { BYTE(0) }
+	.got : { BYTE(0) }
+	.got.plt : { BYTE(0) }
 }
 #endif
-- 
2.35.1.894.gb6a874cedc-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
