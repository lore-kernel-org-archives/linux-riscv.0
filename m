Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84061E7719C
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Vh2hi7SpG2z37s16ZqbfAY0tNR6a3xH8b2tkub3Ezg=; b=nmo9KaoLVotQTp
	WRx3MH62AELzEznKiRa5yPh+gOXSIYWrbRPwI85VESZOmPQoK4fNB44QWiVtJTwiANQuaHBc6BzxA
	vlpXpNBjE5OUDcZueVouUgwLal255B/q+cO00hfIFj9PJvDzpmkunrWzT+NRuxkN7m2g0mBBYmvB5
	hviI9BmOMgSG0PvDK03GpWK67exJHZVN+7FCMlqdAm5sEerE6pomHaXuQTe099f4HQfdPw7FA/ctQ
	kfkeFrxZqfKjkZI09yfWEUeFvuLnuT22GRbBNEtNEoGOCB1PpJlW8NZq3CClF7HJHv33HO8243gLZ
	opDi1c+S22aitj/Gjjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPoN-0000000HRcx-0eWD;
	Sat, 11 Jan 2025 00:57:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiS-0000000HQNr-0oOW
	for linux-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=; b=NIS9YEomDO5qY29dZRXEK7kT0Z
	+2vJYZ78L6qCStTwmhzhOdGqWYtByFxUH+jEtnwZt2CXP4Z8KU7z4TZir36Wk3Q7wDmZ9xBqXPosT
	SUjpDMuKGkuCT2B+jH4BrXYhObozmyKjUakhQVszFfWJyeOTi7W8+BT2SYMLmxgpYnUksog3JXSH5
	m+9H99SLku5ROE6fp1aNFD/RuE5yTs+FmZRybI1fGzjhkIrGie3TbBH7KfE1A2igj6Cii4x5RMq6c
	NNSWNmOCsjO/1hjfSj7kKkIZ2Km/+wi96PfqVSmlV4tvfMOMBh2CErD5wth2WNGwhwSDKDvw+5tNR
	eekpApBA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiK-00000009yLZ-3BQw
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:02 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9da03117so6713652a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556655; x=1737161455; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=qzXOF7oWXrrJDxdwh3iksBy8JnONgG8JG/gk3gC+BhT8lMVAB7HEK1gBjt7n7U9brM
         0ocjJYduFRzB8UHQQlEJ887YLWxO58E8cX2atPLaLIzjEIe1A7/GNPHi8nNIJYXOyxK3
         EEz6fWi7s9vsoXDj7HZZHnJRgVExygYMwrgTrrFB3JYTl6v7lbK+ZCQaabhwv1dS1g1g
         IJRCQBtt8qKRRXEIJ1Sy9g1IAGLPWS0qjdLdCHkZGu9R59p9c2eRAapkSX7oS8hcuBvt
         0PwTqWBU6YkbngpgHxZ2gFzdmmzdm2WnhPFWzKdxgdc+Lbu3amMMKin7xr4X8ktF8b3I
         IR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556655; x=1737161455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=jrPT4PT84MnrDwXXM4KeBiUdQUZS4nIjFyA9kLle6kpmtd11FfrRyMrmu7n+87NjnF
         DSJeWOn1+VtfKNkbAELhxwQAt6mNHvTqxlF2JEsTn0/COn9OuYqR8Z3qiItYrhztg89K
         p3V9Ffep55UN2mTuR49OlAACQ+7z9EYqp6+9P/kVoo08WDhfClgODuq/8cq/xJeIYwcJ
         JDgOwkf9RWK/WywzLRou6c1uXvqZjJF93R3t1K7F7Udau/+l6Bi4wWCKu/4sCUVZVsxM
         ZjKgtxv5Dlky7MeLU4qinr15ELVe5RifvL0089H1ox2qsTqCCq30inz2AHsIOKSCyqTj
         c52Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlXCHE7DavzAq6FWaj+0CUb+a+BRSe0llrZLl5V7dcpieduqyo30brmF9xixcOwXQiaUmr5jS5tWrFQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVUgNaxShJilkbcLdv82qjto7q/LcJs3t6rdqhenYyGqh2PYRe
	cqEl2/ubMexmGgCGt5Rl285aPywsjHcB2s79mqIbBjjexD+cv6AwJ3IofehbOVehVexOzC+Ntfb
	qHw==
X-Google-Smtp-Source: AGHT+IFaIgnmyMwcv0JpFmACh/zvowyMAMYrlakJCH8pPaULUTBzt/qI/JqGqmGqNNZlkEWD/D5dHaJ9LLc=
X-Received: from pjbqd16.prod.google.com ([2002:a17:90b:3cd0:b0:2f4:47fc:7f17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c83:b0:2ee:fa0c:cebc
 with SMTP id 98e67ed59e1d1-2f548ececc3mr18761170a91.20.1736556655284; Fri, 10
 Jan 2025 16:50:55 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:42 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-3-seanjc@google.com>
Subject: [PATCH v2 2/9] KVM: selftests: Close VM's binary stats FD when
 releasing VM
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_005056_912353_8B5DC24A 
X-CRM114-Status: GOOD (  12.37  )
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

Close/free a VM's binary stats cache when the VM is released, not when the
VM is fully freed.  When a VM is re-created, e.g. for state save/restore
tests, the stats FD and descriptor points at the old, defunct VM.  The FD
is still valid, in that the underlying stats file won't be freed until the
FD is closed, but reading stats will always pull information from the old
VM.

Note, this is a benign bug in the current code base as none of the tests
that recreate VMs use binary stats.

Fixes: 83f6e109f562 ("KVM: selftests: Cache binary stats metadata for duration of test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 91d295ef5d02..9138801ecb60 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -709,6 +709,15 @@ void kvm_vm_release(struct kvm_vm *vmp)
 
 	ret = close(vmp->kvm_fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+
+	/* Free cached stats metadata and close FD */
+	if (vmp->stats_desc) {
+		free(vmp->stats_desc);
+		vmp->stats_desc = NULL;
+
+		ret = close(vmp->stats_fd);
+		TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	}
 }
 
 static void __vm_mem_region_delete(struct kvm_vm *vm,
@@ -748,12 +757,6 @@ void kvm_vm_free(struct kvm_vm *vmp)
 	if (vmp == NULL)
 		return;
 
-	/* Free cached stats metadata and close FD */
-	if (vmp->stats_desc) {
-		free(vmp->stats_desc);
-		close(vmp->stats_fd);
-	}
-
 	/* Free userspace_mem_regions. */
 	hash_for_each_safe(vmp->regions.slot_hash, ctr, node, region, slot_node)
 		__vm_mem_region_delete(vmp, region);
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
