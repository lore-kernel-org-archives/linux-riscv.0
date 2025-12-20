Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677C8E668B1
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3cS9CspPnhr3K/VsoejAn/wiPQn0gsVUBWhufJns1QM=; b=dgUsttlNjdzaVB
	CLW2YdpPULVaTUVpN9lKSS51US/mds3DaVX7n0xlNsxEgvP3jkVzA67eT6JfpxWp3nZTXdvfUnR9H
	fCx72hHdAYxKTv/dSxIGU/Ev64+5m24pNtdfv2IH1Twz5c7Ra+2EYAU0TgI6+QQc4QztRUbM6T1fn
	KW+4cWVo97ve/ZkW7x6qW+9weDPg1WiJ+xm9xCcv0qGTnhHpOoywA4VwQZ/QR6q13r6QZ0F7eq5tz
	+rZ15I6SNAr0yijK9HB0qAh9W7Sie55oFO9H9Ywx9l39zXAVIKAIKD67n9dtVqHXL1RfWBl1ii0sa
	fYYt7xDXPxCpBCSr7uQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzxP-0000000Bkot-3dKo;
	Sat, 20 Dec 2025 16:37:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzxN-0000000Bko3-0YX2
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 16:37:27 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34b75f7a134so2137377a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Dec 2025 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766248644; x=1766853444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FCav/YO9x/c2l0kK2rjBlOI4AUzqgUWfXFrOx8/XtI=;
        b=Ic25n0HCl+kYkNHdbsUC2MrwtwobCiixfNAWzRXwH6eyS1rY/yZ/0Citwq9oFjztPW
         bl5AIBMMOySjVrjMFBOyYRDUTeUdSGVL28c0ThERO6fr6iPWp+Km47G5DBLSZcATpQxA
         hJQCkQCZmmI91ujfivCmoZhtpYvgegoIwyBsIzW5G2FQy7jA4MAP70yGtemODm6qGS4M
         FXGo+38wx3Sw+yrjqiDyyouMrNHO8dZs09U4C/kIeHfSpOrL3OxUw9dtsv6GYuOOhhM5
         qNyzEYqH2lpKemcnoR+j2jN7K1z9VxmY8Qo9feILyw1dCIVYNua0u5Kfguh7rXqOWbSM
         qiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766248644; x=1766853444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FCav/YO9x/c2l0kK2rjBlOI4AUzqgUWfXFrOx8/XtI=;
        b=COddr6TeXmcSdtRB/SQkWiezYLXjIl9Xnu12HkJZC+gUFYefpAW9qr730m3+iWYJo4
         8sGeeZEU3zsf5V1FHgptyjWwqepF0KGFU5rMGAGaUX0RN3419M21i4sl8BWmwV/dhWfI
         MjL94IA9thU35RoBPgCy4KoLC2yYr2rczzL43PA4zvQvvnGM8UGjmELSNN0m05J3lCMA
         Hr3VhtUj5gVwVsCVjllaabMccyrpFeuscgaSxGXluxLqS9dDcu5paJ3+LxaLTRzaov/E
         7LiFv8ZKvD2p7wcaBcMiItyLhPCisd7fmIr3Bdp5itRN/vNzB2WdDXewlJ6BIx6vGXfM
         +yGg==
X-Forwarded-Encrypted: i=1; AJvYcCXu5mkVEMdxWqd7EIDJ3dZdCSkqVFNLFlPnkLvxmNWOgfBGe8o2aDhX0vnBg6n5ncTbGua0uNtbiH7EMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ3Q7ful0hloejU96EdpVDMrHJJgkMoMqWsL8sAQevOzh5z+rK
	cjjHytxVa1O5ZG17UZF34s6CP6tt257L9oTc8IRJFXEcgQISWmOW3ModdYnzM/qYvP8=
