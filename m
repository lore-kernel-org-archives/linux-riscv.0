Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81591E668AE
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3cS9CspPnhr3K/VsoejAn/wiPQn0gsVUBWhufJns1QM=; b=XxAowEIBQxl3Oj
	0tQGt3A5a3RPAzEGECEcuCkqj6jq8Zv0CEjkrWwWJhqcWhxziVAKarvM9MbT75MDZ5Z2HcMK5ggrd
	ueek7h/wHvDMTYZmcLMnPicznS4/QkIdJZ+PhoJQ4gw48f4F/FZxmQhoH5rnnbfLQmBq+QAsL9qYS
	yfqCnNKaNw5UmabsVqWbWN952EO4O8d8VtJxKrU4JYyY9ohSG5SlQIadTOHjlanqSuSjIX2wm2+jX
	iG8drp0cTBxk6jkgdCmbNNWmcuv3K5zQbmqzSl1fJFsDLEZBplCUc7yFxNTX7xZJKQcssAAzEFFoA
	Gm5kO+Sj9n3I3mrdNU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsxO-0000000BRyY-0IrY;
	Sat, 20 Dec 2025 09:08:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsxK-0000000BRxi-3GSR
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 09:08:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2043818b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Dec 2025 01:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766221734; x=1766826534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FCav/YO9x/c2l0kK2rjBlOI4AUzqgUWfXFrOx8/XtI=;
        b=cQQMJuU9+CTvqJd5p5FGfv0hardk/gmzQMV+fd0P2cNqv1amNzKU9L0Rwv3oiwJYao
         zWM4SiU3hJ0B+qZYoY2dxfXTNQ5JfOGLwUXscVx84h/gQ6TL3t8JdQWoKIz3XS1XoUkM
         cLx6Wn8HooeW12jSWaKcSzC7PyjDxB5RpEIS3foYXNmjbfsFQN8Gol9CFYZDBr9Xq5DJ
         sqCfisi04kghpYz5XvjA9Q7ozVvF/9VyL56Acom8kTCJo1N1eCqgvuyr2gketDJbb5ip
         xVuqoR7p7xfI8SKSB/lN7gCqmoUWNP91A/875m8V6xpLzY68UXSnUxtfVpmvyUb/dd1B
         c9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221734; x=1766826534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FCav/YO9x/c2l0kK2rjBlOI4AUzqgUWfXFrOx8/XtI=;
        b=nrMqXK4vDj2W/FbI2TrdAewvHNywpv4g9Zk66LvqEg+rLvNnMprRb7akgi0QaXcj+3
         udNOXU5jxUXDjs2NVNakNBuCskWv2uuvcTl+kVAZXMXkigDYmjLREWM/4onQAu/8v5bi
         ITBWwwskZF9PB8VMYyyw6IihJuPGplKxzbINiracibEylPo7ZfYYxeiYJQr6V6XmLTIT
         URZCb313j8NOclEAcPfVVvIXuwbshtX91gTlBEexUQj24fzeYOyUKhSSAxB/YMUZ4Hfz
         uzIuKRlnuE/RdmbsK+20A3zfbiKkYMniD+WPJVI6IP2EOxKPoKGrcwpb8rqeOsBhVJGJ
         S0Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX7nMNQI4QuBSRRJMW2/vJ1C3m2t+g+XeL36pXs4IK/oQTnWXsfHJsWyQ3LD4GhqLwFgzFpqXG6b9PXkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5UfbVm4VLjSefhkP7BcPb9B30upq5ih4BC5TyWxIhKFd/jLAC
	sQg5rZpWeo78Ms1IZyo67+sLiP7wlp0/oJzDpMgcTzX4Rcn8l8MJ5Jl+YnmRWiplD0s=
X-Gm-Gg: AY/fxX6ly5xPm6tKEGMuUKeSQBDsKmGohp+qPi5N288vDnJs3wDYcDFpswscngZMjDa
	Hw5bZ85PXbTfnKC3nN7UGzHtLesqcp/vL3ExWsLjLH9fiNuIMd2KwIt1iPLQfYv6B9fJn2lBlr3
	gVDOP2iGmJ+eATwoVY1MZPu2A3uoxwvy/T/4cTG/eGJAiUaoL1LOF5+w648IQb/1WB7jpdKmW2z
	BVEv5HI25a9JdlY3Yd8nzdAtIcGF+s+OM2r5/slCFf/HDBQYDZsg6pveslVjHyPie2iZ3gtzxAX
	YqNaXVXNkXBXXHWZH3qraOoWlADMWdV7OOga0r7wM4oYt4H5/B+xpfLySqxrcpE/qyMAGV5RRV2
	iuifv7j+JRfZfAqCWeE7f7uoGb66fRxp0QL+QOx7TZ60D09LjAvbJkZIi4Y9Xa/pUjbdIMDo1Op
	n7pgcytNOjIke21IOXbzB+x+NIqZZhqcbHh7Zcp4qNekBjPcPBEoSV
X-Google-Smtp-Source: AGHT+IF2jkxbF7mAn+s4RGO9FXrxMFZTWrnAnqrw89U2+BW6yKGvETNKZF8EMf2cRZHfSphIJaGSBg==
X-Received: by 2002:a05:6a00:330a:b0:7e8:43f5:bd46 with SMTP id d2e1a72fcca58-7ff67257bb3mr4181960b3a.50.1766221733916;
        Sat, 20 Dec 2025 01:08:53 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cd07sm4623647b3a.46.2025.12.20.01.08.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 01:08:53 -0800 (PST)
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
Subject: [PATCH v2] irqchip/riscv-imsic: Adjust vs irq files num according to MMIO resources
Date: Sat, 20 Dec 2025 17:08:44 +0800
Message-ID: <20251220090844.46441-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_010854_823961_09DB9416 
X-CRM114-Status: GOOD (  13.65  )
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
