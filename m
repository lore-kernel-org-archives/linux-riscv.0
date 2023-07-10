Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C9DEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8XFT/+Wk7WTr5oNh00e/3Wzp8TQe3l7XhYL5lW5KhqY=; b=sm2j46k1pKvfJy/w4QprXlMfJ8
	DD5OiSSj9JKW2Cn/TwOeXQPoZOk71SYDsT25mdl2JuIzlX0aJcf4qR4fzr/YbosJ6Ic60zqRLwPyw
	MP74v1vtyDPngFhNQ6AXzRB0F7hHRmbqSfBzACDOYKzvNBswzCs9OMjx3M1cJzxDZ1+lCx6026lUM
	koSOWdAiMsZt/rIzKT7VBfkJF2x+HLkhkBVlITgCCn4WXg3DKSN2fsnOKY39W3f1o4hBCrUbO3KSa
	Gi5eJmyeir3mOy4Ehv9vj7gpqVG6/QqJuM/sLcF5V4TblyUWBZ7QlWJH5Q7GAXxHY98bUMPjlh9Kz
	7OK4zy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjv-00CTIz-2G;
	Mon, 10 Jul 2023 18:36:03 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjs-00CTGb-0L
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 18:36:01 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c6ab0d1b1dcso5068257276.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014159; x=1691606159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U5TIV77Gf9BVe9e6kCB4/ILVtLRCWpn2g7fhFOBoE3s=;
        b=qwyEfW3Cmou0wgR8ApNwjEhaMEQudKFycuSBNRASsvYbO6BVLK0h2HB5eRL+9FdoMU
         cHkqVYioIwvINUHdXDqouKSsUkMhNEt3vlZ5EhDdG/GJ7aS6sxT9BTuMO57QznLtk4Do
         UOyDz2FVIrzepF2aCMOr8gdFR+IFDr8Yizd130zu+X1a5ZNeGj0E1pS9r4u2rgJl03cn
         LvhEifvwZc9TS+BeKevDHotAcWKC0F37ns1qqWpTSOjO5WQ638Ecmx2sZTcvgnkz4ikm
         f0djXHkpR6yjiOb0JfKYanYVo4ymoKD9Tm6gnQSjri0cs478Yrmox99UBLIWxPCVcuw2
         insg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014159; x=1691606159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5TIV77Gf9BVe9e6kCB4/ILVtLRCWpn2g7fhFOBoE3s=;
        b=PFnAdovzcydxdWKkCBLij5yreOf3fbO1FjdTlsev/H4tocxRCem2MnPQXTSopkAD9I
         e64VFpMtdXqGyf6F+V5Xl+Ieh/Dt02MRbFM5PtnaAzZQtQ27y+Z2oZiNYFIyhEkd7ICS
         uiqPv306wKzPURK1KL14Vfm4OnXBcYj7LWv3QhAbgiw19mpwendTtgr4rI13iZzZ4cNc
         1t1RNmz8vd3fbB8VgLP2A3StKRHAfGA0Aw3z1CAfGWjhyAq558MVKjiZgTEabKLeqQzy
         MLoaPAZsUbGThwQrMHFTGfgidQu78biuxXun8YiOpseI2n5ceu3Mlw9/E3MMmtXVKsCi
         BuLg==
X-Gm-Message-State: ABy/qLa5aqXtOLhliF5/IRvaKYPgqexXN6HCa6nkLj/RF5bvIm82F0Gk
	5QA0SrHtsYkA5qDduCZ+joiJhZNaSf3NjgJ1Vuo=
X-Google-Smtp-Source: APBJJlHCBpDFRan8lF/OCBAcQRzjHMIn7AKZyi8KrXyHj/pOEPwKO6DHb0dieV8Bld6b3gSNsuAgryF6lwn80bKvU1E=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a5b:90e:0:b0:bc0:bfa7:7647 with SMTP
 id a14-20020a5b090e000000b00bc0bfa77647mr78507ybq.0.1689014159077; Mon, 10
 Jul 2023 11:35:59 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:51 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=786; i=samitolvanen@google.com;
 h=from:subject; bh=Kirtl/2CH574RlVli6RH7Tr3lxFM3RdB5GGPayWpFT0=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+BGANkjs7x+hs99YYaMrhZLk9av9PmK51ek
 dJTYVpr+pWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgQAKCRBMtfaEi7xW
 7nVMC/0YbuLZxw85M9u6LDaUUwcWbWuX73K0i6Ow+fZlwze0XWWIw6HwbB4a4LtG5NRd9Tb+RYJ
 j6jVsSUO6MPXn4uUYYiSa9lKiKsUoXUkG02C9xDkX6cCn9Zd507LQGKmZW/mzDns+m5H6sdb4O+
 9tuXpgxHMtOmmnM9pQseqzSsfOHRdBqZat4JjmG7GjuAU4mco3J7hCmubi/E4RyACCVYpYkk+wb
 gKCmfg89QQ/bzonXsdRv8Wj2wGDw0IOP+vQvx+19bw1u/LnPEx3L4TuXxYIXoVxS/vpYmdH56dc
 MNLQWYITWJbBzw5z9es2HByxf1uOi1N7FAVFxi9/wKQruIfPbzdUCWTSfhXRFBJ9bfh5ByFoLAx
 mOa+Dld6KrZPLvF+QuOnUt5fiMN8Fk77zFkUYLruYGIDyhJci/wxjNRwjHzVLnN4VwJPWlqZnUZ xd4WtDmOT5gKbgSr/iqHLa2YfhwhUraInyaAMD6csG1kxRAfyFOeiEWRFpP63KzG8Oz78=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-14-samitolvanen@google.com>
Subject: [PATCH v2 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_113600_144926_921962BC 
X-CRM114-Status: UNSURE (   7.61  )
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

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
on riscv.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 29fdba9d8514..68c790b181c3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -43,6 +43,7 @@ config RISCV
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
