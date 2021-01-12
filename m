Return-Path: <SRS0=7m3b=GP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8D9C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 02:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E6622D04
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 02:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E6622D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NrzwpkONACYpB/POv7a8Dfht6hSaKIA5gUiUjDh4w+Q=; b=2ubY+gRUki89ruw4GZ3iDl31JB
	4JwKQwS91Zc3bJssecnODWTHvc9t2ragyFebfCpH+3sbGZkIvuCwb81apSFqK+VFcyOlaDDhOGI5C
	RCAaE05u34eyX7qU6n0tW96aAA3rIyFm0GNo69yZnERW2bnly5lC47vdXkVwcWOONU2vlZy+rkJ8z
	9USHMz2CQ0pIYJsn00ffGrFDmY9SKvmxCdX0v/6pTTywSEfBOMKWtk/WCXSZZScHwAZKvl7WVjhiI
	b/ZUkuCf9/BeRWf6kZyKvfcr8g5xEZYW17Rha0v4jtGWCZ0faLA7tYk2oLOrqk7Ss3NaTL5+iT7Q3
	s762hGMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz9ZC-0000gG-77; Tue, 12 Jan 2021 02:37:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz9Z8-0000eb-Jk
 for linux-riscv@lists.infradead.org; Tue, 12 Jan 2021 02:37:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D3422CAD;
 Tue, 12 Jan 2021 02:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610419068;
 bh=sK4Lld2OfYF7cZZkxMp0bBGgxfOde4PwtozvlLWeiGo=;
 h=From:To:Cc:Subject:Date:From;
 b=aubr0/zhul2ZBGUk+kNEweUlY9ngTUDB28nsC0iUbNKcKzxlV5Xt6wMFVJSBUUGJe
 x6DBp7nVyDY1aitcpq4teX6nHXn8NkyVtpX8HxCI1Z85y70FXsF8QSbbbTKfWTP6Cs
 nqYlbn1qcWJugEXe879LzQhIDYOudfDlVrtL4ECO2GbqctAxqTHy6N7UNJp9qVIjnu
 WYzx/OyR5Jg5oqbngQDfRyhODvEIzK11vpE2QNQ/oBK0+rre99N6ekXUu1cmCHmqGE
 NKm5h/raBw77uXW2uFvJ8sBJSIcI1+TF81SQl9Ear8UxFdDoV/EFsSCLKYuuR5lyAC
 u0wNGdGHWO+8Q==
From: guoren@kernel.org
To: palmerdabbelt@google.com
Subject: [PATCH] riscv: Remove duplicate definition in pagtable.h
Date: Tue, 12 Jan 2021 10:35:34 +0800
Message-Id: <20210112023534.117354-1-guoren@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_213750_738433_6AABD4AC 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

PAGE_KERNEL_EXEC has been defined above.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 41a72861987c..dff51a84e52e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -101,7 +101,6 @@
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
 #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
-#define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
 #define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
 					 | _PAGE_EXEC)
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
