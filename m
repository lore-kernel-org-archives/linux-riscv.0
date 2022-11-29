Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA6AC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdk5Sc5Dd+pcexeGsu5hpSfsAiNbrl4nlPMrapz6gUo=; b=pz3Slq7BcSJ/NV
	HXtp6iheMtlXJdZ4GQAK+xXPMKqUvXIJhqzRE6YtLXu1Jp8RTWeoKgB+Kmel7NzO/vLn4VZVBl5Oq
	b4Nq78nc7O2fMwPf+8dQnc1pC0MN/4x1tFuOSq91dgB0AbQOFOxzTWv4g0qY9TuhGUvS4/YctWGzq
	lkwMFBNroNU9UE2/jYM43l7NxrgpQznBd2F2KR/EsOGmkbvWWxCy0fvEf1q2l7BllwdfCLa02OtRb
	Huw/GYXslk2zhmvRnPtQ8dRV0o45UCqzwfgbhsyS5v1IRe7TiurpZP+36oK4DZ77AefY1bGsclSVe
	bZgHPhlF387dw383nb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01xI-009S2e-69; Tue, 29 Nov 2022 14:51:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01xB-009Rx4-7U
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669733481; x=1701269481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CX12l/BYcHckW0nxt5dW6uGaSf9bcCVSRsIUm2MrbaY=;
  b=CDp2w59xCD6LSvrcuyn7jgU/XJisFsNp5OYHfHt+XUN/Lh9Huk9pLsyn
   VIbg9WvVX0Hxwo+F6tu6LcTXcLboiXEAN51U57s44wmYPpE2iFv7P9Wvr
   HseJCXf59//A9EEjuRePeTAPz4m96xS/LqhchaZ0fHIpWL9wJvjuD9/ue
   7b6fTi9eBq3Hk5YbrjpdXOqQECxRUOlW1ebPA6nLiZvdoGnVkwfV95qHa
   M7O535gVCL+k2EtDq/OqichGiAErpS6j2yS81UaPgoLUANxvk81T7u69B
   aUCEs7jkbmo0NI4UMqIgC5Gb9KcWMO8yRZechuso6TW9KJBjk9fYHAHe7
   A==;
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="190983230"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Nov 2022 07:51:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 07:51:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 29 Nov 2022 07:51:13 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<guoren@kernel.org>, <heiko@sntech.de>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>
Subject: [RFC 1/2] RISC-V: clarify ISA string ordering rules in cpu.c
Date: Tue, 29 Nov 2022 14:47:42 +0000
Message-ID: <20221129144742.2935581-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <Y4XvnHIPw8ZuBZEk@wendy>
References: <Y4XvnHIPw8ZuBZEk@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_065121_364046_15B7D404 
X-CRM114-Status: GOOD (  11.76  )
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

While the list of rules may have been accurate when created, it now
lacks some clarity in the face of isa-manual updates. Specifically:

- there is no mention here of a distinction between regular 'Z'
  extensions which are "Additional Standard Extensions" and "Zxm"
  extensions which are "Standard Machine-Level Extensions"

- there is also no explicit mention of where either should be sorted in
  the list

- underscores are only required between two *multi-letter* extensions but
  the list of rules implies that this is required between a multi-letter
  extension and any other extension. IOW "rv64imafdzicsr_zifencei" is a
  valid string

Attempt to clean up the list of rules, by adding information on the
above & sprinkling in some white space for readability.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 852ecccd8920..5e42c92a8456 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -120,20 +120,32 @@ device_initcall(riscv_cpuinfo_init);
 		.uprop = #UPROP,				\
 		.isa_ext_id = EXTID,				\
 	}
+
 /*
  * Here are the ordering rules of extension naming defined by RISC-V
  * specification :
- * 1. All extensions should be separated from other multi-letter extensions
- *    by an underscore.
+ *
+ * 1. All multi-letter extensions should be separated from other multi-letter
+ *    extensions by an underscore.
+ *
  * 2. The first letter following the 'Z' conventionally indicates the most
  *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
- *    If multiple 'Z' extensions are named, they should be ordered first
- *    by category, then alphabetically within a category.
+ *    'Z' extensions should be sorted after single-letter extensions and before
+ *    any higher-privileged extensions.
+ *    If multiple 'Z' extensions are named, they should be ordered first by
+ *    category, then alphabetically within a category.
+ *
  * 3. Standard supervisor-level extensions (starts with 'S') should be
  *    listed after standard unprivileged extensions.  If multiple
  *    supervisor-level extensions are listed, they should be ordered
  *    alphabetically.
- * 4. Non-standard extensions (starts with 'X') must be listed after all
+ *
+ * 4  Standard machine-level extensions (starts with 'Zxm') should be
+ *    listed after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they should be ordered
+ *    alphabetically.
+ *
+ * 5. Non-standard extensions (starts with 'X') must be listed after all
  *    standard extensions. They must be separated from other multi-letter
  *    extensions by an underscore.
  */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
