Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384AAC02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tg/WFKwBENAhcrrNZQAvXqVfcqVvBAVS+T9OMzWYOUg=; b=g9EJiq/OxJOs3L
	x5ctMENNtnovLoDuNrDVU+QQ7PIazNU+vkKxKjfCFEGzIZPQ88njyjmR9VXvrnukPcataTqmLEybf
	K7Pg1MLvyZ2HedrLmJM1vA3vPkMvdj5vR5NcshA1QvnuBUciynezQhcDX1TkjVQ18nJhxu0XkfvpS
	uEervNpQIUv08qydAECnZr2VthiJPZRRJVxvNu3iEkLE4gKsfaml4hIaOS975RVQtqKjmt979VWvX
	GW4Hd54SGhthwavd3oKXvbJcoaouRkxTTvHVp8MTx97HLj832H5rAaHbiVw2T+31Uvouy3uEYyPfZ
	ClYG5h29cnfWamKG5yKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1ou-00000006OuS-4361;
	Thu, 06 Feb 2025 13:21:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1nC-00000006OQC-2DLx
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:19:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f48ebaadfso1712895ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738847978; x=1739452778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPBkQVcozPH35+SMd7YDKRV52t6xM/qA7YaAmlBFzAE=;
        b=hqB2bv4E6OWvL/WmlzPZw/0lRFzyyu0yXJIsWD3kaTXyz2AzZlrw/zhnQlU954FuNP
         1a2VilQqWBUHR1WLw0o9TPFufCqjUJeoehpeLCainy8/dj+2NwFouxSl2yBAA6DNUTgh
         tvO6OLezcmAWQNwfo7z3imJf2Z+jgy8wJ8DI2xrBRd5wmNzRG8hJJv2onZEgbdBy7Rw1
         LNsgFCmiBgwPLHIL/JfNJD5qiAMjlUcrqFDZp/P/0Am0aiDDcCqGz/Kg19uvsf/1rxp9
         ROusgmk2cvHege9puMWy6FCFkrJBBF0YM0rU3X3nON9j0QiOj4lGWrbc84ZyQyjwxRCy
         lkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847978; x=1739452778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPBkQVcozPH35+SMd7YDKRV52t6xM/qA7YaAmlBFzAE=;
        b=UOsyfJxicc8OF6CSSJs6FS6poCyOtC+XlNXCPGwpZJGo+ZdZIMG5cFmGMwQER7KDDl
         UdOzh6DI6Z0BT2uWLME1fnOg0mMc72TlMfvcJksZ3pvQuME52O4xaOYqCN/Fw2EDzQkt
         NCMC9+4MyA2NJ7qBf2CFHwKxEesGbt4FxYepZPh+qKqETGtjKyk3W86XeOmzF3LDrRo1
         o6Bw6d8GSzPl75d/hRUZ1uf3c1QCfuh4qJ7+wsn4kx97JOsgwmynnrpzWAV10ZXLWF3t
         TW2O11f/7eTduFC8kAxMCvwTzEVawUk0MUJfqbpgJjZOdPtrIoVtlTWMJUZ6j+nqmRvG
         IVEg==
X-Gm-Message-State: AOJu0Yx4WaK8CIOgOXfuwKAFKwiuQHg46y2TLcF2hMr4p0bISenYIsme
	6afQ7ZE1H1OFwndsC54lweRwQH1dtlw90eG1B9iTD7DbB0/DZa4LNM36csP9KxQ=
X-Gm-Gg: ASbGncs9gKbOBA+/xuVKgbRdxQuykGd0W/We7bWH5USI+YxszVBnsFc+iHKqWkzNNcn
	4EN+rbjXFHCXhHqlZll5joxHArXGT4NLb/Sj+sv8d0ckTFvNinLuXmVWdcTYaBiouMZPjtLK67E
	6LK2yNoQb8LXt799Zf3kn3TsTvNVZ3TJL096ek3eJbWFusujSDT2kY0MIgmWeZFXbs/cUMOl4Rl
	EFzAaJ8v3Mt1ZWCa+qCTdy8t6Kl5GE3V1BsVeeWOGBTANn6UtsY3pfEq7T3RfDh7L32bll/hEBK
	4G5AB97l9xNpEjNq7g==
X-Google-Smtp-Source: AGHT+IHeug9cYWBwdxegaLKcOfC/AYX//xp3oimUmbvosm7CRYX6S5ANS8ab4mETPqqD02YJJ1FQbQ==
X-Received: by 2002:a17:903:1cd:b0:21f:1521:42f with SMTP id d9443c01a7336-21f17f2a696mr113150885ad.53.1738847978566;
        Thu, 06 Feb 2025 05:19:38 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.19.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:19:38 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 0/5] riscv: initial support for Generic Hardware Error Source (GHES)
Date: Thu,  6 Feb 2025 21:19:21 +0800
Message-Id: <20250206131926.91289-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_051942_571937_FD1482F3 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
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

From: Rui Qi <qirui.001@bytedance.com>

NOTE: Before compiling the kernel, enable ACPI, APEI and GHES in menuconfig
The following options must be enabled in .config file.
   CONFIG_HAVE_ACPI_APEI=y
   CONFIG_ACPI_APEI=y
   CONFIG_ACPI_APEI_GHES=y

Through fault injection, we can see the following example output

[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 0
[Hardware Error]: event severity info
[Hardware Error]: Error 0, type: corrected
[Hardware Error]:  section_type: memory error
[Hardware Error]:   error_status: Storage error in DRAM memory (0x018d8480019304f0)
[Hardware Error]:  node:0 card:0 module:0 rank:0 bank:0 device:0 row:0 column:0
[Hardware Error]:  error_type: 2, single-bit ECC
[Hardware Error]: Error 1, type: corrected
[Hardware Error]:  section_type: Flle error
[Hardware Error]:  port_type: 4, root port
[Hardware Error]:  version: 3.0
[Hardware Error]:  command: 0x0146, status: 0x0011
[Hardware Error]:  device_id: 0000:00:00,0
[Hardware Error]:  slot: 0
[Hardware Error]:  secondary_bus: 0x01
[Hardware Error]:  vendor_id: 0x1e93, device_id: 0x1010
[Hardware Error]:  class_code: 060400
[Hardware Error]:  bridge: secondary_status: 0x0000, control: 0x0003
[Hardware Error]:  aer_cor_status: 0x00001000, aer_cor_mask: 0x0000000
[Hardware Error]:  aer_uncor_status: 0x00000000, aer_uncor_mask: 0x04000000
[Hardware Error]:  aer_uncor_severity: 0x004e3030
[Hardware Error]:  TLP Header: 000000000 000000000 0000000000000000


Rui Qi (5):
  riscv: select HAVE_ACPI_APEI
  efi: add riscv APEI generic processor error printing support
  riscv: add fix map index for GHES IRQ
  RISC-V: ACPI: define arch_apei_get_mem_attribute
  RISC-V: define ioremap_cache

 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/acpi.h   | 18 ++++++++++++++++++
 arch/riscv/include/asm/fixmap.h |  3 +++
 arch/riscv/include/asm/io.h     |  5 +++++
 drivers/firmware/efi/cper.c     |  4 ++++
 5 files changed, 31 insertions(+)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
