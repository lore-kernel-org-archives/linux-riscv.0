Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D0EC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxUoBfu5xXaN5YTWAU/Ln4fIMUMOq/5avzS2zn69mew=; b=uz67SQxV3OyiBc
	TfvwuGFYsBFL5Okiiz8vLO4pXJIKMw/i7jy2eWWh8CGlIDqoZ9Q0Ox66oyqgKAYtBrb5eD8rh0yqH
	BvFUKtRKheUWD2yw9sAf2E31wUzdVvRRKfj6v8w5sn++mGRYoOe4YeYLG2AKRltkhZSfwk3labJyY
	VvtI6jx0HljbJqKgmoLAKCLulboc6VntMIaMNCEia8+WQu7bYVX1BXPyCWRM0221fmLXwpWbfDiIB
	S+NJNggzwUGrdWKuT+JS/BMzxktaew+KQkvIddZ81dT1EYWje5y0KlmrLTSz4kEdPNxI86P+6c8l3
	mTAYVK0SKoaUTqYH2Lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjq8-001QVm-2V;
	Fri, 20 Oct 2023 07:22:36 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjq4-001QNq-2J
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:35 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1ea82246069so346629fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786546; x=1698391346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRerAerNbb8Gix3xbbzThpKCfwsEd5HQVNj+VzWX/14=;
        b=M7pttKomrGE2ugAYXP4SxzJEf9SB5Sm95fLX23Xb4DGsuIPOLwUBQzeXfrgMnJizky
         lP4hM95SbYk1cNxzHDitUoVM/PMfb9bzltTQzH69/7zV23HVav5rbfUNhYruSTlv9xMr
         Pb35FZaI/95SC2TPCriDGOjrpnBw2mcM8OaeOewogrm5lrLkT7LCVWZx8SRsOZzvC050
         fi6S5p9d42cSsIt/Oi+AQ7j2WdWkqzpA26b+567doi+FujYDt57caK0O74ENWaO4nNmi
         41Oao8nMQzppd8xowpwnHkNsu9a0Yysnr/PjMgB3UUT15IuRQUEf9BbPN2pX5FPBque3
         oWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786546; x=1698391346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRerAerNbb8Gix3xbbzThpKCfwsEd5HQVNj+VzWX/14=;
        b=NfQ8o+xRN8wJppcXwOIgYjSj61Fhv4UDb8UImgrQ8wihus7hra55nH/ZKggkIZqUFu
         enVgMvn9wQLgr+zZrYWtJ6XCHs+A7l1PbixJ897dUGvAD8y20uxoTEX/PGYewZRaUWVI
         kHf1p3q3dHxwySkv0KGtUwy/HUpbk+H7mtlQIhNJWDTTdT8XZp8tZWQvA89FcXCk4OGz
         kER1cK7HzoHrPuyOczl6gtgY5WaU3VKfPEUjSA15mI1Po7ccU+36wUXp2TyD9QeYjMSm
         7J8lv6lKP7ATn6yNKRjlNXGtkGG3Q+lp5Ttm33sqJZD+VNXHVHJ6M3ApiXHFVVgfIkJX
         v5Ug==
X-Gm-Message-State: AOJu0YzfW//59n6P3weY9hQkoAIkEoMJ+CHulhcnxC0ybHMGzIEx+tjq
	v97M/ixBJa5kVlYiA2As7hlYpw==
X-Google-Smtp-Source: AGHT+IGbj7Rt6bShDAUFanmC108dgduwjhSl0KgUP8g8u39xhZmpikUXzy5ZBRKEXuN+qk48Le7mXg==
X-Received: by 2002:a05:6871:5225:b0:1ea:2ed0:2978 with SMTP id ht37-20020a056871522500b001ea2ed02978mr1202977oac.22.1697786546202;
        Fri, 20 Oct 2023 00:22:26 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:25 -0700 (PDT)
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
Subject: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
Date: Fri, 20 Oct 2023 12:51:39 +0530
Message-Id: <20231020072140.900967-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002232_766521_64910E72 
X-CRM114-Status: GOOD (  16.01  )
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
 drivers/tty/hvc/hvc_riscv_sbi.c | 82 ++++++++++++++++++++++++++++++---
 2 files changed, 76 insertions(+), 8 deletions(-)

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
index 31f53fa77e4a..56da1a4b5aca 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -39,21 +39,89 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
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
+	if (is_vmalloc_addr(buf)) {
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+		if (PAGE_SIZE < (offset_in_page(buf) + count))
+			count = PAGE_SIZE - offset_in_page(buf);
+	} else {
+		pa = __pa(buf);
+	}
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
+	if (is_vmalloc_addr(buf)) {
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+		if (PAGE_SIZE < (offset_in_page(buf) + count))
+			count = PAGE_SIZE - offset_in_page(buf);
+	} else {
+		pa = __pa(buf);
+	}
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
