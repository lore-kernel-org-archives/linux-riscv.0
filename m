Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D983C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0xTIkO5zQtp1tjAL4uQ2QkC+TNTXNwiruw3idedp+k=; b=C4zkbPojho55b1
	KL+tibrXYvpylKBwhWkAdFToeahlGzkWeGiOHZ2unQtOGu6vyE2ETDDM/A675dTkItIGK65tBnZ9R
	ZgYX/pWkZYBheOJHfs0Wv+p/SIGQbIvazI/D0spUgOSYA3+gh7CPIgy1taBdIgAtxtl8WnLXvyP1V
	5P3oCMe/jLo2M//GibSrLa+f2EbU9gUc+dTUQWWiMbrgprkb1QMLw+PqpmAz7ZTfzlOG4IngScOA4
	0ib/BtAgvNSRMe5eLjK3bAIcysGxXnr0ko7q0igbsV9g5CBtmOSA/8ZW96CxtQzQKAi8Znsj3xB3Y
	F/bWYPV8jpQGUv7rgPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8p4-002Cpm-Io; Thu, 09 Feb 2023 15:26:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8p0-002Cj3-9k
	for linux-riscv@bombadil.infradead.org; Thu, 09 Feb 2023 15:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EwGCFvR5QiJnBG5maZ5ND+ts9ZoIUQowm5odzUGUVLQ=; b=e/4WGEYRPI58Zfx9mWZLmZC1N9
	hlJfESSkn57tyy1ZksY6v+LpI51TZM6bPlIUxgdi1lBUVMPGQUfzWQZjn3t3U4rt6AOtaA26hZfJN
	AwIsHI+Rq5uR/5jBFkpdPpldsNA9uJecgBatYCK6A2emxzFlpq8tIGAbcIJK/Mhr/Geahm2bkjak9
	NPYIoCZO4d10NctjO0/mYKj4QLIplmNiNG3aHA+8JCIB+7e2ZctRrWMbNNdzRrSesTFGeYluisXSM
	EFZY9h79bnIvXazdLNF0iTMKm9JyA1kF60URG20qAIA2kexonqxqx8C32qTOUumD8dCr/VOQhs6lG
	H/FI/mlg==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pQ8oG-007wyT-2M
	for linux-riscv@lists.infradead.org;
	Thu, 09 Feb 2023 15:26:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id sa10so7383577ejc.9
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 07:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwGCFvR5QiJnBG5maZ5ND+ts9ZoIUQowm5odzUGUVLQ=;
        b=GKVeu2CNGE/49/dMiiNlCex8leLvpRCKi6smtlO8Y9RPXhsC1eDLdiAxJp+k58ahHc
         yDMjpQQZPFwzP0AFKk97XpngeoEqyz+n+0PVj0s+6Tq87HsWKXtPNu4PJDXV6/XbkLAW
         JqnPNBCl78axf8Pa9fK7mtrY6OanHDC4KCKQXvvrxtnadnL8kCcRtPfFDe5muVYxNudN
         SL53XaVMZSNYZWZbjWjasWkH4+DL7EAiBC8MPyqrDrgAnDPYvm56JXFW+dw+Oqpizs+S
         L3GwIDZGG1vbgGw7YsqPyztycZPV0TEFomvAbHdtpHBJ2rQb2bP0FwQacv7jP6mWJOTP
         WiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwGCFvR5QiJnBG5maZ5ND+ts9ZoIUQowm5odzUGUVLQ=;
        b=ahjxeH5xG2u0IXye80FZIhGB4UamoAtmFj6O+V09atyNK6apQBjIzk8qYWa0UOZ9Cv
         VpiaNHth10hxMoCJzXT0pff5XCU2DLHg+UviUhdCRiQPq8qIyIM9Y7083QnZsMHkL4c8
         gL64UOuI5Pa3fKb27ygHgWJpuZHL0uVeRfu0PEAU1YQx2en3OEB1Z9iODvEOoIfKTckL
         Qt9opaD84eC/3FnNuQCZqP2Rz0MT7S0eEzkOCcK3497NunpZI2Tx8w0Ov9KQmUCuL7ma
         7NZwuqJq/S7mrW3ea65NVuRZfx8Oyr0T4V/hmaKllJpiCI69qo3Nc/s13g4ywtPQGWSG
         w6wQ==
X-Gm-Message-State: AO0yUKVGkUGoKB2S0ZR6bz6xhAcRDtsC8vc2d5FMTsKPqZNTfZDb8KK5
	DLjQM7IXuLgOQ6XIlcLgiLWJO4i6a8mC9cF1
X-Google-Smtp-Source: AK7set+iYT9t6JRJsadzPz5rQARTlCfz1RIGdB1jbSa9qEOlDDpYUpcQJnqkS5mvLeHPe0OXsHfmsg==
X-Received: by 2002:a17:906:3a89:b0:861:4671:a834 with SMTP id y9-20020a1709063a8900b008614671a834mr13085814ejd.71.1675956399242;
        Thu, 09 Feb 2023 07:26:39 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id t13-20020a170906268d00b0087bdac06a3bsm1001221ejc.2.2023.02.09.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:26:38 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: [PATCH v4 5/8] RISC-V: cpufeature: Put vendor_id to work
Date: Thu,  9 Feb 2023 16:26:25 +0100
Message-Id: <20230209152628.129914-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_152604_933093_E89756A8 
X-CRM114-Status: GOOD (  11.85  )
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

When [ab]using alternatives as cpufeature "static keys", which can
be used in assembly, also put vendor_id to work as application-
specific data. This will be initially used in Zicboz's application to
clear_page(), as Zicboz's block size must also be considered. In that
case, vendor_id's role will be to convey the maximum block size which
the Zicboz clear_page() implementation supports.

cpufeature alternative applications which need to check for the
existence or absence of other cpufeatures may also be able to make
use of this.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0d2db03cf167..74736b4f0624 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -278,6 +278,11 @@ void __init riscv_fill_hwcap(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
+static bool riscv_cpufeature_application_check(u32 feature, u16 data)
+{
+	return data == 0;
+}
+
 void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  struct alt_entry *end,
 						  unsigned int stage)
@@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		return;
 
 	for (alt = begin; alt < end; alt++) {
-		if (alt->vendor_id != 0)
-			continue;
 		if (alt->errata_id >= RISCV_ISA_EXT_MAX) {
 			WARN(1, "This extension id:%d is not in ISA extension list",
 				alt->errata_id);
@@ -300,6 +303,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
 			continue;
 
+		if (!riscv_cpufeature_application_check(alt->errata_id, alt->vendor_id))
+			continue;
+
 		oldptr = ALT_OLD_PTR(alt);
 		altptr = ALT_ALT_PTR(alt);
 		patch_text_nosync(oldptr, altptr, alt->alt_len);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
