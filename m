Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E93C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyE+5Tk95JjbgJwI9SYqWGeSp+Nf7SWZYzQCy5AG4lU=; b=QpxXEU5EptZq+e
	DJhHn45j4ew3Xa6FNlIvKcdAUwM5650rrH1FuY9J491Noe97Rh8F594051/y4x/hQO2aQ9mIamNja
	5YL4/CnoX93CS0Qz/Yuz10Apq9D1CC4Z+Cjs95fHXKGYAr8w66olb/FvwxvandRlKzGyAIP+ESjWU
	8+6vFJdJJPXrSmcqNZ26NGV2z3g/s2fDqrfjURF13CRpdOH8CkArsiAOulb+20sEa8BGWc4Pe0mvm
	lb9khpzxRtYK3TPzjl19a2wjxeokaQtIce+V+RX3db9qaSQ3RbACh5ZCzBgIC0Gqc+tSqLmU7Iwti
	1gs27CGvQQ3TVxan9AIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYtG-00500f-0q; Mon, 30 Jan 2023 18:28:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYpN-004xWK-3B
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:24:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so1472607pjd.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuVGWrNUUEjIXx2KjigY2fz+dkSBCOERpinGp69EYJM=;
        b=iIZwFAAWGocdPshz3LmlC28vm5OGG56ziFBKl6XO1HZptYcLVhgEw6dYylimgH3fPM
         /9B3J5Y8Z5oJw8BWXUq7KJyb9hzrJEQ6lFjc1pcEcZkbDfsSey1/GskMpm4Hehh4ioBU
         Wt5Pm8Wx6kDDEj97kMeoEwJqCcK8bmo/I04WY0p9wPLCQTVCK7oSRboKeRvATTbLoWjS
         /eXynBB9Ka/mxjLhT+mtMnDY71dEocS7MrjhN4DDRdN4Kj0dm292Qdi9kCBQTP+i8mj1
         uIkxGhN1NA5vTZ36y79ou9www5avH7oUT2PdeyaFoDgA5qOxVcK8Fof3w4fsrUICEmlw
         HjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuVGWrNUUEjIXx2KjigY2fz+dkSBCOERpinGp69EYJM=;
        b=6F209JbsHDt0YTXbBv174fi0yevzA1HBcpg2m4gUXfxpJxnGCpIic1djQwPMuZjb+j
         QGQi8dYAYxNa8jheskPX8GyofWcNHM5pUCeX4u8C8vXp7puQyMLbg9dmjjmk2jJMFoLW
         ADmsqLqXopo3l/7FnY9ZYDAdBQPvX5RMNApejB6I63LVVx5g5zkPrEgHBmVFPx39uvFn
         8hT0JKMskkN+ekaUkQ5XbfwHBfrvoVigNrMRKth2ILA0pScwqGJGxSQ+tPDIOV776W+g
         Q3nKsKKMMl/ehSwt8DClUqy9YBIi+kVEaDGU4e45hDc1nnTmLQhaDpUwUmhJIFCLukxC
         U9vw==
X-Gm-Message-State: AO0yUKURFDvsXBnQyOmke7M0yn/fONLUr7EsoYUxf4hlx5SmeOHJ2PyI
	K+9ed0IHO9puefiQrI99yQZQeQ==
X-Google-Smtp-Source: AK7set+n/r2CZrElPyDBS1vKdJq6Onz/PLzE1JlEypVANy/qXderCMMOJZw49AYfFbT7RutNUjOs0A==
X-Received: by 2002:a05:6a20:a003:b0:bc:3537:34a4 with SMTP id p3-20020a056a20a00300b000bc353734a4mr17049951pzj.39.1675103064549;
        Mon, 30 Jan 2023 10:24:24 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:23 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 24/24] Documentation/kernel-parameters.txt: Add RISC-V for ACPI parameter
Date: Mon, 30 Jan 2023 23:52:25 +0530
Message-Id: <20230130182225.2471414-25-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102425_174435_CD790424 
X-CRM114-Status: GOOD (  10.40  )
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

With ACPI support added for RISC-V, this kernel parameter also
supported on RISC-V. Hence, update the documentation.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6cfa6e3996cf..d9795418aaf8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1,9 +1,9 @@
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
@@ -12,6 +12,8 @@
 			copy_dsdt -- copy DSDT to memory
 			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
 			are available
+			For RISC-V, ONLY "acpi=off", "acpi=on" or "acpi=force"
+			are available
 
 			See also Documentation/power/runtime_pm.rst, pci=noacpi
 
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
