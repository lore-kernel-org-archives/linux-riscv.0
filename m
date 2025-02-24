Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23545C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnwX53pWb06L7RtsJnzb0jskhYZNiVra/IyP/CeeViQ=; b=vB+AArHTfRtAZP
	JZUMZQk5SD1UoUqGLkrhoklUSws97QfyZU+hvMmyEfpNcMn+zu+ftN+leK/+CykJv5gK/8NQBIWyF
	HD+ZWnyr01FkNt9cIDzzBKRsJ1aC44iznuNh25re7z7XzpEEyi+ki7IW0XlFygSr8IQo59yTnnpXr
	tcG4kXFJS8zKFoV9zflacxa2EsGHM90zHpss8CmgcYFBvb811YRNbfQab4SeV9xNLU7e743EqlvSb
	YiyI+DGd9wuNjiUrvGoP/++BrduteoT2PElRmt7qAXs/H1llB9F7gOtZHpLQBTugCXHha7ySgBWxd
	R/rj882M7HVg7DG8bhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiLk-0000000FZ3T-3xhp;
	Mon, 24 Feb 2025 23:59:00 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIf-0000000FXvq-3U2L
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:50 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc43be27f8so16634409a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 15:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441349; x=1741046149; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TGU0ybTwy223eIpDzZVLI/W8vnqy8rZ9uLMIqzhcN/c=;
        b=3XMCoqtsr798n0f6HhXhnV6oQFCHAsUVbS0Mg3Aj074V86Ptdv9WyCqGdO74gUK3sO
         JYxpixMVnrGjTfcvGby7hnpo0YZbTVJ8JCjj2eTNrZ73wPgyzTyJdQIepkCtpv02R9yN
         8R3abCAtm+5262z2jnAG/Q7vxICihK1upCVW84gu5Cxzq5rKfagESHmKpwq2wsx2GTW+
         zeapiLUkC0HUtPpanwL8uSu+AVI++yRxH02LdfZKZmzb4aS/ewAXhFeHHsvRBxu5+Pyz
         2l5uiswSSLPHOKaiqBXoR4Ma6eppKHrW75q6AoR2Q2Od2fvrfv251pSLCHf5vislVZ8S
         BbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441349; x=1741046149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGU0ybTwy223eIpDzZVLI/W8vnqy8rZ9uLMIqzhcN/c=;
        b=j9BGZox02zgTuyZdd8+NgA25PjjAHZjjNCyFNZL8zT6dl5YN5U6890/qZgOnIh9NSq
         aBcBFyBA1JnbvYmTGf6qt7Yrf0ZTA0QcFmmE9M59yLXVODtOnPg29QLMbF5OGgzDc0YE
         9e1BRZg6Q4CGlGrF3RRGLENO03NYfoaivKlOR+kKHIcu8kFxCNNvmFnHDB/1jDS5344I
         9AD5H/M23Yo+vLZLvHaTJTHDew0xweQcG410PJaFfaXzqfFdlEYlHoyPbxJd/EQxqfvb
         i3gmKyyiug8E5u+H7gNZ6GdTI3SGtDcdhEc98x6eaK3OrhoBoq5/rCSr+AHxOU+FGrTN
         TCUw==
X-Forwarded-Encrypted: i=1; AJvYcCU7TjQ2//YubKZ/B2/9WTGG5WIZ04PxFr+VVlaaXeVSzYoblS0WtQaubXCUOfEZpQUas23F84d+yFMyKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0cnDzf0+21S2rMwkaeJxtK6bnVBy0eLp/9UPkv/O8RYDrrlih
	xLFhZ/kKhVvKXmmV7HkcL6vO/AUJa+F7s5mX3TfVg4mhNbaKRsCUjSuntIgf0uvnQMA5XgnVccg
	Q9g==
X-Google-Smtp-Source: AGHT+IHcos0szxLwYcsW2Q/WbhHjoZ/1wFjhF3Xa+8fw1kzKNZT2q6/VDS58iA2uFYrVe3USusRDS/R8AlY=
X-Received: from pjbnb15.prod.google.com ([2002:a17:90b:35cf:b0:2fc:b544:749e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7cd:b0:2fa:17d2:166
 with SMTP id 98e67ed59e1d1-2fce7b40077mr23992311a91.31.1740441348957; Mon, 24
 Feb 2025 15:55:48 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:37 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-3-seanjc@google.com>
Subject: [PATCH 2/7] KVM: nVMX: Process events on nested VM-Exit if injectable
 IRQ or NMI is pending
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155549_870000_0B3D69A9 
X-CRM114-Status: UNSURE (   9.92  )
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

Process pending events on nested VM-Exit if the vCPU has an injectable IRQ
or NMI, as the event may have become pending while L2 was active, i.e. may
not be tracked in the context of vmcs01.  E.g. if L1 has passed its APIC
through to L2 and an IRQ arrives while L2 is active, then KVM needs to
request an IRQ window prior to running L1, otherwise delivery of the IRQ
will be delayed until KVM happens to process events for some other reason.

The missed failure is detected by vmx_apic_passthrough_tpr_threshold_test
in KVM-Unit-Tests, but has effectively been masked due to a flaw in KVM's
PIC emulation that causes KVM to make spurious KVM_REQ_EVENT requests (and
apparently no one ever ran the test with split IRQ chips).

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index bca2575837ce..8220b09e91ce 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5084,6 +5084,17 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 
 		load_vmcs12_host_state(vcpu, vmcs12);
 
+		/*
+		 * Process events if an injectable IRQ or NMI is pending, even
+		 * if the event is blocked (RFLAGS.IF is cleared on VM-Exit).
+		 * If an event became pending while L2 was active, KVM needs to
+		 * either inject the event or request an IRQ/NMI window.  SMIs
+		 * don't need to be processed as SMM is mutually exclusive with
+		 * non-root mode.  INIT/SIPI don't need to be checked as INIT
+		 * is blocked post-VMXON, and SIPIs are ignored.
+		 */
+		if (kvm_cpu_has_injectable_intr(vcpu) || vcpu->arch.nmi_pending)
+			kvm_make_request(KVM_REQ_EVENT, vcpu);
 		return;
 	}
 
-- 
2.48.1.658.g4767266eb4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
