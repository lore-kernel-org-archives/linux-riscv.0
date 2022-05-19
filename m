Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C95C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 05:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lq1lHFMYf5OJSvO/UinlZWZUuJdFeQhDU0TbWvIsDAc=; b=s1ZVJgb+74rlsK
	v6a/o4ZF2zLU/QJvJWmionXO2ZX8aki//UNur1FQwZS99sBtspHWIJrf9HpK9psQXBDX/ytPcT2La
	VoHuEajU7CZX2n8hobEru/NJdU9l6DZRqk5K1sSgMmJ3Znl7sxMaDopRUPKq0YdKafiA/MwvHXx2s
	EcN2nC446umtxnxup10YyU8zz6qaC29ykdZuKxTMli2y+6zTxIzmVuiTtbFbrybuxuBS1Fti/YxEF
	+9heKa1Itd1+MwRgnCKpvrOeKVLUxhf9pZUcNGK0Ry8XP0OEThdqfnLnwzl8g72tByFVpul3dqN8y
	oobMu+nbr9MoIpVe5Pdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrYVV-0054BA-P4; Thu, 19 May 2022 05:15:29 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrYVS-0054A2-Rf
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 05:15:28 +0000
Received: by mail-pg1-x52f.google.com with SMTP id x12so4062957pgj.7
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8kBvwTpuQCpGlgQz4UivyYiv6vdmLNO0fD/1W/RRFw=;
 b=DmBnZP61PAdCkSbyxB6731F3+Vdn1dSA9Sp5nkK8wvdhIt8HWTOjm5x4Mjcl+DwJRJ
 6qi4/MNdtmICF7v441vBd+kfgY1hSqD6BcYMh4Wt6Ut73OGvDCbVGkMB/mqvV4IX9Z8P
 wHF8IH5QKPm3PjOgrKZDDnAVMkVns3cbPcpdFCA026fMVycwV6LbahiaFXX2Sf02a5J9
 cUPTNdGE1R4RDnsQ2Q4GfiUhtCY0/To4feEeTpbb7FMKGrnK8CcZxKDUWJzN2mIBu4/X
 U8UxfTlBEMuDYi2y0aWMohyNvzuHuhRFR4bpey+egKHnyERcewpdIouqxrVpfPb0hlPj
 eNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8kBvwTpuQCpGlgQz4UivyYiv6vdmLNO0fD/1W/RRFw=;
 b=SAlbIbZpXNxjWJaFayK34k840dzrjHDc4EoUyqFQjqF9wdSTyiW1wrlne5CDcDv0vr
 S+nTbPlPUsHToROYSzg+HVVK5AgE1kg6jCZwohCyXpTrYfvnO4Zbj7MkkRJFT4l9HqjK
 Db21Asj97hKiHYEKyJRt+IfI4D/NWLLS9H6cK+g/DDy7J8VzsDf0hNBUX0VRHQqkPAP5
 8gc1AF/1Bk1jKEqRXwFsRzRehjCO9LWFKb9/cGpyytDdTkhdCNcGmgHShvj0YePDT4vz
 SI7sgZTgBVKc48AiCXu8DuLi6H7b6NKUNv0+4vUaYf/q2p4Jn93AM1Z5+wQF92oGINey
 +8OQ==
X-Gm-Message-State: AOAM531wA3v3uWxJJ+DRo0nzqXeFRN5nNHzDxZBQmAcnLBHB34sLEE32
 XkdYQhPPc/Kd/D4+nSrFT3eNHg==
X-Google-Smtp-Source: ABdhPJzkBOnhHrE+4Bc35bpaxBRCk3/P09SRAJ9yBIozW4mar/09Moqazi4KrJGhMgoyYrxap1WNqQ==
X-Received: by 2002:a63:fb02:0:b0:3c1:9513:2e11 with SMTP id
 o2-20020a63fb02000000b003c195132e11mr2558308pgh.258.1652937326393; 
 Wed, 18 May 2022 22:15:26 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.10.235])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a056a00235300b0050dc76281a3sm2929007pfj.125.2022.05.18.22.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 22:15:26 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sunil V L <sunil.vl@gmail.com>
Subject: [PATCH V5 1/1] riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL
Date: Thu, 19 May 2022 10:45:12 +0530
Message-Id: <20220519051512.136724-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519051512.136724-1-sunilvl@ventanamicro.com>
References: <20220519051512.136724-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_221526_939976_273C3370 
X-CRM114-Status: GOOD (  15.81  )
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
 drivers/firmware/efi/libstub/efistub.h    |  7 +++++
 drivers/firmware/efi/libstub/riscv-stub.c | 31 ++++++++++++++++++-----
 include/linux/efi.h                       |  1 +
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index edb77b0621ea..87aa66e8ef43 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -720,6 +720,13 @@ union efi_tcg2_protocol {
 	} mixed_mode;
 };
 
+struct riscv_efi_boot_protocol {
+	u64 revision;
+
+	efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
+						  unsigned long *boot_hartid);
+};
+
 typedef union efi_load_file_protocol efi_load_file_protocol_t;
 typedef union efi_load_file_protocol efi_load_file2_protocol_t;
 
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 9c460843442f..10c59295f379 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -21,9 +21,9 @@
 #define MIN_KIMG_ALIGN		SZ_4M
 #endif
 
-typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
+typedef void __noreturn (*jump_kernel_func)(unsigned long, unsigned long);
 
-static u32 hartid;
+static unsigned long hartid;
 
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
