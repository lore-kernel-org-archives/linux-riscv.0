Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87716C47071
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 03:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNaLYcS+HfQYbrGe7WtyhHOE0NpyV+tSk2gqgiJW03o=; b=XuwmQbXxcIHV7Z
	kT5/j9pfqc7vqaxD1ufo+abl9UdmAYFsgn/RnkVfQeY65LDQs34RZZkDUjiKHYmARzrZX8+T3H/33
	pbuEEN+lZs5mZ35tqUG8CEA3kBg6jEt5ya1QpPOxMbym2p7g7TwMmM00tAftQPi0cAD9xfVDeHIMu
	/WDjyW7a60HZ7SEX6jDIMpBLaJTSlQbpcUY9FOW0dTebFtL6rUCtC+J2eYLD61E8EXjCjO34nDIye
	qwdKQjjqumxIrNcE+p2EECZTDH71pw0I2pwhtKZXvrWIO60hcRSCnnLcfsCFFfsveD6XNwMwIHMaa
	sSXMVXG/kXQJIMxNmC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBR-007n6p-2q;
	Sat, 18 Nov 2023 03:39:49 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBO-007n5Q-24
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 03:39:48 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-58a03280aa7so1417813eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 19:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278785; x=1700883585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5CqYtZjogFbVXt6oNqdtFyBl6EwNFmDaHiSS35XtX0=;
        b=VZ4OsEiknW4t9Ryqf8duIvljVySREpcRx1ALOdTA1nl8bhLvGLnby9MPLOWlODCwcd
         1fji1FWv++jizBnX0KvuzEuCucaX/oqHD4yxfg0fYet+9t1ccijAKA2MtUZM1ivHla/s
         xnnXV8I6KgKlVZJHXVENb1UrnY13ZMSgNlqtPP7HAcfoMghoo5F8BBZ0oxTMl9WpFpQJ
         fcpUO0gV8HmJa5ko56DpFisuqPXSD6WGlHP5eCGDxF39nxvTf3xSpJRnUneqJBDBKelK
         uqNYgePsarGtI1DTa8Ll7RfLYsDFK0sX4xgew55aFS8BgyneZN5jmxGbLi6Xm3tOKFrb
         vevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278785; x=1700883585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5CqYtZjogFbVXt6oNqdtFyBl6EwNFmDaHiSS35XtX0=;
        b=Y+Cu8nvdgJqQvshMAgqVyE0VmUa8QvCO/s958bBPFRVYNHCTatO25TEt+h3W/0cKn0
         HOxbcerXZ4l4IdHrUst5rfnM/IsBRtYuAzUn9kQo/xbfiEKtlIp6r29asQPP93Dlukot
         3xgJwUzgQnT2Nha+46vrjohQRmjrh56qrRn9ymSDcafBiHBUWtCafl8DP3BvlnWyKYoR
         WeThrFUKtpJQndY35hlymUihuzWwZZoNAa5LwCxEHBCIZXodb6rzVRe+donzLg9vtdGt
         j+W3Ea9VbaFQurgsvOTADxQaeTgyXiCBFdXy5l8r2KEOqXC+jaVd+J7E8SKdy+rwS8BI
         yKdw==
X-Gm-Message-State: AOJu0Yxs5RVZ0JGdlyn1qu5J4hphH/46tBd/NaSmHRZfGbQ3K6s8LFyr
	ZyUYlhpjZm7NGeKV4yzMRuiONg==
X-Google-Smtp-Source: AGHT+IFb5EggA2BEK2LPl8TELrC4wgaMj8P7ee9t/caB/1Et1jdB4N8VOhdF9KYDfMnGJFJ+eqIzWA==
X-Received: by 2002:a05:6871:728a:b0:1e9:9867:247 with SMTP id mm10-20020a056871728a00b001e998670247mr1437835oac.47.1700278785270;
        Fri, 17 Nov 2023 19:39:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 4/5] tty: Add SBI debug console support to HVC SBI driver
Date: Sat, 18 Nov 2023 09:08:58 +0530
Message-Id: <20231118033859.726692-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118033859.726692-1-apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_193946_676849_1B6888A8 
X-CRM114-Status: GOOD (  14.54  )
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
 drivers/tty/hvc/hvc_riscv_sbi.c | 59 +++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 8 deletions(-)

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
index 31f53fa77e4a..697c981221b5 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -39,21 +39,66 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
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
+
+	if (is_vmalloc_addr(buf)) {
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+		if (PAGE_SIZE < (offset_in_page(buf) + count))
+			count = PAGE_SIZE - offset_in_page(buf);
+	} else {
+		pa = __pa(buf);
+	}
+
+	return sbi_debug_console_write(count, pa);
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	phys_addr_t pa;
+
+	if (is_vmalloc_addr(buf)) {
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+		if (PAGE_SIZE < (offset_in_page(buf) + count))
+			count = PAGE_SIZE - offset_in_page(buf);
+	} else {
+		pa = __pa(buf);
+	}
+
+	return sbi_debug_console_read(count, pa);
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
+	if (sbi_debug_console_available) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	} else {
+		if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
+			err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
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
