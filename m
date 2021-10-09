Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D571CC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A488560F51
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A488560F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AeeqVRn6m54jvnB8PVxyfvy3UN+24Rjybu9AgaV16I=; b=XlVb75Ukbdph2q
	kTNMCDAK5R7BK+twdEHvypUKExPjkLl+hQmLb7bjGPdLhStZ5WuwEBnddJBjf8z+c8/kofkVdumoW
	8oTlY4cRczumFqMciSycCSRUGtPce/ShjjguaeMBA44y8JOzGD10ayie4iTDWAJRF2mqC29RvSJps
	lit6Pav+bU2gIEf5uXc6zOPYA5lU06E0RvgZY11sumHWuP3ivm4CPD8pUKp45Wb+PyH2minEfX5mZ
	CwvTcLaN+K9tCETJDJOFKmhJmi7zwSYJ8PquZ/nrjxaYGI/9vgOSju8oLHDN58CZgLcMaXV1a9eUN
	mEDTv041G/jsFEFp3NYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1tZ-004VPe-Lw; Sat, 09 Oct 2021 02:15:29 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1r5-004TqZ-PR
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:12:57 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 x15-20020a056902102f00b005ba71cd7dbfso4952719ybt.8
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=OSahwrCOM8hvTCjGSN0bryGWa8lO1ktrkgbUtpkiWTU=;
 b=M5Nnc+p8tzrX3sNy50+q4rLjDSCqSRYtbN8NDtIMtL5lz0M1RLPaDK9QbmYeZ771j6
 iFkLbm77/+6Yc0cSHxabd0QyOohOgtVklZfs3Cn2dN0a1ZwfX67QbT1JAQNLhjpc4+uO
 vi9O60Ie3T48wyOT5Z4Gu0fSaeBm6K+RcT5Zaus4zoWDP/z2bfzcS0MRP6qrM18VmvI1
 q2TtwZL4vCj4M6FLDBiRgBUXmYKIdxYeZUm1TBqJ6arSG1KgtQu+aFJsGYHUTkfjGQof
 tTaWlTLEfPIrKFJvjF0monIrG5PmtaBKUx6Tf3cXwYd6T3mEDwvkPUW8UU30Bw8nBP9y
 0gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=OSahwrCOM8hvTCjGSN0bryGWa8lO1ktrkgbUtpkiWTU=;
 b=6mb0AYwEAatio3CRQRd+TDxPpOxkQ+WqLTX7fFwTXy7E/UaFscTjm+BFski5w0UCWY
 djrR3XjuVq9/+W5/8zf2nsZknwWgKVYPEmfDKbUO3gijeLXokLBCc9xwoFWFNkTuiBNp
 xF8x9QmZaKtkZDiTdvWvdK2jeUgXuBmj1WEHuMMPp4/n07IgKTm3gTUQyRNG9ZGrrNX7
 2mtN+sp6C5/5EJ609r5pJdj9W2Q3Z1dZ7A9yBf/BDYeBaEhP4c/RyJ82smSvuuhM4mla
 McGQ4LmFuAbxJNYEAFy+aCv6fbEzVRCvX+ibzRTjDUAEjdlAkOkV/AzILuEhh0WsBtqm
 gbTA==
X-Gm-Message-State: AOAM530QFzZYIhzgI2Xfc2TsJwCTVdNFR8CbOTxc9w413L4JmJPPONv8
 La6QDe0HbhJi9qQkuC4oEzvVi2zvuwE=
X-Google-Smtp-Source: ABdhPJx08F+X6N2reeGnFXth9S6Ys93QnEjCYVn+7HtsQKARH+T/4QlHmLInc1/XQW7XkZX+0RcLTuK00A4=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a05:6902:124e:: with SMTP id
 t14mr2047183ybu.221.1633745574354; Fri, 08 Oct 2021 19:12:54 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:11:58 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-6-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 05/43] KVM: Update halt-polling stats if and only if
 halt-polling was attempted
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
X-CRM114-CacheID: sfid-20211008_191255_857033_FEB6C51E 
X-CRM114-Status: GOOD (  10.30  )
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

Don't update halt-polling stats if halt-polling wasn't attempted.  This
is a nop as @poll_ns is guaranteed to be '0' (poll_end == start), but it
will allow a future patch to move the histogram stats into the helper to
resolve a discrepancy in what is considered a "successful" halt-poll.

No functional change intended.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5d4a90032277..6156719bcbbc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3217,6 +3217,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 {
 	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
+	bool do_halt_poll = halt_poll_allowed && vcpu->halt_poll_ns;
 	ktime_t start, cur, poll_end;
 	bool waited = false;
 	u64 block_ns;
@@ -3224,7 +3225,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_blocking(vcpu);
 
 	start = cur = poll_end = ktime_get();
-	if (vcpu->halt_poll_ns && halt_poll_allowed) {
+	if (do_halt_poll) {
 		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
 
 		++vcpu->stat.generic.halt_attempted_poll;
@@ -3276,8 +3277,9 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_unblocking(vcpu);
 	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
 
-	update_halt_poll_stats(
-		vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
+	if (do_halt_poll)
+		update_halt_poll_stats(
+			vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
 
 	if (halt_poll_allowed) {
 		if (!vcpu_valid_wakeup(vcpu)) {
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
