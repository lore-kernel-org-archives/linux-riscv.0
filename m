Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65885C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE8060F5E
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DE8060F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzSbNQy3oDOxP1yHw279ffl8RnFDE66uaHIby4i/638=; b=DUItwduqx0/i8M
	95bSywl6q4EXs+L96cMNO/8nU/fbi8PNUySI5/Ig3She5M//tK9cmh3qjCimjB3z8RMzJDyeFzCRB
	UFZBnP5tJs/OBAzrsdUabPSVbaXOlgyO5s2gWqDPyyeWHUkZuuo6GfrBwPEbuiXejaStJo/ug9QmQ
	ObrbNdDsgC5Xhh931bA5Zsn2G+HQPbGaMUUWYaIOwvvWhPXXefKq1ivCmJk2x2bTB+B+IKRrHwNqN
	PNwD6U55TJPOKXbIdQValNlMRdnrC6XPjU8GHqvclYBxMlyAG65aU3ac6KlSQWJHUK0bs0RdQUqE1
	FtXWT8aF+BbeAV0VFvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1sw-004V3C-0S; Sat, 09 Oct 2021 02:14:50 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1r0-004Tnr-Q2
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:12:53 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 f8-20020a2585480000b02905937897e3daso15197330ybn.2
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=VOf0o+drOoyjtnZHAjwPMyY2QgjmuejeI8ZGvk5qQh8=;
 b=c594JBXBzlzJm/B4MJiuak37F10cOGqzZRDRYYkHvGtg+tYhi9bkpT7HAvzA4a7CrO
 wY9eJk+8SXC6VXSYxm/HtIH7HCqw4WmraTlKbDvDXkb0ieGHnQEdhLp9SHTOoF1D+ihb
 l0NC5UfvB9mBvn0GShFPrhMJGBfjxpiBY5BrX5s0xEdDxmIpWuxZBBx29TlMmh0JGg0R
 lof8oMgaYbwVizPYN+9qQPXHfvL56RO9ccLyp7IYNiT8OQ7d02343dCZy83nOSQGhHOM
 xfDcm3J7v9Zaqb3Cv7KhQ0mVfu7vqET/6w/svCdKYDLPxqzAsRNGhLifWQMr9xoyFcPL
 LUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=VOf0o+drOoyjtnZHAjwPMyY2QgjmuejeI8ZGvk5qQh8=;
 b=2K4yQGyUVvw8TclpiDUeI5DTH2Nsbvn1PXLwcThUKYUVKSNd5JEwkeUoXyJClk/rY8
 CbG2SMbumC9lYnygBycFmiugouNTA9Tc2bvi3vQWSKI6sKGk28u6rdagubxd726rE1EZ
 UugI585TSomKofbJbvNOZfHgdcDKmcy6AXk3jNjwjGD/BP7ncvi3cCT8c3BEtNGCEtiJ
 4sECUZ8/E340pG11EyLgKiSDMEpTjz2HdJcf1NIhLas8FEsrHJLF1d4iAjY6Bz3goOXt
 3cNQQS75n+OrpStkM9wXlS/kkEEGq31nfbm44Utcg7xhre4bGWLaVkS7xHbQSazzobBy
 g11A==
X-Gm-Message-State: AOAM533xd6EwEEaiSWXT6BTCS+UkPnjmQgRsA0SIrThdLu/t83wxCfos
 qX0+UjBoQVkOmR2ldelKn9h5I0hAunc=
X-Google-Smtp-Source: ABdhPJzvUj+lYxE1uvv63+XvvDPeheCH+oyqg89jaLQyiP8PVpc/MK53zetbWHLCR1OXSf8DRfROgUDiyR0=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:d915:: with SMTP id
 q21mr7203996ybg.17.1633745569082; 
 Fri, 08 Oct 2021 19:12:49 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:11:56 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-4-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 03/43] KVM: s390: Ensure kvm_arch_no_poll() is read once
 when blocking vCPU
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
X-CRM114-CacheID: sfid-20211008_191250_891093_54ACBD5D 
X-CRM114-Status: GOOD (  13.03  )
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

Wrap s390's halt_poll_max_steal with READ_ONCE and snapshot the result of
kvm_arch_no_poll() in kvm_vcpu_block() to avoid a mostly-theoretical,
largely benign bug on s390 where the result of kvm_arch_no_poll() could
change due to userspace modifying halt_poll_max_steal while the vCPU is
blocking.  The bug is largely benign as it will either cause KVM to skip
updating halt-polling times (no_poll toggles false=>true) or to update
halt-polling times with a slightly flawed block_ns.

Note, READ_ONCE is unnecessary in the current code, add it in case the
arch hook is ever inlined, and to provide a hint that userspace can
change the param at will.

Fixes: 8b905d28ee17 ("KVM: s390: provide kvm_arch_no_poll function")
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 2 +-
 virt/kvm/kvm_main.c      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 6a6dd5e1daf6..7cabe6778b1b 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3446,7 +3446,7 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 {
 	/* do not poll with more than halt_poll_max_steal percent of steal time */
 	if (S390_lowcore.avg_steal_timer * 100 / (TICK_USEC << 12) >=
-	    halt_poll_max_steal) {
+	    READ_ONCE(halt_poll_max_steal)) {
 		vcpu->stat.halt_no_poll_steal++;
 		return true;
 	}
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 3f6d450355f0..7bc38549487e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3213,6 +3213,7 @@ update_halt_poll_stats(struct kvm_vcpu *vcpu, u64 poll_ns, bool waited)
  */
 void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 {
+	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
 	ktime_t start, cur, poll_end;
 	bool waited = false;
 	u64 block_ns;
@@ -3220,7 +3221,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_blocking(vcpu);
 
 	start = cur = poll_end = ktime_get();
-	if (vcpu->halt_poll_ns && !kvm_arch_no_poll(vcpu)) {
+	if (vcpu->halt_poll_ns && halt_poll_allowed) {
 		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
 
 		++vcpu->stat.generic.halt_attempted_poll;
@@ -3275,7 +3276,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	update_halt_poll_stats(
 		vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
 
-	if (!kvm_arch_no_poll(vcpu)) {
+	if (halt_poll_allowed) {
 		if (!vcpu_valid_wakeup(vcpu)) {
 			shrink_halt_poll_ns(vcpu);
 		} else if (vcpu->kvm->max_halt_poll_ns) {
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
