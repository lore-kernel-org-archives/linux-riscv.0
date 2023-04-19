Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB2CC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84OZJ5WvzBxwqS7xDP9hYy+NkBhtoW7QHUAdc3Kv80k=; b=v7phJJxK6pP7qR
	PpCblpfg/7EERt9pGAF1d8ACbxCPLsAyp/TfBxVYLQyTMDoKMaMoamjQL1MKB9foa/5/HPdrqvOMP
	ZP5xSPgFb8mtjwqyxCFW0HLA7SlPjf/S7sg1tajFbVWrBe/X2BLobNwBRVzNXDkxgfA0o6+mAX3gi
	g1oiKQPp/QQa2vTiYZsEwnt6fCYVePJzz8C7Fk/8T5UtRlt6g/w3fiiWQoFfr5MFy7iB2Bg47un74
	F+fjm52cxzWoutpOZXQGvAiNz4yTSDUSLQ1kVAnNSGragOEfs6YzoYqQhM8xGmKwVCtBCUOSPVdDL
	v2ZPtI7xCh5whF0DNmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQz-006X3Z-1F;
	Wed, 19 Apr 2023 22:37:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQr-006WXV-2d
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T59m5JAZKpRDJgvlPNnQtLbeFsduDf6TBzeyZHAxXV0=; b=p7/SroNSPZUHlUNu7L2CpNV4+y
	WjMIsoeUtnkb1bIPcTplVMTg/s45jVUP1j/9ATfSD5sVjI36/XoJ/1XgI6X0jLA1CKtYh2pySXflJ
	wpkuH08892lqhPQTyOVvqOJ4/L3ENcPgvVhzWDr33Fx81OP+6X4aLOIpexRr66QOvccvd78VLNi40
	wNTK/O33iWukly7Xyb14bXITi3ntATUJ+nDLXESxO3o6130hPTe90Cx454sA0JShLpOyI2UpNxGCm
	NDOTnCMTYjpK70fw1GYeqrCWwX8wo6HGxpKP5PzZiY68PvqWXn2pDs9KJF2mUhEwZcB6PqfIxp/Jc
	oeSThqXw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG7c-00De6w-Me
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:17:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a6762fd23cso4482175ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942669; x=1684534669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T59m5JAZKpRDJgvlPNnQtLbeFsduDf6TBzeyZHAxXV0=;
        b=qjxNMIrl8HnhfIp/ecw72oYKFII9UTAwql/uMAHKk/FXlEBEiMQ66OH7eiwjlGKtCq
         fOjlVW3CuH2HqfOiNP9XRTFCzDI4+lJmQdsac4GSSp3r+OkcygCfPaztbk/heRGDIhKM
         pnYeif4EQ7Prrd5kCwoWu5m8+1XOIOkSJ78OzpuHzmCbajgIzTGS3QZn2FEzSLBwhiSb
         6w7a2QMSx0oX83P6+RuntF3wYcXCE4rbF3duzd0QwdejxuKey4lt6WjYMDej+sLNVh9T
         6z0R8DizcoQpeT/MVd47bfnzAc938aOKta+516VE8cUvwIwwgAey2BJajvvIriSfLlPU
         8bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942669; x=1684534669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T59m5JAZKpRDJgvlPNnQtLbeFsduDf6TBzeyZHAxXV0=;
        b=C6Zu2EWgRC5wN/3UkICGWE8V9TWCpmYdknkM5pAaZFwsXcN/wVfAe8aX3TRjWfslpS
         06reEdV+Yo6mvr/3NSKFiW0mVoCBLDJgJowDXtJP4iLImQtZ1NAw7qlnPzlczutX8j70
         SPWi5E8AlDexKu+KTpvLNd7J+Xb8REAMjOydZPx2Dw6KWU9B8RAkACpPN8ZD30a/bMy3
         N3OZnkziV0w21BNK1k12SKLMvG1DrReTwZZD1mJFgK/Vkx5ToZZrqaAS27tvHKcbzt3k
         9P/AnNBTqx8nchVzKbjEJ6dWlDbPe41WeJpHSGMmatIelvrmUKcnSU0SC364g13QHXw2
         AYhQ==
X-Gm-Message-State: AAQBX9cQ2KZcU6IYLj8zD8CzkrxN/A92ZO50l3NBMSjcR5dzwaNTQjyC
	hW6/7L+OSLbgTbZQ8QkIM4nRlw==
X-Google-Smtp-Source: AKy350a2O0VHJD6AXYzabb4g8786HYDihr3e7/POpprE3Ii6IVd/H8nE9VOR2CTMJgAkkR7C+O0Rjg==
X-Received: by 2002:a17:902:aa4a:b0:1a1:f0cb:1055 with SMTP id c10-20020a170902aa4a00b001a1f0cb1055mr6242462plr.28.1681942669632;
        Wed, 19 Apr 2023 15:17:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:49 -0700 (PDT)
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
Subject: [RFC 09/48] RISC-V: KVM: Add CoVE related nacl helpers
Date: Wed, 19 Apr 2023 15:16:37 -0700
Message-Id: <20230419221716.3603068-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231752_749930_64E4AED7 
X-CRM114-Status: UNSURE (   9.82  )
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

The NACL SBI extension allows the scratch area to be customizable
per SBI extension. As per the COVH SBI extension, the scratch
area stores the guest gpr state.

Add some helpers to read/write gprs easily.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove_sbi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove_sbi.h b/arch/riscv/include/asm/kvm_cove_sbi.h
index 24562df..df7d88c 100644
--- a/arch/riscv/include/asm/kvm_cove_sbi.h
+++ b/arch/riscv/include/asm/kvm_cove_sbi.h
@@ -17,6 +17,21 @@
 #include <asm/csr.h>
 #include <asm/sbi.h>
 
+#include <asm/asm-offsets.h>
+
+/**
+ * CoVE SBI extensions defines the NACL scratch memory.
+ * uint64_t gprs[32]
+ * uint64_t reserved[224]
+ */
+#define get_scratch_gpr_offset(goffset) (goffset - KVM_ARCH_GUEST_ZERO)
+
+#define nacl_shmem_gpr_write_cove(__s, __g, __o) \
+	nacl_shmem_scratch_write_long(__s, get_scratch_gpr_offset(__g), __o)
+
+#define nacl_shmem_gpr_read_cove(__s, __g) \
+	nacl_shmem_scratch_read_long(__s, get_scratch_gpr_offset(__g))
+
 int sbi_covh_tsm_get_info(struct sbi_cove_tsm_info *tinfo_addr);
 int sbi_covh_tvm_initiate_fence(unsigned long tvmid);
 int sbi_covh_tsm_initiate_fence(void);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
