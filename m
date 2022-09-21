Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED6DC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 00:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8BgI6R/ouJXFUiVrCORFLee8vdyLRbMiW5bFo0kK5M=; b=SfGGf4r9tqeHAh
	vwrb62dSPB/TyAYjpjq1PyI9hMOhJmVHWa5REH9+sIOr4Tj8N2A+97wpnaFtKKiLBJ6+tAyduChg0
	rzPhGajGF3Z4UVTO36y0WeLOrLHtUyrTl1oSzUOhT2YjtoulxgQgPnivY5aVS17micCDZH+znaZ1x
	gJQ6B9IItQVRU995YI1ia23F3CceZSIjLTwENI68i4XbcOd0n55rR5sk2E4+lACpK+guuvSz8acY5
	zMtEdRfz8upnTWDrp+hzvQCdvgx/AlEh9O5xzSV8LsdMeWzkZnX1QPHldZVgmOack6z40SxGyfqTv
	7LFkSvuI8UHnlkKanQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanhp-007j37-9l; Wed, 21 Sep 2022 00:35:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanft-007hw3-DW
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 00:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jS6wDbw1pF8Ah0FgPiebKmSPM6cE3vh92J7x5AZxxS8=; b=HXs0kj79ntlVZmyyww+FC0f7Ph
	25ZhiRsmixcaKiZESOf7+5Ud7P+uEshyUvg955nphZT9pr1AWdyMgf4RsduMmZZpOjHT6MuGkRA3m
	DherguIm5vvDJtgwLZCywiIIHm7WlMCCowK6z7p4n7JPot+iyOE71r9ouHmfl0eKW5uj1tMbtxZRR
	E3T3of+iM90MvwjcmPiagOVB6Jqe+BlwYCX2gu4UpTVo3AV9TwrfbZ47BlCSVkWwscxWsU9ubmKLv
	2YFu0O8j3ZwS19m5qYPS05J0n5PYVbvjwQbrPp7dBN5/bNo8fQlCaLQ4CIUwlPKnf09NY8AwgS3kP
	YnfYxXPQ==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oanfl-00ET7P-Cm
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 00:33:08 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-34d188806a8so37816337b3.19
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=jS6wDbw1pF8Ah0FgPiebKmSPM6cE3vh92J7x5AZxxS8=;
        b=BXLnvleOcPw2Y/CP9Ur+TUIGjrRNHf90WKKjZAL9Icsc0hEgdcWSuQ+GHVYb1EUn7B
         sg7UYfZNRpVmJtSJClj570j+DzZOIqw4J10R/J9Yt7QeCVYCKTpKQGufMZPkwcZhkNUl
         3vaoURIDkAnxonLZR0kp8E9GOTPxPNNt2Uho8o+B4y7tM55x9dF6kjtMv6AEMiukUUVr
         9k2MNMpEmt6zvG+nctg/UgWyL5RXO74DdhR2N9XX4q20RL0XpVSV68ufwiv6eT0kEN2P
         i58uBMosfJaPWh3cFlR3V9rNs3L5A+Vc+LFEiAaNl1sbw3jHRaKk/mS0dRmTHm93SlWB
         i4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=jS6wDbw1pF8Ah0FgPiebKmSPM6cE3vh92J7x5AZxxS8=;
        b=ohfgGVwOJ5Vvwbw3zzcJasi1lzwRyRtK6+u3vTYuPYLumVVTi0cSC2LQVI13frByJz
         v9qYHrDbYD57BOQ9ziFg7lb5kBrRRJA8g7DalmoSmfZwW4Uct7peH0Nd3wS9dcOsC6/T
         CG3pdvpAWQ09tN6SzzhK6SSpkCeEY02lFNFj2IkU9yugmu/PdKUXfBoBS7yQI0bLtsZU
         97JxX3kuYTw+6zjxC5T6mXpVrUeD2h1DeOSM9Ckt1fDmLds4NiRd5vDUylbjo2W53CQ0
         lf5YUqdop+4xvbNEehDGcMR5nQDw1KmlfsA2cTtYbDdx3ffiLUL9620GWzCHeFCVFhYM
         tAGA==
X-Gm-Message-State: ACrzQf02tJYcTw0s+JIxqTb6TeyBaxmrdl7eiVESG/3Gl9bwFT2GGX9p
	sPQYEKCq9RqbmiW/L9g1hRbCkB4ON7o=
X-Google-Smtp-Source: AMsMyM4FwFyakAFj4uLb7acHZDkmCOLDogY8I+5AwDxw4BtkzCD4DzOXBcnEDpQ/JYhzAy9RSZ7GSFvqyP0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:81cf:0:b0:6a9:4d0d:5ee6 with SMTP id
 n15-20020a2581cf000000b006a94d0d5ee6mr22583489ybm.153.1663720381243; Tue, 20
 Sep 2022 17:33:01 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:57 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-9-seanjc@google.com>
Subject: [PATCH v4 08/12] KVM: nVMX: Make event request on VMXOFF iff
 INIT/SIPI is pending
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
X-CRM114-CacheID: sfid-20220921_013306_157625_86B5A598 
X-CRM114-Status: GOOD (  10.26  )
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

Explicitly check for a pending INIT/SIPI event when emulating VMXOFF
instead of blindly making an event request.  There's obviously no need
to evaluate events if none are pending.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 5922531f6c52..8f67a9c4a287 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5193,8 +5193,8 @@ static int handle_vmxoff(struct kvm_vcpu *vcpu)
 
 	free_nested(vcpu);
 
-	/* Process a latched INIT during time CPU was in VMX operation */
-	kvm_make_request(KVM_REQ_EVENT, vcpu);
+	if (kvm_apic_has_pending_init_or_sipi(vcpu))
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
 
 	return nested_vmx_succeed(vcpu);
 }
-- 
2.37.3.968.ga6b4b080e4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
