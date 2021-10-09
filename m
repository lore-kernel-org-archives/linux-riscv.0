Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A78CC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:13:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0740461038
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0740461038
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FNvRFLl51zv9TQM+Y0KF6u9UtCouogOSwyG3sMQbVg=; b=DPv+Ce+xhHzFcY
	A+lNSnUpX7YovWebrYY/gIz6lzg+YDux+jyQ2xSe+YTIij7IMS1ih/cB3tNaiJzBauHxN2i/cDEnJ
	Ywdm5oDmCGRauuA1UERGJ0s/FMjCT/9c/4I7T62DhH5aqzdkN5W5qeEIYT17yc1X0OzenP0DU7lZg
	CU6QLHNY8vsJ+n0OpYydHSgONXN2oLeJ193q01XstHl3HWDrcRRiQWqVEnRCM2y8KctIXboJVTmNd
	VgryjZ2PMtVHKbyZ6ZzbCU9qI+Wg8Zi0zPePcYafLMTomnaTMoJrbZAVfXi0KXG0rApTaImz4iKj/
	We8ftTObdjO2bBGeORag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1rW-004U7o-A5; Sat, 09 Oct 2021 02:13:22 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1qy-004TmY-1w
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:12:49 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 x15-20020a056902102f00b005ba71cd7dbfso4952474ybt.8
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=79LIBqpnbdhRmfT7kSoV1WyIctghtEtxlcdZEfLixOI=;
 b=td6Jp/Qoz+WOt+cvb/jSNSqRd38PBqxXjUOlkCeRRmF+Xq32DT9663UFIERzbBP+7k
 sIaPHTm4Vgj+KHKuAZRxJtlQiFNwnW7Gr6Np/g8/gHiZEP/vq1b8eXJehgPH0k67g74g
 Eejc31bexmjXOP0iVOhiJxMHqh3sykybQ5VDUN0mBT1X+xmhe4U8/hRuzrlGW28cUSb9
 g22fsln1P8HNH27yLN8eZT01CH6+UAgE5LZNQQheC1aFigNp8cVDpq7HbECp3WAvt9tG
 GqRirzTAEB5G45ET1seL/TOuwe+ZOUYFxzi+NEQTSlGInnVjBGl4BhooEPA1Uoist32O
 48qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=79LIBqpnbdhRmfT7kSoV1WyIctghtEtxlcdZEfLixOI=;
 b=BFatyzpSDRJSv+fX61j2e7RfsYJEdAHhbzJoE517Z/dSQQ6zLrKXW+eFPX4RrrhBIG
 7chWXQRj76+FjatrYLJun25lBsIwENOG+QvHlOrvnrY8u+wKefQ2Ve8xxPGH7IFSpvry
 PQMZtwvcXGAKj5a9O3WhNSc5o79PjpK8bQSVqlGu93Mnh4JfuD6o/uY6VFo8kXPNeAJV
 BiRfV8RUDP6kTevTpK/PVQ0lDKDp2jub9H1nK/rnIPTpERuVNOfrTCz3YKXYfIS4S2CK
 gDpkVu1z0Nsp2uc1EpxlUfOZ56A64JunN4xHd7ms2iql8Q6Ff/f1ZT98x1BUF89ILhM3
 OcWQ==
X-Gm-Message-State: AOAM530H3DzLdMcCANA7uykHe7+Ffv51S4FW9LtrZOXjx3ppx6im76Z/
 ecHYniyLkJqUEs1yBG1E2Y/HhsvHlIE=
X-Google-Smtp-Source: ABdhPJzWtheYwqmb2qGHXjL3MjJXvhFbgclB9eUF2EsS3ZM9JxohPV47rYshPv06U56fIG/ADzd4Ho8ZjF4=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:bd03:: with SMTP id
 f3mr6935305ybk.412.1633745566669; 
 Fri, 08 Oct 2021 19:12:46 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:11:55 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-3-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 02/43] KVM: SVM: Ensure target pCPU is read once when
 signalling AVIC doorbell
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
X-CRM114-CacheID: sfid-20211008_191248_150978_12804D2D 
X-CRM114-Status: GOOD (  13.91  )
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

Ensure vcpu->cpu is read once when signalling the AVIC doorbell.  If the
compiler rereads the field and the vCPU is migrated between the check and
writing the doorbell, KVM would signal the wrong physical CPU.

Functionally, signalling the wrong CPU in this case is not an issue as
task migration means the vCPU has exited and will pick up any pending
interrupts on the next VMRUN.  Add the READ_ONCE() purely to clean up the
code.

Opportunistically add a comment explaining the task migration behavior,
and rename cpuid=>cpu to avoid conflating the CPU number with KVM's more
common usage of CPUID.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 8052d92069e0..208c5c71e827 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -675,10 +675,17 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
 	smp_mb__after_atomic();
 
 	if (avic_vcpu_is_running(vcpu)) {
-		int cpuid = vcpu->cpu;
+		int cpu = READ_ONCE(vcpu->cpu);
 
-		if (cpuid != get_cpu())
-			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpuid));
+		/*
+		 * Note, the vCPU could get migrated to a different pCPU at any
+		 * point, which could result in signalling the wrong/previous
+		 * pCPU.  But if that happens the vCPU is guaranteed to do a
+		 * VMRUN (after being migrated) and thus will process pending
+		 * interrupts, i.e. a doorbell is not needed (and the spurious)
+		 */
+		if (cpu != get_cpu())
+			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
 		put_cpu();
 	} else
 		kvm_vcpu_wake_up(vcpu);
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
