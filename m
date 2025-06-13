Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25948C71150
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvBf5k1FTslK11/OmaAAQKhZFDgORDxKhBIxcVE5slA=; b=fX3BINGiB8ENGH
	6kjbmdKixdGs8VeNczQIbh21Dqa6VOC4Tj0ROeaxfkzFKAokhPXLK6SNGM+4dyYEtibvABtEBOYv2
	fghICxSzhIMbJYQdrFgOvnMP5n5cIkV2Are5AoEFJF8gHabmB+cZea/Zqq5pp6usNpRVShPu0g2yM
	CxT0eQ7o74LFPtqxmxuLTto7Ouez3McFEGCmSoUmAEloGQO9Augvl+F7StkbDzVQcscXcDs+AbyR/
	QGiM6bLDQa/AzQUVg7x0rdNZ4lWioVoX3VGvCkeBDpEkUVse37TDhvQDf7ZwNb8Wjv5Dd8yC53DDd
	ph6XozGd2WQJ5i39qtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMv-0000000FXZF-1HHz;
	Fri, 13 Jun 2025 06:58:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMu-0000000FXXr-19ol
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+QkzcBlS9vLeXpRqbqSrDujMqO/PGHcWXsj9ZWs9Z+U=; b=QAL/DBSW25X8lDXRlQMy0boNSc
	8SyV7aSpgsAFdIjm9tSuk9aYZIqewmFd8Glwec+7GipkrjPzEs2FSsNypQ0XjCzsF/RomLxXJH80M
	8EGGj35v2F0yZnr0MPrwHsG0AmmV+Gn1zCVzIJvL4hSSCjaqOUFnA5+Yw9RA6XSQ5CpShRCNdMJc4
	6gHF0NH9AjOGUrecCTMa1A6BG51vKbrhMQLC8QRSkyj8OybFDxL/g43mlv7dSu0tNiadT1MDFyUHs
	kd+NrHgYxLFrjoJgt7nRv3dJOChMAIb0HceZy554Vc6riIgR4YDshvfrTTBGLt4BYljf4HonAInVj
	8xpVvqNA==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMs-00000002rvq-0CDb
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:28 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so1693252a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797902; x=1750402702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QkzcBlS9vLeXpRqbqSrDujMqO/PGHcWXsj9ZWs9Z+U=;
        b=Qi4Kw8iNeu2lPyb3sjL8el5NYL9AzbbSRAs7YcHKp1lugiABmz0fVnzRV57mKUc/zt
         /8NNzNrztIOSbupLsJQlDLxdFn2y1K+/L1i5EWNZfzZbjpwYMhlXLbvlie9SZGNunVO5
         lS7iUux+BAOVl7nJtpx7Gvfsp8QavMwaoBIO5Z6MM0Dbv8Sq2KyLVbxlwZ73luLu/hKz
         uxUPsfVwsuk6faqJi7lniZXdA+z7yTBmBigQDu2SntTiethrE7GJoAbyKzokUcGWXEk+
         KUxqGZt82dKaUO5IXQNSnoNoelz6l0mD9FLcnVjO27Glg2rbKW/ne3fV9527Pm9e7TeC
         0nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797902; x=1750402702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QkzcBlS9vLeXpRqbqSrDujMqO/PGHcWXsj9ZWs9Z+U=;
        b=qIdzv4HahVGKvrvNHoS8TQG5XO40tieGkpL7RkJnvQ7ZrWPG9THY/SFYgs3d74rB7z
         RFgfGQsiQqSqBRX6ywV2PgqdnfiRN+UwSpLi/eYotgYfrnIcmyNQMKRKip4vPr2I5x+L
         7zi7VSjO8/DpNm/s4CrmZ3sTAtBWJ87PoNtopjwySDPOqMtbyrZjrj/qHNMqU4G1/tFW
         8yjf62aPnoOdFq4ci2dmmeDTZ1p++VifKEgpjn1/gQKoWAdUz/2lKVOLAupus02vAUjV
         Ukz/SvItasD6nWMEUa53BXaR4wNzH78IjKLpZLv3TwCJTTUO2isMAASA24miIRQ5KP2t
         O8RA==
X-Forwarded-Encrypted: i=1; AJvYcCX6i7bDa+cVDS1ezr5aJUH6wZNMEeLt0W1MeLXDx1EqB7VDjOpZqX/7caYfgN05jEMUSEeHCAs2D2tKaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJijxRnZVZN+KHc6ZZHluoJA0gyz6d6OSu7zHYPNHc+CcsLaUF
	PPStcaLpq/AbRBPjzOnw0Tq5fdyMphjuaqynL4mDQc+S1EsVWcVIM+KwCVgc+OLpAFY=
X-Gm-Gg: ASbGncscRfy5oGccb23DQPcWlQpi6ohhDRAVjgqPsZFaCm+rwA8NZ1XeZzl2vhm0jAj
	HJUbnIEUKHgAv0AmsnoBAWXBDpD53alPw7mNI+iJbntGC0GxrDoI87oRRok3QIoTGMyz2NNE8pX
	ru/1L3TckJKKjlXoSl1nHBxXGboL4774VmyjYOr8PAxnH7ZX0mXtNukBrHKlLrWK1mZ6hKm5YE5
	v0jfpoDlvqdbDx2arZrjeu+PZEcFnFfIITxIYGzVUWddAyt2egNt2zKTCrv7a1TJKNAhRW+Qq5+
	VXz4XrK9oTw12CIb7Qj4ayCinvivoBhPAMCFroS7/3WdBVYsC1pfcdh1SNiYf9Bljhjv0A/xJqE
	rB9Lbb3NhtaENYPWURXo=
X-Google-Smtp-Source: AGHT+IFcoxTnNLLCaRe3MbV5XZ2eB09JQHRiE2nVJsRUpfaY0rXLYI7i9qxtUj8gRjcaZRLWDhOK7A==
X-Received: by 2002:a17:90b:28cf:b0:313:2768:3f6b with SMTP id 98e67ed59e1d1-313d9ed72f7mr2932665a91.27.1749797902357;
        Thu, 12 Jun 2025 23:58:22 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:21 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 06/12] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
Date: Fri, 13 Jun 2025 12:27:37 +0530
Message-ID: <20250613065743.737102-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075826_162268_D16EAE00 
X-CRM114-Status: GOOD (  11.41  )
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

The kvm_arch_flush_remote_tlbs_range() expected by KVM core can be
easily implemented for RISC-V using kvm_riscv_hfence_gvma_vmid_gpa()
hence provide it.

Also with kvm_arch_flush_remote_tlbs_range() available for RISC-V, the
mmu_wp_memory_region() can happily use kvm_flush_remote_tlbs_memslot()
instead of kvm_flush_remote_tlbs().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 2 ++
 arch/riscv/kvm/mmu.c              | 2 +-
 arch/riscv/kvm/tlb.c              | 8 ++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index ff1f76d6f177..6162575e2177 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -43,6 +43,8 @@
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 29f1bd853a66..a5387927a1c1 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -344,7 +344,7 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
 	spin_lock(&kvm->mmu_lock);
 	gstage_wp_range(kvm, start, end);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index da98ca801d31..f46a27658c2e 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -403,3 +403,11 @@ void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
 			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
 }
+
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
+{
+	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
+				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
+				       PAGE_SHIFT);
+	return 0;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
