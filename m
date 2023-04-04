Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED6AC761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbVi5xTSn4nfGC9iMpHvZD64jCLVXMWLKTrftKvAzEw=; b=ZgWe2Z4Od0wTzk
	VmJDDKO++1H//swyrcIdofsFe7bd13+JQkavVmIHABPaFXUcn1roOmnJqV8h4Mdy2O/U56XpQWhzT
	upXCz4PNiSoIqBPavCEQbgSEshnLnNvDjE+yhPFnJxkBPlK6QJVx9TB/ToNfMVJZujKa+MSYEe6Cx
	kbKsGHR06rgNzZMzrgTwtCLMeZW+PgMFFQFBSYQR6XmBfGh1Svn1TFKSeOvyMjIa3lACgyabZpmmF
	B8hjGYN99o/M86rM8mqclDLXWSUZ2DCW1J94hfrcRNDLpgA6PO2LIiu3jedMrRCbB1q/gS5aq8ZaS
	HJ5mB9IuKgT0UywvPFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlI9-002U8Z-1d;
	Tue, 04 Apr 2023 18:22:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlI7-002U6J-15
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:22:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id u38so22038353pfg.10
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pi8xH0IxXrFGj4CxsC9boyEOiTx1Qa4CmKA7c/Mr88=;
        b=NrI6ACm7UZOJVCJyBc7mGJGBLfdlM/PTYp6L1vM45ahDVRivroqAt1FE0VHGOEA6E6
         80auVy44DFfVDm1tzMTK6mVz+Jlugq9sYp5hzIoM7XQr7unFo44/VWi2WLq3y8UPCnjZ
         T7oz5OeLMLXiQXUo2ZYgOJ3jQzLVq4z6Z80U3D+fvhU5arvqAPwfwFuONY8dWxgFahDr
         aiwy5PM+qx3mahRPtLj0zuXUwGdgcUPzLxiSXBW7+4RUzVr09/9rUtmt81/t75mueG5t
         yTMGMn5wiW6RERH+pnqQAqUsMYQh8ESCsnkuTVukq1xoZhVaG+3NZq8dZ92Om5J54M2B
         P/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pi8xH0IxXrFGj4CxsC9boyEOiTx1Qa4CmKA7c/Mr88=;
        b=HdMa490hxwhKdYwU3by2TnoHLC4dtPL1MsaW92DfMm+Z9kfBXeKcJ41KmTKbvEfBZG
         +42Xae7q36pJBBCkaHHAEMJX6W3MQUt7jpmNp2W1DegQft+dF0Uh0H4aBb0BRLczX74o
         Sih9cvhhqQkKi1f3bc89CUcxJ0KKPHjsdHvzNTB9lRKMBI0DfPq17ioDSzMLiTJUuSPE
         wXIvc6ZGVCm4R7AVjc9jeTrCQ/ncvIWi0KqYRd2YhUVhkxTf7OM2bhYRg/morLI6j6sa
         JMs+tG6d2dO3vAtphfhGLkAm33Y8e2zIxnCvtm+UOan/RqUSGKJVuikaxevw/I+qglH/
         P1UQ==
X-Gm-Message-State: AAQBX9c3uKjpV6I9r51exbhoxaAC0ymHPEkp4EIjUhzhPyNSyHRYO7wd
	HaWSEB29H2Rf4NlRk4MkB/Emjg==
X-Google-Smtp-Source: AKy350ZrQVyDLMzwqmQeO3KOVb6JBRZ2K0v5xylw2uRxzU82JnTGfnCZ5VoqlPFlxj3azLCOP54Dfw==
X-Received: by 2002:a62:1cc7:0:b0:622:dd9b:e2d8 with SMTP id c190-20020a621cc7000000b00622dd9be2d8mr3363135pfc.3.1680632517560;
        Tue, 04 Apr 2023 11:21:57 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:57 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 10/23] RISC-V: smpboot: Create wrapper smp_setup()
Date: Tue,  4 Apr 2023 23:50:24 +0530
Message-Id: <20230404182037.863533-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112159_379740_7B45FF6B 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
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
