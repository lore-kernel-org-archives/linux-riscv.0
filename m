Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0D7C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:29:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1741560F46
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1741560F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1Tbog61/V7D2EhUCzq/jnBGSL5/HYfMOuKjK7Rgf9s=; b=OoWwxY4dPyWQTP
	MS1awKcpC9zB2hUDe1BaMPDTdJvw5dxq5VCNX7Fkh1JlGebnf1kAVW0HlMcUdEWljxNbpvlt3QRfs
	g6g584NSNOQ/L0f2r8VAUMXwyQUoatFcAfIkk5425YaDPHLhd/Mbn/JgXPrCxwBPi5Tjrf3gphZ/u
	p53XlZQWgf3cGNrxWFE9ueaeTKEs9xsq9ODiiT1fe+kEqsx5Iq5SA1wS+5jzuUtOtwxwa9vtkWfMe
	Rjf6ykKUm6lLfX6JqhyrqQ6CDYAix5VMd0Wc5E3i/nU6ExlVpm4C6j5pxK8tekPFEfFQWh5nIYJG+
	NSDxCR34L9aoqg63NW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ26d-004b4E-Rp; Sat, 09 Oct 2021 02:28:59 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rW-004U7Q-Ts
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 c65-20020a251c44000000b005ba81fe4944so4783394ybc.14
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=iENfBAERukntPY2X5QGQTh9qzr8Td2a/eMmZN0gkPVI=;
 b=DzCx6d3mDseqABvdcGbaVVyn1eWP9DyM0ptlZC0Av6M11xsmwM4hDygp2I9SRsOTlD
 CaLslZ/5tpgFn7ZGK8Q+oAp/z+7Kry0ksTb1JHhzjTahq7Wh+o5eGwzQrJzYlowAOZ48
 VNCB+jXgqhl1lAdIBlzi52PfjMMWOIp8/GrzMp+AjpBgmC/UstMbkG/AsaR/Zi/J2Jar
 o4OtrA3m//aakuHjWV9VK3H1BLYWwyP3onVfEMCmc4KxgicKakfGDgJSztgcePWQk2I1
 bTHWhpYvVB73G/ZnG29ntm8kUxVEF6vAxFCPnskmCGo64vtpSvX8eFpV4pMmLiFClOgf
 jaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=iENfBAERukntPY2X5QGQTh9qzr8Td2a/eMmZN0gkPVI=;
 b=F5zoymhXLgD68OGti9HwopkH/3jteWYGKvMzyTROp0fhIkZmGcwPG+nDnZcNicdSCZ
 2RYmYuaRCgPdAPWmCOB1ySORL47352+xQHuvwGLD+xVUVLO77oAHaL7hEMRa7Z5wmFEr
 YsWO5p29QCv//z81t6/LjIOTaAZUH1tIsied2Z7wW7RV1C9RXxRFlSoZxKtoET6bxbvs
 qc12UlZxP/pDQP9K2fvJRfzEYkpibILaiqb1PQL+cBIg7m+S5OfBVw/AvRZDHkle08PZ
 cDXfOW4ZtP4Z59KUi6BExJJ9dLFBAausE3Q+VC22eheABIAFuerXR889jfdam5oAYON1
 UHFw==
X-Gm-Message-State: AOAM530JqFIJbvTz4J850ar01S7c7pKAOsjXF10v6624yg7+hcfVjRmj
 CBu6zXQSClDtpnNOk/4EDSf+vQkl8Yw=
X-Google-Smtp-Source: ABdhPJzWNw6k/Tym0AlNYDL00dpB0fqVjcBxlLLKgA5wVnQqHXg+hyQOuiK3gpCLlIvGNpb1Xv6thLhfBP8=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:bb93:: with SMTP id
 y19mr7661688ybg.266.1633745601224; 
 Fri, 08 Oct 2021 19:13:21 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:09 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-17-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 16/43] KVM: Don't redo ktime_get() when calculating
 halt-polling stop/deadline
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
X-CRM114-CacheID: sfid-20211008_191323_014220_862DB9DB 
X-CRM114-Status: GOOD (  10.92  )
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

Calculate the halt-polling "stop" time using "cur" instead of redoing
ktime_get().  In the happy case where hardware correctly predicts
do_halt_poll, "cur" is only a few cycles old.  And if the branch is
mispredicted, arguably that extra latency should count toward the
halt-polling time.

In all likelihood, the numbers involved are in the noise and either
approach is perfectly ok.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a36ccdc93a72..481e8178b43d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3272,7 +3272,7 @@ void kvm_vcpu_halt(struct kvm_vcpu *vcpu)
 
 	start = cur = poll_end = ktime_get();
 	if (do_halt_poll) {
-		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
+		ktime_t stop = ktime_add_ns(cur, vcpu->halt_poll_ns);
 
 		do {
 			/*
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
