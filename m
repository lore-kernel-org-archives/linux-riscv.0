Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A971C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhQroJL9ewiOukQfltxJinGiL1ucFoucts7zkF2pWQE=; b=Ps04DA6oBaGUkZ
	BLcjjd/JnrvNW73oInZcIZOVbXN/p6+/kJEsdvbGxC/PtsU/wILF0cafHQBvJ/5ZfvAuLvpZBwj3q
	rvBKXdrbsyY116aAAq1KVBkOOj1CYodP44mT+CXPN+RhRezrogGhS1MoD4tQqwzlxQugnYzTFl3LJ
	jm+kMygJKwmHgOLUXlGr9i6LbyAZZ8jZveZAfbkjseQgQxMpWF/0lLTCNzJ+VNw6BuN1RdPYFSGyo
	QpAAouYVN2QdkZQpXdh5weyVwgD09ikcwK5cFxpa4WT/E9sUos2hbLN8RVKvXklHAZ7Er5fM0wsA4
	vRj0n7bg9p32g7Qcp3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oao1T-007p0Q-5L; Wed, 21 Sep 2022 00:55:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oao1I-007ovx-2Q
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 00:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K+eJDVrRDoT/6MhRD9TeI/5Knz9Tn6rS//AmvrkEOco=; b=FvJ/axtGQSovGG+zki3f/OF2aL
	L6H1ZYLHZ62wXTP2b8q4npXxWFd5QO3A0ZOYb9ABYyLQ8lxCBeUeucOPweCmelpHKSpCTAfEqRmWd
	FvdzO9wpKpJNNZxakPbGVwAZBj3H/bb+AuUMT9jMK+O2O/LcgrYMwD+aXebyNUIgH2Gt1gGhWxnVJ
	NzmqdAoerMNdS6/sQCrXk0vcT8Nrbj8aM4U6TJ1nbPr/qgmwAq5DUqdTxihxvFdQPD6nM7JZZ9lfr
	CT7uMhDAHdbHmMwi2qoDJpAJ2cejMzg5ooa6pZwHoqjmzz8IkBqf0qGr9WoKGb6RXSshWVzZamkUe
	rDe9F75g==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfs-005vuL-TX
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:33:15 +0000
Received: by mail-pg1-x54a.google.com with SMTP id l72-20020a63914b000000b00434ac6f8214so2526008pge.13
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=K+eJDVrRDoT/6MhRD9TeI/5Knz9Tn6rS//AmvrkEOco=;
        b=RumQH9j9B8TemfcYt2a6b2x/yZUXUUkBbA8gdyrJEr38nDZ7RuvyLCRaRk5ZkufEy6
         p2NCHI5GbrqhMqhjM/+4WM5CnKN5bBsM+xcVusQQyjpPw3Ksepa4epiazoqa1DtUlznH
         D3jXrYZbhuvR8NS9oP9hxXzcyaKZyMMMzC8Q3AsRqni5HUkhRX+jDr6NPQVgVd+hQMGt
         1BKLvJS2NkApQBW4GGR8+r3gbwLtcfbqmtTVZArU0N3RAW9Bb+ckWgOW049H7NaAmkBn
         CgE9T8i2GbNr42RCENeJzZg+9RVQrzeyxaiopWDNfB1fyskDMaEA2WCUkePT/lJ5TLD+
         i91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=K+eJDVrRDoT/6MhRD9TeI/5Knz9Tn6rS//AmvrkEOco=;
        b=xyEeaIBaQg1r4YlusxxL5BZUm6dTQAJQNRug7aOdZzfSbbmkXZ13vU1RUpeUVeICbA
         t/t5d5rkaumv9QWUwDcq+WbMtSivFstPqKjNB4i2wtu2yCLg4GsRkQ5Z/QpCKOZh3h84
         VVI2dHvpyM/9RnDjVaz3Dd+q1osP3mzg3NbmHekFCNlwYaGlEYoZ0UvGvJlWKmmxyUO9
         WLmPdGBZwRT4fb1xf3sQvD//EOa568K006HaAk6AZyGyizbqwpA3vn/Mz6wvS4wh5XZT
         9iAAoHLA0XO8osYfCgU8N5S1Alo47REUemhH+HCM+VLQya22Pe/ePncohrw8ON6tBp8U
         yUJA==
X-Gm-Message-State: ACrzQf1ZkUORwVEJjsx8t/kXHMdbGgoM+sGehq1AuC0ksRDyPp1sRMnL
	UDIDVNoGlZa5nnKQertS0T/i3kEJvyM=
X-Google-Smtp-Source: AMsMyM7p74m7+dmjyK72nsLPYB9lNVLqfhypVno6piUFMo/NwEAnZPXgFzPrJP9ozDKFIC2/tvBZej6i8L4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:134d:b0:545:4d30:eebf with SMTP id
 k13-20020a056a00134d00b005454d30eebfmr26543768pfu.32.1663720386171; Tue, 20
 Sep 2022 17:33:06 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:32:00 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-12-seanjc@google.com>
Subject: [PATCH v4 11/12] KVM: mips, x86: do not rely on KVM_REQ_UNHALT
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
X-CRM114-CacheID: sfid-20220921_013312_980304_D885BF4A 
X-CRM114-Status: GOOD (  10.85  )
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

From: Paolo Bonzini <pbonzini@redhat.com>

KVM_REQ_UNHALT is a weird request that simply reports the value of
kvm_arch_vcpu_runnable() on exit from kvm_vcpu_halt().  Only
MIPS and x86 are looking at it, the others just clear it.  Check
the state of the vCPU directly so that the request is handled
as a nop on all architectures.

No functional change intended, except for corner cases where an
event arrive immediately after a signal become pending or after
another similar host-side event.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/emulate.c | 7 +++----
 arch/x86/kvm/x86.c      | 9 ++++++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index b494d8d39290..1d7c56defe93 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -955,13 +955,12 @@ enum emulation_result kvm_mips_emul_wait(struct kvm_vcpu *vcpu)
 		kvm_vcpu_halt(vcpu);
 
 		/*
-		 * We we are runnable, then definitely go off to user space to
+		 * We are runnable, then definitely go off to user space to
 		 * check if any I/O interrupts are pending.
 		 */
-		if (kvm_check_request(KVM_REQ_UNHALT, vcpu)) {
-			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		if (kvm_arch_vcpu_runnable(vcpu))
 			vcpu->run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
-		}
 	}
 
 	return EMULATE_DONE;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8aeacbc2bff9..8b1ff7e91ecb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10811,7 +10811,14 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 		if (hv_timer)
 			kvm_lapic_switch_to_hv_timer(vcpu);
 
-		if (!kvm_check_request(KVM_REQ_UNHALT, vcpu))
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+
+		/*
+		 * If the vCPU is not runnable, a signal or another host event
+		 * of some kind is pending; service it without changing the
+		 * vCPU's activity state.
+		 */
+		if (!kvm_arch_vcpu_runnable(vcpu))
 			return 1;
 	}
 
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
