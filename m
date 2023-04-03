Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FA5C77B62
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5zEoLX61xg0ihGJ+qNaTwq40PiaVpoUso97Lt/kups=; b=yZ2eiz0pObLwjW
	mxW4BXp5EHaHlv/L8UHMWQfRp7iTNAbVco4Ip0eJ9lWts/pQpZfAwGqWcECH/7pZWyo1ADsKC1GMi
	Lu967445obc3jDmHhOSlXks7mKIcFfl8PNm7a+U3OVm7DT3z8DAluDzO4CmaP4nlD3LmJzyxBKeNZ
	I0gx2euMQhZ4N0GTpp36DKXiNZYIVq5mZOXDpS9fC4+g3W/lQ2biD/+LzSaf9NWam8BYe/70NIbA0
	WueoHk22SdUirw90fXkVGa97lKloghXVzX7u1ReGOG39Hu7WGGJ0r7wx0X+ew0K9irdW21y2VHbSC
	7SkK53N7QRhODVEqpncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZQ-00Ejaj-28;
	Mon, 03 Apr 2023 09:33:48 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZM-00EjVg-0I
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 09:33:46 +0000
Received: by mail-ot1-x330.google.com with SMTP id x8-20020a9d3788000000b0069f922cd5ceso15271480otb.12
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 02:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680514422; x=1683106422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8TEjnpfsG0YBkFpXJqRz0n2LVNq8aVMjA0y3Jy/fOE=;
        b=Byhopxkfg6QFjzACmn8B2kg6RMqwLLR+gKTK7/3avZKhsFYLRWJ/fa+ITl6yJgJeEi
         LYSMwqa4DzzfHgp+D83XDjpSy4QWsJ/JTQnVAy+GY3hWk34GI1R5NQPr89xLI70U0GnF
         r8Dh3zwKq6BvysR6qrBUdMNYC0tedh51IMtqbDU6cMfoJy3vWVKADYDGAzvk8ogg1VRS
         wOYdaDuSMiLO5Nb8JWGpTVh59QSfQ0gGREj7deFyFmleK+hABy7yoLvCgsApGOHQwz7o
         wPW5Ymx9y16epuYCMizzSg7EnrsRF74q93mXqySI5wWiVpNi/gf8qZLV6MX3sOHxT7N8
         UyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514422; x=1683106422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8TEjnpfsG0YBkFpXJqRz0n2LVNq8aVMjA0y3Jy/fOE=;
        b=PDy9GAis0vWWzLTkvjFSZfnaSgM1cihJDRrEi0L1mnUWYPnXaR8FcmDXT6Oj7k08Xq
         D9CfPJ32JFi0zEzG19KTFNj3rdAVPfFLI4+LLNX5OzXfq3N9jbjEm21ku/tbrMngO7Hf
         y77eeuyoxHwKGHxArByZVplDSGpVYPptChKQ9bBvxEgBQo1KKxBBL5YUoTAAV1KBDBY5
         HX8twU4j0iQizwtbIQnNtPum8o0D6p2Nn24hnq4pLIyP6XtKRMJOEyDvRS9gb5UhO94O
         kcNThCbV10ZGX/sMKTUzKivt7f5N4twBR5iK1yKob+DBWDsykQ75wqW9OgJMWiUH05VQ
         cD0Q==
X-Gm-Message-State: AAQBX9epwrvIw+1A8NMdCWbhTb50rc3epOpRpMa2jlOhE7aqqkpa7Ei2
	XdzLZXO3GH4vQ3VLT7RfRNzq1Q==
X-Google-Smtp-Source: AKy350ZDBTa5jSfZTanEalOuzmhzncXNNaFKdjBSGJEadMuyCjnXOXLiKG1XfCUUpeYcLBe2hiEMsw==
X-Received: by 2002:a05:6830:1d75:b0:6a1:6e74:b252 with SMTP id l21-20020a0568301d7500b006a16e74b252mr7457641oti.27.1680514422129;
        Mon, 03 Apr 2023 02:33:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id f5-20020a9d6c05000000b006a154373578sm3953953otq.39.2023.04.03.02.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:33:41 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 3/8] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
Date: Mon,  3 Apr 2023 15:03:05 +0530
Message-Id: <20230403093310.2271142-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403093310.2271142-1-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_023344_142649_69402DCA 
X-CRM114-Status: GOOD (  11.05  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
index 46d692995830..f2eb47925806 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -755,8 +755,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	unsigned long hgatp = gstage_mode;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
-	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) &
-		 HGATP_VMID_MASK;
+	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
 	csr_write(CSR_HGATP, hgatp);
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 5246da1c9167..ddc98714ce8e 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -26,9 +26,9 @@ void __init kvm_riscv_gstage_vmid_detect(void)
 
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
