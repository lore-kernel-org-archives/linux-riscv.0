Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C16BCE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfJSC77TqTOj3drn3B8XHZkVSFtwKlOGhaQLzU35yDs=; b=jfOkb/4F61jZfq
	Ji/b0WPz7rvDa8FWuz2Dl6NncFfuid0Nmo5CKDxG65yjO2kTkc9tJFJbNAg3sKxyRboHhKjKYl0BO
	NZqssDKXPlviWO/6jg7DprtQ8X4q3bm7Yr+Z3YBdbILgYkTHftz7aKlNB0Ayp/GKAXmp7sr669sd3
	hITzFSc95/kfY8aKLcftOS0BvykK59Drdd5LhyliziceGB6DlkLu/QL3I98nheGW1HIEF6tMsVnYY
	i2WBkmhKAi1dS6HLBavakWRG557IGK7BNL+dZqvL3Fu07TIT2ZvKg95+RnSszpRAEJtfycqIHbKEx
	UEauf5pyqQeVVq+JHk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloO-00EMHp-0P;
	Mon, 25 Sep 2023 13:39:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloL-00EMFl-0h
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:39:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c5db4925f9so44542265ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649180; x=1696253980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0o9lQ4GgOP7dFq6KPsGtVotlHRRQlDwzXlKCC3Ypps=;
        b=ExavEAVE/aytoCAf0jU58CjXgwLOcJ+IBfV4HZV6+/dIi6y25QKdYiaKDTZ3NWyowW
         UJk1R15uiD280KqGjlcfXNHI19eMDGcrDYB9Tg7njOyT/I3HOhTDUhrunwf5BVUXCj1o
         03XDfUfNI0uHgAkKCZnh/QdEJ9l5CS1bVTYZMxg/ZWmtMkdKEYYYpCA9EdnUb1+zX4i5
         ddBPY+IunNhtYd8zpylJqGICEocNTGdc35LpmFtbzhWD/WOhMrmDbANyKljAuklmmMIB
         bQjkgqqUAVy4e25rzB8gaHbXI9dFXreRSvmDnJg+bQREorjoU7PXwja6KrDKDHkbauag
         1DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649180; x=1696253980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0o9lQ4GgOP7dFq6KPsGtVotlHRRQlDwzXlKCC3Ypps=;
        b=nWmJdjNm5toAIo/Xo+2ELa1I9Mz03QTKruMgxM2WI75hVnGole7zx3Tq8zhqj6KCUN
         YVRRrRdzadNy2fcjHOZaRtSnWavAL99l/a7NX3YfMQazY/Tal9bTKh8yIXnt7kEoa1pa
         fBwR6TUqJPJpdTnGGuPmuQzoh4AnauU/lZbsAUZ57nsY1FD6z+vWReGSq6zTbFknqeIk
         4ktdFmywvZFnXhY9lpWjTT4qSUMhU1+5RZTFbPkB0lEarKeEqVj2qT8CpqOta6fnVU77
         OpdP9vMjUY/0YbUd6ZLy8FcPQXvCMvJNAmhLZzHrKzaOsHgW+Z/YYArZTMMxT7+laeHQ
         3zqw==
X-Gm-Message-State: AOJu0Yw9E9ExlZrPP81iPt9pQ5SJ7wgBsQarRH+0U4KjBv9NZIo8mYwN
	A3GzhK+nwFk6oSWCnkCrcEDgew==
X-Google-Smtp-Source: AGHT+IHWCYspI/fUj+Ig0k3L9hYf5Uzb2FzPkjigw9xzhpmfqfpqTqSt/ibnnqx7qGmYx7Sty1gsrA==
X-Received: by 2002:a17:902:e5d1:b0:1c3:868f:5958 with SMTP id u17-20020a170902e5d100b001c3868f5958mr14239969plf.20.1695649180488;
        Mon, 25 Sep 2023 06:39:40 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 4/9] RISC-V: Detect Zicond from ISA string
Date: Mon, 25 Sep 2023 19:08:54 +0530
Message-Id: <20230925133859.1735879-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063941_259388_09BE45D1 
X-CRM114-Status: UNSURE (   9.76  )
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

The RISC-V integer conditional (Zicond) operation extension defines
standard conditional arithmetic and conditional-select/move operations
which are inspired from the XVentanaCondOps extension. In fact, QEMU
RISC-V also has support for emulating Zicond extension.

Let us detect Zicond extension from ISA string available through
DT or ACPI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7efe9e2fa89..15bafc02ffd4 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -60,6 +60,7 @@
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
 #define RISCV_ISA_EXT_XVENTANACONDOPS	44
+#define RISCV_ISA_EXT_ZICOND		45
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3a31d34fe709..7f683916f2c2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -167,6 +167,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
 	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
