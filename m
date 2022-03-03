Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B811FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nDEazu0eK0HjGq0g0hOyxcl+HJ2P3KCYrwXASa+w/U=; b=R7wqGzaVpoA7Dj
	ydCX+qpj1+CENqnTVdE2Rqz+zqbblgse8RT0SL/ALVmVFuLsa3sYgqonUOs65PwitE81v6k+PppQ4
	HoZegTF/swWVNb0Fsd9Co8wvPzowpg5L8j1x1ZpK6PlsNIU00U8D6z5zGfE7Nvny0AXxb18CEKTCK
	mrVNWNF2oKJIEAqxZ9u4wHS5jhVollhLoeOnvgXy7JGpDZAmjrsL/RAPyFOrTWTzWwT28DxEKOGKg
	LagoQeAFWHvHSnvus1R4B9zwydxrFh8oQ6ThdrmFOD7CLq2HU5BiYVj94yOUjq4aM8+1RynYIeXje
	37waOeFV7Yw3h7ybeMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPmw5-006jhv-4h; Thu, 03 Mar 2022 15:00:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPmw2-006jgZ-ON
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 15:00:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id r10so8280506wrp.3
 for <linux-riscv@lists.infradead.org>; Thu, 03 Mar 2022 07:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iSr9Qn9Bz4exSvEIEKJ560kFdgKVqwLanGXFW+iTqRM=;
 b=jQ1YpTJ1Ll/9O3lki/NjFoQNdp1yiVr3Pt2tjAcuEzvv8bTqWSx7nP7Xnt8kv3QbyL
 vjHge3gDM7u7t+4ZBWzpEC5dvN9IuhJFgri2ZNF1XbvFmMq4emqLXYoHigyQpGH8PWHp
 yaesPGBBKpxzFjTf4+dUk4KFCCCvl+zcHdmGGPPUULnzRgw3l0/pIMZJzy8jrejt5oDj
 NOX/EGVI73j662MmjO9O3TnF/yVFefVCcgcP3ejkNfcDyRJg6FAJ7WgOz+8q2ACfYESd
 xJZy0Y1uNfJmg4KauRT70vX3pJAszb+aUF0oEGyQBt+Y7kv0BzaHEhOJAW0xQ0K8IaO9
 kskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iSr9Qn9Bz4exSvEIEKJ560kFdgKVqwLanGXFW+iTqRM=;
 b=guuPM+8LxYYl/tcLQnHqEauax6+0Yy/SRaMrQsqBkvY+w+wbsytecpQNvtwrawfJmp
 lreUcGbzCXHgg7YBqVFUMQnNyv/Gld4aoBRcyR6Vk+qEjWnos513sPlKwrwtJVOlSFdu
 OzDTiHbcQJ+mV2Owb1IxBY0K6FWAOCHPFgZe8+La8vFPcgUWXoOj0SM1bMTGc7+wnNAv
 uAybyLaGtR36RMUT4WWGyeJfqWcEWCGI1F1zwgY6sGID1z71QH7U9EzI/qiTRmpoyksJ
 0uCdU0ZUP1avT+/I1llzqFAJB4nLlAcvdHfzk3flNIf59B/fJvssbZqIq0AbNpvSwvoW
 5orQ==
X-Gm-Message-State: AOAM531yU7vHwNJkQy3M7QvUgVft0uasV0FgJ2EYuyL4OhpUQi5QSm5n
 LDce5RxO4W3Jvay6rapFxxRUNA==
X-Google-Smtp-Source: ABdhPJyEf2EHXO3BVWONDnMa14Ao/RzwdbENiJaMea2ppdwcPZbQ/wag664EK5SDdJHuReSkBZ+zAg==
X-Received: by 2002:adf:ec41:0:b0:1ed:beee:6f8f with SMTP id
 w1-20020adfec41000000b001edbeee6f8fmr26073123wrn.110.1646319605099; 
 Thu, 03 Mar 2022 07:00:05 -0800 (PST)
Received: from localhost.localdomain ([49.206.7.17])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d522f000000b001e85b14dadcsm2224166wra.5.2022.03.03.06.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:00:04 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>
Subject: [RFC PATCH V2 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Date: Thu,  3 Mar 2022 20:29:44 +0530
Message-Id: <20220303145944.307321-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303145944.307321-1-sunilvl@ventanamicro.com>
References: <20220303145944.307321-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_070006_820098_E5481185 
X-CRM114-Status: GOOD (  14.91  )
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
index 9c460843442f..915ad209d004 100644
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
+			efi_err("/chosen/boot-hartid missing or invalid!\n");
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
