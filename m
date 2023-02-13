Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C750C636D7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJyFPDYSErWSuGq/r+qx/W8Uo22NHyLfQJxSLwgcBQk=; b=Js3ytyJo8bFt41
	xBaxMR2jwzlRDkAdZIOUSLuu5TjLuDLUSxoEravD1xbRGaNSrGx7zCOZiq+utSkK7V4rygW1E+bJb
	gg/Oaeqh/VG014GyjVeOafPaqgv/C+3F14KVuKN2nfrmmOVsbjJ3FoSXTlR9BzqhXHwjOC0b4wxJc
	V2RmjKnCqvK9r5zzR3xY8Cgn+MzzgY2+XEEaat/mcrddFr9vZzwe/I9s09YFhyB716WFEG70VtEvh
	3n1dk9sdZHtaatoX68oWOD3dJYD8gUMaP1tiGTtDtTzUQ0p1wZFrRkmaRkJToVJmutToal5pG9sFW
	O+MllIa1MVeyXMKHvixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrL-00D9bX-6X; Mon, 13 Feb 2023 04:54:35 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr7-00D9Q8-G7
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:23 +0000
Received: by mail-pj1-x1032.google.com with SMTP id nh19-20020a17090b365300b00233ceae8407so3451236pjb.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAzQKFN9fphLzkQzVxdl+t+n6lDoHdhoPqbxrAYfAdc=;
        b=kZrZu0bYDptQxePaYYW5IiHENzLnR3Hl5Yn1XhJJL9GBA8lybF2jXV1FzNJJxICLkT
         a76RJFpXxug5ATjloRUOr8I8E6r1tLzdXjGJ0Qsl+Fq7DgOVfV1Tj2I18RmYVVGDny57
         stTv0BaITP2dFVen5rv+DyWUSEmR4p/4j6Do5jXOkmSh2aCjXbc5cneDYp6VKgWxdYeR
         V/IITNgt28T1uNdrYT+/i9jvhEWnIFHLATtGzqhKDcK75PyIrKDukVVcIaz5/ofVGCtN
         JzG6CdfoohdOh1bR5skxW9jJEL8WNm6Yj/noVQmdJFlL81MDGK8ekdk5rZb7EPVZFOCh
         cRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAzQKFN9fphLzkQzVxdl+t+n6lDoHdhoPqbxrAYfAdc=;
        b=fug5rTRTJYABTaUjMWhZ+/W9p98AyxWz5jgFsaYNSAuklKEkii8BFa7hRu/8kHJe+4
         PZ4O/1UY8OXGvRFfQvwn/BrxfpeBwwsizuyVQkjEucn9te9Oc5PDeWxN8LtJprMA016v
         i+mBe9sj4AdvFfkifmle0o+MCpiHNXp6nT9lz8pHRqvqmCLhoWNBUBrb/hb5C3thcdNd
         GCfzg9w5B18O+tRmGl7Xki1B4DG8anryIVmf6mRw0EDZrNyiqceDx0B9S/ifmeP/1z+o
         cdzM7hhSJIjB1fbEMl9ZCXnLDn9cU8bgOgCbE3/sRV5ctWDy0r+a/5Q7cPAM4H7AOms9
         PCEg==
X-Gm-Message-State: AO0yUKXhRqnQ/H/SieYwRCZSjh2iZTECvKtQpbBOHBf+j+WxS0un444m
	UrPOGMODc6M3z6ir8ApPlWUXiA==
X-Google-Smtp-Source: AK7set+q3tR/PIwP9Bbjl2iUKClzuopM66yTbSa12i2bcSlheS/OuqnmDnzRqlEjdGKp/Rvp7uURng==
X-Received: by 2002:a17:902:ec82:b0:198:f145:504f with SMTP id x2-20020a170902ec8200b00198f145504fmr29915899plg.30.1676264059867;
        Sun, 12 Feb 2023 20:54:19 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:19 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 12/20] riscv mm: manufacture shadow stack pte and is vma shadowstack
Date: Sun, 12 Feb 2023 20:53:41 -0800
Message-Id: <20230213045351.3945824-13-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205421_604034_0BB3A8CF 
X-CRM114-Status: UNSURE (   8.05  )
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

This patch implements creating shadow stack pte (on riscv) if
CONFIG_USER_SHADOW_STACK is selected. Creating shadow stack PTE on riscv
means that clearing RWX and then setting W=1.
Additionally this patch implements `arch_is_shadow_stack_vma`. Each arch
can decide which combination of VMA flags are treated as shadow stack.
riscv is choosing to following PTE encodings for VMA flags as well i.e.
VM_WRITE only (no VM_READ or VM_EXEC) means its a shadow stack vma on
riscv.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 8 ++++++++
 arch/riscv/mm/pageattr.c         | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 13b325253c99..11a423e78d52 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -344,6 +344,14 @@ static inline pte_t pte_mkwrite(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+#ifdef CONFIG_USER_SHADOW_STACK
+static inline pte_t pte_mkshdwstk(pte_t pte)
+{
+	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+#endif
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 86c56616e5de..582e17c4dc28 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -233,3 +233,10 @@ bool kernel_page_present(struct page *page)
 	pte = pte_offset_kernel(pmd, addr);
 	return pte_present(*pte);
 }
+
+#ifdef CONFIG_USER_SHADOW_STACK
+bool arch_is_shadow_stack_vma(struct vm_area_struct *vma)
+{
+	return ((vma->vm_flags & (VM_WRITE | VM_READ | VM_EXEC)) == VM_WRITE);
+}
+#endif
\ No newline at end of file
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
