Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BBEC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5fEuqYiMoUfhzB+Zfi44C2+7QMFNh30JeRpB94MB8Y=; b=Ab2dQ35d5BnLrA
	AW363cySYZ+92bdEmXUAD+Xqio9Hl9wuc/EjcHFOirCxAFCXVfGbx/70zwHQsR4tt/1itm2zv5ScA
	7FFetY7q1Ia/KqNNMKlcFgphGgpP84IbwilZGep50pK/qsR7afiF800DlutcUK8klg6pf04OIZDkk
	wj2/QY/GXSYv59QUqr8gtutwsl7Y0XE822nISNpFJ4Gnc+0zCktx+ICQRNU6H8Bt/Z7N/Z0NZb5zl
	iV5Rr9QASvBZI34r3EyQs9tK5G2cVdPVczZhe6t6wcaQ6NTvScYP6LwPwwS/j4vhdXmOOmRzUEYZr
	VPoEd3HptQMIb2mW5cbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRd-000SHd-1Z;
	Mon, 08 May 2023 11:54:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzRb-000SGp-0e
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:54:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1aaf21bb427so31037335ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546858; x=1686138858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNB5noEZPasx/OngqcP7wy15OXtx85aYSDWecQ1qX3I=;
        b=bdUOpEXd7GBDCNnXUsvG3ckYwryUiZjYQOSav9QR4GUG/8ayaYYTDJbjXmtRT0zXHg
         +eV9YbxhRW91B0jQB9sWuZdtdciKI6upjJ8I4udwA4rx3uxaZH3/cHQQIYX/BwmUfzpq
         NsqTsFR3sE7Sw5k7La5uhu2K1GfIJvVKlyUsE9CInG6jxddpYqF2680jb/sf33vgVttu
         fcjUSpTZANBOqnqT1fW/y+mY7OP8uyDjndoX8ITOfZTo5j6GWdLzl5yLKDZo9yepSUTZ
         j7MCN0w4HtF1A7pQPYPkQoqB1NHg8jHylF85r+oebUh2luVMl3g79mLXG0a54WpOSPgX
         TqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546858; x=1686138858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNB5noEZPasx/OngqcP7wy15OXtx85aYSDWecQ1qX3I=;
        b=YSQUIOCY9bg/U631FewUeDVkWJPyrZ+4MZsJddNpncM1ZfR/syCSGX0mTP7Ga9c8+v
         4s0En8FK6NroLSi8iM57JktdnMBoSY8cMIT96i22+sLjWBlIZwrMEMrsdfo/jCja+8ey
         A6quqi7jC5xO4kag1ze1CvUm3UEkfz7xUlVHWlISCLTyr5TfxpHWN2XlNTMEtmoEXOgT
         gQnSwzPmfNAFbozgrpTvE1Eyy8PY4q4FMfbGTbSnBSxxKHxcnu77RG4hk4tscGt3ZoW4
         dzrVVOJ3DcIKlq4spMJk+oC3Wk6I4S5+NewLbUfeMwOD5BCstXk8CFqo9Uu9Lcznbosx
         nxIQ==
X-Gm-Message-State: AC+VfDwATMYC5gpz1gNb5/wKMaTMw+Sy4nJaCrlx28rr1ky2/o50IXKp
	tlgF6sMgy7FtjGVs2O/gda03lAw9gfjPirrNw7w=
X-Google-Smtp-Source: ACHHUZ5TYA+zQ+rNZLCdLbZt13LOcV1erZfJUbyqxcsnGU9IG5qaZ/PIek5MVqznsb13nf9WEs/MHw==
X-Received: by 2002:a17:902:c40b:b0:1aa:fd48:f5e2 with SMTP id k11-20020a170902c40b00b001aafd48f5e2mr13594721plk.32.1683546858666;
        Mon, 08 May 2023 04:54:18 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:54:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 10/21] RISC-V: smpboot: Create wrapper setup_smp()
Date: Mon,  8 May 2023 17:22:26 +0530
Message-Id: <20230508115237.216337-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045419_242140_A5141A7E 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

setup_smp() currently assumes DT-based platforms. To enable ACPI,
first make this a wrapper function and move existing code to
a separate DT-specific function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/smpboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 445a4efee267..a2e66126b733 100644
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
