Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B113C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63BF6611C3
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63BF6611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ix4zB9z8A1wdPfsgdPILwoXbn9wzDNSMxJiSs5jeEo=; b=vIRjkpVSzDZmBA
	2fDWW7MhUR2DPuIEu0eL5ReqpMHQ3FsR+KjZbIDkFPBpvsdLcbop+tRf9i0cgVEQIj+LmqzWA6Y11
	xb8Bv9m9a4U5wyvH+BmtgPpdBXozd7NbgDEONfPSIB+zDepQ52BNfFI7Ms9kp6qDK9VDbSFO3La1t
	1aPLhu0b2TfyUM8TxixC7mkr/PWjNrvzp7cvrCbVKfYr177M21kv5We7N2e8ZZ5g8hOgNMpqsvsrt
	RUwa5yzusxII7jr3zq25PiU826REsOSAnO+lun1PqpvpE8UmUZSJD59EupaqaPNsVC/jFJv9+B1rf
	uuTdrQcZfQS6pKTlkqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQfn-007Fqz-AB; Thu, 04 Nov 2021 00:32:07 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQa7-007CeO-6G
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id
 q2-20020a170902dac200b001422673d86fso1025056plx.20
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=8x8y6LCkLptxfKHX5+pDaTNp73wBECOiN1YdxqMK+rA=;
 b=Kwf8l4ALLidbOCnsA8IZb7EGVbQY2I/GyIc70v/xPgAN2uNZmJzzLzZJfwAX2uOOCO
 bOK9U8USa/+T5EGJ5WM+xo1wGM21VgQud3S9i76kNITLTzwA0wNdnUr/fJDAgqhSvhap
 Yw0ASqeY//wjIN0mhEQ3qwyRthBADSpw3C4ZFZ4+KorPOGjjv9GHHalj2Z0JVLcN7rKX
 1aJXnhddEMDTeyAz0wqrWJZzkxWK24hOVug2NjMIF6/CfNf9YTCoQnGyCXWnO5Qwes4j
 g5HbrauvOLkXEcvWsWbG0nodw7IIljy/H4UiUpBEQUah5lbLSlwy7/6wMiTLEuWxciTS
 tAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=8x8y6LCkLptxfKHX5+pDaTNp73wBECOiN1YdxqMK+rA=;
 b=uK0twivr7kFKeci4gkvbHtCRHsQ5RQ+k6IdvxXvng9r3sHAl9wL55NTMwEMLvlJE7C
 QkVOIM3U+7waEZkE+k/UkTXguoim+8kNx7HcYeOCnjqYNTmIZM4umn5x4GeSu9iGpr2W
 W5tBDL8GkWwata/hEgj2JkwWdLUgfVOl45Ege2VM6no/fbasv9FGjNKxvbI8NnqGu3Ik
 i3a5pia3PUROs7lAW3ZMoimvmoaIeo5u/aJPFxSzsOfJ/NKYJjnhv1gAzmXOHMmttzgB
 dj/zZykgUT9M3laPjOIhp/6aymi/ZARkV3v2HjbwYEb2kV+31WGSo8jt/FP+430NJJ6w
 nUbw==
X-Gm-Message-State: AOAM532us1j8qO0xIRma00M/0zEhk2yem9PT74W9CkR+KVGGum5vjQAJ
 wToI/H9OG9QJLVGcxun49t9jaJEcOig=
X-Google-Smtp-Source: ABdhPJxsJ29Wj32AtuAm6joDY8iQebT4Rnu7/phTa+MfeSdX22KfADwkK1eYIPGppvLFyQSyOgzQ6GfE4Fg=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr261308pjh.1.1635985573544; Wed, 03 Nov 2021 17:26:13 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:10 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-10-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 09/30] KVM: MIPS: Drop pr_debug from memslot commit to
 avoid using "mem"
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
 linux-kernel@vger.kernel.org, Ben Gardon <bgardon@google.com>, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_172615_306603_49F4DE53 
X-CRM114-Status: GOOD (  10.35  )
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

Remove an old (circa 2012) kvm_debug from kvm_arch_commit_memory_region()
to print basic information when committing a memslot change.  The primary
motivation for removing the kvm_debug is to avoid using @mem, the user
memory region, so that said param can be removed.

Alternatively, the debug message could be converted to use @new, but that
would require synthesizing select state to play nice with the DELETED
case, which will pass NULL for @new in the future.  And there's no
argument to be had for dumping generic information in an arch callback,
i.e. if there's a good reason for the debug message, then it belongs in
common KVM code where all architectures can benefit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 8c94cd4093af..b7aa8fa4a5fb 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -249,10 +249,6 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 {
 	int needs_flush;
 
-	kvm_debug("%s: kvm: %p slot: %d, GPA: %llx, size: %llx, QVA: %llx\n",
-		  __func__, kvm, mem->slot, mem->guest_phys_addr,
-		  mem->memory_size, mem->userspace_addr);
-
 	/*
 	 * If dirty page logging is enabled, write protect all pages in the slot
 	 * ready for dirty logging.
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
