Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9175C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTrwhO1OQfbyWaZCPzAJDqomrbN/cxSHct/FTnzENuM=; b=m9XWnRpxZki8qj
	5+8KUYkRMUqt/wkXciZjUwycjGtu2NfX471oZXLuIRis0g8peg231gVAryhvZ2KfE81yC/Yf/qnIL
	rdG9SJamx/Sz5/dzumYG4eEt5ekx1bkucm2oCmiQ1DGC848TEbHX7NMa9Lv9AFwdlFkAjFWyO1TCI
	MLfb71iAEwPc9rYMpdz0S8IaYMp11DQhVwRG/gXgi6MfZRQgoN+mpO7QSLaLPw6KMFQLCgYeoFtb1
	CyB5/yU8OnxxKTsAXCUIIYZn0waEV9taLuKiEK6VfYIa9EMiRqkapVs2dEUDClKcDJP9+JcU3VQZk
	UG4jVo0k/t17ZIK98/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGyd-006ckf-2h;
	Wed, 19 Apr 2023 23:12:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGyc-006ckG-1C
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 23:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ur77tHINwX+qbUdlSGnRNMwUnwDaAVVcewhgSBhFUx0=; b=lA0hdhT4lCZbEncpRNFlLQUG2n
	OXeLj61Y5Cby0LS+17cVm9/R+BmnNg1z7Omcj7DoVCwcg8k7SYUB/T/fp/a8IU+Ik0UM0dr1dH5PO
	RMVi8xT+agxCMWHjwVOtEqUQ13ChStKkglMBHOt2Y0wF/Bwl7RjO2t84XX0uSvIw5z4iFCpeDpxKQ
	d4YsTbSGUKb6diasGBhxLHziLxmPoDJvglZeTeM1kfBCxeoKBnB0LGwMh8vfW4a4uAXATL026AkxX
	D4sEt53Hjm0wl7hTxT8xtBwiP+PPhhtkKaKKn2veVlr56aYls0lhw3JG8oATjcTeB56Z3KpGPw3zO
	0m+xeZKw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7T-0021Gy-1d
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:19:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-517c840f181so182430a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942658; x=1684534658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur77tHINwX+qbUdlSGnRNMwUnwDaAVVcewhgSBhFUx0=;
        b=c18b6HjhB6xZTijYQX2nimbdoBlIXr9qBNm2sHraX79sumJ2mnHyyAF4iUwGRyqfEL
         BhG5ZneVkTF9bRo5tCCiGvsNVcpWUKCNmPy0vd1ZqJvuNoQxq1qR6f9cnB7vi+C19Hpt
         5xUpfFR1k+6B8FbGHFbFXaZtvW/H2sqgRRevhtG9hluShqAQzpot/WQd/qsXuDNgOnpx
         pk3tmGjn1iUOEgqZ0Ek3rQdbQ5Ky98ttJ9TAom0YVfPe7HTavUoUAmMw/LDuEdRosyc4
         CHRnQ9rCEYyXJCmVNUHBEGkpIQ2ljog3inmdpJcdTAOUNGgtwJP32aGziItUDdOFTV+8
         kKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942658; x=1684534658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ur77tHINwX+qbUdlSGnRNMwUnwDaAVVcewhgSBhFUx0=;
        b=AHU+42AFqdaTaypWAbiszJbzJV6H1lOPfo/pLO4kG3dnTUFhc05bTau+yBC3R3XuAn
         GovutDJUYi+TkoMhytatgzmdj1xr7q6JCxRMGdo0P+lDjGjDEONeIyNk8sVoHnEDwLhj
         aozRlOw61EJ6JV/cFBDTY10FhUi5ZC55oFyOVKAkAAbBo0csHnca3yLQXJRhJ8wBfS9K
         e5PksOlSatUobYOgjanQ+H2tleFIjx9LyuQ5i7JsxbHUIRloP8S+kZ//BndgVwLGY1CT
         U6X0fijr6X5Kt9LYMEkYUMKJssQvY2QZptNst50PNSX8pdyS6Fj92nIKqC4pPiRbAEHL
         i9Bw==
X-Gm-Message-State: AAQBX9dd98ouK7Y8hnb71+nLwcKlGkvrvLiM1d5FyS35/G4o7KxwNoB4
	tpu06YeBFlAaiBIKB0/qDCk1TA==
X-Google-Smtp-Source: AKy350ZqgGYrfhLdHBkYHvd+cLv1LSY5KY8FQdwstau4aKvHx0NnJWKbJ8fq3mAaGG3s8B2dSOXS2Q==
X-Received: by 2002:a17:903:1210:b0:1a6:4a64:4d27 with SMTP id l16-20020a170903121000b001a64a644d27mr7782580plh.40.1681942658444;
        Wed, 19 Apr 2023 15:17:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:38 -0700 (PDT)
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
Subject: [RFC 04/48] RISC-V: KVM: Add a helper function to get pgd size
Date: Wed, 19 Apr 2023 15:16:32 -0700
Message-Id: <20230419221716.3603068-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231947_719069_BDC2D128 
X-CRM114-Status: GOOD (  11.72  )
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

The cove support will require to find out the pgd size to be used for
the gstage page table directory. Export the value via an additional
helper.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/mmu.c              | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8714325..63c46af 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -313,6 +313,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
 void __init kvm_riscv_gstage_mode_detect(void);
 unsigned long __init kvm_riscv_gstage_mode(void);
 int kvm_riscv_gstage_gpa_bits(void);
+unsigned long kvm_riscv_gstage_pgd_size(void);
 
 void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f0fff56..6b037f7 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -797,3 +797,8 @@ int kvm_riscv_gstage_gpa_bits(void)
 {
 	return gstage_gpa_bits;
 }
+
+unsigned long kvm_riscv_gstage_pgd_size(void)
+{
+	return gstage_pgd_size;
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
