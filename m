Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73033C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7v8oEPW2cWTsAecDNq6GXp8nHTZTl1fAgAuUqkeyfE=; b=0yNKzw557+k/4T
	38GG3zVWMnw/vFsCUYQnc4dKPF6So8DNhTL9AMOFoPqA0Hz9kZK7qC3wwAETOGf/UjDEUKRU2iwvR
	7oaxJCHYYxOqKKDkPAw6Ox5qDl6MNxCINujQqUkEuOtvyAqBokpSQyARDZCgVXDS5+wdmFiuD4gwb
	In6UDu6G/+ciQ6R7tnfDsW1hT1SaV8f21poW4e0ruQ8JvW5AS749EgtV1vxkctPK1wVERn9CFVQm+
	tejEm2dzH83WzezpW8w66hlGH4JVdd8LbXoeH7sbyJv82WEt5GFw2fnMoW2OxUboVx62FZ10THyP1
	5F88hkrn9pf1bJANYdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMtF-00000009yck-0CyG;
	Thu, 30 Jul 2026 09:17:21 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMtC-00000009ybv-1icU
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 09:17:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d032846c95so6254225ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785403037; x=1786007837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luAWvof38jeXPbjahnYlH8nET33JhWw2Qecg1TNtU7U=;
        b=M42tW6PGotbSvrgSpjiYp0mklu2dFBT9+ri7ic8ztazeMbl+EzmUxNLXF/eXPaqWfg
         yYzyyAdEfSIWly2lf0xs4p4fkY9Hd3seqR65C1MmBkwww6f/WvEElnKdLNPtUbJr5/J2
         CAGLj3OenHoEoG6YjWK5OvDpkH3Cx+BW/mZsmo8onNGwZ1bXtECoy9FwrxaBQL0HG8DM
         A+B5/BeOyTd/JcNzYlnZL4FdR0pxw3yW+ofsgKN/A7qfYNTScaIfIkq2yQZ6zXrh9GUN
         lcQiyjNEGXBNNjkfDGaaKTXUXcdhWAdMQB8jctBH7PXhshaCOrIVoqkOZe8MoQS+nxLi
         kvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403037; x=1786007837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luAWvof38jeXPbjahnYlH8nET33JhWw2Qecg1TNtU7U=;
        b=d3Hl38Zvb1wWs+5uW74hYp7iNjcqoLSa7Boo1/VqqdG/Cgs8Q1busipgQUMxwVpShv
         GIE9yNMqHdCK9WZrPOkUTfSsKhazUwRcOraHHghrmVFI4TvAKZeQDu2KQ18v7syo2uSV
         SFqGFsAt0oXMDSgG3in9xBLGvJvLG/J9Yajq2xmDnne9/oI3f4jwnANBB6JZ+W/b4CqN
         X90NriqkUeEQnsN7/giuJ3rhgoy6xvdhI64c5PQADQalm309OvAkqruEAAG/PXciO52M
         HMuJ5eduopmg+6MiIph7I5G551lcoTee/5uiMg4RrfgdxThyKYr2zociA7N2ZW1+0xO9
         bT8g==
X-Forwarded-Encrypted: i=1; AHgh+RrqufEKrNEpCvAB1qXm1qw09M8mK9UFDdbfKdhjMQiTa3mfYvpvr3s1fNSFwaEH8Z3cyVI165PJtoZN7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyK9EVSq+GFEQSeY66dvfPkJryiFK4VPO5nIx7z2MRyi/WCwjX
	HjI8L/3D3kdtDnsroGo3EFWV6WMSfDlvx04gtmblkhhYnC5h5Jjfv811
X-Gm-Gg: AR+sD11pAC3kV0cydF+SDyxw3/lhnEaXutCvnL9uLtK0TbJHfitaibrO/xze0Ca0guz
	VOnY7K92CJ3SLRWaMGP+9Y1RxL5FAjK3ra+FTCizMKt8aTIq7PuefW16vbk+rcuocb+7rO9q85I
	uxvm5l6HqQeicPQJw+ZAOfHkfzCrxP/6W2ZHao7GyOVjwGBh25wQtMdB2C75sqz+xzr2Arzo/1/
	yBFJeC4+HgKZngNQEI8ayKnmIWgDGAUThxZkcDLOlsFNoQliymbyXxMxzbGQQrzzymssK8EPC51
	vGG9xdhh6le6P+K4djMjto1mESKIDxk7LnyqojELQhSnJiiawfmyTuvKzDyl8KcOR+2Y9iEiZjW
	2ExKw4VqhYNUVnY/fF+7o6PTQ0XMf25bol+j1j6WTPyrtSURpx6dV56LyZlOcayaGLbm8Lf9opP
	XuOjG/N5YQPb4o9hhn6vC1zrBUh6eKACqb65Xpmw1pFu04OVTVjShdzsuD6eBjzpX/pHZ7Nf4QC
	yus0A==
X-Received: by 2002:a17:902:d4d1:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d035ce64fdmr16534475ad.24.1785403036908;
        Thu, 30 Jul 2026 02:17:16 -0700 (PDT)
