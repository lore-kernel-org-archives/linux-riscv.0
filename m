Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05775C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 04:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cUaQveeTpQ/vuQzo8V2oqJgppNdUkT+IW1Q4R24oDs0=; b=ey/mEkZ2UsYOWY
	ut5Q9eBn/qqWI0PTF4MkE0pOXGlMMvWPKvgIEIf5kivFw0xTzyAqPDm5x7gNvZhvm2MlXFNuTxwU3
	/IGVrD9Vqu3c3O7I+usPT9+g9z9pgPdoMnfC4a3TphT0FriQN6PABxySJShcUMQNMe5zVxJUTltKa
	dfjEFvBbgp9aQkbBeaul8uYx5WlvfqKy6v+P5uZ+XAnWEvfDlc+/kWj9miG2oLyCVQspCNsSs8th5
	NuBCx3wDtR7UUhnaOv4V8aVyTSXk8k89IoeXwGVX5K8LwYq9RmrRlm1R08O5dTUCTUb+ZyYLdOjQ4
	SNrHOKKCKHlASyuleFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJDG-000NXq-BK; Fri, 28 Jan 2022 04:50:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJDD-000NX7-HL
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 04:50:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id i30so5057102pfk.8
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 20:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FD5pKwU2Fwdg7X48mCrqr+jAVcD4ZyeHTAqc+k2RM+c=;
 b=B4CgcY0fEOxqhrw24tg4Q5GH/lXkTLByoWqfd2Mwf8j929EOPzS/1422VapoQYGodH
 FiWXBWuWdBxfetOk3EkoRKBcrlec3LK1FH+jmYGYDR6hzgHm1lSVh9D6Owdq7QIHpHF4
 V/Gqkvy0Yvn6ocSksO5aRQxpk6EnOid8UZRNNF/uJwaPk5n8bK+TTWfbz3OVnyLtmtVn
 BCah28BN9fVtVIbp1qia6BJ9wszMUcpZYRJdsmkyBLeGA00rcQa7DRgqN4fBglwrIFye
 4It2VtWQcF4fh06KHjEUe/lQ0af2DL76+nzrXJRYxAPuIX8NNJAR+ENw69J6e+sZEzY+
 nQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FD5pKwU2Fwdg7X48mCrqr+jAVcD4ZyeHTAqc+k2RM+c=;
 b=L5cWJoLuio0BUpVL53M461OV6brwBkA16BFu4V3T8WoJKB/+6m2oplK1TvILEz/duc
 Sdjr1572kSFDxNyPMyiPVq9/HCUWHX0p8u/0dYwT7l2kIDa/OkAsw6zTwWExw87Qg7ch
 aY0ymc4rnVRqx6neChJES7DY7Ax+72u8EBffcj1srFlfI61BQNnu40rgjh5iAy/sDjwV
 5/0FUxcx9cOZkALAKFIsySLcHPJBlrKSfUdJo6h0SdhuLE7TY1w+IdVqRw/BIDiBZJXc
 PrIPowyhCMwq2nKw2UNrPQ9LHVKlSnCAbGyAVW71lpz5ip80omrFDK3Q/TVCBckLveNH
 ZuvA==
X-Gm-Message-State: AOAM531jf7hEQfRxvZaMbmnSaq3BsYqr2o8E2W7NCdPya849u5sHr9d+
 vd0kDqH6toNti7LggV/DXlLV0Q==
X-Google-Smtp-Source: ABdhPJxsk7PAsAbzq8HVim93uXfpup+rKn0o1kD3wHiWk2p7hYt+rlgXyL4Lt/ufFIunBH/WWgYdMA==
X-Received: by 2002:a63:1d4a:: with SMTP id d10mr5342186pgm.92.1643345413975; 
 Thu, 27 Jan 2022 20:50:13 -0800 (PST)
Received: from sunil-ThinkPad-T490.dc1.ventanamicro.com ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id oa10sm858023pjb.27.2022.01.27.20.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 20:50:13 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>
Cc: linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>,
 stable@vger.kernel.org
Subject: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return value
Date: Fri, 28 Jan 2022 10:20:04 +0530
Message-Id: <20220128045004.4843-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_205015_608157_AC8D83E5 
X-CRM114-Status: GOOD (  10.75  )
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

The get_boot_hartid_from_fdt() function currently returns U32_MAX
for failure case which is not correct because U32_MAX is a valid
hartid value. This patch fixes the issue by returning error code.

Fixes: d7071743db31 ("RISC-V: Add EFI stub support.")
Cc: stable@vger.kernel.org

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/firmware/efi/libstub/riscv-stub.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 380e4e251399..9c460843442f 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -25,7 +25,7 @@ typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
 
 static u32 hartid;
 
-static u32 get_boot_hartid_from_fdt(void)
+static int get_boot_hartid_from_fdt(void)
 {
 	const void *fdt;
 	int chosen_node, len;
@@ -33,23 +33,26 @@ static u32 get_boot_hartid_from_fdt(void)
 
 	fdt = get_efi_config_table(DEVICE_TREE_GUID);
 	if (!fdt)
-		return U32_MAX;
+		return -EINVAL;
 
 	chosen_node = fdt_path_offset(fdt, "/chosen");
 	if (chosen_node < 0)
-		return U32_MAX;
+		return -EINVAL;
 
 	prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
 	if (!prop || len != sizeof(u32))
-		return U32_MAX;
+		return -EINVAL;
 
-	return fdt32_to_cpu(*prop);
+	hartid = fdt32_to_cpu(*prop);
+	return 0;
 }
 
 efi_status_t check_platform_features(void)
 {
-	hartid = get_boot_hartid_from_fdt();
-	if (hartid == U32_MAX) {
+	int ret;
+
+	ret = get_boot_hartid_from_fdt();
+	if (ret) {
 		efi_err("/chosen/boot-hartid missing or invalid!\n");
 		return EFI_UNSUPPORTED;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
