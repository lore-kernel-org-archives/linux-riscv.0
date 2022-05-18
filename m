Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA8BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mY/wNpueQGPb3M9wlSoTfEbExKmlY01rdeHCYhEn8i4=; b=MIEVBPaWGk1Dr7
	raLuYmy72fVlmEE1s+DDoQiN+pt3jyAJ0rOv3UFkrkQHvuGOrvV17OzZcwwxrl6rKNg1cjVvStMbW
	0M7NIvkQqPUt/zICknaQWw0VyjaDijQKZLIZZjws3DxgNF9Pd2X7vltrX6vjLxuohBOYyQVGzq65e
	1l+wrc9cVybmY+y5kYQgHjrvNGN69MPM+xenm0WBJdWo1zpNNsM3cR2n8jVR5AGHf+jzpjbfCxWFV
	HEWKsVrg9S+flpzaGrjlTu0SY3YSiygPWaMCc/c+pau3XXrSITsW+nBG2r+S8VkT5ZlrBlcaEr38Z
	dlDKKn+wibgKLAI2cNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGQk-001DU9-Ji; Wed, 18 May 2022 09:57:22 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGQi-001DRk-4h
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 09:57:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id z3so188673pgn.4
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOkV9qsSBetFWbuRvijcZUKcVy03YutgM/62olPjrWo=;
 b=cAI0lTAvSOZe3Oz8ErLeU7+Li5R1V8awIyu+6ihioqc1AsF8rG0Y0/aPtoQobnrpm3
 E6pFtSqr0ETvX7B8izUuDkpnMzZGdkLNxLe/7X4yoyCtZFpG6bfGtgUXfzWrCrJzs6Lp
 OXbGRBAVCfU8gPEynr0EpoVU9GrXrBLbTdqmlbNWg8JK7ch6OxoPweh14uFAUhRxc+mO
 ZwozyLr2/lxtfUIu8rxErY65syCKPZYdTpE4d0cFYqU0viFJQK0wEU7+mI1ccNNqdweY
 bq3TxUc6w2YFl+1X3GG6PZP/+q47vhJGuXQeLWIlliIHTvn7MRjbaYsK3nF6e1NbJA3g
 1Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOkV9qsSBetFWbuRvijcZUKcVy03YutgM/62olPjrWo=;
 b=xLgmiZpAli76kdN182z9/AkYo/ApDokGXglMl5p/ckYCPEKSx5HC6tfpzSKRZ/0ec0
 nGUrSnxRI3SePoDcN3qYEnXZfSFJ+gC/zIjcaVBQElyaX/gt0rj7A73NbH+xCw6rVfbS
 RqHxOxM1LdZgBx6zIWSqbR2LHSd60JIcWV/4joT2C0UEt4dO5qy0L1YhEXEORd4EEoZL
 dHlY8M4wrW0ZIWUsPDYAeCBXH62PQRVJ2tcBC/J3ezPXKM7xGj2ze+VG9jd+G+oE+Qra
 UppNqMy1tFGjbtAHOtY6xJDq4+m81Q0wHNY1zrHdCRVLjwJjAFwIlSnmqLwAdQcPf6vj
 hbkg==
X-Gm-Message-State: AOAM533oP7RYL1rcVaSR5HaYKYthP+EPHylH2ClLNhmBuj5o5fHiO/y4
 T44QLgr+8nULL+VHu5VRdKKOQQ==
X-Google-Smtp-Source: ABdhPJyL3iVHnWkCm6IHy7Z8dC9rx9dc0kMEpXEKFzYNjEcqkIqbrS5MCOwubvn2NoPvO3BDjKlVlw==
X-Received: by 2002:a05:6a00:1a47:b0:510:a41b:362d with SMTP id
 h7-20020a056a001a4700b00510a41b362dmr27191567pfv.30.1652867835327; 
 Wed, 18 May 2022 02:57:15 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.7.17]) by smtp.gmail.com with ESMTPSA id
 u2-20020a1709026e0200b0015e8d4eb1b7sm1258252plk.1.2022.05.18.02.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 02:57:15 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH V4 1/1] riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL
Date: Wed, 18 May 2022 15:26:46 +0530
Message-Id: <20220518095646.47548-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518095646.47548-1-sunilvl@ventanamicro.com>
References: <20220518095646.47548-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_025720_231571_84AED92B 
X-CRM114-Status: GOOD (  15.02  )
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

This patch adds the support for getting the boot hart ID in
Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
is preferred method over existing DT based solution since it
works irrespective of DT or ACPI.

The specification of the protocol is hosted at:
https://github.com/riscv-non-isa/riscv-uefi

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
 drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
 include/linux/efi.h                       |  1 +
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index edb77b0621ea..aced62a0907e 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -720,6 +720,13 @@ union efi_tcg2_protocol {
 	} mixed_mode;
 };
 
+struct riscv_efi_boot_protocol {
+	u64 revision;
+
+	efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
+						  size_t *boot_hartid);
+};
+
 typedef union efi_load_file_protocol efi_load_file_protocol_t;
 typedef union efi_load_file_protocol efi_load_file2_protocol_t;
 
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 9c460843442f..012504f6f9a4 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -23,7 +23,7 @@
 
 typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
 
-static u32 hartid;
+static size_t hartid;
 
 static int get_boot_hartid_from_fdt(void)
 {
@@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
 	return 0;
 }
 
+static efi_status_t get_boot_hartid_from_efi(void)
+{
+	efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
+	efi_status_t status;
+	struct riscv_efi_boot_protocol *boot_protocol;
+
+	status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
+			     (void **)&boot_protocol);
+	if (status == EFI_SUCCESS) {
+		status = efi_call_proto(boot_protocol,
+					get_boot_hartid, &hartid);
+	}
+	return status;
+}
+
 efi_status_t check_platform_features(void)
 {
 	int ret;
+	efi_status_t status;
 
-	ret = get_boot_hartid_from_fdt();
-	if (ret) {
-		efi_err("/chosen/boot-hartid missing or invalid!\n");
-		return EFI_UNSUPPORTED;
+	status = get_boot_hartid_from_efi();
+	if (status != EFI_SUCCESS) {
+		ret = get_boot_hartid_from_fdt();
+		if (ret) {
+			efi_err("Failed to get boot hartid!\n");
+			return EFI_UNSUPPORTED;
+		}
 	}
 	return EFI_SUCCESS;
 }
diff --git a/include/linux/efi.h b/include/linux/efi.h
index ccd4d3f91c98..9822c730207c 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
 #define EFI_CONSOLE_OUT_DEVICE_GUID		EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
 #define APPLE_PROPERTIES_PROTOCOL_GUID		EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
 #define EFI_TCG2_PROTOCOL_GUID			EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
+#define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
 #define EFI_LOAD_FILE_PROTOCOL_GUID		EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
 #define EFI_LOAD_FILE2_PROTOCOL_GUID		EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
 #define EFI_RT_PROPERTIES_TABLE_GUID		EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
