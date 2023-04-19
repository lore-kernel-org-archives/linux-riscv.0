Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84357C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/lpSN6LVnENVOmYwqzbcCOTk8gm4iY2IbMAiBLwh0w=; b=X+oJ9aRcow2erQ
	8tWrRyD4GEP6zU+Jv+8IbIGmEPh7NUCTxVwaFVqO1Q+imdDxm/neBxKX5M88xogKa25Q6amVGBni9
	9yb11mo6Tq0GUZeZqg9ENCWZ+hN5KJ4y9OKNMqGXlDE1HQ6UGgNILKpOJVWX/SYeDDGHWSVyNfGqj
	YOWsYttrkm76mLMGOOmw6Xg72YYs1tij0aFXLQWEoawH3IXgftHmtpKcJF/MjiQBoFNvy9rA0O3ur
	SzZ8iLKGFqVX+73aFmOnm1W7MnaCbWotb/tUNfb2FIUVirngEu28AsSg/vJEsNko0DWsCLj95XZeY
	sfkRZIyNVBJNmNV9o46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7z-006T5s-3D;
	Wed, 19 Apr 2023 22:18:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7v-006T2d-2M
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a6715ee82fso5264415ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942691; x=1684534691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN7cfqRTuUxE4NYFTrE6RcyXhfZTP+XO506Z7P5jnSo=;
        b=2HntuY5n1tLM4pNJa7nz4osjLmrd+gHhTujKcUSE8JGJeCF47AW9Dyj0rRPbdS8CKR
         ec8mdHxJp3zhFL+VPoHjKpwqqItbmuGrX1ePOLL/H/CjhizNW48AJx/+m0SEc6hw+lrg
         4TAnXTUfT+76XBgFTJYmo+eDlVergYm7g4UDIIG8q8towz6RIKhd0qUN5gI1M3MPJ6Yf
         v6+fwgTgJxyGyevBN2wreiHgOozsBMp0FBa2pY9PJ2gXBMvj4I9WYLUgQzPavzY4XGMn
         BfwkMktMwYiFO0NHEmqBJ8uwsXt7UjR2yMhk7oglZtm60MHD5OqGzZFoQLQcULwN1VOW
         9p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942691; x=1684534691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN7cfqRTuUxE4NYFTrE6RcyXhfZTP+XO506Z7P5jnSo=;
        b=Jg/gYYBVNwaLQ9ZJnITWtTD7cPkUGhRkCxD69+CHBcQZeGr4yNmen9Nucy4zdBDSGd
         GSf8AaZxQ4OKSRX3DQ/EHy7gpjtrrjTyKs6uV77TeOKvaIbjoDLbvi0Dx0EcY3Epruxy
         xKA3C8BbdIPjXDscsBlE0Hhd6lZq4Y3M4cAESs2pvAvC8kzQrrYwgNobZC9J8DWrvwKQ
         UeZVmHtGnlcLrut8WOfOHrr1LnM4ay6MQMqhFAvYVM8GZVTTgJSNCgvZpffZ3kg5L/Xl
         s71P2qNp1AH5929F4yERcGSLqv+n9ZL4R6RRu7g4srlhh46bj8emJ3o60jMPxncwO8Vn
         e3DQ==
X-Gm-Message-State: AAQBX9fYWbjmNNO3aG4IFe6FMnXVx3qBPIJbSzR6PwwVkSqDXIg+h9Ij
	zFehS6XZHJYxjwUpKQqOYaq/mg==
X-Google-Smtp-Source: AKy350ZYsA8lzJG7NSbCoTlmBQanAcDJyPETNQetpvDDQv9McJwUAM0nHCIZ5qbS6IwUoaXgRnH5YQ==
X-Received: by 2002:a17:902:8b8a:b0:1a6:dfb3:5f4b with SMTP id ay10-20020a1709028b8a00b001a6dfb35f4bmr5466195plb.55.1681942691242;
        Wed, 19 Apr 2023 15:18:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
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
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 19/48] RISC-V: KVM: Register memory regions as confidential for TVMs
Date: Wed, 19 Apr 2023 15:16:47 -0700
Message-Id: <20230419221716.3603068-20-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151811_770268_A370F0E9 
X-CRM114-Status: GOOD (  10.47  )
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

The entire DRAM region of a TVM running in CoVE must be confidential by
default. If a TVM wishes to share any sub-region, the TVM has to
request it explicitly with memory share APIs.

Mark the memory region as confidential during vm create itself.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/mmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 4b0f09e..63889d9 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -499,6 +499,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 	mmap_read_lock(current->mm);
 
+	if (is_cove_vm(kvm)) {
+		ret = kvm_riscv_cove_vm_add_memreg(kvm, base_gpa, size);
+		if (ret)
+			return ret;
+	}
 	/*
 	 * A memory region could potentially cover multiple VMAs, and
 	 * any holes between them, so iterate over all of them to find
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
