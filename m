Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55866C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxcR/zLSiEZMgfC86wbIVeqbQCJSjVF9LZXELUKz7fU=; b=HPj6Nbj1+HHLoo
	UJPTEx15LrZlCHN/KBa9ozKwdQCgYsKtw7iIuMubD9qpj+CWDHChKRwg0jSxOnNqXGqYMBG33RMGo
	iDFEKn83SPE1c0Sw0pr7ihz6OEW9ofk2W0V+VG6C0HlCumRRETgWndO6ncwNFIyOmvPrS6xWsAHcU
	sE5AYZvEgwaQ3v+suJaQUrXZac8NVBze2uIZCRz1nB+l5oti3YB1sMiObG54//KOaPZ4YK9hvMCRB
	GESCL8Ejd9H3r8UNeTqLBYzFt60j8Y8cXj4xyJEr8u4XqAn8IaSyCQZFNjCAsbj7lWsxiUyXOR5qr
	abPbXEI8SYlQoZgz376g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHa-002Tue-05;
	Tue, 04 Apr 2023 18:21:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlHX-002Tt6-1a
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:21:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id kq3so32112144plb.13
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=lS5ulDLpGTFhacS/vmHeoNrA8WZMS9A1XD0ivXSE8k1m9UibbT/HDIYwmDj5dsTHzm
         khjVZGw/f+zG21uuCJRZ4P383v2CRWHkitSQ5bFYgsNJvPfImERO9jDlBRkunMUPqiAO
         49W+etiQwtzIpjxUIlH2B2LaPlM0qZAlhwE88kXncU/Z/de2KE5mtcuosQjsfjlZUaAs
         fp6NVPnjuihlvuWzPISUE5kl1VbgFLFjOo5lYVO7n9TJiPFNm/FP+KJDT+bNIGSBwUxj
         nOphCmWDomst3+OiuuhOSLh6CNn9cz4rDQ9C5FEGUERClo98uzNigXIfvs9y/lcE+KJJ
         Q6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=rW9WE4hinbUMy8oSB4DWBW2SEIOuITW7Seb+QIOLo3FOyymjY75RYg/maaiy/RaRq1
         PYD6n2gaewe2GOv5qsOn2M3Xsna1yOQndcQdwepex9+2jL9391eC8Azj+5qduSWYRv/E
         V7kb2aAgZS7MKhIBXWXg8jjZ+hJx9NDtkt7fqfEdGvdQ7KzFr7xbR4z8qk5bAYMwJwVI
         yA290WWYcnAAC4X7WUsEX4BVXcIBnQvG2Gf0npaJEDOSbNaJI95Q6/yf5V4uTv8ENdY6
         POHnDKlYahlSY7QEOWM8c5G9m2qDuGd83dcQupZ/J7cXpKsu4mHIhEhBPyL0p1nV3rDQ
         cu2Q==
X-Gm-Message-State: AAQBX9cO7q5kuL+MWlKivFM5fg/s2f9wLortAccsbwtoUkPyQdwnPtvy
	3LSmmrOm9goN4A4kADd706CXfw==
X-Google-Smtp-Source: AKy350ZsAX/af2SGUjolLHmefDU/DyLThtAxyS7GCNHhc5U197X9IrYt3e8QE2hOBYNi+FCaIsr4/w==
X-Received: by 2002:a05:6a20:b286:b0:d9:237e:9d08 with SMTP id ei6-20020a056a20b28600b000d9237e9d08mr3003165pzb.3.1680632481697;
        Tue, 04 Apr 2023 11:21:21 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 05/23] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Date: Tue,  4 Apr 2023 23:50:19 +0530
Message-Id: <20230404182037.863533-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112123_528414_F05ABB06 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Without this, if the tables are larger than 4K,
acpi_map() will fail.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 3269a888fb7a..f725813d0cce 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size size)
 	return NULL;
 }
 
-#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
+#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /* ioremap will take care of cache attributes */
 #define should_use_kmap(pfn)   0
 #else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
