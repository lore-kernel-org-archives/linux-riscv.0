Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7A7C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAxDHh/6yF+jQHRAEUu11YNdXXyW0DjhlbKMWkN7af8=; b=oOEfMNI4U7vqkw
	1oPqlo4wyeGoUSO0ruht5Sr3cjqcHOnzgOEKhp+TteSfhlNR6gLrBjrT73v0NELt6G3kNbsUq118Q
	JjWNPgV0EcTMMhSP9gTfX7HJ/vBA2NETBrTFWBJ9JHdwKIackXyqbIUzdLEUFdp/oWql6Wn7bxM7K
	It6707unp6LOdkhSD98jlE+iSPUrbHoAZ7wVqYldVHa4HhrYEHRqtes1TQvTxd48NQcM4Vxa4gvHh
	2eiRUHKUoPmEWC/JpRCDDjG2NtgWzNkAAzjliX4LGF34f/M64m2f53BgC7G1RwYsR+usBXMmLWcjP
	H2AsBDBX15+TVdcd8SNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHG2-006eSi-2Z;
	Wed, 19 Apr 2023 23:30:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7K-006SnQ-2M
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:17:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1a5197f00e9so4654945ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942652; x=1684534652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mljZsiO5QRb1GQDkLUDPFjVfkuRVaSDyhp9y+byMdss=;
        b=rSiuLSw6DyvgYFbph9bmFmqDG3DBHXwiC4IjLHTdoeoNqI3Zj5mvjcgftruD3sRQcL
         WxDYcG6ScHPYH/tsYrRzbCoTKzHkW8KNXh7K15sX/3vd0JxNdmgwDLmJ5Gbl1ptnc8kV
         B413qUWKvROFulz1VG3quMom7gr4KDz5SG6hA7i1NB7suVliV8jg80Ei4eKibGK25dVw
         IUKYu3sVmnUrAoFcDhoqyEJFPDZqPR+RsU7ZbMNTfRONc8CY2sotnhibyQDIiJL6WP4d
         uPsZMJmzwj1MOrHzXnjW7uCJa6/KKt6iVnYO2QkJX8Ox8I1aJyUyI4qshbT0yxib1Rsh
         ovBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942652; x=1684534652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mljZsiO5QRb1GQDkLUDPFjVfkuRVaSDyhp9y+byMdss=;
        b=clwRyi2lSO34ErpWNwgeKM71+rgmwdlFcBivWCC3WaEv3aNIFcQvs+uxR6i7oOxwTB
         PfaOD4kiKs4Or9yhm5VAGqjvFQu5eXTyHeP67o+a6dGFPwbkupj1ZUhhSktcvYfJx7dh
         Ln3lUEKVAd3K972h7zOeGEJIakfP3/NdoRLE1QGIvuFBU0uCbqxDY7U+udp0bg7IXgRJ
         tHTQxqrUtbaPuNiI8vhX0sSEeR6FWzBTp23mUd5STwd2lx5Z5UyITSkTw7uilNg56lf4
         9IGs9mL+uliGMg7OE5Lnc1plknULnh5RAg9CTmJjQNN2sOswHtzyqnt5DHF12gtk7r1W
         UdQA==
X-Gm-Message-State: AAQBX9dxr7RM3eXJaGpza8Q/bax7dsC9HfycZjh34GchuAxWAxurLtOT
	ZhL+xXVC5uMav5RskUbnvy+t4Q==
X-Google-Smtp-Source: AKy350YAUHKVoqLB+lNg1GyvGR/YhY1dexLjtDy2z84R1FBjB72vycA1EeypPas5l/++BhN5lcYzyg==
X-Received: by 2002:a17:902:e74c:b0:1a6:4200:bef4 with SMTP id p12-20020a170902e74c00b001a64200bef4mr7961111plf.56.1681942651818;
        Wed, 19 Apr 2023 15:17:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 01/48] mm/vmalloc: Introduce arch hooks to notify ioremap/unmap changes
Date: Wed, 19 Apr 2023 15:16:29 -0700
Message-Id: <20230419221716.3603068-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151734_779482_E9A120ED 
X-CRM114-Status: GOOD (  13.15  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

In virtualization, the guest may need notify the host about the ioremap
regions. This is a common usecase in confidential computing where the
host only provides MMIO emulation for the regions specified by the guest.

Add a pair if arch specific callbacks to track the ioremapped regions.

This patch is based on pkvm patches. A generic arch config can be added
similar to pkvm if this is going to be the final solution. The device
authorization/filtering approach is very different from this and we
may prefer that one as it provides more flexibility in terms of which
devices are allowed for the confidential guests.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 mm/vmalloc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bef6cf2..023630e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -304,6 +304,14 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+__weak void ioremap_phys_range_hook(phys_addr_t phys_addr, size_t size, pgprot_t prot)
+{
+}
+
+__weak void iounmap_phys_range_hook(phys_addr_t phys_addr, size_t size)
+{
+}
+
 int ioremap_page_range(unsigned long addr, unsigned long end,
 		phys_addr_t phys_addr, pgprot_t prot)
 {
@@ -315,6 +323,10 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
 	if (!err)
 		kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					 ioremap_max_page_shift);
+
+	if (!err)
+		ioremap_phys_range_hook(phys_addr, end - addr, prot);
+
 	return err;
 }
 
@@ -2772,6 +2784,10 @@ void vunmap(const void *addr)
 				addr);
 		return;
 	}
+
+	if (vm->flags & VM_IOREMAP)
+		iounmap_phys_range_hook(vm->phys_addr, get_vm_area_size(vm));
+
 	kfree(vm);
 }
 EXPORT_SYMBOL(vunmap);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