X-Gm-Gg: AY/fxX6GKNpoLWaD/YvgioW0m3k2Qdw4Cq9NyuDEIWY7VEr2+aZcdHU9lgEzFi6Z7a0
	UW1azzULISgV4fMyhsm0wGh+YFXCW3kRXIVya/9p/JeZaqqmDnOTBPHuEmRPjFEWMVdrg6r7Kk9
	eUPL9iFwSsxs5u91wMtrveci0HN0QggsIF8pza5hc6EZUMTO2D85AT1VHzqIuWlBdV0yU5NHvNS
	0MMaKE4RtVI0g3LTTPo+zNpD3nt6ogUGCmMfwBNoX9PgRsuVFM/kt5IubS3t6Jus7Yb0q70rA77
	fEYM1MdKuK2FIFAik5fuJqmnJZ9IdP4cbrf2dsjR0NKDkjzcpaqNVOY5JQFL1jj29yJxAHPnt+c
	DD0Wp3NezobknYaZUgccBVy45pDpPMKdFKUI20vDN0KK7eJtXjCY1+ni+JPBPqfd0W33tt2Epus
	O1Mymm8ppZfLylhoCopnZrNXnufhw1cHDagEotHOHKiOsSPgOvb4e6
X-Google-Smtp-Source: AGHT+IEJ3D8d9FhHHj3AGrLqpCRsqvYXaepmMKWkAaQAZJhz7+7JujmZvyMN56HD4piBnaPs2x/1og==
X-Received: by 2002:a17:90b:51c8:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-34e9212a206mr5848851a91.14.1766248644122;
        Sat, 20 Dec 2025 08:37:24 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbc9d6sm8368055a91.10.2025.12.20.08.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 08:37:23 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@linutronix.de
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3] irqchip/riscv-imsic: Adjust the number of available guest irq files
Date: Sun, 21 Dec 2025 00:37:13 +0800
Message-ID: <20251220163713.34040-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_083725_170788_2860770A 
X-CRM114-Status: GOOD (  13.23  )
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

During initialization, kernel maps the MMIO resources of IMSIC, which is
parsed from ACPI or DTS and may not strictly contains all guest
interrupt files. Page fault happens when KVM wrongly allocates an
unmapped guest interrupt file and writes it.

Thus, during initialization, we calculate the number of available guest
interrupt files according to MMIO resources and constrain the number of
guest interrupt files that can be allocated by KVM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/kvm/aia.c                    | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 7 ++++++-
 include/linux/irqchip/riscv-imsic.h     | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad3181856600..cac3c2b51d724 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -630,7 +630,7 @@ int kvm_riscv_aia_init(void)
 	 */
 	if (gc)
 		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    BIT(gc->guest_index_bits) - 1);
+					    gc->nr_guest_files);
 	else
 		kvm_riscv_aia_nr_hgei = 0;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index dc95ad856d80a..1e982ce024a47 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -794,7 +794,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 
 int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
-	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
+	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_guest_files, nr_handlers = 0;
 	struct imsic_global_config *global;
 	struct imsic_local_config *local;
 	void __iomem **mmios_va = NULL;
@@ -888,6 +888,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	}
 
 	/* Configure handlers for target CPUs */
+	global->nr_guest_files = BIT(global->guest_index_bits) - 1;
 	for (i = 0; i < nr_parent_irqs; i++) {
 		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
 		if (rc) {
@@ -928,6 +929,10 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
+		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
+		global->nr_guest_files = global->nr_guest_files > nr_guest_files ? nr_guest_files :
+					 global->nr_guest_files;
+
 		nr_handlers++;
 	}
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 7494952c55187..43aed52385008 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -69,6 +69,9 @@ struct imsic_global_config {
 	/* Number of guest interrupt identities */
 	u32					nr_guest_ids;
 
+	/* Number of guest interrupt files per core */
+	u32					nr_guest_files;
+
 	/* Per-CPU IMSIC addresses */
 	struct imsic_local_config __percpu	*local;
 };
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
