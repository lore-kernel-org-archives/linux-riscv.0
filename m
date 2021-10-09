Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F8EC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:33:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6156860F5A
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6156860F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPYn+xzeqIb28XzXUpyDeJ/Ob/QDyXWBlt08Ro9c6x8=; b=C2DkZtGVG/SoyH
	X9IykNkE5gy+VPRPFPXJcmQPp3JBh34jMuR7hGHyN990HNrDBh0xq6UnvsXRIT3d00pqVLyQUqEsd
	yQnZppCjTPQd7WaPQKf9lxQufgqtgcjmFeMzPHwF0RQtbqXZcGvw/zxVSetehrq8n0mjUqx5j3rmN
	yCUqRRhZ02WolHq+VT3l96uqzMiGmHs0JmKs8r94CyxW8kUJLnjMdEUi27OHFGDhw3yWLIBMqn9BA
	Gvmki6HcdQBlicVuFiW/UyKJbIeFabgYZNLQXqxrsOTW0RC4vPOG+NAPlwZIgsL+zLF6SxyxBhqkZ
	lAYgTmivLsOwW8nSHKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2Ae-004ccw-Tl; Sat, 09 Oct 2021 02:33:08 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rg-004UEh-VV
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:35 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 b5-20020a251b05000000b005b575f23711so15169872ybb.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=JkZfdKKKsnqnpAtGUC7eJv8NSTwENPUfH6MKqHK3m28=;
 b=qVLIqxee/wprC+4bjZNYJueP2zjkd+ggVBKmgUwNSOpnEV7X/9yGfblAJrRqdCWEih
 HkkaQsOOaOeL+/6gKeVGYHju8vK+HKNcdt3bTPsONepW8SXVyQdRvqfaAKZcB8+jVwae
 l3QyVEsfib1Ds5XSLDwK5fjGQZuWnnjDxgzphYDPgXfwssEpRJVHvOakRnpFdPD78q0R
 +0gwjhJzjz6GJsBbS0TZrWfFGUf6BV3+uE57g+PTVVc8UKWIe6wyeSoVcPpQNBbE7SiU
 oPp2V17b+NBHZjC8Iixu81AY6DPeXf4DpNjHUN5949xj5Ej8bfX8i2do7PuBJAHe/oBY
 ATyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=JkZfdKKKsnqnpAtGUC7eJv8NSTwENPUfH6MKqHK3m28=;
 b=uY+3VNRSedTQ1p9rqJbZux3V+wdMPnoc+hWGZ+JxOEqySQsXbVAN3ivc19gVIpIzI0
 opNBN4LgqIchABQtC5ZRAx5PqOacHlZ0yVYQJsjyNoUGHHPuAdiRRA5W0sDzBD2hneDO
 YZk/LRovlO8/oVSq7Bj8m0ohdKqqYUiW+CjjzNVY0POv1zKt2XSrBEImGlM+g4Gu9aTw
 HZt4dIbCjhG2swOJT5WiepcM+7bMDTHUug0f4L6U6EmH1soTU6Kjx8q5vndfT7B5Eh5B
 UHuOl4ipZrFQ9jFBHl/rsbjeUmaCwL2qLxL5DjA1NM8ffVHZ6RUc/NllQX+qaPdydDpd
 w0vQ==
X-Gm-Message-State: AOAM533Y/6Kn7VP8ccUulZmbh3f0ZaQD1h8GPtoL3zDjQ6XJlpPvc5wh
 /8n8QWfffBkmPGt2P+rWxAsNp/Uo8Z8=
X-Google-Smtp-Source: ABdhPJzgeMmRSEoifPybAsuoSY+JDjln6XTZNwptycydEyLK/6KcdeEb7uS4dZEit5L6yoPPTC+t8rdx1rg=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a5b:d03:: with SMTP id
 y3mr7590634ybp.400.1633745611129; 
 Fri, 08 Oct 2021 19:13:31 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:13 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-21-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 20/43] KVM: VMX: Skip Posted Interrupt updates if APICv is
 hard disabled
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
X-CRM114-CacheID: sfid-20211008_191333_104195_4A3B3E0F 
X-CRM114-Status: GOOD (  12.86  )
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

Explicitly skip posted interrupt updates if APICv is disabled in all of
KVM, or if the guest doesn't have an in-kernel APIC.  The PI descriptor
is kept up-to-date if APICv is inhibited, e.g. so that re-enabling APICv
doesn't require a bunch of updates, but neither the module param nor the
APIC type can be changed on-the-fly.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 3263056784f5..351666c41bbc 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -28,11 +28,14 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 	unsigned int dest;
 
 	/*
-	 * In case of hot-plug or hot-unplug, we may have to undo
-	 * vmx_vcpu_pi_put even if there is no assigned device.  And we
-	 * always keep PI.NDST up to date for simplicity: it makes the
-	 * code easier, and CPU migration is not a fast path.
+	 * To simplify hot-plug and dynamic toggling of APICv, keep PI.NDST and
+	 * PI.SN up-to-date even if there is no assigned device or if APICv is
+	 * deactivated due to a dynamic inhibit bit, e.g. for Hyper-V's SyncIC.
 	 */
+	if (!enable_apicv || !lapic_in_kernel(vcpu))
+		return;
+
+	/* Nothing to do if PI.SN==0 and the vCPU isn't being migrated. */
 	if (!pi_test_sn(pi_desc) && vcpu->cpu == cpu)
 		return;
 
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
