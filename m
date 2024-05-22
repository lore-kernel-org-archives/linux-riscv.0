Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D138C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8y9Yo1zBlHbeIeP2QOCoUmkK3RjDwNNrhKGsAekggQ=; b=AqMzDpNDEi8ukK
	hKRd38P2poFTlZ2D/jM6V3czb5Aqsxt/oV3QtU/zxQcyxKFbE7xYjq3kkKdXJy7vpHPuPDB91iP1e
	wR49FsBgSv2yyhsBUG5mcIsXofBXApmgpYwn7S1TmmusS1e13c2XqjG4mIn8pzu1QZbP2Y1rqN6+5
	GSl6LaFUxn4FdlSEsXlecVcDcAQluc+a6W5wqJxkFopXBs8pjAhhjXtnvNLxZkd/9GDtzUruePFp1
	4FuDbsqKDbGLnPHE0+DG9C/17sYDAOxnRO19a0xKt8yoZmHKayb1UkE3tl4pW+wTE7Cv9Av4wCYIr
	DR9uBRPEYOxCtgdXJvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9axw-00000001edC-3tIa;
	Wed, 22 May 2024 01:40:28 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9axn-00000001eVs-3swq
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:40:22 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5c670f70a37so12359855a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342018; x=1716946818; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ksrstYm4acNB+vq44uyCoC45OYvJ0DDPXjwdxHvKYos=;
        b=Nb8IXEKIJBZsXrVP2jqmjh1b/Y/iYj7DHGX3WBPb+StFQdzr4US2/cTWEGqgLR5tK0
         xH6vgsrrMGIVEFt9Ie1R5FL3wIajApYjXZQcAaF9fCndqM7tcD7AdnRod5i1vVPqma74
         FKmVPHQhDaB33pFRgXLMB9pE+eNPGzt0OKqg5j5ifrc25C0F0Ee8CQpJRhVG4VhoCvbE
         niRAUa3Rj2uf6ilPLi4hftB+opruiv4nmF5Vu41yP4LdwBTMuLHrvRaqC09PXfGxkWAc
         hRWOLgDcBvztD/R/N6Ts99OEaVh29Pw/F5Zz5Z4t8MBr/3/Vp2MWox723XJ0+jgu/zjR
         x/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342018; x=1716946818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksrstYm4acNB+vq44uyCoC45OYvJ0DDPXjwdxHvKYos=;
        b=pphLvTYzJ65/vHWV1rbfPf1XdBsHOq3jhLFBdrsyZ+oALXn2D9HOTsRRf5Ry090lEE
         KewsEI82bju+LAYeLdVQrrGvqcvJwQYmiryDRmbFu9yawzFpHGlCkxn7GanCiY3o20Fg
         CAg0khtr07kiM1MtLicnXNj+auaXLPjiWv+zvi0OkGeAA5ZMldoqT/R+ZelIm2mBRz5+
         BdOjatv1WyivVvnpdicGgjIzUbII0KCiAuNL7kIyjvoEi8+aju4L9WCeBP/xXUEkYZ7q
         uw5Wl3COWLgHSm6nP6B4uWrk9MdReyYk22cPSIivzEg3RAbvnn0bpX/e1Uo+u8IpC0mI
         Ju6w==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZMippKabQ3f0lw6nrsbRLNYvQYTsqFSKbZEjg3ot8XuuHj+Rj8n1+0IAvoQ3andZNkoLhw17tDW5i9szKNObn+DDk6O0xMOIowbA+1ju
X-Gm-Message-State: AOJu0YytsamfWSomxcLEfYNUCdvjk7UL1R8GWSZxCGv08iymPsiuohYt
	7msx0PiYI+oq7dY8SR8ZMiwETV2Skp0Bsel3HokBbirjNgc6995JGQcrLYS6atP9AohBbuFNchT
	EFg==
X-Google-Smtp-Source: AGHT+IHJLNUzIn6ctcMF+INwxFBaLeFnt3jt+tGT+n5clQV+H1h//pkXMDRUR1aNO5clBwbY0FCScT/OPUo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:484:b0:5dc:5111:d8b1 with SMTP id
 41be03b00d2f7-676492dc83emr2297a12.5.1716342017980; Tue, 21 May 2024 18:40:17
 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:08 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-2-seanjc@google.com>
Subject: [PATCH v2 1/6] KVM: Add a flag to track if a loaded vCPU is scheduled out
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_184020_000139_18231BE6 
X-CRM114-Status: GOOD (  13.27  )
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

Add a kvm_vcpu.scheduled_out flag to track if a vCPU is in the process of
being scheduled out (vCPU put path), or if the vCPU is being reloaded
after being scheduled out (vCPU load path).  In the short term, this will
allow dropping kvm_arch_sched_in(), as arch code can query scheduled_out
during kvm_arch_vcpu_load().

Longer term, scheduled_out opens up other potential optimizations, without
creating subtle/brittle dependencies.  E.g. it allows KVM to keep guest
state (that is managed via kvm_arch_vcpu_{load,put}()) loaded across
kvm_sched_{out,in}(), if KVM knows the state isn't accessed by the host
kernel.  Forcing arch code to coordinate between kvm_arch_sched_{in,out}()
and kvm_arch_vcpu_{load,put}() is awkward, not reusable, and relies on the
exact ordering of calls into arch code.

Adding scheduled_out also obviates the need for a kvm_arch_sched_out()
hook, e.g. if arch code needs to do something novel when putting vCPU
state.

And even if KVM never uses scheduled_out for anything beyond dropping
kvm_arch_sched_in(), just being able to remove all of the arch stubs makes
it worth adding the flag.

Link: https://lore.kernel.org/all/20240430224431.490139-1-seanjc@google.com
Cc: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 1 +
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7b57878c8c18..bde69f74b031 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -380,6 +380,7 @@ struct kvm_vcpu {
 #endif
 	bool preempted;
 	bool ready;
+	bool scheduled_out;
 	struct kvm_vcpu_arch arch;
 	struct kvm_vcpu_stat stat;
 	char stats_id[KVM_STATS_NAME_SIZE];
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a1756d5077ee..7ecea573d121 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6288,6 +6288,8 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 	__this_cpu_write(kvm_running_vcpu, vcpu);
 	kvm_arch_sched_in(vcpu, cpu);
 	kvm_arch_vcpu_load(vcpu, cpu);
+
+	WRITE_ONCE(vcpu->scheduled_out, false);
 }
 
 static void kvm_sched_out(struct preempt_notifier *pn,
@@ -6295,6 +6297,8 @@ static void kvm_sched_out(struct preempt_notifier *pn,
 {
 	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
 
+	WRITE_ONCE(vcpu->scheduled_out, true);
+
 	if (current->on_rq) {
 		WRITE_ONCE(vcpu->preempted, true);
 		WRITE_ONCE(vcpu->ready, true);
-- 
2.45.0.215.g3402c0e53f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
