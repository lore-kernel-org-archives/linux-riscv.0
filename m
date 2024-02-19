Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE67C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5tbnb4jZayZeEIaZ3IHyqxrdI+KikYzobSTc0UfLZk=; b=e0x+6iDilqrVx8
	2fjpjD+TUj98b7z35FrNQroG8XHvQWCNvCPE4n8otw7BFZ5aJ5drDqgENKaR6rWKS+kzG5d1INMnC
	9nWt23Db/olfsJPcsv+l7IpvVATo5HpbzzfJm+DdGUbA4EpbMGQ9R69iWkpzFIuwrBFIosrnkTGSy
	3NsjA1jeheo+efvcrImZh/hQITB5Jlf+rbm3S4DgifH04/F2AXaV3oc4VkSaWcUGBuiyZHYzh38+g
	l2sXrtM3hUgbKWNbzfszyuQhz1JWTzUknFpIyNNeQb5GIT7WreGtEL7bL7lPEsAvaT6bYHhwBFRZN
	G+bIKFtL7L32Wz94BgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc5kc-0000000BA5p-3QMi;
	Mon, 19 Feb 2024 15:40:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc5kV-0000000BA0y-01UZ
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 15:40:11 +0000
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708357205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSJH2Cy3AOqZmgikXh7qng6szl5HlWuz3PgXeKPeks4=;
	b=e8ck0FruzZ8Ag+/b5iHDLfIUxz9zmagc1f5rEiyK5hbbzj/S1I6gnFAFXaVxyBtsMkqHzF
	r3sco+vWtbdQfXMs/jAETq3/y9aizlcKB6nlpxeqssBVvNsHtpfgiak0jRhNchDVoGjYKq
	RZPEA3ub6REw1ibtUcbODrfwKIIwHzy60GRhDTtZ0y3wAORbzXwiK2V4vJ3zVWTB+L9Ky5
	3ZV9koyLq5KoU80y9k6mp+yeksnv1k5N8zMCi65KDKTGZ+G0Y5ATW8+/nHgR91kIoE43T1
	GIvca5Ues2wsqmpjhDoIhNEMY5vX7qfxmb3U9m4wISnoEoWZyJSTVNr2dPeqsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708357205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSJH2Cy3AOqZmgikXh7qng6szl5HlWuz3PgXeKPeks4=;
	b=OUpLh70/kjYmndXYQ+Zlava3G4i+VeFfT1Xxc2MZrt7OW5qubKGDDj7Q3tgRl3hGOuaL6g
	Nbk18oNRr5ZzodBA==
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 06/10] riscv/vdso: Use generic union vdso_data_store
Date: Mon, 19 Feb 2024 16:39:35 +0100
Message-Id: <20240219153939.75719-7-anna-maria@linutronix.de>
In-Reply-To: <20240219153939.75719-1-anna-maria@linutronix.de>
References: <20240219153939.75719-1-anna-maria@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_074007_211847_C677C8AD 
X-CRM114-Status: UNSURE (   8.06  )
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

There is already a generic union definition for vdso_data_store in vdso
datapage header.

Use this definition to prevent code duplication.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/vdso.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 2cf76218a5bd..100cdea6d3e3 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -30,13 +30,7 @@ enum rv_vdso_map {
 
 #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
 
-/*
- * The vDSO data page.
- */
-static union {
-	struct vdso_data	data;
-	u8			page[PAGE_SIZE];
-} vdso_data_store __page_aligned_data;
+static union vdso_data_store vdso_data_store __page_aligned_data;
 struct vdso_data *vdso_data = &vdso_data_store.data;
 
 struct __vdso_info {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
