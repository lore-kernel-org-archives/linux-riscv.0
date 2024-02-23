Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E2FC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRCl51tMi5ZUPsclStGAorr0xEw2EY/Tq0HIjdzrP4E=; b=SXRKVxBtY+h/j8
	YwHd2oWltDU/scIs3JRbtb1sT5BVD4Czj93cF/PAN4U1YU6S1meJV4F1F0RZXPfnZctkwvfMbdZUx
	yxlhSGNR410vQB6mjzTo0984+RK0a6oWVPJKnpGTWkIx2WFAHPrYpGmANi86weP70NUe8OqkoJ9p6
	jDM10JjkrCBAVWUGDpT2N9UPO4J5T02Qq5LUUpTSe9f9c2wyCYzOxzROrvNCdHl/vwD4Rwrp+s6Io
	/DL3zeAnfDkPoK/bcZ4KbmbUt1i5oKtpqE3Xbc9QtyHegSclRQNANmUaZjU94N6ee2fs7yAliD64/
	F7ffQA1Xun6pldnIT88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJh8-00000007Ezb-3eZc;
	Fri, 23 Feb 2024 00:45:43 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJel-00000007Dt3-1m1M
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:18 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5dcab65d604so242262a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708648993; x=1709253793; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VHEHpfFT3fq5ZUYVbA7KHyxL3TWLbo6jAAmdD67Ha7M=;
        b=teEwxduQ15sV93Z4ZY6Tc3Ghh9OoepNcbNmbKOv4UG/IGAj7FBQy0e3vvuIHiaPHmP
         hwEN6pDz7BwbmMrV/x7i4nhDfL+aDGagFUhHqGb0B/Zmx/kDOdm2sN2AuT7fReE17a8P
         UVPBvhWSlFRtX1S02ZDMhY2khEfxwWh4QIyrEQh9+ieSQeHBVtNY8lz3adL2FoBmP1JS
         ZhNKsRthwOW0uIQ1JTYTJdGspy5sAS5jMup5sgEo58DWwCnM6zE4sD0987YHwZjfJ/cG
         uSloqfAP9dJo6fo0HUxKcbL5DYt1zakCAAHL28wYNb7Vg3TUWspeENCQJSLnYckItXCt
         72Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708648993; x=1709253793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHEHpfFT3fq5ZUYVbA7KHyxL3TWLbo6jAAmdD67Ha7M=;
        b=JQDgeIoRbKMMLowkq00XrwOuXdlrOASAwmGHT1auvBHSDcXtDniuiBHbPfoKJSkVmv
         yVIfY+TPoswuRoPJBQ8oFZoTdby5H00KGOeHNBYeDcO3QtvrRE1fnMC++hyu3lJONgPU
         7y0GE04VszOxDX0/dB0CuocIRVMGE1/jJ8ACefhbqJ3+mulh+vy7OZ7ZeLaNXCCZMfsk
         u42tFInRI5tcWKYZPweOjvi+D5XBCvy2fZhUdlK9BHHYiODFKNqlO27TTHboOf8vHdNS
         KTWx2r/nBE2Mj1HHt2VSvO9Z5T4f/BugMuU99VPRgNsVNbqcazUBqQk89yAwgsRY57k+
         NpZA==
X-Forwarded-Encrypted: i=1; AJvYcCXxSdyDTGxsf+210EpBPs7RAWP/qPWZR3Cf5WqMUOE+Qk0ZsF8Ud6PC/Y4EhcvAiiZlqsrkh2S0XlWu1GQdU0PrMGVln7U7/okhs293B0MN
X-Gm-Message-State: AOJu0YyutzfDI5yuSFMLRcM6CR6TMKnNqqQFbqNYqHpjp/vA+ihg+MfP
	FonVmHpf8rwYRz9dLk2BBeAKpb8NbCK6+2TTBRsKBLtlFK1C9TkoBa+UnvcB6atcMepsWB934rL
	9Dg==
X-Google-Smtp-Source: AGHT+IHOzHa69AmDUbZ+OQC4gdWd8eKNcA+4/Rl+KkHknT13uIbfHPqOmsB/BAUR4nyvpq5uPcFzKjJ/Uj0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6d14:0:b0:5cd:9ea4:c99 with SMTP id
 bf20-20020a656d14000000b005cd9ea40c99mr900pgb.6.1708648993312; Thu, 22 Feb
 2024 16:43:13 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:53 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-7-seanjc@google.com>
Subject: [PATCH v9 06/11] KVM: selftests: Explicitly ucall pool from shared memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_164315_681186_7C0EF92E 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

From: Peter Gonda <pgonda@google.com>

Allocate the common ucall pool using vm_vaddr_alloc_shared() so that the
ucall structures will be placed in shared (unencrypted) memory for VMs
with support for protected (encrypted) memory, e.g. x86's SEV.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/ucall_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 816a3fa109bf..f5af65a41c29 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -29,7 +29,8 @@ void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 	vm_vaddr_t vaddr;
 	int i;
 
-	vaddr = __vm_vaddr_alloc(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR, MEM_REGION_DATA);
+	vaddr = vm_vaddr_alloc_shared(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR,
+				      MEM_REGION_DATA);
 	hdr = (struct ucall_header *)addr_gva2hva(vm, vaddr);
 	memset(hdr, 0, sizeof(*hdr));
 
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
