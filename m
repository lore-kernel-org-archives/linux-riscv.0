Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEADC88C83
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 05:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44oh/FEG78cm8WIAADms/MHqpZyatPp5O3lFHfJ5v+E=; b=nttnVHSe00ac6f
	1ZBtQeP2hcDH1v3HzBkedmhkJLziihMN31ZmjE9JuXrLtAmVlIi/EpXRcy67TUbVNNMJVUVB2orL2
	v4eJ7COF3MnOtcA2FhB79P434wzagaUAvnUlwIAnMGnl0zI9VexuNydPmZ3Duf24lovLsRwKTty1h
	2u/uBMGP1BKPOF6s/hvHIQn/AvdHgnzwwiFHS/nln98YGwMwiu6OpsWCh/NAy7+3XNKbit78nxG9M
	nB7Jn1YhUlDFZGQ5bYeZTSGJ14pcNY2wsaRxDDdDYhIpOfSM3WMj3Zj6d5UclkqnluPxwH18ROqzD
	Il7HbX3a2M4vDMYC2g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHe-002fkW-0E;
	Mon, 12 Jun 2023 05:40:06 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8aHb-002fjH-20
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 05:40:04 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-19674cab442so2467785fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 22:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686548403; x=1689140403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy2FvnQ7sT+hFfzfZbK6StB7FDfBUwIcnd7vowD7Hdo=;
        b=fKgyV64IuuDp42oIE6+vlEALvMZVYR6v+zRX2M6KBdp2U1Q4EEebp+gWJClqMF1XXk
         OLG79st9/QNYq31F77kDNAqW5yxqzjZ/ljYG9ZCiIhBYqfERkkZZQkMmWp1DKH5TNdMY
         vXwGTZP9VPOUhOKsd6hbPeiYhZlI/rvmafAKC/3+1ih6jsO+O29QAWjMS+laB5KoHEvV
         GwwTRhkKPI0XRfYBv7/a6FrBe9Y+HxKOlxG2qFED5Y+OpmdtPrKVe6cF16ZoSPqwH9kV
         zYhhgtK4v0R8WlZnF2eixvx1n0GVXz/t83u1plyp4pJ+FBjsPOuJFY+3CynImlF53wg4
         93xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548403; x=1689140403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy2FvnQ7sT+hFfzfZbK6StB7FDfBUwIcnd7vowD7Hdo=;
        b=GM1IvMYYMKIAeSfE6ccHk3R7P4tIvEcftjQEuLLZTgyEvJIhVyo2Fc9MsIw6uWwODs
         VbugM653dBgX5ggolNHGPqIUeZLp0dKpQTylMimUhMu2uzD/7CKvOR0nb5JvV/dLHqZp
         QIBoEEC0+ZJRXIZp8d/jkQ/7jegG3za25ZfzDqEoo61/hH4oixmkNbZc6uDA7hfPDo7X
         5XiJg5LBK+ccTg0pQgjxPtpsfuEPHuXrXPvk4EwD8NFI/j1WP8Fyt3hKYJaFpv9nYlD9
         4AJ1gBDdOouTbucXf//jtrbBAT5Rqw7xxm9Ewl+1ytNOhlNYMgWzCQunqM5mNjgMV4Tr
         2yaw==
X-Gm-Message-State: AC+VfDybOfyV6myQ7Z3uY3fa/4a8z5tWvHutatruzqFdATz4WoOsmQEc
	sPWxMi9Mu72FGy4L8FYc5df9fQ==
X-Google-Smtp-Source: ACHHUZ5kPec2p3OADgxcfQzu4nQmjeX0kue8Qhu5qVqg39cFrxryxf6q488ZF3QT6feTgV7ykRUpYg==
X-Received: by 2002:a05:6870:2207:b0:19f:5701:8c47 with SMTP id i7-20020a056870220700b0019f57018c47mr5001745oaf.9.1686548402860;
        Sun, 11 Jun 2023 22:40:02 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id lv19-20020a056871439300b001a30d846520sm5534869oab.7.2023.06.11.22.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:40:02 -0700 (PDT)
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
Subject: [PATCH v2 04/10] RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
Date: Mon, 12 Jun 2023 11:09:26 +0530
Message-Id: <20230612053932.58604-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612053932.58604-1-apatel@ventanamicro.com>
References: <20230612053932.58604-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_224003_667845_042A425C 
X-CRM114-Status: UNSURE (   9.51  )
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
