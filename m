Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD028C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kYori0FCC5zrNAacC5AX7S511uYe3Q+HsknUkFbBEUg=; b=n+fr9DyPbeEmVu
	ILcHIKTAprzgU/vmRz54NjmtaoSrIGIxDW5oMY+QTm/eQctomMFBRxw97QTsDavaO00FKo/DJ6Us6
	CeD3bEcVgpFN13PHdvZDuytH0Z9WwEPBClZUnUhc4O0+9RwuCVv813ImhAy4UiHTmlCRk3qml4KsX
	uXnm2KX/i17F5wu0xjoMHC4EKU9AkIJFeP2tHFSaWYOQ4zFxd/LGEmJitvZkIjEwe4qgqKXy+kC2n
	Nijw47/f6z8keNNMmM3wS+Uk1395++pD/Fh9Ehn8s4h3QV2VYfc9Ddml3Bb/6twgUnUwfwnAAcjMN
	cY/kHIK1nuqvul9kK2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8yQf-007CyY-2f;
	Tue, 13 Jun 2023 07:27:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8yQb-007Cxp-12
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 07:27:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b3d44e3d1cso14839295ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686641210; x=1689233210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCTKwSM7nGfTgkpcwxuzbHKvrUHLJBGdS4r/wN5pXSo=;
        b=LiWdB17E+jMG963EaRHIWlzJpAIjHvEvA6bk4BXb1N4r3YKPeO+SP2mkQPkR4PCnaz
         B6lk/eSWsSCcR7gIE0oL4Ngx0J5MrheuIJ1xyaQslocVd5ouF+kzNKZexYWLSd6q9J68
         F5zIYtwYDGwrxB3ONyRFmJeIk7hWu3hzwrP3WffN7Dm4NOOeA3sNh9hjiGq2XOxmPFar
         ox0DLtxWHQDYLJFpcwamhFWtbh5XvtJQw9eiLbNyCcnrWLcQ4czn/Igkn9AmyAdnGzrR
         4zNKIN8CJi7WJykqGqKHN5z9UxsgzEboK4ErLZYhiQSQbYBrU7Gq53w84BCT0soat3tP
         iYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641210; x=1689233210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCTKwSM7nGfTgkpcwxuzbHKvrUHLJBGdS4r/wN5pXSo=;
        b=f2iaAcAAsfjf32CMEscOklQ+Rec4cvO0IWlzpW++aqKC6mE0ozExCSWRzL1JtAQ+Vd
         IvuLlKTbg5O3yQjxjtTwN2gsLGLyKYo2Ysqj9xWOOvIIQ+XhXdvusouJ7b5zZRsI90Pn
         yAk69XKSVwRGIL1/oXcd6xSs2unp6NsLybO6edFokzyh+mNLAtosNE8WwTTKpbxgKgxg
         36wctXZTzKUPuYQDaN3ktldJNZtpn/XRC68/GFLti8hRkjYGnV2VsUNi2Oeg3zxyFcyU
         7fTbbEqkjuuf48hCwFIdCQj28jKDJDAX831eRMzVqSMSFgL0j2JNWohhgusfhVbIMOnC
         rRSw==
X-Gm-Message-State: AC+VfDzSxPwtOjs8lV7puPArYJQeK4m8IOMGSxTR9vEhFu1Smci/LXdg
	ORhSNvsU9gK1D4RvzhZbYp/aRw==
X-Google-Smtp-Source: ACHHUZ7/bXnQVjLPpiyc3uSEjDr+FSZ/NtFlYA34O9DkwBHezk4wWVKKyVZtaCb/wBtFIl1nnjSLDQ==
X-Received: by 2002:a17:902:708a:b0:1b2:fa8:d9c9 with SMTP id z10-20020a170902708a00b001b20fa8d9c9mr8467088plk.49.1686641210024;
        Tue, 13 Jun 2023 00:26:50 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902748400b001ab0d815dbbsm9446677pll.23.2023.06.13.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 00:26:49 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	jszhang@kernel.org,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	nylon7717@gmail.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH] RISC-V: Support 32_PCREL relocation type in kernel module
Date: Tue, 13 Jun 2023 15:26:44 +0800
Message-Id: <20230613072644.10487-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_002657_383558_A2E4558C 
X-CRM114-Status: UNSURE (   8.40  )
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

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/kernel/module.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d55fcbd..f52d8e3d4b63 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -310,6 +310,15 @@ static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_pcrel_32_rela(struct module *me, u32 *location,
+				       Elf_Addr v)
+{
+	ptrdiff_t offset = (void *)v - (void *)location;
+
+	*location = (*location & 0xffff0000) | (offset & 0xffff);
+	return 0;
+}
+
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_32]			= apply_r_riscv_32_rela,
@@ -335,6 +344,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
 	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
 	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
+	[R_RISCV_32_PCREL]		= apply_r_riscv_pcrel_32_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
