Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E8AC6FA92
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3R0thVwE02+bZl/HcZIMHMLIh/4EDTeBYMjE9zCG0oE=; b=13aPZMw3w+rfLf
	5KpxPSbIHqiz13Dj8aouU+X7WDjZtE/VqDzjxsXWWmS7cbEzujsvzWMjlAR51ih2Zm8xaDpM3OZnI
	RX2NxugqOB/yhrkFN1qOWMtUClLT5oVoEZBvzNXGOdxQOv67t8rQv7aCfYkztH32e6rvRAC1M2mNO
	+P+eebtktk78nDt9eQo39q3CYNP3wRlL2+WCKjm7tw+O76s5FuIQ12HQFITBaPXa8UFJKnLppTCQo
	zqtPfN0aJXVnv4No7PD6Ki2wp9O7pQBp0u0frbJ4DV6KRjoYLPvrNaIUhwjrwoFtrLiY6gT3hxdwu
	+ZoRujvC3hJsOfSIl49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfk-007hvU-Jc; Wed, 21 Sep 2022 00:33:04 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfa-007hnI-GL
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:32:56 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-349e90aa547so37870067b3.8
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=MOTPXqlRM/VeyDMLdvanelesLQo1zQAim2hnWRvX5Ck=;
        b=YBqAHda81cZL+XoxjJlGZuZuboXTXgUC0z4uqSgz7QVH6dpNmadTy2MF1qyxWTzse+
         Bm4tIE92SduAzP3ZIMtRF2tHutR8pP7xlWpK1ArY4DnG03povI4wausutZUl5/iFFjm4
         TVHVZG9uLcywTpZWMGs36ucGtqVhhGObHn0VVjekmG1+dp+mNh3xufw2ncJL/mts4ZIh
         7z9P/A8X9TowwqnweXUdspRxboWu77JnECKkB3W0l/4PI0O4qSiM4m96bzkM3yIhCnUQ
         IS3oC/wRtMwluha1XcW0DRroQd63c6ike/sLIVwGS1L4peBPZN+rGOVKwA2aeOQ8Ropo
         ukqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=MOTPXqlRM/VeyDMLdvanelesLQo1zQAim2hnWRvX5Ck=;
        b=YS0uCsSXP3GURAoxiEMiZW8lR36EfT08oVu7cikU58n4AMOtwW7vbL/MiJc6ywKUjV
         AyDWOAOYOqQ3T817AbrMGTCxqtpXQWyxNnNsNmK6WpZGpIjGcthcRoywDqNVPfZyyrB+
         f/v7T3c0cfr2QvXL5TocADLNMvzPCFECaesO5RoITpKOolFkuRsA5ZYwCweJd3GZKfgI
         oWaX8pR9IpcbF+4HM0BgXX9Tz4OKGe8MMPvhcgjMhEA2V0RPT9EaLlsZ+2CSN1qf6FM9
         Hsj5dcTDMpAPnRz2QlETs/5+uKGZKN+4oXRtHYHDZ+gKU91sa8Rc4k30gt2PSmXORCcT
         q0LA==
X-Gm-Message-State: ACrzQf0sRQkNielE1uMjcu84J7joHLMhk2Y7eYF0w5BkSH+U6NlXYPTw
	QP6RQ+OJTYFSPClnt6kMWPB6blJ22FI=
X-Google-Smtp-Source: AMsMyM6m3bS7RPF5fQr/eH5ncPqvFCJtkoDqyUevH+R4X807matv5uzc8TD1ePhtwCCU0OlXVNBl8o1DpUw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9256:0:b0:349:e25e:9bfe with SMTP id
 j83-20020a819256000000b00349e25e9bfemr22039190ywg.111.1663720371023; Tue, 20
 Sep 2022 17:32:51 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:51 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-3-seanjc@google.com>
Subject: [PATCH v4 02/12] KVM: nVMX: Make an event request when pending an MTF
 nested VM-Exit
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_173254_595670_17627BF1 
X-CRM114-Status: GOOD (  11.99  )
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

Set KVM_REQ_EVENT when MTF becomes pending to ensure that KVM will run
through inject_pending_event() and thus vmx_check_nested_events() prior
to re-entering the guest.

MTF currently works by virtue of KVM's hack that calls
kvm_check_nested_events() from kvm_vcpu_running(), but that hack will
be removed in the near future.  Until that call is removed, the patch
introduces no real functional change.

Fixes: 5ef8acbdd687 ("KVM: nVMX: Emulate MTF when performing instruction emulation")
Cc: stable@vger.kernel.org
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 3 +++
 arch/x86/kvm/vmx/vmx.c    | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 85318d803f4f..3a080051a4ec 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -6632,6 +6632,9 @@ static int vmx_set_nested_state(struct kvm_vcpu *vcpu,
 	if (ret)
 		goto error_guest_mode;
 
+	if (vmx->nested.mtf_pending)
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+
 	return 0;
 
 error_guest_mode:
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 94c314dc2393..9dba04b6b019 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1665,10 +1665,12 @@ static void vmx_update_emulated_instruction(struct kvm_vcpu *vcpu)
 	    (!vcpu->arch.exception.pending ||
 	     vcpu->arch.exception.vector == DB_VECTOR) &&
 	    (!vcpu->arch.exception_vmexit.pending ||
-	     vcpu->arch.exception_vmexit.vector == DB_VECTOR))
+	     vcpu->arch.exception_vmexit.vector == DB_VECTOR)) {
 		vmx->nested.mtf_pending = true;
-	else
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+	} else {
 		vmx->nested.mtf_pending = false;
+	}
 }
 
 static int vmx_skip_emulated_instruction(struct kvm_vcpu *vcpu)
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
