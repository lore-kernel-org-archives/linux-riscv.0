Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537ECC77B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VbwfL4JXDrp5CHlkZTSfcysNU/Q8iMSIju7eW3gTeI=; b=YOzpDlB4XFnUAP
	IfRF7td/zuPGYt532lwu9i0VhmNyYumgJC0vVhMkBtm6EIFvHG03D0UDz9sfBs7RPkq25ptZypiL+
	wBua5uI2q8Gu0Fi4P7OjGA7+owGn9EapvXvyy9IoudWvS+LGIv+61LzcVT6S61dWyTA6w5Z9nfik5
	Y21lbQZG+RYZoZDkJBdVrVavCUKqBk3JvD0t0hDOEi7kAOxnL7WSFNUODNmF7z3oWYiXgBQauDKc3
	UGPooHk01xbB9KtFG3VvyR693ZvO991JbR9V5yxfa1URm5KY9kIwGhTzYbcJkHfwB7JkSkJqK3h0N
	rQnuiFbQApdtxIAtgmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHG3-006eTF-2f;
	Wed, 19 Apr 2023 23:30:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7M-006Sp1-25
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:17:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1a6862e47b1so5504105ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942656; x=1684534656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ+Q1EB8U9VN9DkQE/7ZRwGYKH2CHxTB2A2ZNISqIdY=;
        b=M7pMYKMh2fzPlQxiN+Er+1mRXb5xsvVBR/kCf0Xc6I4eRmeu17ZWxN3F+8Uh4bOfYt
         pLsryNkeitFt3/g2LwdIO4gRgf1eK0d0zd3qJJmJH0/Ytd9PXb2f4ZIv2vw9qF7rcmT+
         +/5fNVmr7py0CepFxvid91vQee8LTDJ1trxwVh1r+SZa6D1ybCiNK5WtQpwcXBYzwzon
         14Dk5NjS3zvhDHWUiYkgfDVG/0CawxYwCekaOcRjbz+KKATicit8f2wKNBE+FUv2M2pL
         VFRS7BwOkXZ7Z6aFPV2U5r0uWlcE+ptOAW8XtsMKVeJj+vK+/KtMoB1U0hUKE2I995ZX
         1ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942656; x=1684534656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ+Q1EB8U9VN9DkQE/7ZRwGYKH2CHxTB2A2ZNISqIdY=;
        b=Og8s4o7DjQIySgTmzS7bF7gtj751ZxnETypH6OtWbDxKpFUaexSUK8zQXx9cOahnSO
         aR6uJzA0iu4JH3hGwTqoxws60X8sPcURep3pj08Du/fnldi2jMU2IRxpdzWL0N36RxNv
         bTcuUDoc/dt2kWGn/B/B/9XRGnzAZ3Tpi/zASB/HJbA/CmYTmMcGdu3OcWNaVFsXVCtu
         AnlilCuaxUju4g57a/W2ugWK2xq925g5U6pOITwWPar1j0srgh835viLw6VCwMpBcywA
         s+ymbL4v8Y77Ku8sPtuumw9om/FJH/VMHTCWsOq8iQXQpB6cKKYh/8KMlhKBhXflwskd
         TwDQ==
X-Gm-Message-State: AAQBX9c7r7WkSThZcbHDTk9m96MjO+QHe630eSfWp8yPVpy+L7lUtB78
	T3av84p41P6wlrxA5v8Y6Itimg==
X-Google-Smtp-Source: AKy350ZJUiSSYrDjl7yi3RGe7KkMi+TjKSL1H9rjEJIsWoSyzpH0Qljb3g4DlHLMrKbT1BFQ8UiTyA==
X-Received: by 2002:a17:902:6bc1:b0:1a6:81fc:b585 with SMTP id m1-20020a1709026bc100b001a681fcb585mr6201339plt.41.1681942656169;
        Wed, 19 Apr 2023 15:17:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:35 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 03/48] RISC-V: KVM: Invoke aia_update with preempt disabled/irq enabled
Date: Wed, 19 Apr 2023 15:16:31 -0700
Message-Id: <20230419221716.3603068-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151736_682795_C017E692 
X-CRM114-Status: GOOD (  10.81  )
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

Some of the aia_update operations required to invoke IPIs that
needs interrupts to be enabled. Currently, entire aia_update
is being called from irqs disabled context while only preemption
disable is necessary.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e65852d..c53bf98 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1247,15 +1247,16 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		kvm_riscv_check_vcpu_requests(vcpu);
 
-		local_irq_disable();
-
 		/* Update AIA HW state before entering guest */
+		preempt_disable();
 		ret = kvm_riscv_vcpu_aia_update(vcpu);
 		if (ret <= 0) {
-			local_irq_enable();
+			preempt_enable();
 			continue;
 		}
+		preempt_enable();
 
+		local_irq_disable();
 		/*
 		 * Ensure we set mode to IN_GUEST_MODE after we disable
 		 * interrupts and before the final VCPU requests check.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
