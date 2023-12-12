Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542BDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 05:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MTdp6WHSN6FA0Ybcm2+I6WyoAedCA1auE5Szr8Omz0s=; b=rMIsqf4oKVChIr
	8AbvnEhUtmKIEy/ofG3tEKihK80ZjIH64bC4F9ir5KqeHRi+crJyf5nk15YVsFoHYkSBbgCK6JUb+
	6rmn2asuM48zXOhX/PbyverBPfd/sg3V5cfbImTU4uKbMfAPxYNRilkgC6Aol4ybq8y/tppjRB765
	HrrqsQMfzJihexEHbR+TNONi9lMzhktp+B4zO6n3M+2syIBvIvUrh+3VLWi/lCTeajiLrWWA7H1my
	D09s3JoCD7lgvC9ojQ2E1EJENiImxTFj8/1tYTwZm9dWVp3z2A9r5osdElNr6Pn/Mhj4xxA+z3ASj
	PpQXAbeSN0z8KYZxQMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvQG-00Ane9-2T;
	Tue, 12 Dec 2023 05:35:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvQE-00And9-04
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 05:35:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d0b2752dc6so46232825ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 21:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702359308; x=1702964108; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcj60ICAmx2Wgj1m3BhaBwMoYIl3KbsB3eCSbSy5S74=;
        b=jbjvpg1F8+kBfilGsj5D8opwGK/soyDyRXyPSQpxulqEjxUm7pWhGVrrjudcOAFU2H
         eLEqaFHOXCgcoTBdncoAqs6YrVe1d0vguxec558gNTRsmeIBJ06xBt9V/hSBktnj/DcS
         /NFi1rYWrGtxoPwvR/B+Gspzt7NkmDLlWcr8JbXmgcvdsahQOm5xhlmrZM3QAU/gvGU9
         Z50V5mHnQP8YmHILuL5LM79u8j4twH/1noUIQKZKiFCIoZxqrQsT7VO9Am08jAFlpZk8
         D/1I/8/YfF/IEi3LwMgrBhJZUySA2UfmGhGz4ITTcWO88JgiKrjVScWygmpwoiQr/viE
         ZX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359308; x=1702964108;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcj60ICAmx2Wgj1m3BhaBwMoYIl3KbsB3eCSbSy5S74=;
        b=Ntxy76bgvnC292fak7ZYZ8QETj/p4PLa7TbM/WrNPLtQlgoKwqa+r/UAd7QKGhZBeo
         wLqEIi7r3UyPelXTz9B/VXMsT7IxeHfYD5RAAE5HE8DIjg/aLcNr2T9E2gku3MQcECuX
         EHiNCHUjQRL0x+vuAATXNcyFzloUaT0vBw95/qoCOrpypOWHS6nVUiCSyuvYvHWkAGvB
         GlFOWQA+MtR/zMja5gNTE3tjzgycOhe2SqQjMltKddNjxcfqDGdgL4JZqKHCnP9orbgM
         0nQVURPH7enPccIhgVeC8dtIv3QO4vvx/FbzXYBCNjAUw6ydpv1FqgSCpWw12oEY6xTL
         COiw==
X-Gm-Message-State: AOJu0YzgVojctZI885yqN2Cv4SDqEg/UBfCx+CpKyF+RD5TDUwkkci2I
	AuxtXPWLGnUvENKQcJZ7lgyc9oL2v5e7P3lqwJE0MHOLiUYXm42QffxokRqVoQeZd1YHJh6hp+r
	L4uhVO/e8SnHJcqRAlfNiD4nAi1EvPfeNVAcH5deFxhqXyNIUmRF7yknXqjrgrY0xNE96G09XyJ
	oDKAv2LjzwMZ6zA83tfC8pVlg=
X-Google-Smtp-Source: AGHT+IH+0SEHIrmD1lG9gKpeJV/gu+68+6vQQUc6qbNwDMzT/HchEiI83Pj9+Ajy1EiiaZ5i2c6GhQ==
X-Received: by 2002:a17:902:eb88:b0:1d0:6ffd:9e37 with SMTP id q8-20020a170902eb8800b001d06ffd9e37mr6217232plg.137.1702359308075;
        Mon, 11 Dec 2023 21:35:08 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l15-20020a170903244f00b001cf5654fc29sm7654118pls.72.2023.12.11.21.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:35:07 -0800 (PST)
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
Subject: [PATCH 1/1] RISCV: KVM: should not be interrupted when update the external interrupt pending
Date: Tue, 12 Dec 2023 05:34:59 +0000
Message-Id: <20231212053501.12054-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_213510_088094_9BB70CCA 
X-CRM114-Status: GOOD (  16.07  )
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

Tested-by: Roy Lin <roy.lin@sifive.com>
Tested-by: Wayling Chen <wayling.chen@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/aia_imsic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 6cf23b8adb71..0278aa0ca16a 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -37,6 +37,8 @@ struct imsic {
 	u32 nr_eix;
 	u32 nr_hw_eix;
 
+	spinlock_t extirq_update_lock;
+
 	/*
 	 * At any point in time, the register state is in
 	 * one of the following places:
@@ -613,12 +615,17 @@ static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
 {
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
 	struct imsic_mrif *mrif = imsic->swfile;
+	unsigned long flags;
+
+	spin_lock_irqsave(&imsic->extirq_update_lock, flags);
 
 	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
 	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
 		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
 	else
 		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
+
+	spin_unlock_irqrestore(&imsic->extirq_update_lock, flags);
 }
 
 static void imsic_swfile_read(struct kvm_vcpu *vcpu, bool clear,
@@ -1029,6 +1036,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	imsic->nr_eix = BITS_TO_U64(imsic->nr_msis);
 	imsic->nr_hw_eix = BITS_TO_U64(kvm_riscv_aia_max_ids);
 	imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
+	spin_lock_init(&imsic->extirq_update_lock);
 
 	/* Setup IMSIC SW-file */
 	swfile_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
