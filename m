Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AA7C83F36
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 11:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBbJohqToIUXXpKMMZyFf+n1ZJ0a2PixDoxqIRXbxDg=; b=PbKiNY+HX54peh
	n7iZ7Z0JLsx0egQ2BlusF3XdmY5dWOGCMoDsrAFTTyALUBIv7vEGH1b17i4rw2ncVY+OrHfUumkp5
	MVtp9skGX++r4xrKSkUvT7R0JC9H9ZemOU7hLAuHqok8y+Y+hGEuPl7MIWoQL/Thze1jv4MS7PefJ
	mS3YjrsfqlChyLmuE1b776p6hKINtBGie8AtK/Fgh1gW7CCmbBn6ifVW/29MfxBknuNMqkZeTHkYy
	W8X2M1ONR+brGzbiW1VOYzIm+S64VBnFzDSqHOhssqZ3iazXnkBVU98hdwDqzobAV9HqB3o8hJwOM
	wsDJ+mCgjF5UTO0+wHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzzE-00000007VEI-2RvY;
	Wed, 16 Jul 2025 11:07:44 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzZj-00000007S60-0swR
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 10:41:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7490cb9a892so3912686b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752662482; x=1753267282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaG3DvsXq5/AKyC1GLSjgb34PJp+nqhxTUl2VKU3MC8=;
        b=AiW8zhOjpisGJF5jzn77Nb00upaPfo5Lxyfb8CWT/Y8qyYtsZ9nQeJeiFpQYM7E525
         xGYyKMdbkNFEoiyuSle9UPsKETgoPbSd+Vpm9K1A8H5i2iPs03SoL9Xusrz6pFJoQVoo
         q8dLHVxi3tksb4yYuBJEP03Uhsf+W7pkj9isAIoLs5h4B4bUAoNFzByEQg8ohQ4Ey8SN
         KDeFQI9U67u64dIvY55pTuEbjVXA8M/tGZK0RXy1WH1c+8i+qRTuYmvDP3htwfUDfzVI
         fOtaf+fjMkZC9AWgs8D0TRuK/7QzxrK4JuWEKDEMl8SX0NDXEfp9s7xbdAQxXBiGudCI
         JQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662482; x=1753267282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaG3DvsXq5/AKyC1GLSjgb34PJp+nqhxTUl2VKU3MC8=;
        b=P4b6vRZgo9t93iVs3MxYHS24w6YELtxHZy+JisVbuBzjOt6dwqKX/WdyycwBM6891/
         C6FrLpJNPUqbAk2g1CBlKyDPRqma06R5Pfq5FrZaizcTkA2hX4zykM8Z9Las3R6aQ6m9
         M3r4zjbUM1rhY0odbJIEqVoY4+kT3khOpo61beOgjDzP3tXW30NX1NlLKGcFBrvVqSKk
         yuFBSCi7pW61zJUfBRlXEFzqfkTlIck/I4r4Wo9gu7MOLw0IPNsmfoUAupsaJI27GEA8
         Po95ha7GUsnXq2kys99oGARGMIRXWPlJ2+5Lbtbvgr3lk2quWKDSfSwzWu7g6hFAsOYI
         hrfA==
X-Forwarded-Encrypted: i=1; AJvYcCVQnr/DH4gX2z5NN03xl/Op2lfDbH0xDdKf0VjQi3Ir8TrvWum5UkMTZYncwdVZj2JH0ONcUTL+bro6PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOFi70Ko4MDx+FfqMmWETTF+97vXK2QYBaNuUPzC4A5wZrs+w9
	S8TWxFBISMmwh5wniENaLKtpQvHwOQBUV57YuVNamxXGhnPLVznFiFuz0WWwtaXF0+s=
X-Gm-Gg: ASbGncu1jp4a1rnYN/oiTIm5upczo9b+v/lCuzdf3rwkNaXZvwGvtJjIUboWYOA2eiR
	llTqbIhT/B/L8Za9fAAQg0jMn4bAAUs9fG/NjxIttmyNF7YsUXuufg/8hvTHJXDwboDCjKblr6i
	REfsZaPV0gfm30Lul0BKDYEvUF9VpL/SozYIC+MGvgxT5g3BAWyc0J+XgNwMfFkd9zojSOOidW7
	jSETY3rsSTUnjPmSsQYhrT5Df/aoiBsIpKMYp6pubTmxjGNcubkZHoJLOQslHaGG0Y/VhJ1uSWN
	v3vRYuTUg4EU3trgCe/L+XNkGjUCMkp8ow807AHLSGeVECk+C2NHCsBDaFQhezVnOokxNOuq1sz
	HhnAqYst1sFpevBVXhmuLXaegyNlfhmAA
X-Google-Smtp-Source: AGHT+IEC8Wh248xbvV7SVKKzD0alSVzVgeFsgJh9ogEs3+/ngP7xonwyOrkgTHqNNgbjcXTmqAIWTg==
X-Received: by 2002:a05:6a00:2387:b0:749:540:ca72 with SMTP id d2e1a72fcca58-756ea8b944bmr4580850b3a.24.1752662481956;
        Wed, 16 Jul 2025 03:41:21 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1af40sm13946709b3a.72.2025.07.16.03.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 03:41:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [PATCH v5 2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Wed, 16 Jul 2025 16:10:58 +0530
Message-ID: <20250716104059.3539482-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
References: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_034123_248162_1B82F636 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Kumar Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
Add support for RISC-V as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/scan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..f022f32de8a4 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/acpi_rimt.h>
 #include <linux/acpi_viot.h>
 #include <linux/iommu.h>
 #include <linux/signal.h>
@@ -1628,8 +1629,11 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
+	if (err && err != -EPROBE_DEFER)
+		err = rimt_iommu_configure_id(dev, id_in);
 	if (err && err != -EPROBE_DEFER)
 		err = viot_iommu_configure(dev);
+
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return err;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
