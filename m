Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D04C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:58:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB1860FC1
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FB1860FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qC9dgzm6vKSTfSyqIsvyX/E+Ll8GmGpIuUAdclqlaBI=; b=SL21SzWxgn1BCg
	ch5PF/JwfJE3dJ/WR64WQuzVfEky8MsVxCBXTDUrBG65+czkzeBZhY/BgX+JEC0hutAiprayYMOAL
	6JzK+ed7bmBsOlgc2qM9+wBXXujrtX4HGbD9buUOPBwDRM7fD79N6Y0UAWtu90pt7QwkrL7Sc0Wzn
	TkdBczsQy7OWq+nK8oCJPSS3qFCtk1Spvx3JnRVKja/wkFfZM1WskmlggtygK6I3rEl0zLrdnjdA1
	kQExCNSVzJEaw5gz9npMISsKjlnx49JtvGGh4oB3cSEmxWpfsCogD1DjQLOq28aYiGo3UQDV7Kngk
	CnYwBzbFcSwGvlFKWt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2ZF-004m8F-AE; Sat, 09 Oct 2021 02:58:33 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sU-004Uo5-0y
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 v70-20020a256149000000b005ba4d61ea0fso11141493ybb.22
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=aUX8Y2YLswKDqX/BLpfoyrV2JucXQRAbXeQDlXSPSss=;
 b=G5MbwU8BdaMQMjcxHC7wzAGcbCLg0J9TahLf26928bNhrSUGxee3WK+qIWNauLjJc2
 4Xwq4k9z0Bcozkgdo9UuN8pYL/McLuokdYERF6AjYJpP9DVrzz7LcHr5xQ7YSRGHDf83
 C4d2MTdybZ7qs6+Hvzz4omoXgx38bBowhcmbmBEmcHJcWdglD0Yhc1MiEuFt9Fw1KjYf
 IU8Si/NujuJeGl73mPfUyvTbrfWHQuWcYsMeCz7hSroDRTTwybjhxVWqi9JvGgqv6GdE
 c2z6JfVm7zV7RLMtNOh0ttQMOfVO1eAL7gbGkhhf3GzhLAQDASqkrGGTf6PyZKaDC4wn
 ItTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=aUX8Y2YLswKDqX/BLpfoyrV2JucXQRAbXeQDlXSPSss=;
 b=z7QP2jrBIkW2nghill7p2BgDHofu8g1RFzA52m70PlMWRGEcGU1wrXCvI6AgzvQVnk
 jSPWO1LNgY05i+0e2whNUiX56Dh1LbneWe6MRJrJS10EXWjVhQ2mbflDpvAIDwVPGY8A
 CGrdMN0FMOPvG403OhizyvdFStC0Zp77s0e2ayASk93kYEYK/RPjrfnCAoxELRS3GxA7
 SaxG9yZi7HlJ28dLUoCUx4YZLNZ0WcdCa78B5Kdh1MZSxUUF8SlLTaNYRSa/ekBawl98
 hrhpbVDra2GZi16eMRPm6xY9lhfyhSZgjDgVTrdS34hDPk6+pYKy+59zAllfAOl01iel
 q19Q==
X-Gm-Message-State: AOAM531C7YGUZqNf3HudxTI65CG33QLL2vlJlb+giNSPY/tv76wQxPBj
 owSrRRIIWpQ6pjuAmsovqx6SYa+mJUw=
X-Google-Smtp-Source: ABdhPJy/0bkpOZiIEUh7mp5zb57qYvZdonB+LQ1epmXddUZkHwIyS3cnCQFog4XmODRYh0Rav6GUeBBi44w=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:2209:: with SMTP id
 i9mr7632692ybi.52.1633745659766; 
 Fri, 08 Oct 2021 19:14:19 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:33 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-41-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 40/43] KVM: VMX: Wake vCPU when delivering posted IRQ even
 if vCPU == this vCPU
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
X-CRM114-CacheID: sfid-20211008_191422_232430_693F5510 
X-CRM114-Status: GOOD (  13.37  )
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

Drop a check that guards triggering a posted interrupt on the currently
running vCPU, and more importantly guards waking the target vCPU if
triggering a posted interrupt fails because the vCPU isn't IN_GUEST_MODE.
The "do nothing" logic when "vcpu == running_vcpu" works only because KVM
doesn't have a path to ->deliver_posted_interrupt() from asynchronous
context, e.g. if apic_timer_expired() were changed to always go down the
posted interrupt path for APICv, or if the IN_GUEST_MODE check in
kvm_use_posted_timer_interrupt() were dropped, and the hrtimer fired in
kvm_vcpu_block() after the final kvm_vcpu_check_block() check, the vCPU
would be scheduled() out without being awakened, i.e. would "miss" the
timer interrupt.

One could argue that invoking kvm_apic_local_deliver() from (soft) IRQ
context for the current running vCPU should be illegal, but nothing in
KVM actually enforces that rules.  There's also no strong obvious benefit
to making such behavior illegal, e.g. checking IN_GUEST_MODE and calling
kvm_vcpu_wake_up() is at worst marginally more costly than querying the
current running vCPU.

Lastly, this aligns the non-nested and nested usage of triggering posted
interrupts, and will allow for additional cleanups.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 44d760dde0f9..78c8bc7f1b3b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4024,8 +4024,7 @@ static int vmx_deliver_posted_interrupt(struct kvm_vcpu *vcpu, int vector)
 	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
 	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
 	 */
-	if (vcpu != kvm_get_running_vcpu() &&
-	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
+	if (!kvm_vcpu_trigger_posted_interrupt(vcpu, false))
 		kvm_vcpu_wake_up(vcpu);
 
 	return 0;
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
