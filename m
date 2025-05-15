Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D0C3ABDD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 23:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XbtH1tBsXZtTVX9vIzLNNq/WndM/+y7k3HPkqanuCaU=; b=DydBpXugBuUd3D
	J13dCZp6L4N/1p7G3nKufKkWhYJ7BkSs8aQJhCX7sjcwD92a/ODYE/cGqdYNiRKDIRLuYBJ3yO9t+
	anyVRUYGf5lgZSmPobeXEU6qhkbpdu/7NxTuVOvlN5RGDEA/uXn6GIjNsFLd0g07yimJ84lGIyXVj
	RUUOY4qRUce+yY1R6I7i7GhotAnY2H9jqGxbxnEqqza8rRWAgmyni56SJ2yycUCQt+osREcjNVvZX
	ODRJBhvjDKY3r8s/RG4H8vic8RxgInMvT/SZpRKNoEHIhb8KI9Ky17CGdbOcfJyL2xO54Su3hadSE
	TTDXuG3wNJdlLHOYz0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFhjc-000000022bz-2B5W;
	Thu, 15 May 2025 23:11:28 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFhjZ-000000022bB-07hH
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 23:11:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-30e57a37294so1186806a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 16:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747350684; x=1747955484; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWXRh7r2vJxZ/1lbG9aXXgAmYeOBerYG9mBks7QssNI=;
        b=1ROOnr0wrOFiI1mvbEvKzX/IHJZMe/nFLCGRu870ggGGV5H9EgJBF84z4JyqzD+yGw
         CTvLTOqBxKpmPr3QPVA1Yi/+Xv1rkEG98SlfxuMAXZ7vAv0y/g5Ie6J8jU2WI8UgH4pg
         V8Upge4SKbZfvrzgoYVjwcM9wB22mGNh4S8xS3xRK3/hbrGtM+G1XVThImui3VkG+szh
         +0/08BXLZuI63tENNmWztezvyZ6ZOAqK+Av0XXYm3MqMyNPcWP+uoWYyY1fVnszJSoTw
         k0OJUrQoSRgZYO2wtodDHkvO0HkQKBC9UHAtUA3b4/cbU2AAGtuPudU/A32ACJ4L2SW8
         a0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747350684; x=1747955484;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWXRh7r2vJxZ/1lbG9aXXgAmYeOBerYG9mBks7QssNI=;
        b=ocxMCiRQ0TVcsbLbWYRCC3b08iRom0uo+BEtVdohQSwGEmiaipGFJEJT8Pu67xCjoG
         50AVENx40RcFRSzTlbhituW1QkyobGvrk/O6QWzikQEfIh5Ihq3bG0vXdP2W4aUN7ORu
         j+ZnxzB6M4zzuAOd8pQGoyxIucXMhLA4z3ai0MFP+zN4YC+mhQdZG2jNr4r4luUdJG3E
         vdTe3Eu0uT/2IrYlYaoCK/gLB+fmC3qAP5dVwacboXTIIt+FSLyJ3m79dBl0Di04KUk9
         uamyNXNMec96pRb0sIo1E/ub/iFbO6cHL8099SetcCyglbTi838r87qrhDoeAWYbO3qq
         EJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5wI3iN4Q9YOCnV8dOFMvPEaUvnn8VFzvynZmoopG9fWHpmBt2pbivtPwgsLB6VP6ue0x1ZE6jToaAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKdBes1eLzgRHLHtPt7/jvO5xTXmv3EB8c8zuk6ZNrda1LhldL
	kCgpEb/tGs8C0orCPPgkkl5t4MhyF6fyme6u3HonABi5sGUwabhTVwxW9amBuMKDMEM=
X-Gm-Gg: ASbGncsIcMUEyvkK3mj+PmxEgPyuCI1MP8csN/RhUJADQB+r2G+w7ZGXbRe2GDRbueQ
	UH6r1KEtf0Dc75d9cZUbl1npMgNh/afTAFDpgV1pSpVTBB61XB1ILj5GRK7tMFlDFRlQcVGqnRY
	w3M6H++k9ar2135zJacTwrorwcMHql4PpKYW44oqpQa4npoY7+DsWNp5OpL+EPgUIWS+xXLSUGf
	AkleTFsvfU8nLucPBe1n0cGFeyLyKtO0RRUA2ezuEjhMV+ttDm7CQQyKoXgZNC2B7zLybhUxjsO
	FY3mWMee9qFTty5SZKKiPbYB9Tt6+Sih9bftqrTt3YYN6BPy1Xu5O2Zhxh+HNdjLjQFxHlVWltI
	=
X-Google-Smtp-Source: AGHT+IGAW4cvTanI5pu+NrHheJagZj7AR+lLIMA5PpkVtQFo51HmALe79lqxHvRdT0WW08MROjTyIQ==
X-Received: by 2002:a17:90b:548f:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30e830c50a5mr457868a91.2.1747350683748;
        Thu, 15 May 2025 16:11:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d46f4bfsm406016a91.5.2025.05.15.16.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 16:11:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 15 May 2025 16:11:18 -0700
Subject: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
MIME-Version: 1.0
Message-Id: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAJV0JmgC/33NzQ7CIAzA8VdZOIsZEPbhyfcwZpmluB4EA5NoF
 t5dtpMxxuO/aX9dWMRAGNmhWljARJG8K6F2FYNpdFfkZEozWUtda6G4pecQwT/cjAHdkCK3xnS
 N1BraS8vK3T1gWdrM07n0RHH24bW9SGKd/tOS4IKDsFqOtlfQ9sdAyUdysAd/YyuY5CeifyGyI
 MKazkDd9Aq7LyTn/Aa1I//2+gAAAA==
X-Change-ID: 20250513-fix_scounteren_vs-fdd86255c7b7
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_161125_173057_4AE7739E 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Scounteren CSR controls the direct access the hpmcounters and cycle/
instret/time from the userspace. It's the supervisor's responsibility
to set it up correctly for it's user space. They hypervisor doesn't
need to decide the policy on behalf of the supervisor.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v3:
- Removed the redundant declaration 
- Link to v2: https://lore.kernel.org/r/20250515-fix_scounteren_vs-v2-1-1fd8dc0693e8@rivosinc.com

Changes in v2:
- Remove the scounteren initialization instead of just setting the TM bit. 
- Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com
---
 arch/riscv/kvm/vcpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..9bfaae9a11ea 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -111,7 +111,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
 	int rc;
 	struct kvm_cpu_context *cntx;
-	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
 
 	spin_lock_init(&vcpu->arch.mp_state_lock);
 
@@ -146,9 +145,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
 
-	/* By default, make CY, TM, and IR counters accessible in VU mode */
-	reset_csr->scounteren = 0x7;
-
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
 

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
