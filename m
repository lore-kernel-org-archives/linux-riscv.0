Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD44C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDy9DyaQxmwCz+kwTgqGF27D5KVi5Jhy8+hQt5XCDKk=; b=hgOMaoy1dqrurh
	EkoywAMGQvkKEqaMK34y89r2fxwofnCQaRqFsYpkq+HRPnsAH/FwmJX5mUUik5eH4Ao87CQgldAE3
	DXD+RJJp3sxRfvlv6W6zZWxVNIocykCVEuednvCNQw20PBakACY0n/lrFTITHc5Qw0bTVJoV+FWM5
	e6laDuU4zqsXs2+ZpoItonykW3Q+IVlP0Tnu7qDVyYNu4whuhVEVTLzPxv/QOMPyepWMBD+Ba7co1
	sYFVLXYs5hBSLRfTY/wu8sbyt6zbS5jscKayNtFxSAuBEZmvT1A3abwwq3geYU4nhw0YWMJNq3QxY
	R5nQpOmHYDJL8Pr4DA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR64-0000000AFpO-3yYZ;
	Fri, 07 Feb 2025 16:20:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR63-0000000AFnl-0VwH
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:20:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dd0dc21b2so146592f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945250; x=1739550050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXWq8j6voTaeGRr8J3gg8YAr/RtfWvANeWegFFYO8S4=;
        b=WmXr9QJIhUUuheXRAcu5rfXrJ7YXoYqlqce96QzJghalfvcqyugSE4U3lfA7zZbUdT
         R+soiSc40AhmWuOzh1i1sECzupkqeWNp1PDlucmcxhC9AHs/7YXXXsvc5AY+MoGImzyb
         yWhmKT0g3VkFUIYC2sZWl0LpQCAtbUPuC/M4liOTCdXGc2cXLgKKDQCpW32Tmjn3Bc7i
         bm18sSq6GnrXzWP5rNYq+O4asmxQuVJIo56nGSBysCyo5iwuOITfOyrsa7IaWwsh4Z7V
         R6Bdgu/8McqmDo/HsOKnSNFTV/ooeBbfikIsembg/EtGKDogX/SziMCH3jF0o0d3fHHR
         bx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945250; x=1739550050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXWq8j6voTaeGRr8J3gg8YAr/RtfWvANeWegFFYO8S4=;
        b=ISZUxo13dIbbGQrP7ay9RRqSWbmHT4UcC/tqjnrpR8cK4KH3cyvTWP0GcC91gZ08Us
         w72Im2EuqydwT07YaRk64wOyBRljZFU+nH4eT23dwi13N7pktwbGFCL/ZJ/B+Q4FVYvV
         NSWigD1ggy8qjwItm02NUW3ZiIQsMmH4mGGQNDUPCVyIBBzFVFSz1Rv//P93nFA+QUa3
         FeTauIfygkFm8ydJPSF88bv84IjpbcM4MHuSUZMkjCb3fKXllxM0TcVbojhK+rbt6kVN
         Q4lOLRgz5Q04ybO8QR+w5po6YCB+snMHzgfh58FY3BUEIW9UrV6O4wVzU5faXSyPYzz6
         AvOg==
X-Gm-Message-State: AOJu0YzYMl7XtqsUnItgTngxQuSSIlikvCfy5swPCzyjOpbrkerntoyZ
	Y9tim8kbJcn1DkSLDEZTgHw494g1HzVxGXVNDduE3NAPeR+2J+H4VCVb2gzBVPIbMu50nVBg5Ca
	lLUU=
X-Gm-Gg: ASbGncu38q6UKh+A0/2ajvQXuw79y16O2EbV5oIbkBo6z+8T8HYgea8vRPmx7P4KhPl
	BU3hN0T4Vzp+8TGisILEdtUbDlzr+9DdxaNuxFS7yQGTHjonbTOpakpac1DxSSrVIsAXXzqm7T2
	HSLUCK0kHOWVu0Phqog1zojnpawrjQmCdj3O0KbeLNXpvwSRzg5lwyGTNtkYI0ZhhhvUH6+IorC
	9kBW5z8EYrKN6/wSjNEr5NBkrFbK43B5BP+IARp93E/5zEK4WqwS+r9eciG1zApsqTnCv4fM8M0
	kCSHN7QGUdaG/MIr/bP1TmlgGEa6FyRYIzz+28Wjxu9VS99PTwN+pXcrlg==
X-Google-Smtp-Source: AGHT+IHh6JwLYQePZBMujNRYI8A6XwD5WkfD3Ot/VtJsrqiS9T18sjhPkT+oNZek1pT+BypYrsY7PQ==
X-Received: by 2002:a05:6000:18a3:b0:38a:a037:a517 with SMTP id ffacd0b85a97d-38dc8dd27f1mr2638562f8f.19.1738945249611;
        Fri, 07 Feb 2025 08:20:49 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd8448sm60238835e9.38.2025.02.07.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:49 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 9/9] riscv: Add Ventana unaligned access table entries
Date: Fri,  7 Feb 2025 17:19:49 +0100
Message-ID: <20250207161939.46139-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082051_163076_34C52D86 
X-CRM114-Status: GOOD (  10.75  )
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

Ventana harts always have fast unaligned access speeds, so skip the
unnecessary probing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/vendorid_list.h     | 1 +
 arch/riscv/kernel/unaligned_access_speed.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index a5150cdf34d8..8dd55a847893 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,5 +9,6 @@
 #define MICROCHIP_VENDOR_ID	0x029
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
+#define VENTANA_VENDOR_ID	0x61f
 
 #endif
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index bd6db4c42daf..ff9905274c60 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -14,6 +14,7 @@
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
 #include <asm/vector.h>
+#include <asm/vendorid_list.h>
 
 #include "copy-unaligned.h"
 
@@ -251,6 +252,7 @@ struct unaligned_access_table_entry {
 };
 
 static struct unaligned_access_table_entry unaligned_access_table_entries[] = {
+	{ LEVEL_VENDOR, VENTANA_VENDOR_ID, 0, 0, RISCV_HWPROBE_MISALIGNED_SCALAR_FAST },
 };
 
 /*
@@ -460,6 +462,7 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 #endif
 
 static struct unaligned_access_table_entry vec_unaligned_access_table_entries[] = {
+	{ LEVEL_VENDOR, VENTANA_VENDOR_ID, 0, 0, RISCV_HWPROBE_MISALIGNED_VECTOR_FAST },
 };
 
 static bool check_vector_unaligned_access_table(void)
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
