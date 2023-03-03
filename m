Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F53BC678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbVi5xTSn4nfGC9iMpHvZD64jCLVXMWLKTrftKvAzEw=; b=YShAaBtD95UAyV
	YewjXXn4Gavk7qj+9dp2921JUSBrVuVcd4brgSgBxP5U3Qf3siP5ARxg0EZFTsImgNZdOr3i1WwD9
	QuaxsuDCH4soy6fLYJZFabg8FFdDeH/JWuzHl1pSZg5c5AEAyg3HedEz8RO4q9NRfaZ/UZyzyxt9w
	MJc8aXNOcDGr/Dfl9RCUKDttHe2VdQNa+MHz19TVyqZ0dw1atQDMGRGTrvuqXbq4yUZK+1T1EzVQ8
	nJ6l0MORv8ZbD3bCxDqhY0f+svJGLtIYBiT6lk3NPm0lbtRVRYXKILGWtg3bg/SaVM0sAE7DcZ1jK
	YsS/Fy2oDRxrDL5KN/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bT-006TLz-BM; Fri, 03 Mar 2023 13:37:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bQ-006TJR-S8
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso2315157pju.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pi8xH0IxXrFGj4CxsC9boyEOiTx1Qa4CmKA7c/Mr88=;
        b=ospJEN1H+o62BETHuMHU/j9Q2xjVV+b+WkaZuGnP3T/+3pPt9ngIgnJeGsoBFW/TO0
         6hwXGOXmHiK6F4logs+p2Up85lMfjy7zUU7DDihJAoUad7IQ8acc6QgTZ/12/ZcvcMAx
         f2SRlvk4EDhFMhYjuxKm8I5zvoZOZVqOYZbmqZPXznA6rWLgNPg6XvSxRXLjp0yK4014
         4sgcyZrl7Os6aroKX6L/49uK+6PgZ6tA98MFBqPc9KNHk9nagm3iUiBc0pepZ+qfWSIl
         AMFj2DMCJZ82vffzVKpYynki1Q6XU9ob/ThV79YCGGgi8PFMsbu/YYP0ahJM7K1X6wjJ
         jDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pi8xH0IxXrFGj4CxsC9boyEOiTx1Qa4CmKA7c/Mr88=;
        b=ZzjQzCXKewM24EDL1IXHXSYBo84/XVctRuDsCw3QKMDg8KoiA4dmQgdryxH+eweuyJ
         PIUVU1/b0+8E1ZKsAYPInRkR16LoSZ9qWa1m6Sw6n26h6oPMa7XACRhWdxCkm6Jed/3e
         nCU/1ZZ43gREMJWMBZX2pCII96mcRcu+h1PwVKZC29ckM2rQ5XrCnRle6O2rUaer8ltH
         L8JCtAwFhBeovDrEMPofn/yn6ZwBr1FJqO0BIY74rAh0plBHgP7AFr03FZgsf/rOsFAS
         PvQoPbdHfcLCnoOuJj3qV/PNO0R0X4Fm1AZ+EPKVStvIpTms9pI+Xpx6VlXtZlfS2RFA
         olYw==
X-Gm-Message-State: AO0yUKXOtPl+mKDe9BxwaXFksXA6I3YPJdRU802zSUPYQMtEkntiS3AL
	12agy8jMuX2qlY9yXG9qmboi4USbglUnmmnc
X-Google-Smtp-Source: AK7set/n1ssQQjUjID0NxGei92GK70/GndvtpN5XR0Ch5wvj7TQe8/xVBnKzQ9qiTHpWUDkc1vrL3A==
X-Received: by 2002:a17:902:a9c6:b0:19e:7c33:3722 with SMTP id b6-20020a170902a9c600b0019e7c333722mr1673766plr.40.1677850658806;
        Fri, 03 Mar 2023 05:37:38 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:38 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 09/20] RISC-V: smpboot: Create wrapper smp_setup()
Date: Fri,  3 Mar 2023 19:06:36 +0530
Message-Id: <20230303133647.845095-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053740_932769_B5AABC1C 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

smp_setup() currently assumes DT-based platforms. To enable ACPI,
first make this a wrapper function and move existing code to
a separate DT-specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 00b53913d4c6..26214ddefaa4 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -70,7 +70,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-void __init setup_smp(void)
+static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
 	unsigned long hart;
@@ -116,6 +116,11 @@ void __init setup_smp(void)
 	}
 }
 
+void __init setup_smp(void)
+{
+	of_parse_and_init_cpus();
+}
+
 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
 	if (cpu_ops[cpu]->cpu_start)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
