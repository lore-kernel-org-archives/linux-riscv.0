Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32853EE57C7
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8QLyrIaZy3bCC3J41MkT0/7mj0Tk0i7GarTJRzmHH8=; b=QhNXj6eKFZoYsY
	r5ApJuhQOtBCaW2AWKeJiaiGTuGfQCdzF5JlymjRQy+Qxe0bnYr4LPMaeZvFdDQZ1QSMQxcqvJH0V
	0XS6J+Kr2ccOL2uP1Kxx6BCY6Up/2hGa+M8RdhGhKUISBX7mwiPZwZn72RiDuhD2lhaCQVrS2WFJZ
	vr/a354Z6SJ9kWC8oB9dBPMoOI4SaU4Lco7bgdPBgQdre7BQhwDl6T1M2GG++FafRPPpWJOwyvba4
	W/dCftpG4v4cF5lwEut6yCqfM45UTXyM0pJN5Yt1I9aLKtMSw35ToR+RJ5ZPIJsXhE0jcNHpc8F3n
	exaJju0kMdYjSXNjEdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijq-00000005NYm-1nqz;
	Tue, 30 Dec 2025 23:02:50 +0000
Received: from mail-pj1-f73.google.com ([209.85.216.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaij5-00000005Mid-1Jav
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:14 +0000
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so22827160a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135721; x=1767740521; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=snslv60TkZffEAQE2fKI/7w9i9KGKI8ATFVeEcgF+Qk=;
        b=F/D1kpaJYMzrQpLd/RqrLV8EArQpA1Y4FEEsZn8NdJc5PhrujrQQTatgLNhGReOwPl
         Yeg7UuupR6N/56cBRdClEe3OGCml4hjqcJZvxUJSl9rJGnHc/Csmpkfv9L2uEEbwHyI1
         +hgH5mbITcdZ6IuAHFjOXObu/h0bUscLotMxe1viHTVU4yJ97251jADsspcc40pYArVB
         MdGt0RJRTQ7j4miOATavkKUjLRnUYxFX6fiPQHhCULqZZduMY+/X4E4Jig8GRjm7hcHS
         mMuA+ZpmfwC6YDrZ/WUaScUYMuxweb8ShfvCTZO0Zb+5rgnbrczUgPFQ711qLOj6ojaQ
         h+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135721; x=1767740521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snslv60TkZffEAQE2fKI/7w9i9KGKI8ATFVeEcgF+Qk=;
        b=jedpjoJOMNCk/kx30JIEegZQYvaQA9etf9BjlErcQT9WsblJ5CITo913m+mguPL3fm
         RV7cWbwoo1r0TPuDMI+3WtOJcALMBkTTDzjz+AZZwiYeJ1ut2SLpqse9OjFXN8ZVyICP
         VKbUnG8Oh3yZPm6u9u5mq8RCGs/MR0tRaebUXQ+4A+XfReFve+d4TmGS1nEJLaGyORQy
         AAzLxcDHXlq3FxRoGlZfxUWFFlEaj71E2y2lV2iBZq2Moo4+q/IgpXyf19BpUNvWuG/h
         P502i71SxHKIRLZfaAnnTQRtrzfeUW7oF32d57NAz6k9P5qnGa+oj/iThPDGqaD50Wbq
         IwTA==
X-Forwarded-Encrypted: i=1; AJvYcCWhNz7akv4ZhdU9GURfOq/M/kJMTyyxSxncO4CCnmhffLCC0a2s8rXm0bsp86ck9u+QFqlrWC+wVYzOLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywomyp8jl081Uq49nHDzwwcwFzVodjvtkPXiiKOXjQ6hSMburkd
	nSPjYuOYS12XHpOeU18GxlH2zzk4fPc7LC7giQKYZy3y1W5T5SmDcVFLfSWOOqOs8bTov51fVaX
	5Ne0nOA==
X-Google-Smtp-Source: AGHT+IElvIFPPzPbx/fWhmlKYhmrHPLLecvBIwXjPK26QLj43KDrpSTQ0SF/ILvphJaY0JI4Mn53QzvVzYY=
X-Received: from pjoo4.prod.google.com ([2002:a17:90b:5824:b0:34a:a9d5:99d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e0c:b0:341:8bda:d0ae
 with SMTP id 98e67ed59e1d1-34e921b7334mr26690257a91.20.1767135721380; Tue, 30
 Dec 2025 15:02:01 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:34 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-6-seanjc@google.com>
Subject: [PATCH v4 05/21] KVM: selftests: Stop setting A/D bits when creating
 EPT PTEs
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150203_366516_BA01BDA3 
X-CRM114-Status: GOOD (  14.69  )
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

From: Yosry Ahmed <yosry.ahmed@linux.dev>

Stop setting Accessed/Dirty bits when creating EPT entries for L2 so that
the stage-1 and stage-2 (a.k.a. TDP) page table APIs can use common code
without bleeding the EPT hack into the common APIs.

While commit 094444204570 ("selftests: kvm: add test for dirty logging
inside nested guests") is _very_ light on details, the most likely
explanation is that vmx_dirty_log_test was attempting to avoid taking an
EPT Violation on the first _write_ from L2.

  static void l2_guest_code(u64 *a, u64 *b)
  {
	READ_ONCE(*a);
	WRITE_ONCE(*a, 1);   <===
	GUEST_SYNC(true);

	...
  }

When handling read faults in the shadow MMU, KVM opportunistically creates
a writable SPTE if the mapping can be writable *and* the gPTE is dirty (or
doesn't support the Dirty bit), i.e. if KVM doesn't need to intercept
writes in order to emulate Dirty-bit updates.  By setting A/D bits in the
test's EPT entries, the above READ+WRITE will fault only on the read, and
in theory expose the bug fixed by KVM commit 1f4e5fc83a42 ("KVM: x86: fix
nested guest live migration with PML").  If the Dirty bit is NOT set, the
test will get a false pass due; though again, in theory.

However, the test is flawed (and always was, at least in the versions
posted publicly), as KVM (correctly) marks the corresponding L1 GFN as
dirty (in the dirty bitmap) when creating the writable SPTE.  I.e. without
a check on the dirty bitmap after the READ_ONCE(), the check after the
first WRITE_ONCE() will get a false pass due to the dirty bitmap/log having
been updated by the read fault, not by PML.

Furthermore, the subsequent behavior in the test's l2_guest_code()
effectively hides the flawed test behavior, as the straight writes to a
new L2 GPA fault also trigger the KVM bug, and so the test will still
detect the failure due to lack of isolation between the two testcases
(Read=>Write vs. Write=>Write).

	WRITE_ONCE(*b, 1);
	GUEST_SYNC(true);
	WRITE_ONCE(*b, 1);
	GUEST_SYNC(true);
	GUEST_SYNC(false);

Punt on fixing vmx_dirty_log_test for the moment as it will be easier to
properly fix the test once the TDP code uses the common MMU APIs, at which
point it will be trivially easy for the test to retrieve the EPT PTE and
set the Dirty bit as needed.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
[sean: rewrite changelog to explain the situation]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86/vmx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 85043bb1ec4d..a3e2eae981da 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -432,14 +432,6 @@ void __tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 
 		pt = addr_gpa2hva(vm, pte->address * vm->page_size);
 	}
-
-	/*
-	 * For now mark these as accessed and dirty because the only
-	 * testcase we have needs that.  Can be reconsidered later.
-	 */
-	pte->accessed = true;
-	pte->dirty = true;
-
 }
 
 void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
