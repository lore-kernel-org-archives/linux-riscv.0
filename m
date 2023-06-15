Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E7CEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44oh/FEG78cm8WIAADms/MHqpZyatPp5O3lFHfJ5v+E=; b=lcjwugVkaDjo4e
	NoU5ooLKIn9QtOO35TLCnX7uh1VqJz8FB92WDzGB8lkRCmsfbmK/43Aoxlyuq4Rmrk4kJzcHu5/gW
	woaROyAeGy2Eos9lNV9hWBSU6TtcJIG2jyyxdkqkhMkZykJqhleQR6AeneQkTwZYzen070Yf1PIHZ
	TRt5p1FtrVBXGZvJdQZOkQBhuRF4KKQAsvszobbsJlhIDOyLPJ11SfNRBGKQkkgpPjFfRjUotEXaC
	i59EYnbiJQ6tiaRm0RMzapsOCROxeCbaVfijn8cN0uHMpVCDvH/YeKgIkTpX8WAqMEH4Rgwdkx3hX
	FoI1SaVQWFaf2fWBCq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUp-00E1Bw-23;
	Thu, 15 Jun 2023 07:34:19 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUm-00E193-0x
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:34:17 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b3db8f3d94so23710915ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686814456; x=1689406456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy2FvnQ7sT+hFfzfZbK6StB7FDfBUwIcnd7vowD7Hdo=;
        b=Nt5IJ9A8Go305vi9k3xNch93gz4wG7hVjY7emu+ejrqDCvtVPNFSMj/ewo8/JK8jKC
         5mTCTUhtatBK9HMGYBEbL1PQ08wnaCe7WXC+hWTgRDBES+tNYHWe/UI821L/gPKf8//x
         0ggc2QMn2Bd4RHfoQL5qR+bIELmGTRAjHA1f5VFO+cJfPiov87zTo4q4rQDv5BaUL2ro
         jgYmzC2oRLN4GydsRhhA5SOMkVWeZxc7z1uIl+FgKR0B0/XjHWmimv0ZNw86j/5Ge3Am
         ir0opF7aLz9gqQJ1q21Vhp/uz/wejAlOt2q/vOSIwYoNQUB29t/JHEHK8W+lT6yaY+fQ
         QJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814456; x=1689406456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy2FvnQ7sT+hFfzfZbK6StB7FDfBUwIcnd7vowD7Hdo=;
        b=bvYGg6XrYp4uca5A3lYhs2908EIGEtt8se5KKxq4HelJ3LZWBwRQh0ie9G36H8Hhb/
         zwxR5gv6O7qU5RIMRNQXg0Q0Q4qCorMNawYgWpvA5gEDaWFRr4it7bCK5MOnDPjlVxsh
         jv6z/31Y2bMaiYFVF2hQFLBFc8Jc/kscr4/7omJ73xFD9FIBjMA5znHlew90sBch5ywE
         C5/UZbGNg4o7CS6Sn0r14GzkjP6Rz+efYTLNDMD7WriJa4kdi+lcqsJAvTOwly0g2NhL
         yc1QWXMXYE01b1Vdlar2PSv7JPm+8juhE//9twn3NCmVTzb4GEcdMW4z4eM31/AIDpCR
         aFaQ==
X-Gm-Message-State: AC+VfDwGEI0tGZOT4FQkX55hnjGGZRyt2JbL+TzIurdi/Q9rUfcxHQdG
	27JguKZx5mkjvtsNnbF5opH6xg==
X-Google-Smtp-Source: ACHHUZ6mHR+PnahYyMyHEriKGo1bZrAuECg7TeZ+DuP6p9ElRRQTkxt63TCxjTz3+MbZztPJbCNo0w==
X-Received: by 2002:a17:903:22c6:b0:1b3:d25a:5ece with SMTP id y6-20020a17090322c600b001b3d25a5ecemr10637846plg.31.1686814455799;
        Thu, 15 Jun 2023 00:34:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b016313b1dsm8049855plb.86.2023.06.15.00.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:34:15 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 04/10] RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
Date: Thu, 15 Jun 2023 13:03:47 +0530
Message-Id: <20230615073353.85435-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615073353.85435-1-apatel@ventanamicro.com>
References: <20230615073353.85435-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003416_333796_F7D72317 
X-CRM114-Status: GOOD (  10.08  )
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

We hard-code the kvm_riscv_aia_nr_hgei to zero until IMSIC HW
guest file support is added in KVM RISC-V.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/aia.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index c78c06d99e39..3f97575707eb 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -408,7 +408,7 @@ int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 
 	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 
-	/* TODO: To be updated later by AIA in-kernel irqchip support */
+	/* TODO: To be updated later by AIA IMSIC HW guest file support */
 	if (hgei_va)
 		*hgei_va = NULL;
 	if (hgei_pa)
@@ -610,6 +610,14 @@ int kvm_riscv_aia_init(void)
 	if (kvm_riscv_aia_nr_hgei)
 		kvm_riscv_aia_nr_hgei--;
 
+	/*
+	 * Number of usable HGEI lines should be minimum of per-HART
+	 * IMSIC guest files and number of bits in HGEIE
+	 *
+	 * TODO: To be updated later by AIA IMSIC HW guest file support
+	 */
+	kvm_riscv_aia_nr_hgei = 0;
+
 	/* Initialize guest external interrupt line management */
 	rc = aia_hgei_init();
 	if (rc)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
