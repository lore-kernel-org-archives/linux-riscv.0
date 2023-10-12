Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EFACDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13xOl4PJFQLXC2+nxc7mhxpsGDgpH3bTT0YPOCmcCis=; b=e4vtsRgfmSuR3k
	cnGRa/LBBXGEQK4thceg9I/5WHb1desLhUp9hFqxDOM5aEqrcUmyz3lq8qdFVLESgQBRB7CDsGuD5
	ktVsylA+wsRXXZpEj2wvpPFXB5q8y/mnEMj/qwOnA34gzaZjcyjaA+d+XWbcAOrSFMVvPv7/tlJ9S
	Sml6lvA/7IDI7HeSyQUgyy8hpg1rnsoIVZFmW+JPXI94QOkJor8Wgn0fFUp5VE1HnGAJfuhf8NFeS
	D3p7t7zB8Qt2wrrd6e7ywnZp7LNC4U6X5Fhbd/xq8IDFqfbxP3c1UCuPAJI3Nuh4h0GJ3on3jWaDf
	pMeqi7bNBq1Dy6kzliBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo3C-00HRRm-0R;
	Thu, 12 Oct 2023 05:15:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo37-00HRM5-17
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c60cec8041so4288255ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087750; x=1697692550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VumssqyPhV2g3eQM7/n//T8x0MORKj84YM3EuzCDgk=;
        b=MBkn0jxBc+qz9U7McWpbGg32wK+FD2te9YRCkfIDl0FEBFQgHOHZ4gfrCOclCFY9YQ
         WrkHQ6WWV0UtrDvFixblVk1YZTZwzDZk0ztiLqHMONfZHLXr5zsB8FNMyVnDRqNQxhzk
         1Th6ceYbEs0s9M7n5b6AeOxz7SfUoUCvRkgbhfpxu5iiuJdUk0L0g4xl3kaj6PWRUPme
         siVGGyRtHMKSrrGAUvSN2fxejF9i2aMhY1MEd8MlbwP25Rf2kMLk2/x4YyaWj7y15IGc
         mQGZSHi9YAa85c/K4c2U/g4+Vm8Wl7nOVCSOhaOMdZ3X970kvo1Dn0YkpYcXIlY96xIR
         LXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087750; x=1697692550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VumssqyPhV2g3eQM7/n//T8x0MORKj84YM3EuzCDgk=;
        b=FbdOmJxsqboSrg2yJbt9Q4cEct2A+q4/LW9/OSiH1wMvmJOG0ODiulS3NHcSA5nMo2
         n94LCF4F5P4x4Y+ccYY4CkdUadLTKzoqfi2CZUhl+VHEBlrajoO6r3fcBwqGgiUMizgu
         YSF5voENT6KnmAJ8ViCUvJmoLbix2hacTZSA43Hh6iU8Dsono0gM8W7PZ1aV0xzBdYwP
         BVz3eO6IZebdHxpL2FuAkoBpfCZRHvBllp+nvxhOWTxls9vLGuYK79t3FC6HejsP/1ZN
         jCdSkqRdGunva6aBM077ZXLehSoxL3wBptNBxaHQY7Tco61FT5KxfoXd6qCwhKpevU8A
         kZZg==
X-Gm-Message-State: AOJu0Yyr+cHMsGeJbXMVckj2cppPAdac7TTmY7dmfeSr8zXBhNwA71XA
	irXl2/TFLQfJ5AFJsNSj9YPQUQ==
X-Google-Smtp-Source: AGHT+IFQ1W43pn4VQeKIkawEacDc40dCj7u4jClbhdGq+OcNM4Reual0u2XRPGbMPIHdZ7ZptLiBeQ==
X-Received: by 2002:a17:903:2341:b0:1c7:1f3f:b6dc with SMTP id c1-20020a170903234100b001c71f3fb6dcmr23793872plh.11.1697087750172;
        Wed, 11 Oct 2023 22:15:50 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 7/8] tty: Add SBI debug console support to HVC SBI driver
Date: Thu, 12 Oct 2023 10:45:08 +0530
Message-Id: <20231012051509.738750-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221553_384619_2B289466 
X-CRM114-Status: GOOD (  15.32  )
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

From: Atish Patra <atishp@rivosinc.com>

RISC-V SBI specification supports advanced debug console
support via SBI DBCN extension.

Extend the HVC SBI driver to support it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/tty/hvc/Kconfig         |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c | 76 ++++++++++++++++++++++++++++++---
 2 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 4f9264d005c0..6e05c5c7bca1 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
 
 config HVC_RISCV_SBI
 	bool "RISC-V SBI console support"
-	depends on RISCV_SBI_V01
+	depends on RISCV_SBI
 	select HVC_DRIVER
 	help
 	  This enables support for console output via RISC-V SBI calls, which
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 31f53fa77e4a..da318d7f55c5 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -39,21 +39,83 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
 	return i;
 }
 
-static const struct hv_ops hvc_sbi_ops = {
+static const struct hv_ops hvc_sbi_v01_ops = {
 	.get_chars = hvc_sbi_tty_get,
 	.put_chars = hvc_sbi_tty_put,
 };
 
-static int __init hvc_sbi_init(void)
+static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
 {
-	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+	phys_addr_t pa;
+	struct sbiret ret;
+
+	if (is_vmalloc_addr(buf))
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+	else
+		pa = __pa(buf);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				count, lower_32_bits(pa), upper_32_bits(pa),
+				0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				count, pa, 0, 0, 0, 0);
+	if (ret.error)
+		return 0;
+
+	return count;
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	phys_addr_t pa;
+	struct sbiret ret;
+
+	if (is_vmalloc_addr(buf))
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+	else
+		pa = __pa(buf);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				count, lower_32_bits(pa), upper_32_bits(pa),
+				0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				count, pa, 0, 0, 0, 0);
+	if (ret.error)
+		return 0;
+
+	return ret.value;
+}
+
+static const struct hv_ops hvc_sbi_dbcn_ops = {
+	.put_chars = hvc_sbi_dbcn_tty_put,
+	.get_chars = hvc_sbi_dbcn_tty_get,
+};
+
+static int __init hvc_sbi_init(void)
+{
+	int err;
+
+	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	} else {
+		if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
+			err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 16));
+			if (err)
+				return err;
+			hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+		} else {
+			return -ENODEV;
+		}
+	}
 
 	return 0;
 }
-console_initcall(hvc_sbi_console_init);
+device_initcall(hvc_sbi_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
