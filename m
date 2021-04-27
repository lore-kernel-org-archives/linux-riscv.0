Return-Path: <SRS0=01Py=JY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6319AC43462
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 12:07:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 999F2610FA
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Apr 2021 12:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 999F2610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZAZTIgp6t17CuThgbDKv9Ur5hjvEjEvicEuH1IsM0Gs=; b=aRbNNnr4c0FMF4MIgvm9j8uRB6
	b7roYIYljhvJpTMOhYEh8BFUQBdcx6NM56j7TEcXR+CU9J2ahO1wpkw//Nop8ZfW6zBrcptuGf6IY
	VUu13grP2ic5PVCzkvtfZOaVFafdEGen/8NjKQWtUYw0GIh6xVWfaR2tmfeIKDQnotYoXim1qywCA
	yjMLLrNv3VNeIudatofL2W9K3UR/Y2I91s0uL6Yh5g7fqGN0OkA0xzUDQdh8bTRl6ToSkuyTUg+fj
	kJuaT9HD8VAjzxwHPoOXTllpNaT6nGE6lpm8QDCaRfyGAuods6g3lSo0V6hCMYWvO/S0SGK4RftC/
	n+BpD6RA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbMUk-001a1m-P9; Tue, 27 Apr 2021 12:07:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbMUg-001a1d-Hy
 for linux-riscv@desiato.infradead.org; Tue, 27 Apr 2021 12:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RJxVncGS6U+aW2CwWEyoK+WV9nu3WxeKlSv9zlz4jhY=; b=4bBLotCQTeATF9fKe10BTJOQA7
 UGSwnmDioKfD8YtWNVBtfp/YnLTIxKMrZqEwDKlk23IIdi5Flzdt9gjwtsXm9Ujl7ii0gkdiGDnYg
 meGIAhsTDt8xgam+mMLz4iHSsecjcTewTEbxo/5xPW501FN7FBe8YNFVljESnrfw49yYUb++3r7zh
 1yJs++ruet0a8rH2c1xvSqrhnY9eep6y7O2ZNdjQSxwCDsbYIiDahd+/fRvDduN7HVYRBkM2zmeAE
 vEdh0lJv2WoDacbZfhO2ARek8G3fkuYhieY1p3BGOTrTZs0fW9ZVM522HFjtgnjGnRs2yAO2etBWe
 /mRstjqQ==;
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbMUd-00Gi86-GA
 for linux-riscv@lists.infradead.org; Tue, 27 Apr 2021 12:07:09 +0000
Received: by mail-lf1-f45.google.com with SMTP id y4so53102534lfl.10
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 05:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RJxVncGS6U+aW2CwWEyoK+WV9nu3WxeKlSv9zlz4jhY=;
 b=slLuqYMrbj0M6WMawwo59fEDOmP5M6JqwmuhuPS9crcT0cgOEFnYh7mFyUjljn7d6m
 NGQfxHncRQFBgNx66d5cL4CIlZudFxrHcl5DZp1liRdPZ1Drm44e1T7d+xGvhoO+6hSf
 P98aLvu312nnJGaCWqAkcv1W4qlAl1PljZ0AiZ1HeLCexwpVX5SdHfhjnLWEEPm1S5E7
 0tuJ5e5rM+73qtepEiJBDM4zbVuDITQyo4CCcZFeqxF0DmtRmTWx5PV+Ljl0hDpD++Sd
 2gL6wY+QZTw8kJ0vyMRT3CHFjWMwXyPR/FWegak6N/EoXnkkMw+FhtljCVV6U8Uw1acl
 /2HQ==
X-Gm-Message-State: AOAM531njcYUwFgbnrUCGqHebfn4fvdcWrrxndm4f31ZdcniHuJmPGMk
 CxTHO+DbyhoskOl0AvuVPnc=
X-Google-Smtp-Source: ABdhPJxQ0kxFGDW6SKs/ZkAuW3qrdumsGa+YE/HoO2jF89zCZ/AFVyqy0UdLvMZnvlj+iY/cKI8Sig==
X-Received: by 2002:a05:6512:1116:: with SMTP id
 l22mr17431918lfg.655.1619525223175; 
 Tue, 27 Apr 2021 05:07:03 -0700 (PDT)
Received: from arei.office.basealt.ru ([2a0c:88c0:1:813:96c6:91ff:fe6b:6650])
 by smtp.gmail.com with ESMTPSA id
 h12sm376351ljh.21.2021.04.27.05.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 05:07:02 -0700 (PDT)
From: Nikita Ermakov <arei@altlinux.org>
To: linux-efi@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nikita Ermakov <arei@altlinux.org>
Subject: [PATCH] RISC-V: Relocate the kernel relative to a DRAM base.
Date: Tue, 27 Apr 2021 15:06:07 +0300
Message-Id: <20210427120607.2646166-1-arei@altlinux.org>
X-Mailer: git-send-email 2.29.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_050707_555266_8C8A1618 
X-CRM114-Status: GOOD (  13.92  )
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

Try to get the base of the DRAM from a DTB to use it as a lowest address
in physical memory to relocate the kernel. If it is not possible to
obtain the base from a /memory node of the DTB let's make an assumption
that the DRAM base at the beginning of the memory.

Signed-off-by: Nikita Ermakov <arei@altlinux.org>
---
 drivers/firmware/efi/libstub/riscv-stub.c | 39 ++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 380e4e251399..1b5944276e1a 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -46,6 +46,39 @@ static u32 get_boot_hartid_from_fdt(void)
 	return fdt32_to_cpu(*prop);
 }
 
+static unsigned long get_dram_base_from_fdt(void)
+{
+	const void *fdt;
+	int node, len;
+	const fdt32_t *addr_cells;
+	const void *prop;
+
+	fdt = get_efi_config_table(DEVICE_TREE_GUID);
+	if (!fdt)
+		return ULONG_MAX;
+
+	node = fdt_path_offset(fdt, "/");
+	if (node < 0)
+		return ULONG_MAX;
+
+	addr_cells = fdt_getprop((void *)fdt, node, "#address-cells", &len);
+	if (!addr_cells)
+		return ULONG_MAX;
+
+	node = fdt_path_offset(fdt, "/memory");
+	if (node < 0)
+		return ULONG_MAX;
+
+	prop = fdt_getprop((void *)fdt, node, "reg", &len);
+	if (!prop)
+		return ULONG_MAX;
+
+	if (fdt32_to_cpu(*addr_cells) > 1)
+		return fdt64_to_cpu(*((fdt64_t *)prop));
+	else
+		return fdt32_to_cpu(*((fdt32_t *)prop));
+}
+
 efi_status_t check_platform_features(void)
 {
 	hartid = get_boot_hartid_from_fdt();
@@ -97,7 +130,11 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	 * lowest possible memory region as long as the address and size meets
 	 * the alignment constraints.
 	 */
-	preferred_addr = MIN_KIMG_ALIGN;
+	preferred_addr = get_dram_base_from_fdt();
+	if (preferred_addr == ULONG_MAX)
+		preferred_addr = MIN_KIMG_ALIGN;
+	else
+		preferred_addr += MIN_KIMG_ALIGN;
 	status = efi_relocate_kernel(image_addr, kernel_size, *image_size,
 				     preferred_addr, MIN_KIMG_ALIGN, 0x0);
 
-- 
2.29.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
