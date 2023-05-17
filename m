Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9502C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmDypBlgm/Nf8V1OSfvxL77YtjJDcPRvtIaD6ANFbtg=; b=N6zuqMcOgHgvzR
	KALaC4amie5gcgi06FUtc2D6UpyGKYsbis+vRsBSU8Y7jGVwV5Fo0W+mOXtNwU4KEbnW0YoocMS88
	eBvEhIiQO4oq0+X+k73EvsjRbCTc/Y372YysNe+bTZeNriMche44DW9wx/wiywiQhAD1apWHc4AsZ
	BqmnNniogMVE1kzaS1X1ur3sggA+Ac1wEK/bJBUO6CYKctVNiPIMHEzZTxaTnQ7S2Wlc4eXPSBoGP
	kV0R8Frp+kwfGyWtshpMJAukcnHYD7o8+OGe8lUGpF+Jj6bgejYCxmaiwK6DwNf0XBRHnC2SwS1K2
	k/bCakIgCDWD3d8y8Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFpa-009iau-1M;
	Wed, 17 May 2023 12:00:34 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzElM-009UNr-23
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 10:52:09 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-394440f483fso387551b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684320727; x=1686912727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ28JLrG1g8D7dyJImcOfHjIQvhPaHtlfmKpeESLpGY=;
        b=Jnid0LSmDD5xq4sLyxjSQ8L5tr7Woa1SosoehMDgR69PzZ3l+2D6q4SoLHkgdDaiD+
         YG50yzfZYHRNEQI7qGu4l+X+dEpuW6aDqYF4R3Iwjz5VF0OVhGtNdi4dD4LNwy53DGsA
         nF8j+Y0t26IO0ZbRmQ7GTqbUqrHl2r/260iNHA57NH05fp9lVf9ZZ21wJ1rp6HbIfCo9
         wT4AxUNJG7Eb9+AQE/unR91SwtxbFEPVD0QZe2MgDn9nW0K0QleUZvLHYl5S7eKAJGx0
         J/wG2UaQs70iffUQGdghITh2ZWgwLSlg04OssoGZsqyRhtH9CtACUVR5+Bmm/O8jPaCo
         Nh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320727; x=1686912727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ28JLrG1g8D7dyJImcOfHjIQvhPaHtlfmKpeESLpGY=;
        b=PkfN6fo8Gpej/vrDHndAf7FmRUxoeqED3VC9ntkUzouYm+Y+5XdC9nyedl9+6AaPyE
         ISuiVCGMQRKiRHrx5PVaGNgGpBeYaizkdwYZ2xdLeyk+K7Rus15CgCewsBMumunvYBno
         7+NhJJkHh//vW22NOixTQHKn035SYXr0xdDsXvh0tiqtMpYaYyklrWGE5+UzKwd0E4dR
         LOpwESiRv1Wj0xK2nij94O581tO2OcXJdFUfSB2NovMb2h39Nb+GWDEDNhbcvbkqOcr2
         AhXfJHmEJanb/RvlU3AJYL152WKeGPFyvqGwivwR7RF6b7dd9Bizfb1+l1+0nv1OT3Bs
         i0cA==
X-Gm-Message-State: AC+VfDxFMvor9PcnEXCdoC5rtXDiYXJ8jimQTCWfOjEFCT7mrFws/ljz
	VXSvBX9/3GoYsGEX+wNIKBxu8g==
X-Google-Smtp-Source: ACHHUZ6UYNpzXHK7JEk/oI9BzRIucS9Y02RIxttWYFtZ944PMuU22M2sIdJpAvkSA1Dm1VhSrk0S1w==
X-Received: by 2002:a05:6808:17a8:b0:394:670f:9ecb with SMTP id bg40-20020a05680817a800b00394670f9ecbmr12925825oib.1.1684320727214;
        Wed, 17 May 2023 03:52:07 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w1-20020a9d77c1000000b006ade3815527sm2279896otl.22.2023.05.17.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:52:07 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 04/10] RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
Date: Wed, 17 May 2023 16:21:29 +0530
Message-Id: <20230517105135.1871868-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517105135.1871868-1-apatel@ventanamicro.com>
References: <20230517105135.1871868-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035208_671799_783CAE96 
X-CRM114-Status: UNSURE (   9.82  )
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
