Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27172C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:16:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C9D60FD7
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1C9D60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWQJiekFVv79b6TjUCihLVR+zyGHluhU8kxUIISgxtU=; b=JHdIocKeT+hAIt
	xlNMLIQrWvtxBBkLSGtXss/Vx2EJAZYDGvcdqSiNmEWJVV0/zr7NdBeXlKdR84hwC505FCeXeEmLv
	GxvYpa+mqOeAyJb8e/rZ47ok5FP/6Tz4FjNVAF0BJXiRqlLjksEusLh3DuCVvLPvcQCLY3kWH1Dt1
	TCS3DOwvazjZK+uXBv6IUBuIYgVjKPgY9JzToJ+cNmncCWXUcanlegU9LUBMYytXV7ZvDcDbMYj0o
	YGenhSQLrZ3uW7eb2NMzLIwRVl0Xx+/UuGUNqccZ3VSzdLDhn0SMeLdOHwNYeH9guJ4gWykOpkQYa
	62AnXUZY50MbEl9CWtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ1uF-004Vow-Fm; Sat, 09 Oct 2021 02:16:11 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1r8-004Ts7-OZ
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:00 +0000
Received: by mail-qk1-x749.google.com with SMTP id
 r5-20020a05620a298500b0045dac5fb940so9782723qkp.17
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=duVCxds/Xk54aU09i5UIkyaIUq0yJMQJZI9wZA2YDlA=;
 b=Wv/kcG4ULQxV2PKupeA3o9viF1KOUTbF8+9gkKByWbWPMHCHTm+TZZg7F5whB1kJEv
 00RE4Q8btFY4lrjbmtjP6hVSSAYJJdql8WRFW8k/FQZNMBqfykiFr2BiQA+wfe28C543
 SWlusb4mpYdymW6ZMpaM7mrIbRvVwIrPb/jvum8yisSKEvO7UFeRbl7H6trZAhauAzQD
 a1bpHkCHoYH6NJt8GSDU7cMPxIgXQRKLxIkS2NtUm9+Lov6n2e8PGJQvej1YmfsKCffW
 TihOARLN4ummUTvbvoWa2j+nguD9Os55BuiemMJ8jed6VNGgNVOfE7xoH5rBJNb4aOyN
 lvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=duVCxds/Xk54aU09i5UIkyaIUq0yJMQJZI9wZA2YDlA=;
 b=BjFug/F99RGEb5l0dQCaNv/T3jBO6Y29G9ojea9LJpV4ZcxlTPU6aOqMLReA40ItQS
 MfsHA2JgLFUp/POKGaJOEyryAYMXqEDiv2LMmoHtEJOKpAOmbv6bicd6jaBQ0FiUhBP+
 6jKhaW+LmP95xIUypuh9a83zs67d49+diPD6Ck4E2qUsP8znw89i8egErJd6dwPUZtUi
 qKmY5nez39zlyos2FUZJsRE1qCML0ysLqU3WzHdKrmBTL173WqLhzgWP6gPqLbCDToz7
 g48yo/+FnoKR8FT3yfHNid/fdBR35mbZ5Ne3NttaTzp0g3qwkmoIdrOMumzT3Rs+f6s6
 XG4A==
X-Gm-Message-State: AOAM533Pv7cnGTr9yrjQ7D4PbwwqwgxDf6K7TJPPM1ZKN0BsuoRrW/I1
 rRbEeleO+aH96GjPPGDvIFbpHHxc6mE=
X-Google-Smtp-Source: ABdhPJzReckbemypX4PIoTmT2KiRT9pVyd7dG9YNXxxpVcLBpBPcyP9Rkq3/2bNbj++4tivC2JpyLGM9nrE=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a05:622a:1055:: with SMTP id
 f21mr1892047qte.24.1633745576813; Fri, 08 Oct 2021 19:12:56 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:11:59 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-7-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 06/43] KVM: Refactor and document halt-polling stats update
 helper
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
X-CRM114-CacheID: sfid-20211008_191258_840560_ED948B49 
X-CRM114-Status: GOOD (  13.29  )
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

Add a comment to document that halt-polling is considered successful even
if the polling loop itself didn't detect a wake event, i.e. if a wake
event was detect in the final kvm_vcpu_check_block().  Invert the param
to update helper so that the helper is a dumb function that is "told"
whether or not polling was successful, as opposed to determining success
based on blocking behavior.

Opportunistically tweak the params to the update helper to reduce the
line length for the call site so that it fits on a single line, and so
that the prototype conforms to the more traditional kernel style.

No functional change intended.

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6156719bcbbc..4dfcd736b274 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3201,13 +3201,15 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static inline void
-update_halt_poll_stats(struct kvm_vcpu *vcpu, u64 poll_ns, bool waited)
+static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
+					  ktime_t end, bool success)
 {
-	if (waited)
-		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
-	else
+	u64 poll_ns = ktime_to_ns(ktime_sub(end, start));
+
+	if (success)
 		vcpu->stat.generic.halt_poll_success_ns += poll_ns;
+	else
+		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
 }
 
 /*
@@ -3277,9 +3279,13 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_unblocking(vcpu);
 	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
 
+	/*
+	 * Note, halt-polling is considered successful so long as the vCPU was
+	 * never actually scheduled out, i.e. even if the wake event arrived
+	 * after of the halt-polling loop itself, but before the full wait.
+	 */
 	if (do_halt_poll)
-		update_halt_poll_stats(
-			vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
+		update_halt_poll_stats(vcpu, start, poll_end, !waited);
 
 	if (halt_poll_allowed) {
 		if (!vcpu_valid_wakeup(vcpu)) {
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
