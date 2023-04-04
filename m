Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EAEC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZCfZuiWaSR3XHLSQi2jd5WLrkJ7Nrhhq+8USt0+eVE=; b=aoVbtBl2ikVq9a
	/SbxM3A3byzjfAnLoWa/fX3FrHApQyB3ayaIL1IoBp62PWMs0LEMKtwIrQKDP6RbIgu0xYS+hAaJp
	Lu3aCu4QaWQZAxLO61kivkxHKMU1/32nqgQosIRkyFGRgVgo8PHLPREWZI8qt21dS3Hn7R/GqBp7J
	AxYk86JJLbubpLuUB5xUoM7VvfJgvrECYwbVpXjReHFHUXnaN0PXqNL6hsJpvPoaQVwH4mdzCO4ZZ
	IVGGUdONJrtD9zsBGOGdupvrbjY5KxGRVa3LkfpfHsdA7ufVOI6aelDaoadUz3Hcd+bEv9fk8cHsC
	/aNJf8mM0Ca8PXOg+Qvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIL-002UDW-2x;
	Tue, 04 Apr 2023 18:22:13 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIJ-002UCQ-1z
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:22:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id bt19so22073957pfb.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOfAYG3XRnm+elp9Rz4INSxNTdbKknHW/6eObzO7hi8=;
        b=L8YECRNq9zHfdajtfyIxGzHpmgAu+8AIVFW1slPJBQJ6rehzKPbVARoQnJZcn0eLo4
         MZJwlkBXNWwUdUTfaNSKkrkxTTu4KyG2qGOMUv/QmEqqV/DRdXVfjGa7HoDimM+6d0Kg
         y44bdJ5lRuCVCZ3T+qr98D9JJokhrxPqVeAEAv1arA8yLOHyPwK8xWkKJ3OcxXDmqC5V
         H7brCz+RrTXiJPi9Lxx2SXxvCy/V3plJ/cxF8IDBy4naSeNVcIgT7e3QC0gr8GOJkO6s
         ryRvuYpFL1C2f4FEG39wrbBR1+mNGg+skArfvu24iysSkTM4p9nW7XTd1b93qfcYm83d
         3Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOfAYG3XRnm+elp9Rz4INSxNTdbKknHW/6eObzO7hi8=;
        b=APXvYk+1c7pi7u59XDYsrKOZG1Z85dO09Q4vSsv/hX+uOS9/MY656Txiloxf4VOwuA
         DjE17+ZakNfRcuP0zkz3QC0u3wsEWoI4+nh8b6GG7eUrnSPfQ5sMIA3YK+L2RkctdiGa
         1MyMrQRG+l7JNjwC6zL3AaS7BMR1SgDzC/YJFLONE6qz/KPhwr+Pk8YLmyjRd/NNNhYo
         pkT3cFzj7VWa42OpWn69MQ5bHFYEARMVCqJSj3CAOcr7xdwbMSVfqyaLzTz4dmYaL5tw
         5N+yXLT8e64xRrWGAZ5w7IMw75Ong/C0UFIlPrdq9DiBfL8+HT7WRbK2jyBkZ8CMk6xJ
         ueEg==
X-Gm-Message-State: AAQBX9cUgstjlyaqoPoDg6Wj+weJU9fr8+ihS1+zM8AONOe2quoa+4C/
	nztGFBuFE0V+CSknV5QeJa03CA==
X-Google-Smtp-Source: AKy350Zpp5mXd1sQHCpB7UZIOcSKdFUPpz/zileQuMF0F72Lgc9d9QGQsq6GZKBUg3PXCt3oMIPvzQ==
X-Received: by 2002:a62:7b8a:0:b0:625:1487:f06c with SMTP id w132-20020a627b8a000000b006251487f06cmr2926744pfc.29.1680632531143;
        Tue, 04 Apr 2023 11:22:11 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 12/23] RISC-V: cpufeature: Avoid calling riscv_of_processor_hartid()
Date: Tue,  4 Apr 2023 23:50:26 +0530
Message-Id: <20230404182037.863533-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112211_655239_F0D5B95B 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

riscv_fill_hwcap() finds hartid of each cpu but never really uses
it. So, remove this unnecessary call.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..63e56ce04162 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -91,7 +91,6 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	unsigned long hartid;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -109,10 +108,6 @@ void __init riscv_fill_hwcap(void)
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
 
-		rc = riscv_of_processor_hartid(node, &hartid);
-		if (rc < 0)
-			continue;
-
 		if (of_property_read_string(node, "riscv,isa", &isa)) {
 			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 			continue;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
