Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D84CCCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GR8P4zQ7sEFm7TNT9ngteSckLKwFyWA7pX/StdRLDZk=; b=ZvOZeENQKDf5WR
	mpj9bm0IAN1+IKebalBL7hfFMPaB3kT3Ym4Wi45trMC5yZg1oW4cOGQZpEsVP7Rd0bVjGArdFqWmz
	QJhDK/goUMAM2fbTxDYfhZAoO6a105Fiyb5S56S4IhiPMBBL/BmGtTv0bH4QEBGIeAnCa2G2T4HeG
	m/bxxcrOw1qG1exETfULf92npsJeM50hwcaPExPvRsrUSToiX1ugBj08SetDUP8cZayz5qM5Nzm04
	E3VNb4LHT5qaU8gthapRVxc0FaKsq984QoWLTOp6/m01moHEA+ODU6L0i1GkwOQ+Vz9HEL8sckMeI
	wolgoPGG5+jaeMVFBKdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQO-00000006ElH-3jdL;
	Fri, 17 Oct 2025 00:34:28 +0000
Received: from mail-pj1-f74.google.com ([209.85.216.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPN-00000006DGa-1Jxl
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:27 +0000
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so677242a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661202; x=1761266002; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6nFGgJBVWEpkJy+c6A8c/BAOcJuYsJfcEhqI0sTwd+k=;
        b=R1K0rcsp0+vqrW5OnxEfK3p1Pi71YCzgewcLVtawlX0QdRYDAVKNTaQkdIhVRUMaKe
         TKCGsfUkpcEPfQZtZN7X82kC4DKpl3j26AmjSy4EV1Xo6QMnYYAtvA9/77YXBNYZsG5B
         kS3aqvTsbEDXZrmGW8zRzFXz0rNTXp64CtNHSbcoySFTbipEsCaGJbBcfzyxCpLBAk4I
         YDn2pc2kkW30Jr41K2YemlmCMmkIVzmQNJackd1ZcDm7+P1Vxo5yGbsPvVh2erK+GhId
         JqOTAuBzqcWsJC9xlfZuSlSkYVAuiTaSfG/MmQfEDs5w5+Eyw2fzXh10G/awWuM69PKQ
         SQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661202; x=1761266002;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nFGgJBVWEpkJy+c6A8c/BAOcJuYsJfcEhqI0sTwd+k=;
        b=ENLpU2CcGlHEhoSSXnvBKBueoQ2KSr+A+ZHwsDAArYsp0q3wzjIH+5ASQB75BRPqHb
         ium2OhopzCnNL0Omx+Y79jCRsJXifjBT5mEnaY907KL+/k79kAGVtcVdlkqUPrp90hMK
         3QKQpx7/91P4w+chabI2HIXR4xIkEHLFHMpyetx8gEEA0SZGhE0raopBQt2+wao+Ke2O
         9H6UhQvzN4OxRvo2qk1xo81afuKRchhoh5jKazgT2RsqUNriTXQPJENBXse5417Nz7nO
         Pvu2BTaBqZFsKLjbq8owpZBS6RsA+GNCPEX0sQ1qUm4wyVryxZa0Vhfms2QEWmJtDbvy
         4kOw==
X-Forwarded-Encrypted: i=1; AJvYcCV6T6Ss1KHYP8X1KCSp+QQ/ota40nWG/+ED0khvFPpS4w5zzCch+DYgHyZUVfdAM/+htaHHxH55/DaiIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4rA2UZNYFeJvd9jb6JpyIL8KVU7gs2aRb5QJX250BhmZnLjr
	7exdj1GR7LHg9/Ovi4s2JSrWOOCHyJwuRxCN64/0KGUOHjFyrqS4xiu9SGLb4cAKngzy8GDcPRm
	47UU8wA==
X-Google-Smtp-Source: AGHT+IGwUk2DKc/Clop/mYKkbeytMt0iZD/Bzj0bONucI419CZOE9/NPfh2luTSi9dr6fi1GHUAnQKjomOI=
X-Received: from pjnu19.prod.google.com ([2002:a17:90a:8913:b0:329:ec3d:72ad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc6:b0:330:6d5e:f17e
 with SMTP id 98e67ed59e1d1-33bcf8faaeamr1865014a91.24.1760661201850; Thu, 16
 Oct 2025 17:33:21 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:37 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-20-seanjc@google.com>
Subject: [PATCH v3 19/25] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_173325_652353_B33C28CC 
X-CRM114-Status: GOOD (  12.00  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Unconditionally assert that mmu_lock is held for write when removing S-EPT
entries, not just when removing S-EPT entries triggers certain conditions,
e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
Conditionally asserting implies that it's safe to hold mmu_lock for read
when those paths aren't hit, which is simply not true, as KVM doesn't
support removing S-EPT entries under read-lock.

Only two paths lead to remove_external_spte(), and both paths asserts that
mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
handle_removed_pt() via KVM_BUG_ON()).

Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
that wait_for_sept_zap is guarded by holding mmu_lock for write.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index e517ad3d5f4f..f6782b0ffa98 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1711,8 +1711,6 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
 	err = tdh_mem_track(&kvm_tdx->td);
 	if (unlikely(tdx_operand_busy(err))) {
 		/* After no vCPUs enter, the second retry is expected to succeed */
@@ -1758,6 +1756,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * HKID is released after all private pages have been removed, and set
 	 * before any might be populated. Warn if zapping is attempted when
-- 
2.51.0.858.gf9c4a03a3a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
