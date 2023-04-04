Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C99C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HJHQu3xkRkTz1H+aVu1ZnD0gPIdwTtczbw+ZQNHHoc=; b=z91yKsU3+CxDpE
	lPz8UBe5oiJIIfnN04wMScHzioCMyfrlJjIp4YF4gyo/KKizxXQMIV6RgmTCsaOWA6mlj+QXcITFj
	pQvevtq0CI6om2Eej/A0Jfy5SW7iB6xe2r6J2gIzPaAmiDyflKrOOiW9RZgaXvSl5qZdUUHzKeAZH
	Wcd6bTgGZlL4WYDFQrUUQeGL7uv5S1eEFiXHt9oiLGA0Zjr/+I2VJtdYvToxo6xgCZ8OTJ7AMi6aq
	lU4uhTDyEMmzEoynF95tkmsWVhUWO7UuH6iZm2ISDzHCVxxuGjYW8LBn7Szb/Oj28Sge6hMLVYJOu
	a1nGOyn3LRilPBeV7ayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIv-002UV2-1g;
	Tue, 04 Apr 2023 18:22:49 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlIt-002UTX-0K
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:22:48 +0000
Received: by mail-pg1-x533.google.com with SMTP id y35so20223184pgl.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD5rRL/Qo33kIFahZhwUm29X+6vMDi/30v04/QLcXUQ=;
        b=UIHu2giA5QAUdfrzphOrCNgf8TXf9Q337RJyaEDTsCelh5V0xJtnF5gy2TpNyJ3dib
         JQxA71u/Yth+XIXINwX7ERs/pWdRfR6fiMjDKHJrVNobDIWnvCxoz9SL3ii/bn6LJZBh
         qavA3ViuTfTTmh5JPoKTiEy/TNg6PKmzql59rAOOlKjT0+Y4VR4Tllzag0CkfB7JI8mN
         oIT1dLLjFZkxEing3aWpLI3zfjPVUyoxqBL3Fp8HxThPD9NCws5Lfe2SXIhYWU6ns9yU
         ByteigMnS++tSxUZybtfzf4EpK7ugZVUS13o1Pu+O+857FM6pQJjzjC1bEyIuyYsBPBJ
         sKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zD5rRL/Qo33kIFahZhwUm29X+6vMDi/30v04/QLcXUQ=;
        b=mTqimH7wpdn1XrBHEVwhhqZC3CetZcxQXW4ZzyI6gYnMrK5SKSqjU2lkaHMbA7fT3l
         z2KeO3gtN74hqx0N5oHgOWQrW+/RoJ7NTpGIaWFwrVt8b2uSaJlHqfZvv1IxLYcCREM3
         vCCrcfjLiVc3abKnoVtkUklEOw8a/2UwsFjEwKbHZXX/SWq76FaI91ItsPWuMI4UCWl5
         q7OaoatPdAW/wU/Okrf5esiAHEG9ZI3SYzbwdM0lBsT3hPn8uiQkX7IUPSLTY+l706MC
         q724iUN7Czl6DutaEX4/uKlrnH6fAp1yud/LwFlbsa32VN0Fk5zvR5hbJwyJSusISy1h
         44Hg==
X-Gm-Message-State: AAQBX9eMRLzL8bio+zbxEZ7l+SSJeM0Kld5+4o4b3n10RuZfLGxKUGAc
	NZuQUh/1Yvrvf2E6EXEGwLf86A==
X-Google-Smtp-Source: AKy350bhrHRdDWNUPNswRwG+i3CBb1KLXEYk2mzXo0XGX7CeXMoT6FgV3O1l78I2J1umA2T5+KrIUw==
X-Received: by 2002:a62:6203:0:b0:62a:9d6f:98dc with SMTP id w3-20020a626203000000b0062a9d6f98dcmr2813704pfb.11.1680632566619;
        Tue, 04 Apr 2023 11:22:46 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:45 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 17/23] clocksource/timer-riscv: Add ACPI support
Date: Tue,  4 Apr 2023 23:50:31 +0530
Message-Id: <20230404182037.863533-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112247_138994_2DC1ECBD 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Currently, ACPI doesn't support a flag to indicate that the
timer interrupt can wake up the cpu irrespective of its
power state. It will be added in future update.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cecc4662293b..da3071b387eb 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -207,3 +208,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 }
 
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+
+#ifdef CONFIG_ACPI
+static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
+{
+	return riscv_timer_init_common();
+}
+
+TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
