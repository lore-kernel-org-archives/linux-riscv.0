Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0E8C2BA4C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJ4gw/VqJNwdqEhVu2PsnnPscsDGbsHFGX2OP/FGHj8=; b=A7vxQv/X32v8Pl
	5tFHzz/8r720Knk76G0UsR+ApUq2xccz2eefIwQXozFc0OTTBcVTs0zmtSfpVnFZSUA9USjU8Y1nI
	fiqs6HRsQH4+QPYVKygxzfSCpArLH/t/0HW2SfxzNipx8xBLRBabsVvGBBpdIgwShnCbuVcB9j6u3
	cjmXqngRRfrT6VnFIj8RWC94Ot82OI2kVnckgwruin0UpQdd41XIdezeVxcexuAm8n3HoBJywNRJl
	NH/EMg5NdcUlsZGYDbTPfuxBV5S5wQxYY86xoTTrl+nfgyDQ7Jpf17fE9sqPauRqLDG9UPWWPc1b7
	Hp4Ow5Tk6ENxvzcpGr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgIB-00BQi5-WA; Wed, 26 Jan 2022 11:16:48 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCg8H-00BOPE-NH
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:06:35 +0000
Received: by mail-pf1-x435.google.com with SMTP id a8so17008804pfa.6
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKOxeAFs8Emmc3fhmzQkKbSXzeM4KV2nj8OXlHcTbRc=;
 b=Qs/qsEDDuKtEoofAiibv7eMKY8JF2iTOALoGwBLBm6gTRvPztMZOI/oV09l3bECE8S
 HbbIzy2bkijESpND9yJcLDqsqolSdFiF1hs1ZBPi13J603abakFE0qPy8gNJIHwfvsiK
 SD/GoLAZfU+COhAKph8wK9wbP6JXUfEoYqg+9GHhBnEfjo+0naD1VmUf8xo0BP+mqijJ
 tmpBm+qAg1CJE/n2T1kyoGCVy0K/I6yH3u4s7yxh04kEZRrZp0hgoeNY/7Qz6XS8rPTA
 Et5wcAMS/ZxXwK31nlkDjx6Xh2UnI8nXTuMQSN6xJyrYRCcK7gooOkt/nowwXctIXhZn
 eBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKOxeAFs8Emmc3fhmzQkKbSXzeM4KV2nj8OXlHcTbRc=;
 b=Y6QKfgRW9hQcReLI0tv+KXXXKVlyuK57Djv45bWPr23TFIx1Fjrfk/qEG+ZnpjgMAz
 tIYqAKgqyJPq+4riG6d927n4X623596U1kR3b/HBEq+7UG6yjd82P7F2jIE9h7HSMPrb
 IkajNvkun9GXJkdhoEIUqbW+7cTe+YXcvsWpBj9FuGgod7AtWOOnjoLi5rzYB3PGgrmL
 6e3pftxxaCTxPr/bnhOInaI2CWE1iQahtTXKnZ0t2sNjr1yh3XcNwozsRal2Nw7Ol2DW
 J/BdP4qeMs8AD+N6jg+JBmBwP2+TgERotWozCQeo/S1eqDjqyFoIYFbffYCy0oBXe83G
 H/sA==
X-Gm-Message-State: AOAM532xQNU1j318CMm77CBW8r7JjhCrqATVLG1cRWHNMqN+VTSWgN3c
 p6eIVuDH5Xk/q8LcsiVF7fsdbA==
X-Google-Smtp-Source: ABdhPJyrozMJzK7uXJz7QXVrc55G1XxvDHKRrhDehcrXchiGbxAxGQWWo8T0lVPkuVswCE/5A1+B5w==
X-Received: by 2002:a05:6a00:cc2:b0:4c9:f07d:6abe with SMTP id
 b2-20020a056a000cc200b004c9f07d6abemr10317842pfv.17.1643195192179; 
 Wed, 26 Jan 2022 03:06:32 -0800 (PST)
Received: from sunil-ThinkPad-T490.dc1.ventanamicro.com ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id r11sm1811792pff.81.2022.01.26.03.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:06:31 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [RFC PATCH 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Date: Wed, 26 Jan 2022 16:36:15 +0530
Message-Id: <20220126110615.33371-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126110615.33371-1-sunilvl@ventanamicro.com>
References: <20220126110615.33371-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_030633_815121_86A3E0CF 
X-CRM114-Status: GOOD (  13.20  )
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
Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/firmware/efi/libstub/efistub.h    | 15 ++++++++++++
 drivers/firmware/efi/libstub/riscv-stub.c | 28 ++++++++++++++++++++---
 include/linux/efi.h                       |  1 +
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index edb77b0621ea..0428f8816942 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -720,6 +720,21 @@ union efi_tcg2_protocol {
 	} mixed_mode;
 };
 
+typedef union riscv_efi_boot_protocol riscv_efi_boot_protocol_t;
+
+union riscv_efi_boot_protocol {
+	struct {
+		u64 revision;
+		efi_status_t (__efiapi *get_boot_hartid)(
+							 riscv_efi_boot_protocol_t *,
+							 size_t *);
+	};
+	struct {
+		u32 revision;
+		u32 get_boot_hartid;
+	} mixed_mode;
+};
+
 typedef union efi_load_file_protocol efi_load_file_protocol_t;
 typedef union efi_load_file_protocol efi_load_file2_protocol_t;
 
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 380e4e251399..c7add4eb5453 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -46,12 +46,34 @@ static u32 get_boot_hartid_from_fdt(void)
 	return fdt32_to_cpu(*prop);
 }
 
+static u32 get_boot_hartid_from_efi(void)
+{
+	efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
+	efi_status_t status;
+	riscv_efi_boot_protocol_t *boot_protocol;
+	size_t boot_hart_id;
+
+	status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
+			     (void **)&boot_protocol);
+	if (status == EFI_SUCCESS) {
+		status = efi_call_proto(boot_protocol,
+					get_boot_hartid, &boot_hart_id);
+		if (status == EFI_SUCCESS) {
+			return (u32)boot_hart_id;
+		}
+	}
+	return U32_MAX;
+}
+
 efi_status_t check_platform_features(void)
 {
-	hartid = get_boot_hartid_from_fdt();
+	hartid = get_boot_hartid_from_efi();
 	if (hartid == U32_MAX) {
-		efi_err("/chosen/boot-hartid missing or invalid!\n");
-		return EFI_UNSUPPORTED;
+		hartid = get_boot_hartid_from_fdt();
+		if (hartid == U32_MAX) {
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
