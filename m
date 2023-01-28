Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C7BC38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOKztLUgp6GHRLQ6STvlpC6+r534YukSUJGbLddr/pI=; b=v3IoPuEo2ISS4u
	tT3qnTpX63jiE5oNYn41KRmHvEPAUNc6Jgtm808t6ggMObOtI0LZhgfRb9ZPttV5cXnrvm4oHY/PW
	I195lWWgCUdPDdkIDFb1WXwReWQgNLYjv8rh+gH4WNQV3hVdKUxz8tm96ef6CcSPNazAEgj/qDsE6
	hx/WQTzUfNqMTJSeg1R4B1oVtepBXfuWfy532SRDKDS/ol7EeZgVr313CZv2feDqufFW+PXsmRrsY
	MCJwFeV3KegRFIUgkyyV2sndVcNAfu1xmsQSMQAuycxnci2kFHeus4GFuo8hfmWSn4NqgZhouqko+
	ut1NA8XGb9e4PFJodNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfd6-00HLbQ-0c; Sat, 28 Jan 2023 07:28:04 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLfd3-00HLYy-L2
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 07:28:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id cl23-20020a17090af69700b0022c745bfdc3so132215pjb.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 23:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw95MQk4sL9FSIPsY1+7zF6OQPrfNBcJ8svOzlGbLXs=;
        b=jL3raJ3xxkCRnYv7QuZHM+clZq2vwOYN9zGjV+DrEFaSk7H94B5Gov5D/0murmm0wW
         iUsqjmJ2BpC4mcz1mNEreyPaDCnl1ZbJRPpWDD4ZVBaIDh+k2L/aiCv8BEUifLGplPUE
         wVpOfiimSf9cHmFJSOpnoJnjb+mBV/io96We1ppknUXABkp5wsGm53pTNCI05XnFQtpd
         8C7mHdgEZ3daadVjTn9743dyaAkRjNtzOnrMndEDEmQYiL1r/Pe4vj6mRBrpc3WuiCbP
         nb8GQ62vOma3L+7OfT8B0dzI3BqZhrcHixOmpDdm8uZyp4dkeE5mOZkPEpdePfgTf3HW
         Ny7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pw95MQk4sL9FSIPsY1+7zF6OQPrfNBcJ8svOzlGbLXs=;
        b=b07fCNlG7+EMO2KAPtxAiwlMselSqFbnnedfzqnwXJUiFU+UhiSKvOX69FyuIUAepy
         aUqkFCjhBqacGPs4vRbx4vf40HLXam1nfM3lCpH/fxnMZzkWWkslXthxoZN5L2EgT8Ct
         YaSvf8GtzvmBOVSxMeQ54D3WasVPGehZXipUGXwHQLe1oThj7YiA6A7TUhBGCt7fAfmi
         ZDN7tB+RYcG7K19Dbf0rsICFmRmhttW6lkcuoj8KI57Blyhk09X/oYt+ZOYfR2Ek3dG1
         mbKBKFJQcrpKLW/v5RV4MRRk9ANK6N+/9syicp3BUdzrPkIVsVOmcAImFOuK2OlFFs+E
         yQxw==
X-Gm-Message-State: AFqh2kr9u99RqCD3YwYVv52s0B1YE2FWCxl5WqbknM9t+dtVvLId7BpE
	wSJhqu5epZjQMcw2ou8r3SsAIA==
X-Google-Smtp-Source: AMrXdXtulo+lTOI8OKr7E2ZX8E5oNn2lC9UNaWbb3c7VwiNOKwdWw5VqDkQJ3LdBm8bmviaYWX2c0Q==
X-Received: by 2002:a17:902:f70e:b0:193:3845:de53 with SMTP id h14-20020a170902f70e00b001933845de53mr49205851plo.39.1674890881027;
        Fri, 27 Jan 2023 23:28:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b00194ac38bc86sm753132plb.131.2023.01.27.23.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 23:28:00 -0800 (PST)
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
Subject: [PATCH v2 3/7] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
Date: Sat, 28 Jan 2023 12:57:33 +0530
Message-Id: <20230128072737.2995881-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128072737.2995881-1-apatel@ventanamicro.com>
References: <20230128072737.2995881-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_232801_718163_A6264358 
X-CRM114-Status: GOOD (  10.50  )
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

While we are here, let's use GENMASK() for hgatp.VMID and hgatp.PPN.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h | 12 ++++++------
 arch/riscv/kvm/mmu.c         |  3 +--
 arch/riscv/kvm/vmid.c        |  4 ++--
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3c8d68152bce..3176355cf4e9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -131,25 +131,25 @@
 
 #define HGATP32_MODE_SHIFT	31
 #define HGATP32_VMID_SHIFT	22
-#define HGATP32_VMID_MASK	_AC(0x1FC00000, UL)
-#define HGATP32_PPN		_AC(0x003FFFFF, UL)
+#define HGATP32_VMID		GENMASK(28, 22)
+#define HGATP32_PPN		GENMASK(21, 0)
 
 #define HGATP64_MODE_SHIFT	60
 #define HGATP64_VMID_SHIFT	44
-#define HGATP64_VMID_MASK	_AC(0x03FFF00000000000, UL)
-#define HGATP64_PPN		_AC(0x00000FFFFFFFFFFF, UL)
+#define HGATP64_VMID		GENMASK(57, 44)
+#define HGATP64_PPN		GENMASK(43, 0)
 
 #define HGATP_PAGE_SHIFT	12
 
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
index dbc4ca060174..829a7065ae01 100644
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
