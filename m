Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4102C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 06:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RlNhsTlqXNV1r4PdpyEahdHfze9hgruourU3cSYAlTM=; b=orTvMp+nsMgrhs
	XARrVDKWax3YVU5Fag7FyYQeZcYdrqsqRz1IXED36nJw/mLuLNlmTjz62WZi4ORY/+Xv040Dau/Tc
	S7Eb6oaJntFkBq8+3CpkU9+2jFaEu/JwWqH/gGGCiHr8c+VL9XAWaTvxgaVcy57YbGUa8UZn9hhR6
	WEliNOdZWgRWmhhkMVH7D+ME35aTmtfQDHgOUCobVU96BxfP5OtPHsyRjtw2HgsKp9rf1+XjTdFpo
	YkmUeorDEx+Re+iuw8wD1v+lou6iD5NX8bgg4gNgdMxmA6JmpyFFHulutnXK/qPE/NMxF2XR9bC7S
	kuQ/8EAW2PMaeMGS0KmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIXe-00DkdZ-1Y;
	Wed, 13 Dec 2023 06:16:22 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIXb-00Dkbb-1i
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 06:16:21 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6d9e756cf32so4224193a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 22:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702448176; x=1703052976; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvNv5wfHF4xhsTtKWQpkLRjgdWBIUIRMHOfm0nTFkAs=;
        b=Wk2Uq6VBY2A8B0nf3ArX/x2+Ff0VAe0wHsN+9kqb+6AnnTaRehPv2PZEcHXlFlQVSE
         2ONgY+rFd9KupCiBARopZkb7EwwLOkcducjWzl0mYQOc/PQxPtY9YszM9zF0aeTBW74e
         jHYqrHSrlyqiUV/HGnVODdClCjJOOB0I1GWEbsWoybZ/yJxoGB1A402RcMFDRwR7z+HQ
         Y9x76LcNe6KJcKeoK7KNuIQ/kKlIO4ODM5Lj0pVGp0DL/YVRcJm7h76DVApxGPDPxmc7
         vY6A9ejWlK+8LbqhykWZJVTHGwRNFaRe/IEPYlNUNd/oPjRNIhECKoi9Qq4nuQJd+wvX
         VuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702448176; x=1703052976;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvNv5wfHF4xhsTtKWQpkLRjgdWBIUIRMHOfm0nTFkAs=;
        b=oRT+ueGhDzswI4womeDVdh1H/waysvfB5raid4clC9iRB3koMJXXwjlOOZJo+8aW5e
         KAfdDPrajxhlpYy/DsIgShHA9pBeWqFMcwmuwhM8XEM673yYa4VO/Tv8l0ngXsS5g3JN
         m8tYuJeaVpCavc9sq3nAV8Qh9fYP05v0upZjowTi1oSJWE786Lew5Qu33NrXS+8k47gG
         uJrQu6rD1qdWaEhSQ3rxG4Y2AwnqpnH047CKp+/nL+xNDJbIO9rc0CIwoj7l9PJ55Fw0
         ES5eNjC04vYiE+MVebnVxFOX66U2+5somFBdqks0m2xIyAP/vPZKb3/TUXLaDY/K9oU2
         VpNw==
X-Gm-Message-State: AOJu0YzZXIgvbt6CHgBoHhQ6kGOUSZjSe264ukh0kd+9AIzgxVtevOYL
	qzsHpGEIBYRUABfURKfX6M06vlUg8YQ/A/mamNvawgr1XdJ8oPDbdgKRRp5XiyTJ2l7V+sYlcIn
	3CXqc9EY2A0TB13ml7HhD1GZF/7ZHHrL6exKdbiaXn4yyzmgkK5kWqdCDDcDSc2gkMNDu6Tiya4
	pTo+JlU3CPJPZWAKzpok7n8FQ=
X-Google-Smtp-Source: AGHT+IGagDM0nKL4ki3x1mUmX8Sb5HGZKw8UWtPHqF+o2WY74k963vboMKd1J30RZCv1Lb6uCLOblA==
X-Received: by 2002:a05:6808:1385:b0:3b8:45cf:9b2 with SMTP id c5-20020a056808138500b003b845cf09b2mr9139581oiw.20.1702448175749;
        Tue, 12 Dec 2023 22:16:15 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm7731076pgp.94.2023.12.12.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 22:16:14 -0800 (PST)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] RISCV: KVM: update external interrupt atomically for IMSIC swfile
Date: Wed, 13 Dec 2023 06:16:09 +0000
Message-Id: <20231213061610.11100-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_221619_624642_1A8CBD72 
X-CRM114-Status: GOOD (  16.46  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The emulated IMSIC update the external interrupt pending depending on the
value of eidelivery and topei. It might lose an interrupt when it is
interrupted before setting the new value to the pending status.

For example, when VCPU0 sends an IPI to VCPU1 via IMSIC:

VCPU0                           VCPU1

                                CSRSWAP topei = 0
                                The VCPU1 has claimed all the external
                                interrupt in its interrupt handler.

                                topei of VCPU1's IMSIC = 0

set pending in VCPU1's IMSIC

topei of VCPU1' IMSIC = 1

set the external interrupt
pending of VCPU1

                                clear the external interrupt pending
                                of VCPU1

When the VCPU1 switches back to VS mode, it exits the interrupt handler
because the result of CSRSWAP topei is 0. If there are no other external
interrupts injected into the VCPU1's IMSIC, VCPU1 will never know this
pending interrupt unless it initiative read the topei.

If the interruption occurs between updating interrupt pending in IMSIC
and updating external interrupt pending of VCPU, it will not cause a
problem. Suppose that the VCPU1 clears the IPI pending in IMSIC right
after VCPU0 sets the pending, the external interrupt pending of VCPU1
will not be set because the topei is 0. But when the VCPU1 goes back to
VS mode, the pending IPI will be reported by the CSRSWAP topei, it will
not lose this interrupt.

So we only need to make the external interrupt updating procedure as a
critical section to avoid the problem.

Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Tested-by: Roy Lin <roy.lin@sifive.com>
Tested-by: Wayling Chen <wayling.chen@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
Changelog
v2:
- rename the variable and add a short comment in the code
---
 arch/riscv/kvm/aia_imsic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 6cf23b8adb71..e808723a85f1 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -55,6 +55,7 @@ struct imsic {
 	/* IMSIC SW-file */
 	struct imsic_mrif *swfile;
 	phys_addr_t swfile_pa;
+	spinlock_t swfile_extirq_lock;
 };
 
 #define imsic_vs_csr_read(__c)			\
@@ -613,12 +614,23 @@ static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
 {
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
 	struct imsic_mrif *mrif = imsic->swfile;
+	unsigned long flags;
+
+	/*
+	 * The critical section is necessary during external interrupt
+	 * updates to avoid the risk of losing interrupts due to potential
+	 * interruptions between reading topei and updating pending status.
+	 */
+
+	spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
 
 	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
 	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
 		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
 	else
 		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
+
+	spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
 }
 
 static void imsic_swfile_read(struct kvm_vcpu *vcpu, bool clear,
@@ -1039,6 +1051,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	}
 	imsic->swfile = page_to_virt(swfile_page);
 	imsic->swfile_pa = page_to_phys(swfile_page);
+	spin_lock_init(&imsic->swfile_extirq_lock);
 
 	/* Setup IO device */
 	kvm_iodevice_init(&imsic->iodev, &imsic_iodoev_ops);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
