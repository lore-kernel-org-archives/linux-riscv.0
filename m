Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCF2C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 03:02:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C51560FC1
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 03:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C51560FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wGw9A1xf7zN5F3trhpJbVsXxzHByYtAplYQD3pvk7Y=; b=fViA+y11G4RCjK
	9vaA/k/1ghFySFEeQ3X67xhRMS4GSsIDQ0/iRyC4PZ2trLPdU+Fg5ue01h/kPTNuZVnmUy5diEDwE
	zo7yeIDO8x2fRvFkQeOvaGqcBTRT+i4tprbLgvwiap9V7DPntIV7lTFZ4vFTYs5Dj+1QOG/z9zFva
	uWm6AvTKCc+z4TzkvAZbP1qvTLZPqgmb5H5HWEfFN+HNb9FvzsY4QqPkKSeBZn0c04wYrSSybQlDE
	tiggLiyV59Hl0lJ0Ido8D5SjuwBkAxCGL8Dm3MSu2lvPeKT2Tg8+EI+2j5faew6EWerKSUujYjkGk
	xQPXO9RVo/FmkoOMjdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2d0-004nYl-Dx; Sat, 09 Oct 2021 03:02:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1sb-004Utq-FW
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:14:31 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 b197-20020a2534ce000000b005b71a4e189eso15172602yba.5
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=DNh7SHjv27CkTpVQ6UDQfpazfFfU/7m49a7OyCmxJ04=;
 b=OmBEyvgBxrWmm+DnEXtUY5SGJEDJ8rfSRexcZ/sLohcuuuU8wRBxtkVvWgAcEXTtDu
 CSHWkz3NrHAP8CQWDZPjwrNyXQv8t3ZVqtgnkJTeroV4I4ofTpUhF08tAgeFlhHpdjz5
 DSzs4995JQ4bvC8+hT2zhEZx03XMTSTWwaAlUhES+GMR0I/ltEGK03OtIT6xjHVnTBjL
 MK1iAMhumx1HDCHEN7Q0/UoppdBB6U1GwAdJ4EO2l1vq2DEjW94MHM8qR3/RmALo617b
 gz6KYIdYwOM9rgqP7AeVSQ/Il0lIODnMHAbfZnMNEpK7JCaMpNzkLfJZPqdAxx+LfqzC
 +uFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=DNh7SHjv27CkTpVQ6UDQfpazfFfU/7m49a7OyCmxJ04=;
 b=YZtoFGNUXwwb/1uGP6H62oav0nJFAAp4QA0/JfrMRC/j8tee4nlEPRte4CqQuzn/Rm
 HtLknq9QsI3FaFBmsEIOXBB4TOfLasup8/qHQdMQS2ZJt7eCM51r3PWlXWF3NrJfDN49
 ftpuLFYw7ia9qOmGNVfshaIuBpzFuCs/yLem9nH8yM4twYircufct2pjoJLZaXhQkLl2
 X7c8hU1/YFddEA71D3tvWf0IlLZ5kr6wcKeftSyUpwhgaI6unF1L5Je+g2JIJVoaUNCT
 zRsiy0IrCDqYNjYD7nI8AVmAxQVc1S9dsThtlWL+k7Rqd4xPR7EAnFle5v9qnEj/RXTv
 GFCA==
X-Gm-Message-State: AOAM533Uk3L7PRWjlFy+uMyN7yalkswB9yU90NFKvJ7VfpMj0oHU4BkU
 9xD8Pa2St4bZvi4oaJQ1fHJ9V4TTQ3c=
X-Google-Smtp-Source: ABdhPJwFBTWTsWfiioDi0mhoc4HC7I+aMeFu459xFpIEzn2YdCstAMDsfKMjJFSfY3skCf0Gp9GZ4fuQR4M=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:77d6:: with SMTP id
 s205mr6993283ybc.529.1633745667357; 
 Fri, 08 Oct 2021 19:14:27 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:36 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-44-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 43/43] KVM: VMX: Don't do full kick when handling posted
 interrupt wakeup
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
X-CRM114-CacheID: sfid-20211008_191429_557282_AD87B401 
X-CRM114-Status: GOOD (  10.14  )
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

When waking vCPUs in the posted interrupt wakeup handling, do exactly
that and no more.  There is no need to kick the vCPU as the wakeup
handler just need to get the vCPU task running, and if it's in the guest
then it's definitely running.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index f1bcf8c32b6d..06eb9c950760 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -192,7 +192,7 @@ void pi_wakeup_handler(void)
 			    pi_wakeup_list) {
 
 		if (pi_test_on(&vmx->pi_desc))
-			kvm_vcpu_kick(&vmx->vcpu);
+			kvm_vcpu_wake_up(&vmx->vcpu);
 	}
 	spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
 }
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
