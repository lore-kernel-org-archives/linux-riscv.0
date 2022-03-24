Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CFDC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezJkICGbb5F/VyTnJNcaePzLluYUdKvlGZVOdZ34HWE=; b=j91e7yjDifedB5
	OqiKICJaEhB7NDtspiUnCPPm0ikmzwpzvAQ/8sJwy18sqHqZZzbJwAkyZ0FZkRWE0k6Svv1l5NHSu
	B5ke9urNm7HM/77Pddig1nbNy2PqYrEl42J89liV2d8AHPdxYzSMXvNI9uv+x6dwm3HXCmQ6RPq/J
	JTGlhgFz2A3YZ2NqNN7OM88R66dX+79g7G8ahajs34soZxmohsaOd5NPDbvqzm+DxmodZJgvFG06M
	K+IICMGZqa6i+nvIMpnPAwaB9ykKxnLlMOfrbCdrij2CJcq9jYKVslbfpoSbPwh1OSPIWgABxUqx5
	VIgYSkDyaXOyi8VrixIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXLbP-00GLKT-Q0; Thu, 24 Mar 2022 11:26:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXLbM-00GLIl-AA
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 11:26:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso2387508wmr.1
 for <linux-riscv@lists.infradead.org>; Thu, 24 Mar 2022 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMSVKsWryqt3zeqnYjz8LXFCtuqxZELmkuw89oQvIBA=;
 b=RLVWby+BCQjf4bP21qjgEAspa60BBTvBjDK8vlIlNZKDGGYXufONeUshaSHNCTkxcL
 cwthikyIy9BOybxpqr2uyxDetL8asrUt/BfvQ+0cFDr4B//eKXfSFRzdtlq7SjEu5JuY
 i4MsqyPRGBVoXhcEe1Hat7ZxiIFDLGGwWaedFtrDlfmN7ZUOuf9RvOEmbGaCMBpG/+3K
 CjNLUKW/2Mdw06iIrahB2YB9J7UddvmCIDyyDhALm9u8Pwjt9alN9Nhpby8mMLSVs2NY
 4yidt7zRQQo2kAzvC18XhDkNxl3JDFPX6kbHwn5pbiqVPRbaDsSs/37y/ne1qAiJwTtU
 MIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMSVKsWryqt3zeqnYjz8LXFCtuqxZELmkuw89oQvIBA=;
 b=QwY2jOAXQIE4Ntr+z/3aZeSNAy9FytE8g7Q76/9kBIX3j1KL6RRrgFSRbxMlVlKsSF
 wNO4zO753X55/GBeC3D5wZ7KHUlj8pXar5J6E88D6b24fSo5YoEfExKn9cD8dnDKu4zU
 WKr+c1s9GZvjvRL0rOY1c3lT6dJjON/hLV5/P+2j50TDBF/WNlGAB9lCcg4PcU7H3j0H
 /jLoz6ZY+H0PqzqpA/Nf/8W5Z3XiatqyX0/Rq5AmXVDJ/Yml2EP8yG5pKbfNNAgQeD3a
 tjKiRJgR2uCJHHr5P3URn8RxaKX6DiMDONsEXV2+uj9qHmyomvDw/9EYpNei7scKADTF
 aHBQ==
X-Gm-Message-State: AOAM530f8+iFDMwACClTuonGopauaok54+tr0HMdvweKxbaJhqNGP8/3
 3i2IQ9N36qGZg2L7WP26olhS3w==
X-Google-Smtp-Source: ABdhPJxxSeuSOAZdxU/+Rqr9GkGi75FBqxzBrOgpiX7ZMlp1RTm4eO79f7FGS9r2qHc4u4GPQCCOQQ==
X-Received: by 2002:a05:600c:5114:b0:38c:cb16:14d5 with SMTP id
 o20-20020a05600c511400b0038ccb1614d5mr4984948wms.169.1648121158508; 
 Thu, 24 Mar 2022 04:25:58 -0700 (PDT)
Received: from localhost.localdomain ([49.206.7.17])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d64a3000000b00203ed35b0aesm3875350wrp.108.2022.03.24.04.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 04:25:58 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 1/1] riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL
Date: Thu, 24 Mar 2022 16:55:34 +0530
Message-Id: <20220324112534.209959-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324112534.209959-1-sunilvl@ventanamicro.com>
References: <20220324112534.209959-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_042600_376175_48037539 
X-CRM114-Status: GOOD (  15.52  )
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
