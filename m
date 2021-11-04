Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B45C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0546560230
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 00:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0546560230
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzQCdfRfE22qyoaVL/eSKzxayMm820rTc6PCgW7ac9Q=; b=onAEXXOnJN5NCW
	u1orLkTqaP5UDDmsi6oKdo6jMsn70uk26T4iqrBU8AUo3biVVlmGUF3lAKGGQeto1DgTehqXQXlM8
	7njO/FHZp3yyQAMZ13S4GF1JQ/cb+9Er6shkBka9L8VA640goOz+mNxhvaAdigOaEBJaRS9ysMgf4
	dSjqUZDy4DngKsHj+7rJm6pZjDgaWesFtETDtDVp0BZu2CEjJaycSnC6F3e+dScG6YCeZltcN9KEB
	Fed6xvND2lkd9SxPfP/U4bR4mUxUDi9zJZpAk94RpEZVhaDx8DqdIBMF8iQ4KNUFMr9aBsqtNFXED
	A+ECfOCRdoC4bDwVMRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQat-007D95-EN; Thu, 04 Nov 2021 00:27:03 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQZu-007CWa-QS
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 00:26:05 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 c2-20020a63d5020000b029023ae853b72cso2357574pgg.18
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 17:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=YU3JQHoEXhNYeqTaFGElIxIrX+lTdkV7tmvn1pNhx20=;
 b=nzIiCi8a3FdUTPNh7ytN/z1OZHuDUfxPkVLwkX7a0tH3K3c1YU/GUrVbVsUKogWulg
 8TV0o+lCCtBLbDlyn4CdD1ZyDyGmDuKpEashuorjvvAytB9Fha6Xh4GdoRmbK2lCIj46
 yaw8bm9yIsgJfAeOZzVP5kZxJzf5HvyCshSjBFStaw+bzKBcK6bPZX6ZcbGAXqRyq2X0
 r24cJ2J/KvfMuDyi9skDCmfAMeR4jILYlAAhpoLRq8XhdUkbVLo1pJ78Onj43zLqECqm
 BUFjMpHQOpmAXdYIVQtZSEVPXFkfrUmNQanymXLbwXrV/MiRmrChRqGkV2fOUirqVkRC
 KbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=YU3JQHoEXhNYeqTaFGElIxIrX+lTdkV7tmvn1pNhx20=;
 b=7BB7HyvT26YtVUc6vWhywZtkladcebafRONu0AT2J/YOLfl4N7OQ/jchF5jlJPN/L3
 NK9BEaTz7Pl1oFmUvfv2N6SwnyyS0FPwmyRFOhZHxqDuQanXiEAvC+za975bw1d3/QO6
 Og/3XHDGqXAL+tc8hd6f13lc1Y18wR7eGgM/42csyT7FnQ3r4PmIEshPjGawKusVDdkR
 +8TvXZRVeNsN014eMoUUzNbSylPTON0dfwyDziP5SJ3ZCYB7IXVo/enbXcBo3YxFR0HZ
 Ft364aTLgY01OzdVK+WfsEICF06FUG9i9hnj5ku6m4eLmWbqbrV3cUxafggsybStgGiF
 JK+g==
X-Gm-Message-State: AOAM531TFMedqpUtxxl4zASo/3/p0Iyx2js5Z5wzafrAjG7J0uKLwKVt
 J87ZfNMFNy0mYDMI32AHwlPxyRLJp3s=
X-Google-Smtp-Source: ABdhPJweDq2zn2AkOEc4n/Ejh97liBXXjVYy6U4pABPdgYlHkkJl2at3TcV1J/XikSLWHiPxtEuWDooqyFQ=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:16c6:b029:32d:e190:9dd0
 with SMTP
 id l6-20020a056a0016c6b029032de1909dd0mr48630576pfc.70.1635985561569; Wed, 03
 Nov 2021 17:26:01 -0700 (PDT)
Date: Thu,  4 Nov 2021 00:25:03 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-3-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 02/30] KVM: Disallow user memslot with size that exceeds
 "unsigned long"
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
X-CRM114-CacheID: sfid-20211103_172602_890531_157EC517 
X-CRM114-Status: GOOD (  10.38  )
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

Reject userspace memslots whose size exceeds the storage capacity of an
"unsigned long".  KVM's uAPI takes the size as u64 to support large slots
on 64-bit hosts, but does not account for the size being truncated on
32-bit hosts in various flows.  The access_ok() check on the userspace
virtual address in particular casts the size to "unsigned long" and will
check the wrong number of bytes.

KVM doesn't actually support slots whose size doesn't fit in an "unsigned
long", e.g. KVM's internal kvm_memory_slot.npages is an "unsigned long",
not a "u64", and misc arch specific code follows that behavior.

Fixes: fa3d315a4ce2 ("KVM: Validate userspace_addr of memslot when registered")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 99e69375c4c9..83287730389f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1689,7 +1689,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 	id = (u16)mem->slot;
 
 	/* General sanity checks */
-	if (mem->memory_size & (PAGE_SIZE - 1))
+	if ((mem->memory_size & (PAGE_SIZE - 1)) ||
+	    (mem->memory_size != (unsigned long)mem->memory_size))
 		return -EINVAL;
 	if (mem->guest_phys_addr & (PAGE_SIZE - 1))
 		return -EINVAL;
-- 
2.33.1.1089.g2158813163f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