Received: from 2045L.tailb1cd6d.ts.net ([36.112.122.101])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2d022bca9d7sm23779615ad.52.2026.07.30.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:17:16 -0700 (PDT)
From: Guidong Han <2045gemini@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Naveed Khan <naveed@digiscrypt.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guidong Han <2045gemini@gmail.com>
Subject: [PATCH v2] RISC-V: KVM: Fix PMU event info array size overflow
Date: Thu, 30 Jul 2026 17:17:10 +0800
Message-ID: <20260730091710.1366757-1-2045gemini@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718153620.829378-1-2045gemini@gmail.com>
References: <20260718153620.829378-1-2045gemini@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_021718_459049_BADCFF03 
X-CRM114-Status: GOOD (  13.49  )
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

SBI PMU EVENT_GET_INFO stores guest-controlled
num_events * sizeof(*einfo) in an int. On RV64, num_events = 0x10000001
makes 0x100000010 truncate to 16. KVM then allocates one entry but loops
over the original num_events, causing out-of-bounds reads and writes. A
nested guest triggered:

BUG: KASAN: slab-out-of-bounds in kvm_riscv_vcpu_pmu_event_info+0xa4/0x142
Read of size 4 at addr ff600000074d46b0 by task init/1
Call Trace:
[<ffffffff8006471c>] kvm_riscv_vcpu_pmu_event_info+0xa4/0x142
[<ffffffff800690c0>] kvm_sbi_ext_pmu_handler+0xca/0x268
[<ffffffff8006779e>] kvm_riscv_vcpu_sbi_ecall+0xec/0x1e6
[<ffffffff8006008c>] kvm_riscv_vcpu_exit+0x48c/0x540
[<ffffffff8005ea0a>] kvm_arch_vcpu_ioctl_run+0x37e/0xc80
Allocated by task 1:
 __kmalloc_noprof+0x19e/0x4b0
 kvm_riscv_vcpu_pmu_event_info+0x72/0x142
 kvm_sbi_ext_pmu_handler+0xca/0x268
 kvm_riscv_vcpu_sbi_ecall+0xec/0x1e6
 kvm_riscv_vcpu_exit+0x48c/0x540
 kvm_arch_vcpu_ioctl_run+0x37e/0xc80
The buggy address is located 0 bytes to the right of
 allocated 16-byte region [ff600000074d46a0, ff600000074d46b0)

Store the shared-memory size in size_t and reject multiplication overflow.
Allocate the guest-driven array with GFP_KERNEL_ACCOUNT so it is charged
to kmemcg, and use __GFP_NOWARN to suppress allocation failure warnings.
Use kvcalloc() to allow vmalloc fallback and an unsigned long loop index
to match num_events.

Reported-by: Naveed Khan <naveed@digiscrypt.com>
Closes: https://lore.kernel.org/kvm/178345245327.72065.13249716450708539854@digiscrypt.com/
Fixes: e309fd113b9f ("RISC-V: KVM: Implement get event info function")
Cc: stable@vger.kernel.org
Signed-off-by: Guidong Han <2045gemini@gmail.com>
---
Changes in v2:
- Use an accounted, no-warning kvcalloc() allocation and kvfree(), as
  suggested by Sashiko.
- Naveed Khan reported the issue before v1. I missed his report at the
  time, so add Reported-by and Closes tags to credit him.

Link to v1: https://lore.kernel.org/kvm/20260718153620.829378-1-2045gemini@gmail.com/
---
 arch/riscv/kvm/vcpu_pmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bb46dcbfb24d..8e1f6abb84e2 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -12,7 +12,9 @@
 #include <linux/err.h>
 #include <linux/kvm_host.h>
 #include <linux/nospec.h>
+#include <linux/overflow.h>
 #include <linux/perf/riscv_pmu.h>
+#include <linux/slab.h>
 #include <asm/csr.h>
 #include <asm/kvm_isa.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -479,13 +481,14 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
 {
 	struct riscv_pmu_event_info *einfo = NULL;
-	int shmem_size = num_events * sizeof(*einfo);
+	size_t shmem_size;
 	gpa_t shmem;
 	u32 eidx, etype;
 	u64 econfig;
 	int ret;
 
-	if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
+	if (flags != 0 || (saddr_low & (SZ_16 - 1)) || num_events == 0 ||
+	    check_mul_overflow(num_events, sizeof(*einfo), &shmem_size)) {
 		ret = SBI_ERR_INVALID_PARAM;
 		goto out;
 	}
@@ -500,7 +503,8 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 		}
 	}
 
-	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	einfo = kvcalloc(num_events, sizeof(*einfo),
+			 GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
 	if (!einfo) {
 		ret = SBI_ERR_FAILURE;
 		goto out;
@@ -512,7 +516,7 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 		goto free_mem;
 	}
 
-	for (int i = 0; i < num_events; i++) {
+	for (unsigned long i = 0; i < num_events; i++) {
 		eidx = einfo[i].event_idx;
 		etype = kvm_pmu_get_perf_event_type(eidx);
 		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
@@ -525,7 +529,7 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 		ret = SBI_ERR_INVALID_ADDRESS;
 
 free_mem:
-	kfree(einfo);
+	kvfree(einfo);
 out:
 	retdata->err_val = ret;
 
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
