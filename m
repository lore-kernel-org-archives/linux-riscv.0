Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C5CC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Sa7nugl1xYZhaRNuu/gUSCK7xqzBvPC9/vKyLPTxHM=; b=lEMDb2569wIRu8
	sFTOXbGedO+1vQ/EcmGZ4KTUBzH77kCK4eQD0u4qoL+xwszmItHyFB7D7A1aUtnPrVGpUKyVH+2CB
	qnzTvqr8n6WHbpT633YfYCvN8e2QtxcznbyDyXLLvT/V8GHsyjk4SZBgqMXNIntdKTQNhZN12lAMM
	05Ao2SmMBtyCKwopQvT7MTIBTgFSeCy+lD7TgSUyWJLkIYvDMQYWU10ff2ED9mHg8vA3IhejcJsfI
	cOYF+1sjHhpgVjAktlKEUgLAXhEKo6IvWvpmc/H/1j3LBjplQX7vXIb1Gkg97NC4+Rj/0QkuYPOMK
	j0XxWnoVgMTlHtX/QEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkDS-0000000GnOC-1mOr;
	Tue, 29 Jul 2025 13:18:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkBN-0000000GnDL-1Tkx
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 13:15:54 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D90EE3FCE5
	for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753794946;
	bh=0675nP1c4f7LfG6VM+ssWqBgKXw69YZUUaqh2DpxFLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=pd8qSbToHWh95mouu98j3LTMDVLzrlDgi8DvXDK4UNMCyrdP0FSvAlw57BFFhEPeW
	 cpHVvnXeuY20ROPmnwPe04REcqRX3WJ/fPA5lMrrSjAzeB5a2xA7NeLBgZHIJlqrPG
	 +9NJeJyaulGEyhgRB9jYdjVfZ3eieDU5c4469fEPt/QKtMUEG1j6D0k3hF03ccxQJ/
	 DdXC5iP30VZO/mRGuV84hlitLk1KFUQSvDoh8HGFMId6TUEEkHeK4yExYXF9KaSPqS
	 WzowYAhf2NGdqIbWUtC8d5P/NtrjHjii0W/dgW7rJaoTl5+/hDVXVAdZY+/KpiELNw
	 ne3Uz3cPdNk5A==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-455e9e09afeso19896885e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 06:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794942; x=1754399742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0675nP1c4f7LfG6VM+ssWqBgKXw69YZUUaqh2DpxFLE=;
        b=HtQB47RGWaQscBizqe9NWXrW+tlLhd7EQYIs9PbmEqcScMGN4aKQUAVwdY5XPTuBRS
         tsbmWc8zwLkXdzlRgPKtkX7ygHN68de4zeLjtTNYxq4jmRr6aZCWVTpWp5PKiW9hsQ0l
         3tXRbXz+DvYQOuRKrOh5ACOJiUGbWfcG/MNC68LXLuQ76V63x0jqUzWs+PfqmcghDVZ+
         ACeq4jsjrpfEHF15Gt+BzJZhiyiN6ysIa+DStzjXktN4LlOT/Op+XevKLh1kgAgztuFi
         GKQu5n3NMF1TwK3uONRE+XT6TYdtKvRxHk1sn0iNTLoQlUCXj4dEt6ieGoK0p0QP+xaR
         oU8g==
X-Forwarded-Encrypted: i=1; AJvYcCVc8emQEQJeayiWS/tNxC0E03FPgMgeJWa4HhexvHtd0hPZjZxjYVubH3qA29kKcwPrmu6ajvGvM7ScnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqFNZ6wAGR+RLYtmhjg6J9C2/ckuxDpkCeZQbaqzV68mnNcJGe
	tyZgBNsSx5z5FG1NTm0C7BQ9scELSCeq5uB89hJ91w1W4KipNAPQbdNSab03MtB7a0IAQ8ppTyg
	cRsY9pObivqnUjIQeedNrxy+Dlk2jX9fwTuN0Y4csvwQ1XuC58nJtnMESoAUzqIu0qYzOXokcpj
	JXprczvkNDeg==
X-Gm-Gg: ASbGncs4atiMaR0AxI4SNzdn5bx+bLDlCvohJjQPgjZLpSc7gx6qq5iGJeIyrZ2v7h/
	1hBkPmHmri8x28ZcEa9bA8HsvBgPgyJgnA/uNaW5WxNlVlWNsjnPPwXvLDvZDMBX73xcWp4D7O2
	TCxfqnndHvL9TBPx8v2c+m3Fn5UiTCnUANzuPSiUq4ndAm27+d461eZmA2faBk26qL7eaBXLnL0
	siJOevKHdGFSjb3dDxNHfvD6NgqyE2MBL1gSWir8iYg6a7LuYklmMXistaELjzCVTJZiyuMMrhd
	vU+e8IRVXJOaSx3Ywp29nWXt1YLD6FTMlmHTkO0BTl1dgd1GWQx/WpkojhrduzzBJEytV6oA6Yp
	iz9arxBXmNg6T3Iln/YKSuW91i9+7ZA==
X-Received: by 2002:a05:600c:3510:b0:456:2698:d4d9 with SMTP id 5b1f17b1804b1-458762fd2acmr137350695e9.3.1753794941860;
        Tue, 29 Jul 2025 06:15:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZvwVRiKsT7wS30tgGHiJnVmDKGNcXlgxTTqdd4YwYAyoY3NMdFL5ZkFUfhAD5/m/bpZyuMQ==
X-Received: by 2002:a05:600c:3510:b0:456:2698:d4d9 with SMTP id 5b1f17b1804b1-458762fd2acmr137350395e9.3.1753794941456;
        Tue, 29 Jul 2025 06:15:41 -0700 (PDT)
Received: from workstation5 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb9bdfsm12024338f8f.20.2025.07.29.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 06:15:40 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/2] RISC-V: ACPI: enable parsing the BGRT table
Date: Tue, 29 Jul 2025 15:15:34 +0200
Message-ID: <20250729131535.522205-2-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
References: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_061553_517253_44B8057F 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel@vger.kernel.org, Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The BGRT table is used to display a vendor logo during the boot process.
Add the code for parsing it.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/kernel/acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 3f6d5a6789e87..71698ee11621a 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/efi-bgrt.h>
 #include <linux/efi.h>
 #include <linux/io.h>
 #include <linux/memblock.h>
@@ -160,6 +161,8 @@ void __init acpi_boot_table_init(void)
 			early_init_dt_scan_chosen_stdout();
 	} else {
 		acpi_parse_spcr(earlycon_acpi_spcr_enable, true);
+		if (IS_ENABLED(CONFIG_ACPI_BGRT))
+			acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
 	}
 }
 
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
