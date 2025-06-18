Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF6EC7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHBFWMlytXg323bts36AIBx4MNPrqmpC5YDmbRbRmXY=; b=OQDHfP/ynr5K/u
	QpPvCBmbFA5n7ghbadwz3uqeNeUVAN/IQz9tf40F0rnP/wHOSPjgqzRQ/FGiFxcYxTV6WqTkbqPy0
	RkRihUZ6sQ4tfkE+/qJn+yxoynkli1b334y4WHXoTkCK2QveVRZdQ8xvnBAN9mciqbFctCuemgI7/
	M+7296Zjb6BweixIi2sLU6bpKkAjU4ReTLBvNYpXwCTxJBmcWRgsH+yxyPOs6EljTwYSxEpZlj35Y
	ocmgXputHB98LjGOlSADIiP+qdsJttdGkkSdYHMEyf6sMSkUtzoxesqZ7Sem/9XFk+MeSZYWSrQhQ
	JSYRQCyrGM1A+bsN8bYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWn-0000000AEdx-2ZuO;
	Wed, 18 Jun 2025 13:08:33 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5O-00000009xi6-3CWX
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:12 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so5616361a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246570; x=1750851370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ernJHGr8wUUltKH2OhtBcW3LIbI4jpB3xEJEU1yumiA=;
        b=DZK6aNH7zCc1Y+QhUmSwR1Fg4i2CWWe8HPIpuELjJl34ekINzS2z1kd829M9q8hC8q
         EIUtOC2SokP+8P4HPFIWpF8Bjz/OWgAVDkkJ7k9jYJxZpBupy9tI6EbkCeq7aROSGetJ
         Tt6Yu+prRnmNqcQLNY01kKEB5Vverlt7PhOX1H43xiZToDcFsNJfCdsT2bJ/rXuM5VMD
         8FX0BWaaTaXiIZngsAtjy9X7chuyMyabOx2JdfSB0kY+p04/kOhS4V7XDMnvE9W//9tZ
         7b9Cvtz5O/7WsuVsZigLj0xL6HuqFuzR6JxVwfUvjuofK8F0aUY2SUglYSdvjSPobPf3
         q6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246570; x=1750851370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ernJHGr8wUUltKH2OhtBcW3LIbI4jpB3xEJEU1yumiA=;
        b=WXoIg/0uf7hgMe/ZaE6nXy9OgaO8xYmIUzJoRh9/eRavB+91vmmWdRyhvI84KczooF
         DdnXN2i5MseB6HFXqBVUyhIlSnxhzWzF8PdC3KVqXVaUeWzvGOOMucs9hDv3EyEUlFWC
         3hzx+hbyx3YQYWFnP6kkwVnvuPO7EYsuvbpVP0Qgh+iGOnUiIVbqb26ppdx4CarLTqKr
         m14XmTr9v0ZboLwWmweq5jsPQgKEGJaDWnwk2L3Yl5+T2t67vdJurCa0tPX6WPtk2Ytt
         TMVeiTub5HvjjyAqR5w8dYaXAUb5KEzGZuMdvYvXTxD2hlz1sgIwiSC5DKtircIq3w1n
         4ARg==
X-Forwarded-Encrypted: i=1; AJvYcCXYsXItd9jvxod1sfzyq3knoCfX0LdDK6z0eh7iKb2ejh/fbvgMzFQTY5MG/FXG4NE+6JHInNkTu9droQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4oIq4T4yUbFejSxLJNtVfypEiSDegkZs/q2O0Kx9R89nr7/JB
	nHUXRIOkDLF7LgBGlIm1o2t+IIYnzaEeKanlLtz00onPo0+KJfCCz1L7GiaL5MAaf/Q=
X-Gm-Gg: ASbGncvcV2dPbktTxR5o9F9inXfHTN/mPk161JeJ1wX5JmEmVhPvwq0ot+ynjP5y0nf
	NtANBO5aEz45EXOR2K/FoI96zGzpm2IrTA7q0WSMJ/RkshsXtkSlpmId5lOMERx0wysrwAciV0Q
	nmuRshz9GmiaN/pXeeHvAFiA1FY+YFxBKu4td6mLkjOzRcfsxbPIOlhhi28FpPEAKgZDj8nV4Dt
	DebKq3wOuXGOw/mVddRmDI160xJpyhbwHgOXkzHrwPu59QLj6rJaUbnhieM4BXEnm1nYJzJIu+t
	iZ1LIb/fEQq3oUlJq6d4tTb/5NrZDbLlqycj+OHeMNfUWjgDFiyz+gcPTi6CNPxwCtG6eiNqfUk
	Z6kXvIFn31x2sMqhwEPnZ4nQpq6So
X-Google-Smtp-Source: AGHT+IED2oGexk/JFxqAVuWpL/++/t8pIqk6FimHQhJH+vt07+Mbc0bPBQs0X+EavqGGcAYnWQlaQw==
X-Received: by 2002:a17:90b:1a87:b0:311:abba:53c0 with SMTP id 98e67ed59e1d1-313f1c03004mr26620231a91.9.1750246569846;
        Wed, 18 Jun 2025 04:36:09 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:08 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 05/12] RISC-V: KVM: Don't flush TLB when PTE is unchanged
Date: Wed, 18 Jun 2025 17:05:25 +0530
Message-ID: <20250618113532.471448-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043610_804800_74EB1229 
X-CRM114-Status: GOOD (  11.12  )
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

The gstage_set_pte() and gstage_op_pte() should flush TLB only when
a leaf PTE changes so that unnecessary TLB flushes can be avoided.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..29f1bd853a66 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
 	}
 
-	set_pte(ptep, *new_pte);
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (pte_val(*ptep) != pte_val(*new_pte)) {
+		set_pte(ptep, *new_pte);
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
@@ -229,7 +231,7 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
 {
 	int i, ret;
-	pte_t *next_ptep;
+	pte_t old_pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 
@@ -258,11 +260,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
+		old_pte = *ptep;
 		if (op == GSTAGE_OP_CLEAR)
 			set_pte(ptep, __pte(0));
 		else if (op == GSTAGE_OP_WP)
 			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		gstage_remote_tlb_flush(kvm, ptep_level, addr);
+		if (pte_val(*ptep) != pte_val(old_pte))
+			gstage_remote_tlb_flush(kvm, ptep_level, addr);
 	}
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
