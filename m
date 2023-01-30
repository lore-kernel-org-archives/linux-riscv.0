Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF7AC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7i1DTLF+h+jxuPohyEAHYIvM3yfVg4sBn5kT0l3dzU=; b=0fqLV9l/J06DzW
	ASVyOJK4jwA1Fo0rl8BDtcjvltbXlUWGf6VBJs2cikbu+q7xasF/GXuExmq65eR5qMBdY+dO40YuH
	qfkAQCdwo4ICpD1HUX9Lna1z1BAolHSefeC4IgolQiBJRnnUThCh+8MblFzHkIs1bYqLYWFxf7bLJ
	6t/kv8gzLiYHWKsajWSbHqOjZBIZnDXKQVBruZdrAWOIdFuvihWhysbHoDwfKRyyvDqYgZXFjLlog
	4coJh9CfRv9RXOxKXKqVjxYXnvrvgIl5V4YILsKYdFgPfkj/tYMAH0Pdvsx6rff53tisFpBD1ruJs
	B/9FnQIOil0s2uZGmSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYrw-004zCv-42; Mon, 30 Jan 2023 18:27:04 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYov-004xKe-90
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:24:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id cq16-20020a17090af99000b0022c9791ac39so4007955pjb.4
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjibFpTqTShjczIJbVTkz5RGTuyNmy3y1G35vLo3EEc=;
        b=JIG4KdNIJo8a8e5DcMOlWOMk+SMYfFyg3Sc1+T9cyo/r6KA/knBlxhzkv6TiGdCEFh
         QjO2PFJXsESo+8PMKJwelpLyT4Vo86Khy7c6Z7o6X6a33TuC+f+kT9LsGwllBf2XqEK5
         IEDoGCJNFCrY9/SkFjrWHgpKsYV1CNUXGhJ9Yn8evGLV6bv8sgnDZ0PIaPdedoyRjbLR
         ap7ZG6XW24t+kvvZedK4Buw158HCC84yxTP3DRLno7tqS/f+CTP6IZBNL1IIp28NwGhD
         sUunUcy8sZSCp8pqwKkOULMjeoXPWWA/ga6VwWeMZvqz37Xp18dsvJX+07/zKlwpRN5R
         uRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjibFpTqTShjczIJbVTkz5RGTuyNmy3y1G35vLo3EEc=;
        b=V66DbJ84nPsBRvhduz5yVd1kARnZAugHzkCkxsWaeF+MG5DYs0zsjQG9A6kJnpB0Fl
         8vjB22/T+Wz6fqWeXYRq+EnhZ7LCm2JSZK/wnAI7dkOUgtGZn1yQuLdktlMW9nTjlCyX
         UwPakJ9KR4ywqflsU0CkiXVaofaYtUCYqxY8evLy0BtEQITprf5mTCbjxHE3r/cei73N
         lICnD81vCIVtlq668pnSDD/a5ol/OqxbcKbsCgaFlLQMABhbuZfJfmqB3WA4KdKizne9
         A5JY9wIDYmc0bd+zTvTWGBi/dCpJey2wtazqplLVMqGnmrakAEfsYaewMi/MuePtFx3Y
         8XYQ==
X-Gm-Message-State: AFqh2krWzu0A0xf3cttMAiEZt817yEKdAlnrOu2XwxNy8l/a8kBF11yX
	yKu13Bp3Qs9tALeVaJhuCRvg3yd2eKYe+T9w
X-Google-Smtp-Source: AMrXdXtiX8G638QNxJdbmXV10F7Qf0CdgmUoIWBv0Ar85IkvXkqVVNNpBrhVhN1ABIlikG/btEedJg==
X-Received: by 2002:a05:6a20:c706:b0:b6:c018:7fd8 with SMTP id hi6-20020a056a20c70600b000b6c0187fd8mr52692395pzb.11.1675103036632;
        Mon, 30 Jan 2023 10:23:56 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:56 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 18/24] RISC-V: ACPI: time.c: Add ACPI support for time_init()
Date: Mon, 30 Jan 2023 23:52:19 +0530
Message-Id: <20230130182225.2471414-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102357_364257_25479A1C 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On ACPI based platforms, timer related information is
available in RHCT. Add ACPI based probe support to the
timer initialization.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/time.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1cf21db4fcc7..e49b897fc657 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/of_clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
@@ -18,17 +19,29 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
 void __init time_init(void)
 {
 	struct device_node *cpu;
+	struct acpi_table_rhct *rhct;
+	acpi_status status;
 	u32 prop;
 
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	of_node_put(cpu);
-	riscv_timebase = prop;
+	if (acpi_disabled) {
+		cpu = of_find_node_by_path("/cpus");
+		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
+			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+		of_node_put(cpu);
+		riscv_timebase = prop;
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
+		if (ACPI_FAILURE(status))
+			panic("RISC-V ACPI system with no RHCT table\n");
+		riscv_timebase = rhct->time_base_freq;
+		acpi_put_table((struct acpi_table_header *)rhct);
+	}
 
 	lpj_fine = riscv_timebase / HZ;
 
-	of_clk_init(NULL);
+	if (acpi_disabled)
+		of_clk_init(NULL);
+
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
