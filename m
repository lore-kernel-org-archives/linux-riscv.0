Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DEEC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:49:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8F960F5D
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD8F960F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g72wrz5Rvub0PUhaT8y1gXxWKVKmRjQmVotwNfz7pfg=; b=kgb1H5qeobTMTa
	ROTXdKE3yeJgSPnFVl2CZ+mDhge7KygeqjaiXJq//kqELztbFqVtUJE4cy9+zm3d70KUq/1onWEr5
	mcPRlKuFJegDoJwbe9eu/aLm15qOkBw/+2ox0KpK98b6SdSsIESHn4fqnn6HQQyyb72ZFjXUCH4z1
	YoeJA8NmrRz3klHIaGCiETRsSL9urx9xoUT5j1Kgf8KAkssSoxITQVrw+HexmH8sF9Vi0emWb0CXs
	XtUpDJkIz7v2H+HgiWZBCm+n2UT9JQwY8wN50GVX3t6tkZRJwfhtj5lNyd0cy8VqjnhYK1SWx30P3
	CAfcXKGOqNHVjIMw5w+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2QZ-004iqu-Ba; Sat, 09 Oct 2021 02:49:35 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sC-004Ubs-TW
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:06 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 81-20020a251254000000b005b6220d81efso14972365ybs.12
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=C2PBzYfpswTkvsOYeskWQEML51RRougebHfj0Alyx5A=;
 b=WYMPTsMzDt+AsjiCyZJ1B4+ZpYxh2OtDt82Ju6kAg5cXo6tqXm1ZgRYGEPixBeGSUX
 csu0nnUcxqKDiQ1eAmAeGes+LUQg2mXWzAyCEZN0ncq8JRJRFlJFF87rnbemqyBf6tBd
 V9ViKRAH1hB1quUnaDowk1/9kTi2JyNnkHWTKfzzmhY7AxslA7BLbxo1ZA8eLcYWLnjz
 YbQ0w447PhslHJ3ZxBNJRnTcGLYtNfmZQAOeWXXJuualGN4NlLQe9GK7rEtrWgH0mtsp
 VqsmagApekmgICqy79O2umIOGpnKlEqjA71PkSs0Bk91M4cBLEAn1bGCQe9gx+1d5Zvx
 1xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=C2PBzYfpswTkvsOYeskWQEML51RRougebHfj0Alyx5A=;
 b=Wk36Vxh96mYyS8j5hbNFaxffsYGYDU+CmVss4rD9aYqkXJaEuUx094PCTk+B6R1BPT
 1U5Wt9Src9MrKzvdBrC1eGBx+101LBsYqdKcFSIwYr8nA8ygaJiwF/+AfuxryXqmPtb/
 sTPBlPMjFLE+ryVZfadQVF4Zx9UYGnIhm7xKbEGQukY1BorH5cg9/KzyyCgmWVfKxRRM
 GCzePTKyQcKjYzhYlTPWNiGDhPz7e8xxyWb4089lYrBd6qKN/9iAjx11Z597KYAugH5g
 MiSxw/l6upPf+xMlfgBOGdGWygVy0qlNax0UgeCuviPxBhLkg/JZJd3QySsZInPM4upt
 m33Q==
X-Gm-Message-State: AOAM532svM3JLXhZu/hd+NPUFAdk/DiVL5u6wFJxc018ohSxTLIUxD+z
 YilzG5t3cFhb9gsmiQUifVucEPRDtZw=
X-Google-Smtp-Source: ABdhPJzcpn5DTPQuPSfZUPDLuPAfkBrPTcc8cEPmAKwjDwkk0IcaBIdBFMmznx5JjVGnWgQQ1Ay+qs9Sp8s=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:5954:: with SMTP id
 n81mr7136674ybb.435.1633745643213; 
 Fri, 08 Oct 2021 19:14:03 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:26 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-34-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 33/43] KVM: x86: Unexport LAPIC's switch_to_{hv,
 sw}_timer() helpers
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
X-CRM114-CacheID: sfid-20211008_191404_993086_29FE4CE6 
X-CRM114-Status: UNSURE (   7.05  )
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

Unexport switch_to_{hv,sw}_timer() now that common x86 handles the
transitions.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 0cd7ed21b205..cfb64bd4a1c1 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1948,7 +1948,6 @@ void kvm_lapic_switch_to_hv_timer(struct kvm_vcpu *vcpu)
 {
 	restart_apic_timer(vcpu->arch.apic);
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_switch_to_hv_timer);
 
 void kvm_lapic_switch_to_sw_timer(struct kvm_vcpu *vcpu)
 {
@@ -1960,7 +1959,6 @@ void kvm_lapic_switch_to_sw_timer(struct kvm_vcpu *vcpu)
 		start_sw_timer(apic);
 	preempt_enable();
 }
-EXPORT_SYMBOL_GPL(kvm_lapic_switch_to_sw_timer);
 
 void kvm_lapic_restart_hv_timer(struct kvm_vcpu *vcpu)
 {
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
