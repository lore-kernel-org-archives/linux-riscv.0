Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD77C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECfJAUZJyQmMFH3kknrtwIRC1Ks9cKbyFpMtJT592Vw=; b=hSy9M0WXJpTtY3
	fuD+jrk/qvqG5ZESTVrYW+zXzTwx/a5lBXia+UxTKuL8sKn3i0Rdd0zs7E3TG4GIKQiTmxY5wliio
	HTJrnFQJD62wkMmtL1xq1iqnNLlSj02IdCNnRnjrhdN1+ylNS0iImuyIHUQ8cAvfmYV5mCVkxG1HB
	BIdKfJ1cs61m1Zi35ZqFph7GuTYyu/wMDetSzJ96gAl5m0T4PNhLvRf9pdyRcAuFRdTyCaCV4hR0g
	6qAFpwr7JbrmxvrKmYSjxmZkpfqoIFzc4mLQKhHdrVIucFYcQY6Ei+DLJ0+kntEKyFMZvaPwTeUbE
	4fZ/K4sbmc0H4pcfrQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqB1-00000003BL7-3PzR;
	Fri, 19 Jul 2024 16:09:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAx-00000003BGf-0tNd
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc49c1f3e5so20231855ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405383; x=1722010183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQYdxy4I3d97ZA3Gu7a5XPpIu9ZgexRW3zods61Iwf0=;
        b=kyTMKjgonwD+SEKwnLYHxuF21VyH8AqwwQV95UDLQXONWaxnDRE8suwkiH28TQupDP
         4GP2cv1RH2X3fjqMGK29a85Ed361F2njy2C7iAt65bGxqASplPOgHD/hPVzQKuWp+OUR
         p4KGZ/whRNgf7OL3yhMizKdmWb2M6BAq3NHfKf3Urp1M/vhERBwmparQSH04dv77TMv6
         J8L3TEtpEKJNioQWuhRLWVkUshFGtQay71vL/hDqW/cz5x5oHFdP2V1ERSdnxcJJRfHU
         FUJ11mzSD+4eWCJVNggj1gsgOa+/z2/pREAJ/QxjBrghKga2cCeeQQZ3bwMUdbpWhnWa
         fb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405383; x=1722010183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQYdxy4I3d97ZA3Gu7a5XPpIu9ZgexRW3zods61Iwf0=;
        b=wU6c5BZM5nhgKn4CYnXTHcpuyq53QKeH3W3Dobtb35aRLnQg/Z5twpGpk39A7WaKgM
         h5UDkxKPc0vjUPonN6no+WQ/7080BjjEWCeElrGQ8MRxXm5YRKAfUAivkUOpgPyzaV3b
         rlBR2x6wf2uTBCyK8gSpJMUElPuKYflmv7ulGbk11ugosnIbiHOnJ/7+lzDLYrvHx/j/
         KSaxEk2jFt95e6HolVwzThMcp8WqvUA7lqXM5UZhkjtaZ9Uo4iJ0kgogc0K3TbWm1GHB
         FQ3oukk7NE87PzfUjBxLIN/xeGKTzrJKeWJ72KEKoFi2hvZ+d5Zr1f9l+oGA1cKiZW0p
         vjlA==
X-Forwarded-Encrypted: i=1; AJvYcCV6aZTuYLhUClvY7zbbgnIbdyPLrFCoWpdZCKUV92yRk7zl6GtoO6psFQZ+GmocpTcBfLHN9aYrBRsuYW/tLjy23CcllrqDFN22oExA6MFO
X-Gm-Message-State: AOJu0YzBjfMxf1ytWRHvBgz+MYjJr6APTYxonzoVgxcxE1ERMt3E9Hcj
	At2FSjuUIQ7kYjJSz3UK1Gsu5WpLvJLMLdZFtF30gMNRpTrgP0O3F9ka71tsY0E=
X-Google-Smtp-Source: AGHT+IFcQ7KahPwLVADQu0Jr4SJQkcqdSHgky/PzW7byERWwoXyqIuaKO5JrsOXY2Zp2DqwfDtDsyQ==
X-Received: by 2002:a17:903:41d1:b0:1fb:4d84:f461 with SMTP id d9443c01a7336-1fd745f626cmr3062385ad.37.1721405382435;
        Fri, 19 Jul 2024 09:09:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 05/13] RISC-V: KVM: Replace aia_set_hvictl() with aia_hvictl_value()
Date: Fri, 19 Jul 2024 21:39:05 +0530
Message-Id: <20240719160913.342027-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090943_288875_7B072404 
X-CRM114-Status: GOOD (  10.84  )
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

The aia_set_hvictl() internally writes the HVICTL CSR which makes
it difficult optimize the CSR write using SBI NACL extension for
kvm_riscv_vcpu_aia_update_hvip() function so replace aia_set_hvictl()
with new aia_hvictl_value() which only computes the HVICTL value.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/aia.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 2967d305c442..17ae4a7c0e94 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -51,7 +51,7 @@ static int aia_find_hgei(struct kvm_vcpu *owner)
 	return hgei;
 }
 
-static void aia_set_hvictl(bool ext_irq_pending)
+static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
 {
 	unsigned long hvictl;
 
@@ -62,7 +62,7 @@ static void aia_set_hvictl(bool ext_irq_pending)
 
 	hvictl = (IRQ_S_EXT << HVICTL_IID_SHIFT) & HVICTL_IID;
 	hvictl |= ext_irq_pending;
-	csr_write(CSR_HVICTL, hvictl);
+	return hvictl;
 }
 
 #ifdef CONFIG_32BIT
@@ -130,7 +130,7 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
 #endif
-	aia_set_hvictl(!!(csr->hvip & BIT(IRQ_VS_EXT)));
+	csr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
 }
 
 void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
@@ -536,7 +536,7 @@ void kvm_riscv_aia_enable(void)
 	if (!kvm_riscv_aia_available())
 		return;
 
-	aia_set_hvictl(false);
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
 #ifdef CONFIG_32BIT
@@ -572,7 +572,7 @@ void kvm_riscv_aia_disable(void)
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
 	disable_percpu_irq(hgei_parent_irq);
 
-	aia_set_hvictl(false);
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
