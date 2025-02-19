Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373E1C021B1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyzP7B3+i1arZIN5oLIVE7cA0YoCnTYSlywcqbqoi2Y=; b=omkQbhcR6/0Ns6
	S8fOJUGliYLRb5jSL8S9uoHBxlRxH4efKbpk42iitLrJb5lNXUc8CZ5CogEq0GkoaccKddV0uVJ4e
	3//5esrQA8T0I/rffDNekgSDJiuAKmddLJCeP72q2vVU2Jyzvte+JlGxxp0MxMN30wSQE2Q4FUIgP
	9vFuc7NKpG/TbTCDJEVq/3LydDqO7KcgZsyviCXV4Pa+aVvPYJc+9qVhsFPHDRJek8bY2U9Ca94+7
	Usl5rB9vWR9SxkrHgG01c3sGNk1Q9F4etP8qa4PdT277Fkn+i3b/J83dESp/+NC8/Z1Y86BxYBDBl
	6s65gcm4MVYTSIIFl44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiSj-0000000CTHk-21HT;
	Wed, 19 Feb 2025 11:41:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiSg-0000000CTGE-3Wmb
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 11:41:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220ecbdb4c2so138000705ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 03:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739965314; x=1740570114; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TvtQB/lGlc+Tk5xjdqGmPEVFQSYg82f1Tgy36DWvKQU=;
        b=cSGmR5W6yOjqNhoBDZKt164epZVwKQagDLSCPptp2kyK1zq8UX07oQz9GSeGqEIP+b
         mMLi8QTbRHwCFMHR+mvUaA7S8+uV/x6qRBWwrIfsUaPikl/fIfCWVZCSJTAK9sLfnPOQ
         Cg5TdaQJp+LqvCDi+xDP4KV7kRq7AtGJo5rE/CP23aSbX/oYNbn8XDOjt289Iy1KqO4r
         aAD1C7BYzgkwDDj5IX0DjPuN0nq5HuhqAb3FY/oexmxELSrIrbyuQ3Y+kxhXSlGpCq+G
         Y7dsunyUrvWjnM7wnoR3EDFT/HhoA7+TqWohMD4kVsWy6Iin3axuxGiO9JoVdaOgcnXm
         gdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965314; x=1740570114;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvtQB/lGlc+Tk5xjdqGmPEVFQSYg82f1Tgy36DWvKQU=;
        b=rLoFnHZrfj8HaOVM+nDpiKYCS5pr1p1cS2B1QamTJfgMRBnxnzuUEAERxCZ3A1/q05
         nYTfFPj6wNwGZi4XdOtM1omC8V6w39Ml7UxQiRnHk0THBwIjUBgZhHJP28gv/z/0sOfo
         Wgkiq+H8FxrWAaiy9yNyBeBlWYRoHB4xuoDQY6jjF6GnCuDw+GDxAdhMmE6fT2vX2Dek
         W/wEooSf+GuHXiZJSC3KoBVhvktVpMzlEmKvPeSRne3Cx07aINiH5rmxIY/EsuXvpTE+
         c9/xw5tLBbVeAD/j0H+LjTZgv/pNxD6kPHiAsmSQ5TUdKyxDy4CUPO25l8G6a9eBkh6W
         bGEA==
X-Forwarded-Encrypted: i=1; AJvYcCXTscPoH9gPI1Tkt3rxdXlkZKY4QMrIeTACBR3Vf6H7HfI+C3sSI1z7jTgLlCkw6gKluIcZd2CjllxRRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjR2DFRDB5AljLWVBquc9ey4Fo3WX2DlhAJesNKVHvFzNYbBP/
	9tSrYVCnySsXRlMDvGNJYQW6jn4cCz8d5g7xPsb5tkNudmAGWGsgkh/ZPxXkYzg=
X-Gm-Gg: ASbGnctrKr6TFyBDfbBd/QmahgJEvrjifPjyt/udzBWCb0LmZ1CTt4jFcJ4QfNY7QKe
	KjYEdZZeIapWHauh0TvkIdTL6f7jFkjq94vebwhdlHahPDR2rzjA+U+7zlzcXHBbxdIs/4Y0nOA
	qh1CZSyKZ1N8inhI8EhSlmjvq+SfIaSabYJH7S+JT/TPfLtVJdSQxgihD5fCySfsftE1l8JQ/d3
	i6K25HameCEzkNSfWPd5rGYBkZFuy7rjatsD4fZiKvCwPB7csc0eeXn7qgPpMZjO81IEWR3pmTu
	URA7ujkTNcMeb1+jfvzv/uOynOmd2V4OkE3LTg==
X-Google-Smtp-Source: AGHT+IE6NLalTRKF906UogoaqA2vkhz8eL3B86SceRlnQGiSoGs39HTOQJs5eyoh/PazNPL54JFJxQ==
X-Received: by 2002:a17:902:dac5:b0:21f:507b:9ada with SMTP id d9443c01a7336-2210405cc66mr282536845ad.31.1739965313971;
        Wed, 19 Feb 2025 03:41:53 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d507sm103218545ad.145.2025.02.19.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:41:53 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Nick Hu <nick.hu@sifive.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] riscv: Add stimecmp save and restore
Date: Wed, 19 Feb 2025 19:41:34 +0800
Message-Id: <20250219114135.27764-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250219114135.27764-1-nick.hu@sifive.com>
References: <20250219114135.27764-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_034154_879757_0187E819 
X-CRM114-Status: GOOD (  10.29  )
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

If the HW support the SSTC extension, we should save and restore the
stimecmp register while cpu non retention suspend.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/suspend.h |  4 ++++
 arch/riscv/kernel/suspend.c      | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 4ffb022b097f..dc5782b5fbad 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -18,6 +18,10 @@ struct suspend_context {
 	unsigned long ie;
 #ifdef CONFIG_MMU
 	unsigned long satp;
+	unsigned long stimecmp;
+#if __riscv_xlen < 64
+	unsigned long stimecmph;
+#endif
 #endif
 };
 
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 9a8a0dc035b2..24b3f57d467f 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -30,6 +30,13 @@ void suspend_save_csrs(struct suspend_context *context)
 	 */
 
 #ifdef CONFIG_MMU
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+		context->stimecmp = csr_read(CSR_STIMECMP);
+#if __riscv_xlen < 64
+		context->stimecmph = csr_read(CSR_STIMECMPH);
+#endif
+	}
+
 	context->satp = csr_read(CSR_SATP);
 #endif
 }
@@ -43,6 +50,13 @@ void suspend_restore_csrs(struct suspend_context *context)
 	csr_write(CSR_IE, context->ie);
 
 #ifdef CONFIG_MMU
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+		csr_write(CSR_STIMECMP, context->stimecmp);
+#if __riscv_xlen < 64
+		csr_write(CSR_STIMECMPH, context->stimecmph);
+#endif
+	}
+
 	csr_write(CSR_SATP, context->satp);
 #endif
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
