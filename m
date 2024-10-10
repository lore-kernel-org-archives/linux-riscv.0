Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E975CFC60B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kojyu0UfWOChY23ElAAPS5nr2EbxjFYzmV8MDMz+GGY=; b=pt7pZQVYyTPbrA
	qSs7e43brvuLn/TCJO3Hia3tN8S7pNwzhhSCcyVESyZ8bKqvvh3Bdj8Hcz8gDa5lhTvLlcf4xb3C8
	rjnlWf/SgqBmPvurqqBCtMxZ/55COE3IzFeQs4Dl3EOeE+K40+j6b7QchUhdHk0xFHBiqKsWt607n
	xCX4z8TD/dZFiQx9QeWnJFinZ/txtbb47Q9FNLauivzTnM6mw2Isw8MOH1VfgOGYMyhe9KX/FLXmB
	fj5Xq1WQnVdERLOSfNIG4UqdWC+QyybeygMXQrI5i3fjeQZYnSa1YU4iuv3qToxS5e3u0nWe+xTWh
	+RMnhJuAjwcA7LpPa79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syywe-0000000E7sI-3ks0;
	Thu, 10 Oct 2024 19:35:32 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsR-0000000DrNg-0YjC
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:08 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ea0bf14523so1033550a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584826; x=1729189626; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I+2gp5vLlKRJWMtv7YF+IvP9h9YjJXEpCIK4AMigCis=;
        b=ovwcCNiTe5u04NlAVbvO4xK8yzOXNx3Ter+QhNXl3VOJCQEzI/gEvnC3H1V7Pqxq5A
         sOkzivM5rCRz91Y8yeZwvNqvIZLyWI/UTPOKy44Uv53XB221DIga2phGSlSM+PBCmaOl
         bgVg0eim/0V6+Ct3L/8ml5n/a7aAynz40Pzgot6a8ms+YupfuzIQ2Mh4wpNXQzF1nicw
         60opQHHdJC1LDVjxEqhBrglkeQMOhacGkNexNdqMNHeRff1T8NraOFVlEAgUebACjRAr
         6UmULf0Wwv971DDjdvY+42yiNd3AMS3OUiyNgkJ4jpH03Q1sbY6akeGf+wKLHMkEHkZ9
         eKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584826; x=1729189626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+2gp5vLlKRJWMtv7YF+IvP9h9YjJXEpCIK4AMigCis=;
        b=o7CiF//kxvSuCCYNJfVTwoZWpnYIo7Gm4+1N6jusxuZnpfyxwq5UvMZFu1u5njVB1p
         0dfNdnIs/XzZwILbWW8cMiCuWFd3inx5K++nhPGwp3D1dxf1EWkJbpP+EqMg8mbxkfZr
         OPwsshvidySmOf3z1tgF3W/dfUHCcHWlPRTTfwC4sW2fLQnvCRVQ1cjZP/k0Vg73Ou7g
         0SzgGT41/Lyu+nUjdIamOpsp/U7T7nzRFTabsLVQ/S4UIBAxUMRaxL2ICrwkKk2czT3Y
         28ip6dTVI2W1pssyS0zEnpMF+2BP+3VG0alCMj9zQNDx3rDyC8shfL4vsS3tdjxmxHKj
         sKvw==
X-Forwarded-Encrypted: i=1; AJvYcCVYQggpoakjy5vMlj7cJCuJa3B3hBY48ETAbpUwCCh3ZClngWzzage/Ei0M2ALlzWYL27tfnZjnuIKM4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/5/diePmxRTelA3h4jy/MHbNDszAlw89GngW3xcivu9MbuIdc
	XGChPogBVzOENV2b6Qg5cAt4F4Ea9Jcn1M594B7ARqaOQXeU+Hcn836NRuUf+7u+2LqzdS7XNZ9
	lSw==
X-Google-Smtp-Source: AGHT+IEBzxfSdV5URAWtipQSxApJSdWqJAcjcFibIBQs32g4G2eVPMYjVJgo5zFwBPuTEySHq4oumcdrCOE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:e546:0:b0:684:6543:719 with SMTP id
 41be03b00d2f7-7ea535307afmr40a12.4.1728584825522; Thu, 10 Oct 2024 11:27:05
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:05 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-64-seanjc@google.com>
Subject: [PATCH v13 63/85] KVM: PPC: Book3S: Mark "struct page" pfns
 dirty/accessed after installing PTE
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112707_322319_10E566AB 
X-CRM114-Status: UNSURE (   9.69  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Mark pages/folios dirty/accessed after installing a PTE, and more
specifically after acquiring mmu_lock and checking for an mmu_notifier
invalidation.  Marking a page/folio dirty after it has been written back
can make some filesystems unhappy (backing KVM guests will such filesystem
files is uncommon, and the race is minuscule, hence the lack of complaints).
See the link below for details.

This will also allow converting Book3S to kvm_release_faultin_page(),
which requires that mmu_lock be held (for the aforementioned reason).

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index bc6a381b5346..d0e4f7bbdc3d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -121,13 +121,10 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	vpn = hpt_vpn(orig_pte->eaddr, map->host_vsid, MMU_SEGSIZE_256M);
 
-	kvm_set_pfn_accessed(pfn);
 	if (!orig_pte->may_write || !writable)
 		rflags |= PP_RXRX;
-	else {
+	else
 		mark_page_dirty(vcpu->kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
-	}
 
 	if (!orig_pte->may_execute)
 		rflags |= HPTE_R_N;
@@ -202,8 +199,11 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	}
 
 out_unlock:
+	if (!orig_pte->may_write || !writable)
+		kvm_release_pfn_clean(pfn);
+	else
+		kvm_release_pfn_dirty(pfn);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_release_pfn_clean(pfn);
 	if (cpte)
 		kvmppc_mmu_hpte_cache_free(cpte);
 
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
