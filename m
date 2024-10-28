Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03EFD13570
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdDYJK+HGiRHZiU3tDh6SK8HNAXHx3ggmtwiq6dt8uY=; b=tl3m7DcYFT7ENP
	ghaH7MIkchxcWGTWexdimI4/zPElV0kWE8uN/bwYEb06sP5dSX/jBjWzL8sfVCTa+J7hR2beWijWs
	sHSvPK7KkzhABs3oDvkxwB/B3BwtwgYM9lfK7HKTO1c33fREqTM2r+hwHJCeE+ZKkYlfhSik7wEFe
	hR/E8VmEzkej3YuMvTvkeARkTGCHEt16yL4Keukf1iRZQR+rZZN+D4C+GFFXbfZpNlokywsoUYfZ0
	xmzkCif+SPN8AH4S6BZIfqgyqeGw99OzdQe3gdXb5LCZCjvNyvzinTqnJO+EfHqYz+Lg7tLrLprUz
	ikQYUJYM5F+sfDGlNj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NMw-0000000ATNK-19X6;
	Mon, 28 Oct 2024 10:53:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NMZ-0000000ATG3-2VQC;
	Mon, 28 Oct 2024 10:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vRGwCr3IGkDKI3RnHxpJ1UKIsZSuFi+n/eEswoZg4Xo=; b=NV9fdJOlpARawUGTb8UJTG+fhu
	V+eaIeKENlUTwL82OMPReJFPQWQlIiLpFT8gHDzrVFCe2cp8pwx3IzAZDhDQ4pnkvfa54nPyubueo
	94h6Kyz/zX4ra/I0jVuFO1q77FZfzfkg+UAITV3CQMyGr4q3KQMDUAh0Im3O0HotlT16Q45iJKSdQ
	wlmIbbpF4Kh9oeb3yXkLVsiWK23R2TIPrfAA3Y+DieNwBQa8mlOaD5wW5HHSdZbkXVliSlDDozsCt
	HAm0DUXcLyoRRiX1Yd7oOoXp/ngaMEl7ewldVCW/yJjbdOjQRXL0eBJz6xilmIVfStUzjJOsRstFg
	nNP587hg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NMW-00000009dCo-1u0w;
	Mon, 28 Oct 2024 10:52:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2B635C5897;
	Mon, 28 Oct 2024 10:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB641C4CEE8;
	Mon, 28 Oct 2024 10:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112755;
	bh=WsmI98TsusQUwfMNedKTmmiRisXjnAxc/6P2yiG/5eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLyYkOdAinI7M2L/O01ps4z89DYjQQ6yr9i8TPuwCe/5K93W1nRrlC3z0CgvEMS1X
	 CQQBNR0e5X3CgIW0JR1uUxH6JXDs/FCmmHMRIPHx7yPPlRh8PaZlqVoFz+DAEwk0cV
	 cWWuKaypO81OMkzBzovd6Aoz2nfD8Na1oHpB2B0NNFYSvypqJkqiWR4ao0PBGz4YdQ
	 uyKH1t7Ec0A4LCLBPw8G9GEiBl+FdfqdEV7n2KhTVg86e2GRiF5lvWGO5Bm74cwPF0
	 +GppQOWtmF65FmOsq+s4bCls4pDNcs81b7843tT4qbe6uBIjMuFZm/BgsJBKh0Lh7d
	 VMirTp+XZWJKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Cyan Yang <cyan.yang@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 08/15] RISCV: KVM: use raw_spinlock for critical section in imsic
Date: Mon, 28 Oct 2024 06:52:04 -0400
Message-ID: <20241028105218.3559888-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105218.3559888-1-sashal@kernel.org>
References: <20241028105218.3559888-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.58
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_105240_932319_4A818804 
X-CRM114-Status: GOOD (  10.21  )
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

From: Cyan Yang <cyan.yang@sifive.com>

[ Upstream commit 3ec4350d4efb5ccb6bd0e11d9cf7f2be4f47297d ]

For the external interrupt updating procedure in imsic, there was a
spinlock to protect it already. But since it should not be preempted in
any cases, we should turn to use raw_spinlock to prevent any preemption
in case PREEMPT_RT was enabled.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Message-ID: <20240919160126.44487-1-cyan.yang@sifive.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kvm/aia_imsic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e808723a85f1b..c1585444f856e 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -55,7 +55,7 @@ struct imsic {
 	/* IMSIC SW-file */
 	struct imsic_mrif *swfile;
 	phys_addr_t swfile_pa;
-	spinlock_t swfile_extirq_lock;
+	raw_spinlock_t swfile_extirq_lock;
 };
 
 #define imsic_vs_csr_read(__c)			\
@@ -622,7 +622,7 @@ static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
 	 * interruptions between reading topei and updating pending status.
 	 */
 
-	spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
+	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
 
 	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
 	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
@@ -630,7 +630,7 @@ static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
 	else
 		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
 
-	spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
 }
 
 static void imsic_swfile_read(struct kvm_vcpu *vcpu, bool clear,
@@ -1051,7 +1051,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 	}
 	imsic->swfile = page_to_virt(swfile_page);
 	imsic->swfile_pa = page_to_phys(swfile_page);
-	spin_lock_init(&imsic->swfile_extirq_lock);
+	raw_spin_lock_init(&imsic->swfile_extirq_lock);
 
 	/* Setup IO device */
 	kvm_iodevice_init(&imsic->iodev, &imsic_iodoev_ops);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
