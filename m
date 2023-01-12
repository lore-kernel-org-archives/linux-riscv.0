Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3321C54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1ZHY5pVoeg+nAMDp0BKvB7rrjQ1HbnXXFPTmraEnp0=; b=ysGF6W4Ugcq3t7
	+nQgmSaYswjKgsqgvpSsAC/bjyvSVIEqUblNH9HmT0pCVj6IS88wZLTR6Ta/+A+ZUTJVFMHubmMBd
	ujZC4QqKW6M3fDJvkCe6MqitjGiTvpL/12tNDcXXarjZu1e2k+68Jm/yw2983NEHAv2ESUT0qiIZ9
	8BTJD1vI1PYYPLz+VPzR4iPnNNbgd1wFOvD029U6oL+/+45DN13CbdiIi1beYoYrJQX/XFjp39KwI
	jqDxLZaKv9fkdv9SZpl3rbhPV+ESFHT9ewJ4g3s0nkdMEFwWns7IxY+UM4bJ4wtdt0yWBBHUsE7co
	xC6cG4SiUeLx/RuJz+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFyBY-00FHns-73; Thu, 12 Jan 2023 14:04:04 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFyBA-00FHda-IN
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 14:03:46 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so23689314pjj.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41mwjRtAV9Ps8+RICLlcEu1Jp8E7xzwVnsOTMb697U8=;
        b=Cx9wgXiG3yGJIP13AxtRLpEyPm0oHQsEnGUEH13SkW0zvi6xNemz4LlDlYS9AOoc6E
         3CHh1eoF1q5fDipXLRzUd5Ecg06hisNoF/bGEbx5ujjl5KvD1iOskHMzb/dkc63SsYQy
         H5mzf4RXtvetFCoBGo/S/MSYHSTLohsQ7hvwjGUGq37fBrZZlw+bEyB9p5P6s4s1lxa4
         uyXKOhwk5Y5EVjbGWtYFn5aNcpmNCQG1BOL2WjHYGCW43O32Pv4blj6GahAXGHgQwKGR
         6w0BzQUpAycWFRh1dU5nk3k6mkW0qLJkvte40xai5RWIQi1R81H+MT6k9LUmDVe3gvdF
         8k9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41mwjRtAV9Ps8+RICLlcEu1Jp8E7xzwVnsOTMb697U8=;
        b=J+9JRYIfS5ynG++xT30NdBEaV9X4F1afowahkX9Gya4GpWETScSU2k5dUbU1qlEQUA
         DB8MtYVW575dzP0hApJSmbGTpSqHb7Mdj87NIU/LxWAednFgJAkoAyZrrUUxq+xHqyMO
         0gthYVX1hg/xIdAj3wWaaWYisBUajrjbSmATn4rQ8P0fzqJZYj4wFW6oDbLB9R0isoR3
         RbaMvd5xxLDBqfVj/SnH4lHmCw1BGMcqoCSmCqTbbCgEpVRl8VfZOBqHiuOic82Z9Emi
         5l8xiD2hLfUiEL8lwi8BylPMm0LFdJALn/0snVBdwLmRKGj2LDatE5ZHRAfQHCy6C4im
         /JBw==
X-Gm-Message-State: AFqh2kqGb41+A4gq37+K7u+0Duv0N+GZaT2erj1TWZOiiVio7J3aYT6T
	pop6/T1OTa+xwXUcDY1LpAyc1w==
X-Google-Smtp-Source: AMrXdXuoqF9O/2Eth/euiEsYL9iZeQ5f5ihqzpJRnRU6lFfvKPaGgzYrAJ6y+uWOnFZ67on7TXRK/g==
X-Received: by 2002:a17:902:8543:b0:192:9454:7b32 with SMTP id d3-20020a170902854300b0019294547b32mr48252741plo.40.1673532219874;
        Thu, 12 Jan 2023 06:03:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b001925016e34bsm12351455plg.79.2023.01.12.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 06:03:39 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/7] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
Date: Thu, 12 Jan 2023 19:33:00 +0530
Message-Id: <20230112140304.1830648-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112140304.1830648-1-apatel@ventanamicro.com>
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_060343_763911_CAA0F1E0 
X-CRM114-Status: GOOD (  11.71  )
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

The hgatp.VMID mask defines are used before shifting when extracting
VMID value from hgatp CSR value so based on the convention followed
in the other parts of asm/csr.h, the hgatp.VMID mask defines should
not have a _MASK suffix.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h | 8 ++++----
 arch/riscv/kvm/mmu.c         | 3 +--
 arch/riscv/kvm/vmid.c        | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index d608dac4b19f..36d580528f90 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -131,12 +131,12 @@
 
 #define HGATP32_MODE_SHIFT	31
 #define HGATP32_VMID_SHIFT	22
-#define HGATP32_VMID_MASK	_AC(0x1FC00000, UL)
+#define HGATP32_VMID		_AC(0x1FC00000, UL)
 #define HGATP32_PPN		_AC(0x003FFFFF, UL)
 
 #define HGATP64_MODE_SHIFT	60
 #define HGATP64_VMID_SHIFT	44
-#define HGATP64_VMID_MASK	_AC(0x03FFF00000000000, UL)
+#define HGATP64_VMID		_AC(0x03FFF00000000000, UL)
 #define HGATP64_PPN		_AC(0x00000FFFFFFFFFFF, UL)
 
 #define HGATP_PAGE_SHIFT	12
@@ -144,12 +144,12 @@
 #ifdef CONFIG_64BIT
 #define HGATP_PPN		HGATP64_PPN
 #define HGATP_VMID_SHIFT	HGATP64_VMID_SHIFT
-#define HGATP_VMID_MASK		HGATP64_VMID_MASK
+#define HGATP_VMID		HGATP64_VMID
 #define HGATP_MODE_SHIFT	HGATP64_MODE_SHIFT
 #else
 #define HGATP_PPN		HGATP32_PPN
 #define HGATP_VMID_SHIFT	HGATP32_VMID_SHIFT
-#define HGATP_VMID_MASK		HGATP32_VMID_MASK
+#define HGATP_VMID		HGATP32_VMID
 #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
 #endif
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 34b57e0be2ef..034746638fa6 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -748,8 +748,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	unsigned long hgatp = gstage_mode;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
-	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) &
-		 HGATP_VMID_MASK;
+	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
 	csr_write(CSR_HGATP, hgatp);
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 6cd93995fb65..6f4d4979a759 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -26,9 +26,9 @@ void kvm_riscv_gstage_vmid_detect(void)
 
 	/* Figure-out number of VMID bits in HW */
 	old = csr_read(CSR_HGATP);
-	csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
+	csr_write(CSR_HGATP, old | HGATP_VMID);
 	vmid_bits = csr_read(CSR_HGATP);
-	vmid_bits = (vmid_bits & HGATP_VMID_MASK) >> HGATP_VMID_SHIFT;
+	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
 	vmid_bits = fls_long(vmid_bits);
 	csr_write(CSR_HGATP, old);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
