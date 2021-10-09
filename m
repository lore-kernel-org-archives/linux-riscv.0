Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49189C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:31:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E5EC60F46
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E5EC60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdgv3LUoKePgiojnl5r+LWFU4Jb441CqE/iKyQltK8c=; b=1voNKvU5TNcyra
	M/lOrVDr4RvCtjFuYupsVQqj5CUdY3vNJJf1fhkOf3340VoAbTEaLJT9QUCpaynEX41KYD1VxDdl8
	97tr7UOBdUw3Bp2fuIIHj7NgZJpYZYxmCMpEMEDFI97wDGq9hc/BUz6nGyQWQ4kEkNddZDPpFODT/
	okf+M2Wg2d+U987kKwP8CP3yOgeJEyejQULqJ+lH5yi620eB5940l29ycl2/1vfeRruW1o0q8erUf
	g8GPSsbTEwzUKvlpwIH1VP2D6DpaaY91BTccvA0yk59ELYSKsidJdqM+FaGtSeTO57enL+eSo1IWp
	yk5LTBYcDVeZnNb50c7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ297-004bz8-L4; Sat, 09 Oct 2021 02:31:33 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rb-004UAy-GI
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:29 +0000
Received: by mail-qk1-x749.google.com with SMTP id
 r5-20020a05620a298500b0045dac5fb940so9783580qkp.17
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=qbaTmooIqpw2scwWIPvYnbgTG8gkipCw/gcnfpltSGY=;
 b=FuJT0BM9dDnYucltpEKN/3PIbfdvyXmexJqecK3YzG4d74UzCBAUJzNpfna5d3hhf9
 CThoB+q3zbECmvBpsVwSPC65vqE3PC/pyRXG3MptW0vOaTjGmTNfFzi4I7G//ciy+nJL
 p2SrF4m156i96jaV+xzdhT+w6QkXcy0HHxtm4YS01i3rZ/GAWxIlxZ4cG090KNqUoG+F
 MZ7IfesCmYwBPSKodHNoD1ZFOQvtV8bnYcdLR84ii1K0oqwvG/i2DqC+H4C9C8AdNE7S
 NtI/ovPQV920bh3qJxqxqTJF2XHwSs9PcFYmvUBVFETjJlGAhfkCawm/pDGPWqba98m2
 bBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=qbaTmooIqpw2scwWIPvYnbgTG8gkipCw/gcnfpltSGY=;
 b=G5HonEn2R9qfVYRkDbyW19pzaY2POlrTzlF3rZRROOwbcXGwLGS2cPoeJJaVXH4v8N
 J49yCrUJdUwp1+K5T9oav3KPJE+FVW1ujHS2W9Y85h/+cZgWpipHb92vT4ieWcB6UX4+
 /8UUyBvzFLc+vS+oXbmvwdTVMAhFReGwcE8LLTcwa1KcGmCHL0SpkTrRRkULUdgt8R4w
 yyU3J9LE73quDTiH0j1Pz4thiGfBbfP3CnFXMHZ+JUP8MaXENXz3DFOtF8O3aEupIhkn
 D6iwVpNMjI8P8USNywEZs4OrW5EDthvlfl9h3zTMZqafYVNsiyaUT4LbinJUCwbqXXNJ
 79LQ==
X-Gm-Message-State: AOAM533Sj63+kk0r+gspWeZn68Ip03yCKIBNg4M2e7Lw7wFXJbrktPRR
 ZgEDwOjoszq06RemShV2A4kUt+IkOv8=
X-Google-Smtp-Source: ABdhPJzmsEVzPU7/MqwbML2H7/jnReeletG9BCOCcGkMjuKkxZyo31ypELMFzY3g7cKF9pg0VOLbDRLLOow=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:ac8:4e11:: with SMTP id
 c17mr1903866qtw.400.1633745605808; 
 Fri, 08 Oct 2021 19:13:25 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:11 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-19-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 18/43] KVM: x86: Invoke kvm_vcpu_block() directly for
 non-HALTED wait states
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191327_578207_2DDC4BEC 
X-CRM114-Status: GOOD (  11.50  )
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

Call kvm_vcpu_block() directly for all wait states except HALTED so that
kvm_vcpu_halt() is no longer a misnomer on x86.

Functionally, this means KVM will never attempt halt-polling or adjust
vcpu->halt_poll_ns for INIT_RECEIVED (a.k.a. Wait-For-SIPI (WFS)) or
AP_RESET_HOLD; UNINITIALIZED is handled in kvm_arch_vcpu_ioctl_run(),
and x86 doesn't use any other "wait" states.

As mentioned above, the motivation of this is purely so that "halt" isn't
overloaded on x86, e.g. in KVM's stats.  Skipping halt-polling for WFS
(and RESET_HOLD) has no meaningful effect on guest performance as there
are typically single-digit numbers of INIT-SIPI sequences per AP vCPU,
per boot, versus thousands of HLTs just to boot to console.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cd51f100e906..e0219acfd9cf 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9899,7 +9899,10 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
 	if (!kvm_arch_vcpu_runnable(vcpu) &&
 	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
 		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
-		kvm_vcpu_halt(vcpu);
+		if (vcpu->arch.mp_state == KVM_MP_STATE_HALTED)
+			kvm_vcpu_halt(vcpu);
+		else
+			kvm_vcpu_block(vcpu);
 		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
 
 		if (kvm_x86_ops.post_block)
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
