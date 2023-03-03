Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61098C678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxcR/zLSiEZMgfC86wbIVeqbQCJSjVF9LZXELUKz7fU=; b=drKKW652Qn2La8
	CxJyEhwWfYEkZN+/JO+w2nDXDoD2LT8oIyMkQPPwj9tO4qxBWUI/hbvh4UgdTdDt5sO+upeY1N9E8
	Dv6tgTyQ5Hlhd4qorneq7GcgRfwnWw9ggLKlZfRBGB5Zsw+W7/hZ63MKBk2ovZc4z5aird3ojr62q
	7abFwZTViMFSY/TZLrpzU+WVe4kL6zKE63zYl3PYvZKVhGzgMJ9HjIBM4rMgY79Xfz9Pog949dVMP
	u0y5Bw89CBVy1ep/eQTu/H9QK8s13eJ/3tKDKAzmK2oAMVDEpVH2thIPnvZi2zmHQYjrYmbZm7iGD
	R38tnrtIkVgzy8EjF6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5b9-006T74-6Z; Fri, 03 Mar 2023 13:37:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5b7-006T4u-9Q
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id oj5so2507331pjb.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=Zsc6LaeJTpGX1sgtByVE6O8d9udmKb3fR8oUsq0FNYih6Tsi4uKgSRk6XDvsBjOfbl
         1KTWbpwaFjpI21q3iRGZkju0DVreKkZJb5upDlXkI5pllv+9x5Hq7n7Zaol2tB6zq5El
         zE7YMzWWP8RP8qm7jM/VyT4r+BHa1khQw75ZNQ+RCFrXbe9POTWcDU31NAc6erzEcWWp
         iXD/utPdJrbpDyEWHIy3hEvtWAnybAALp0Di7/6PkNLP0Kv4NpxQEz41nUnD9jHjZ7lB
         ynYP6TOiOHbSCvvXMA4pBxnLBS0SqnPSPI5mcnsUgiR9U0N8YmEuuWMQ5J/sNa6nt/Pe
         G+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=yBL6M8pQEQVGjallm27eJiKoZ75/Q06hiiMTeJBvwVpU0ycGU+yj4LKSwsjOL/PbPX
         ddpyZmCq9nt+yJE0u/D9q0YfRkCMOOmeyqoTpnYskys6dDP/6ZnQHFGOPlHEGQ+7AOec
         33GbU70vw0GwSoJu8GP+0Q0Q5TUkF+9vxS7xoxtlrAhRipwIvRIBaKPfO7TinayHbKDX
         uO1YQb7L8oPM7ufwA2AQmJygB2MBeUbfscdD2kjfl7wJnuID7cET++6xOecDuIl5azme
         oDVEyt7g5jU1MbVjgmsmIh8zkoGHZGYGErbDq/TU9Wpd4j2cSsxQl/uhJB2culMQy++M
         5yLg==
X-Gm-Message-State: AO0yUKU982UdmHSwgkNW1IbtygSh6C84FMCh3+caYmo4yy26V6dUgmzV
	aEnnWyD35/2yChnxHkRpV+iKcjE3INf3xHyK
X-Google-Smtp-Source: AK7set/G1m0QP8TwASMfiHdCi9Qj8Nix2/s9AwyTOx8M1PebkEi+mADM4ez9JdpRzBLNQbgkk8W3Hg==
X-Received: by 2002:a17:902:e80a:b0:19d:243:d5d3 with SMTP id u10-20020a170902e80a00b0019d0243d5d3mr1978853plg.33.1677850639872;
        Fri, 03 Mar 2023 05:37:19 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:37:19 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 05/20] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Date: Fri,  3 Mar 2023 19:06:32 +0530
Message-Id: <20230303133647.845095-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053721_367058_C7D22E72 
X-CRM114-Status: UNSURE (   9.16  )
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
