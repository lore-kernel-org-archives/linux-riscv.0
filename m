Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC16EEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGbQ373wUU/codxhTwR3DGUQpcR7njxBGe1x9+coY74=; b=YeiXzRU8II0eGN
	DHzGqcNPLRDiNScQ/NdO7Y4k/ELKhu54OgrTbq1HxHlQWdxNs0cl9Gil066SgUttpk/5fwvJLVpjQ
	Y2DBF7hXPV9ZHl4y3gRkk4L6acBGev0AhS/XbUgBZDgoyNpX9sN3DQbsXatyqps6oV01J3kz8axxV
	/08d7EA35vsdPKZiHoBMwjyef18lqeoH+8aQE09UWT/eOhl+ky9+Th9aG/VzqQBNqHcMsEZ00ti2Y
	UPPcc/1sM/9JFkl0vi8gWP0MMNXOiK/dSjPKNiZBZm81QwlIF2dlFThAnkpvOU+2UBenaKe6TZVHS
	nhG7ZQC98cwCJ522LV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0wY-00Fl5y-01;
	Wed, 05 Jul 2023 11:45:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0wV-00Fl56-2j
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 11:45:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b8a44ee159so8842935ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 04:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688557507; x=1691149507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+ITQvowAXOXD8H4U5Ak65JYD6vo7/xikUkbFThVisc=;
        b=JdOIUPCcVgRbkHL6lKC2twEROgaAL4yJ8ZwTGhCaGWbZQF9aFGaRYNPGYzOGyghzhg
         +xgjWXfn01h1SKYk1tCnUwym7zJigY1FB2L5nLJ9K9xF+V96OcBaG8t1Nvd3B2sJD/Ls
         4hF63PIb9gGwLm7I9MhvBmuNYQeSd2x4nd+O5gtyCppqbUmkWKDhM+rfZ0oSgKLAnmyh
         ef/1usAQUA9CcwFdOCMOZiXTJMrJ22ZEPa8whSjBMypJAPO7J2gk5zs4iFCdj7s8Fcrk
         ie3LhugAEg6iQhA7aaj/0X0A/wWygp1ho0cDLjVJrYds9JfqZ7MvJZbTR5YNypqp+lHX
         hrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557507; x=1691149507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+ITQvowAXOXD8H4U5Ak65JYD6vo7/xikUkbFThVisc=;
        b=PAFjRfywW/+0VE6KjE6ne+AP9Ije/efQU7vVl2v7yAjCtXMrm8hIXWxUcFcjzoCcWk
         vSPq1FfZ1/0QWVms/86Xkcw87/2RTq9bHUKefHakweL7BS84ryIb6GEfb2DaZ1VYhGrh
         roO2r26dMKQSETRYlQf4o2dyZiLPfPMp7rz4pfPZbXse94WJmxFGNtvKZcx/WAubL+4b
         1p2pu7B5lYqgSpZslJSWlhpXLOInRIpS+/dc2/Q77n4Mmc0D2c0J5AODHAX0rjBHl8p4
         UfCxQ8ZbAMQRzkfWwcaeCXILeLmZ84ssci8HJCWgcRG3aaqgp2KQ87Ba7bVHAsxiqga9
         0N2g==
X-Gm-Message-State: ABy/qLamjmuVPM71SIjh1khCNL1kaWXihMHa+ZwRSXyK03FePZPNYbyj
	lal4oBQ3tHkAs3qpSsS3p1uwhg==
X-Google-Smtp-Source: APBJJlFcrKCShSuwPuLAA2ZOXSGBben7z55N7jwvIQjxqZ8xyVRdttDLfGixeJRGpz3xqUvIJ1x13w==
X-Received: by 2002:a17:90b:5109:b0:263:5c78:4b63 with SMTP id sc9-20020a17090b510900b002635c784b63mr12763480pjb.45.1688557506871;
        Wed, 05 Jul 2023 04:45:06 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a194300b00263f6687690sm1177900pjh.18.2023.07.05.04.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:45:06 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	sunilvl@ventanamicro.com,
	ardb@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	rminnich@gmail.com,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	jdelvare@suse.com,
	yc.hung@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	pierre-louis.bossart@linux.intel.com,
	tinghan.shen@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	geshijian@bytedance.com,
	weidong.wd@bytedance.com,
	cuiyunhui@bytedance.com
Subject: [PATCH v3 4/4] dt-bindings: firmware: Document ffitbl binding
Date: Wed,  5 Jul 2023 19:42:51 +0800
Message-Id: <20230705114251.661-5-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20230705114251.661-1-cuiyunhui@bytedance.com>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_044507_889360_AA2E6DA0 
X-CRM114-Status: GOOD (  12.93  )
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

Add the description for ffitbl subnode.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 .../devicetree/bindings/firmware/ffitbl.txt   | 27 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/ffitbl.txt

diff --git a/Documentation/devicetree/bindings/firmware/ffitbl.txt b/Documentation/devicetree/bindings/firmware/ffitbl.txt
new file mode 100644
index 000000000000..c42368626199
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/ffitbl.txt
@@ -0,0 +1,27 @@
+FFI(FDT FIRMWARE INTERFACE) driver
+
+Required properties:
+ - entry		: acpi or smbios root pointer, u64
+ - reg			: acpi or smbios version, u32
+
+Some bootloaders, such as Coreboot do not support EFI,
+only devicetree and some arches do not have a reserved
+address segment. Add "ffitbl" subnode to obtain ACPI RSDP
+and SMBIOS entry.
+This feature is known as FDT Firmware Interface (FFI).
+
+Example:
+	ffitbl {
+
+		smbios {
+				entry = "";
+				reg = < 0x03 >;
+
+		}
+		acpi {
+				entry = "";
+				reg = < 0x06 >;
+
+		}
+	}
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b886ef36587..008257e55062 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7874,6 +7874,7 @@ F:	include/linux/efi*.h
 FDT FIRMWARE INTERFACE (FFI)
 M:	Yunhui Cui cuiyunhui@bytedance.com
 S:	Maintained
+F:	Documentation/devicetree/bindings/firmware/ffitbl.txt
 F:	drivers/firmware/ffi.c
 F:	include/linux/ffi.h
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
