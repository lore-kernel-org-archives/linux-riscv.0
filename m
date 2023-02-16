Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCF3C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ru3TiLYzNqZccs2JaKgUF0LrqyHC0OTqQQrCTxV4yZI=; b=RFSxuqQZi0orlO
	LECURuhzDmTJFf9AJGz0tyX/3JzKmha8n1mkyCgsWb/UPO55Hk+0R5w9fuk90IurCeqbOrBW6JDXQ
	Q+e0PiyZ/+pZISbka4QX55aBCdQ8os/xb6VBC9HKGwx8O0kxsh0zm9ckb1en7ZfyOxNHRmEEFrpJi
	u8v5hPLiQxYen/3QStkmWGqD+K3UpI9M2NRe3F+s3kuqWnYqfrTFqtOWReQyYbPyYFZCL9AGO8E5L
	K56SgRZg1cGOtechkmPQQ8CkPPFhdRcHwiwXTZfWMb+8ZAPvLISAHg40WYEK9ECXsGgFtdS0tlIVs
	YVv//1UTnAbSt+oIHfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSivP-00BVcs-65; Thu, 16 Feb 2023 18:24:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitt-00BUXr-Ue
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:22:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id bt4-20020a17090af00400b002341621377cso6729010pjb.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc+EdRzJ0SRGUPyQRF18IAjDuJpqdPevv1iUeqHNSDY=;
        b=MT+u6Ji2DSotNL/3ZJ31+4cfLb/HUgIEAzHyb/4A3W3hXKL7CuBMT7DFaf8PRm7cRi
         hkX1t1QcAn6Fsh4g9bblEZv+ilGLrh4phGy+dWKqmPb5y5cpQtlH3TAu+YOU0SnV0Luk
         HDucHKXRMGxNFDuLtGBJm3I9tnzVAAQ1MUc6DNMO077XW2R/1eEDaW0Jd2emJHRAWPjM
         HGm8QIKeax6/ljYPvC/5GtfUEcuV0hqZzqfkU0/3+9ZK0znENu0rEkld1JzriqhbZHHh
         XyGAE624cdyEKo/bR2ibxnm20fA1861ECmsz+HbEDZY/Me4+oPLiv4hAMXBd3+rQsqSP
         LmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc+EdRzJ0SRGUPyQRF18IAjDuJpqdPevv1iUeqHNSDY=;
        b=e8K8/2K05NqLq9p8pYY/FeSbmhLv2XjdL980XJWgn3Uv5ZsJIJ++GAMDDggAZTmQQk
         qQ7bWZxeNcg5FoAFUHms4E9Lw09Cy46XYIQALKxoD2MzxECWYPGWG6n6gI9z8+ae/zgo
         y+v8OLbrTOZ4jhjawtzuLI3tMe/HjISp8Y0qSjk7L6AEyK3K/uyTAZ+id3TxncSx6KOl
         KsSqeurTBqWzMlsSU3aQ8UKjhZGchHzG95DLLZJxHtNsws/SfoZ5YZGLmxs70glueIN9
         jn5J2zhhtEyjyaMAIPoeKEmlOVaX0dMo3c234Yhd8TspoP46ViqwJcXeL4NllBUs5C4n
         iedQ==
X-Gm-Message-State: AO0yUKVuZUx6wRCjUJP0dgoDT5KeY6QzI1kDS860RCClT4N9/3MRZblB
	a4XrFIV+kUnNAemb0RCskSJk0w==
X-Google-Smtp-Source: AK7set9M9fF7YNnpHhSlQVgpgwmmQbyWXyDh9qg54yswDsPTDVjsTPAME9mc2ETjA4Y1JYejJYwZog==
X-Received: by 2002:a05:6a20:d49b:b0:bd:278:f68f with SMTP id im27-20020a056a20d49b00b000bd0278f68fmr6832215pzb.52.1676571753281;
        Thu, 16 Feb 2023 10:22:33 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:32 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 21/21] Documentation/kernel-parameters.txt: Add RISC-V for ACPI parameter
Date: Thu, 16 Feb 2023 23:50:43 +0530
Message-Id: <20230216182043.1946553-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102234_048320_B3689037 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With ACPI support added for RISC-V, this kernel parameter is also
supported on RISC-V. Hence, update the documentation.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6cfa6e3996cf..b3a5a5844daa 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1,17 +1,17 @@
-	acpi=		[HW,ACPI,X86,ARM64]
+	acpi=		[HW,ACPI,X86,ARM64,RISC-V]
 			Advanced Configuration and Power Interface
 			Format: { force | on | off | strict | noirq | rsdt |
 				  copy_dsdt }
 			force -- enable ACPI if default was off
-			on -- enable ACPI but allow fallback to DT [arm64]
+			on -- enable ACPI but allow fallback to DT [arm64,riscv]
 			off -- disable ACPI if default was on
 			noirq -- do not use ACPI for IRQ routing
 			strict -- Be less tolerant of platforms that are not
 				strictly ACPI specification compliant.
 			rsdt -- prefer RSDT over (default) XSDT
 			copy_dsdt -- copy DSDT to memory
-			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
-			are available
+			For ARM64 and RISC-V, ONLY "acpi=off", "acpi=on" or
+			"acpi=force" are available
 
 			See also Documentation/power/runtime_pm.rst, pci=noacpi
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
