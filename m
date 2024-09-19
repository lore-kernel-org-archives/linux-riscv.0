Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF51CCF3959
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8x2Fe/FzULjSjpx/AR3WVdcMqMxRnr35dByWaccG5e4=; b=Bz2tLhKFLMlotR
	R+22Q1nRgOlNt2qfI96iEZnYGtPcldhmt+gq4GxjGS7BaDRXbN1XusHG1zK2/SIQJ+82XNcZ4764l
	TuZfhy4IEZL/n6am7OV5u5rqOwOCA/cLExrJ8Bvft8XXl75dLkY+J8q0ueNdM2EFM7E8hYpxz94lI
	6/h4bgDe0zrLPCt4SoXHnDKh+3Ttm+up6gPlLAlWQx+3qurVGtAO4dcka2Gf4sznoHnkgjsDmozrG
	+gd7629Mr2cRDeWfpGxrIB+oBiUCBzcBHxcBMdGfmgZqQGfgg339ZQm9RDNeCMldKH1BoTPY/QjKg
	2xGHtH+SLTJm7zJq+cRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srJc4-0000000AbbT-3V86;
	Thu, 19 Sep 2024 16:02:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srJc2-0000000Abaf-1dFN
	for linux-riscv@lists.infradead.org;
	Thu, 19 Sep 2024 16:02:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20696938f86so9078875ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Sep 2024 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726761751; x=1727366551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IY5B5QxXDNVGbG3vnBPyBqvWzO5uiDp/nIYu33vK85A=;
        b=KzlBD5wKt+0+qnWE3LPD3FlKUcrTDNyurjbiOFLuB2D6lh3EgIH8gLgVkt6AzYP2tU
         XrbJ4KJOM4tUWrwpVKz44m8LG+tbuU+jPk+o/Voaip2xeBK6vnCm02T0E7RkAgv8OHZ0
         9+GaxrY8/S8rO8Rgl5EPMHE+EiNV0oQgiK0JPxetlubdL6a2erpb1BJtpl1NMHM+M+MT
         Q4KPBFVSRkKs/DXlE4RRNBQTdmAhNV2w3dktYesnNIUQJzUe7ORxw+k4u1tQ4oPZKMwe
         CI3249XAOy/zvFuIrBPJaYPE6V9X/YK98CAeqoXJ5XeeG5CvRRxj1gkPzqmyLy/LDzWx
         U+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726761751; x=1727366551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IY5B5QxXDNVGbG3vnBPyBqvWzO5uiDp/nIYu33vK85A=;
        b=VxW8thfg1TPxxctxfqtQDlWWW9/nDpwDNO0kx2PSL+vIlFwHEOfLeXBwopKK8sz569
         bmf/CarFqir9HFlCqMPjBPHzO8FSWRDv6rs4K9VhS9ZWcpQQi3GcqOcWu+cqKT6FtDrD
         Z5JMyfgRRn8XuFHwuMZWFKTlipYjxrYHz665EBuJ0ZOa0nP093Lt/Fu/3b5UlVZ+034a
         uxUNhr8JTlfQVIX3M8xX8GwlQhvoa4g4n3ndAV/oh3FzAMMavq6j47Q6x2ZZgmk3VCWK
         z+CP2kPXiv8+bF8bOiy081CW0lKdD2V8BsJe7GZhBs6V1Vwe32q3YukjMYZIe/ZTzbiY
         GWZw==
X-Forwarded-Encrypted: i=1; AJvYcCVsMrhrMmxbOHwyzYCziSHOBNO0gPTu/qZA7arpBeac9sYr1qJE3uEdZPQLCgdSJBYspdJtbbA5j2bldg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn7ezGgLqqjpiRQsU/nGXjFC9yXWmeThz47mVgtJF0z8Iu2VPU
	VijciyFBm6zsOszJf9bdfUDf7v+8+SDNNfrS2F32OCFet0o7ek8YFgyLpg+VVog=
X-Google-Smtp-Source: AGHT+IHlrfEPPxfE7BBmxMTJoT8E08EE7/Q0AmzGFUzu6sN8uV/9Rnz5ZDYIemz+SMlLQ8t0Vj4kxg==
X-Received: by 2002:a17:903:8c8:b0:205:40a6:115a with SMTP id d9443c01a7336-2076e4360f7mr350612825ad.48.1726761751137;
        Thu, 19 Sep 2024 09:02:31 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com (114-32-147-116.hinet-ip.hinet.net. [114.32.147.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d19e5sm81665645ad.140.2024.09.19.09.02.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Sep 2024 09:02:30 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: anup@brainfault.org
Cc: atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH] RISCV: KVM: use raw_spinlock for critical section in imsic
Date: Fri, 20 Sep 2024 00:01:26 +0800
Message-Id: <20240919160126.44487-1-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_090234_435538_0B312B91 
X-CRM114-Status: GOOD (  10.46  )
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

For the external interrupt updating procedure in imsic, there was a
spinlock to protect it already. But since it should not be preempted in
any cases, we should turn to use raw_spinlock to prevent any preemption
in case PREEMPT_RT was enabled.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/aia_imsic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 0a1e85932..a8085cd82 100644
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
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
