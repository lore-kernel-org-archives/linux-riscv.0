Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1E2C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC04760F57
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC04760F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyqb9xmGiJiFg2cHvwR8nVGT+/STDVrimpULLgoQoU8=; b=qdJMXrPu49kWas
	cyA1yEedHKE5hYL82ZmPknsxi4pk+XqA0FBkOAnrw0avpgQPpfPM4B00agFs7/SZydvTDr3yxd/U6
	5ZUqpvkEiZEjwS9P2gv7kOgfpmhxN6EEHX7uurH4VziuO0y3Bf1dGl19CcW7AWkHsr+c+4alwxyAC
	ticP4KMxxdFtUfT9eJWeznrJrOJUU+BBV0ily54oBmGhc/FVnoK+MIjAVndlA1NqwQMBdq780j6fJ
	RA+xD7GNkkZzaanvcWuo9AeXVQ8MoL93jBDm/B7c/iILhS7LwVfkzhMRSP0l2XaHv3A5SY08z+F4o
	bHIsAZ0rewLPCoXIYfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1ur-004WA5-Kd; Sat, 09 Oct 2021 02:16:49 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rA-004TtO-U1
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:02 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 t7-20020a258387000000b005b6d7220c79so14964245ybk.16
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=C+i8NrMil/B/zUdg/nLE/M0TZQFBBWIIBWMi/JAr4uc=;
 b=je+n3lLm4A0uVSi9vpvS/05S8oYMXrlHSB6veYJTbVDTpbNd4p8mCzawy0O3YfBv0U
 VkYS1gQyXD+Vhv2MKKEDypDIAmAUZV7+XoKV2GNHaTVHTXEEief1nVbXKyPAlhbnV2Iq
 AgDv18LthCBgw3zhOl5b0oeHGLTEvaCSkl5+xlvQQtEny0Ld/9Zg4+QFyGyrsCI8av18
 DmcjgY9VieQy4PNiTx9Rjpoa5+HAuInKE44ebmh0tt4Cev6vzGuTfdj3Hb7+Xq+pKABX
 ReTheEfMC8DB/Mq2Zd65wAAdUEOkI6Nw5jw5fMSe0n/pdwq1ppMu0LuEVStnZqxTNlvJ
 ADqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=C+i8NrMil/B/zUdg/nLE/M0TZQFBBWIIBWMi/JAr4uc=;
 b=P4cX/cFKt32RvkEmVx5oDqediEIcanVJmRhHfuGFuqfqVB1Ls3XlH8Bd/c2hKVMwBv
 5qCiHqV5I/HEW9lQKIxvuoT3evlhmQGZINOgN636v1JrsOSUPOvMXBSHujzQ3YicbOZ+
 N8II+d/ILlsfuPSu4itP04LCaA6n6+jzlCx/lcTpBIvaxcunj5+wzrD1ovnz/rVCo/Uv
 FuEPiIuVbsdpLAVl9gYzUAu2Ssjne1zL7S+3G/IW1G4kXl858WGy+yTDTBhADQPwkU+m
 T+SBy/oYuNTFB05W8ywemfyuKN5AObVtU+zpmcCtPEGeI/0o+FXh2lQxIRyedXbgya7x
 k9Jg==
X-Gm-Message-State: AOAM532QLKrbOeKjbX0eMK4aDEfrh/tJ37Xy0k7QkZxc8zNLq9FZZx8D
 yWcQtoPJTl4Mmso+tpKZad3NpREaz4k=
X-Google-Smtp-Source: ABdhPJyW87IQPywEIwG24n6yL9o1TEbn2OC7doTlKy4ci1tI1vJZKdBQ5pgX2pnD7h6R4lIJ9DAvEJ8oiwA=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1105:: with SMTP id
 o5mr7903925ybu.518.1633745579491; Fri, 08 Oct 2021 19:12:59 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:00 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-8-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 07/43] KVM: Reconcile discrepancies in halt-polling stats
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
X-CRM114-CacheID: sfid-20211008_191301_030417_05FCB3A5 
X-CRM114-Status: GOOD (  15.80  )
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

Move the halt-polling "success" and histogram stats update into the
dedicated helper to fix a discrepancy where the success/fail "time" stats
consider polling successful so long as the wait is avoided, but the main
"success" and histogram stats consider polling successful if and only if
a wake event was detected by the halt-polling loop.

Move halt_attempted_poll to the helper as well so that all the stats are
updated in a single location.  While it's a bit odd to update the stat
well after the fact, practically speaking there's no meaningful advantage
to updating before polling.

Note, there is a functional change in addition to the success vs. fail
change.  The histogram updates previously called ktime_get() instead of
using "cur".  But that change is desirable as it means all the stats are
now updated with the same polling time, and avoids the extra ktime_get(),
which isn't expensive but isn't free either.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4dfcd736b274..1292c7876d3f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3204,12 +3204,23 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
 static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
 					  ktime_t end, bool success)
 {
+	struct kvm_vcpu_stat_generic *stats = &vcpu->stat.generic;
 	u64 poll_ns = ktime_to_ns(ktime_sub(end, start));
 
-	if (success)
-		vcpu->stat.generic.halt_poll_success_ns += poll_ns;
-	else
-		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
+	++vcpu->stat.generic.halt_attempted_poll;
+
+	if (success) {
+		++vcpu->stat.generic.halt_successful_poll;
+
+		if (!vcpu_valid_wakeup(vcpu))
+			++vcpu->stat.generic.halt_poll_invalid;
+
+		stats->halt_poll_success_ns += poll_ns;
+		KVM_STATS_LOG_HIST_UPDATE(stats->halt_poll_success_hist, poll_ns);
+	} else {
+		stats->halt_poll_fail_ns += poll_ns;
+		KVM_STATS_LOG_HIST_UPDATE(stats->halt_poll_fail_hist, poll_ns);
+	}
 }
 
 /*
@@ -3230,30 +3241,16 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	if (do_halt_poll) {
 		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
 
-		++vcpu->stat.generic.halt_attempted_poll;
 		do {
 			/*
 			 * This sets KVM_REQ_UNHALT if an interrupt
 			 * arrives.
 			 */
-			if (kvm_vcpu_check_block(vcpu) < 0) {
-				++vcpu->stat.generic.halt_successful_poll;
-				if (!vcpu_valid_wakeup(vcpu))
-					++vcpu->stat.generic.halt_poll_invalid;
-
-				KVM_STATS_LOG_HIST_UPDATE(
-				      vcpu->stat.generic.halt_poll_success_hist,
-				      ktime_to_ns(ktime_get()) -
-				      ktime_to_ns(start));
+			if (kvm_vcpu_check_block(vcpu) < 0)
 				goto out;
-			}
 			cpu_relax();
 			poll_end = cur = ktime_get();
 		} while (kvm_vcpu_can_poll(cur, stop));
-
-		KVM_STATS_LOG_HIST_UPDATE(
-				vcpu->stat.generic.halt_poll_fail_hist,
-				ktime_to_ns(ktime_get()) - ktime_to_ns(start));
 	}
 
 
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
