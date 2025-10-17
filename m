Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE10CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Poi8pKgFWDTM0M+R4H1zBLuLo6IHTLeSh+k6FUrtuJc=; b=YD13gbSD9Fsp5R
	RyT1x/X5mk5vT+8G1t5kEff6a6dQIUs1aPqeT34b/FaGpV0A5j1vHAKwc+ZTmjxoeQc6Xfnwjn1rr
	Xoox4RUxZXUNsNXBHFaFdo8yLMp29UbE4KJ7b1teOZz0WqMsoNLgkiYobzZiUkstIJ9PNaV69PlA+
	/68ks3+BLk/SLo+Se8AfY+/kn3w3Wdzl3AkIA2bHbimgc7Us/byQerUFqYCJIa2xjtQwZ+1iKqjK6
	nkXwk3zh4a70OU/yAFTHJvuKot9nGCYmiBG9aXUs805K81fzWNie6xb2dUKi28EaR2VU9AwWAmqXW
	I1Ktnfb53gixz4FOzBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQt-00000006FlR-0f5Y;
	Fri, 17 Oct 2025 00:34:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPj-00000006Dn4-3fAu
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=; b=Vv8eo6R/1ctZPhrTSeLOs67462
	fVJyG8sOGqjINkL9bI6PA+eC1Q/aKQbk00xGUBQdbvOD6yiQRyabhxZHtS5PWM0wBHBCwm90r3kP1
	x9hvkuUCkYH6QNV2011j3V+cY8T2IUfVY520okHQgDSd8qYpPcM524X4Y386eENpQ4xoamd0xyCnp
	00fPYsH+oLGQLhMaGo1hgHIOiBuhxfMkok/q1C98KmpjNXj+Qe76e/t3Gkr2aVt3WG4eq9aQnEupz
	o5dKZzRqfvmGiEhlVfB8SBUB9n0aDFqMZ3xMzBZJlEBexWg8nEU+Fh2DQFIyPiT16mV+c1b8Dycoi
	A+21D98A==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPZ-0000000FiLU-2nB6
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:46 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befbbaso1594016a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661208; x=1761266008; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=Bp4PDPO5QCGT5svkgnOy6GN3J+r3dhyWTR+KZgt0yDOSEo1JVbFqYyFPwWK2v8Nz7R
         jwdwkvGtlBsSKTQ/+DlBytLbmkcdDE73v/C6GFfhXsVZmX/ntNRdyMJjFSs6S7DCewYZ
         Xlwzot6UpxCrtEKd7G29nyIhMfpLEiCPkCUj6dQLzePV9qmdTIaNDIGSD0mV6GAJmQ/h
         dLmcgA618zN+BY/8q+nmDVcIKszKDFzSg8FQZ+hMkyrjKTfmQ3nXVhCsEbFUP8YTv2NR
         SY02rrSx/fZtudv8tgj0ptiUM/+eQLHj1MfZ5LN9MDlx86edjuq17n8EwiBa8JJW0s7L
         Nosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661208; x=1761266008;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=mwK9aaocJys7VhzIql9U5pkmJrXdZFysT1/rxd6C4LQfiuJ8q3F+lLSe2ZUiaiUeJp
         YTQF4dT9AuBR6b7Xx2se8uGF1h8etML+EkBXvBfOdtwY3Nl2EyAOqFdcVgU6it9giJNx
         tOHSFQKm07f9acXJcGNaRCe9a7lB/0XQ0kEv6XQexguKcJT0zDGsKOuFibctJ99Kywax
         i4jS47oLETJ1P9978jDDdYRsY9eDeGpmA1w9qu1Odzhihr/7Z1uSleA6QV5qyBW34x0J
         fBj9V2U9ziWp4BOCpi3+IK8Isx8c2WY4GzvigUkM1DMRUEQwmfZlcYWOxSi9HW/31HQp
         ksfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfC1kfN4IXP5RRgNAqtkhn0hbsd7Zz9dsdOduaKUGpI86H23n1SALloiZKSwhcox0TJa+7unjrFLXdpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySGqfos/SIVCoo74axiUbHsBFHjqebR/9UYjbvXQDBUkBVBhls
	1U0USN1f1zMHP89XwG8sg0dZR4De2NA6JYfze0BgfMRPBqZC3iuk626+VWD+psqzijaKDNZnJMd
	s9+iK1Q==
X-Google-Smtp-Source: AGHT+IHg17I+MrCPzq5TEoO4O1fEv/5Rea+bFeeHOFAKW3+uW2v4jsY6m0H6q4wWDO+YA+zfXcJHtbyRmvo=
X-Received: from pjot19.prod.google.com ([2002:a17:90a:9513:b0:323:25d2:22db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c7:b0:335:2747:a9b3
 with SMTP id 98e67ed59e1d1-33bcf90e717mr1807890a91.32.1760661208480; Thu, 16
 Oct 2025 17:33:28 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:41 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-24-seanjc@google.com>
Subject: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013338_977714_26D0EDE9 
X-CRM114-Status: UNSURE (   6.92  )
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

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1de5f17a7989..84b5fe654c99 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2781,7 +2781,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2794,15 +2794,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.0.858.gf9c4a03a3a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
