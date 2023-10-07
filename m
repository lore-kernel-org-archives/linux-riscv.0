Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46DFE92FFD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znWk4O7nTBMFHegdl8MNeWzu7p7OoSz3FpKBcNGsKw8=; b=T4X5XCKuGI1ii1
	YUjJ8dvPBhPBb/0a+UdEJ9fYesFkjXQVE2Re/HEhby9cjJQVsGQs2pU/BLEn9AXdeqxZ5+fzqSTcp
	dPPh71J5U82aVM3ZVvVwXf9J9h3YMhE7pi2h0yLdf1KcVkZgj29ZwTjvTfeWDSKiOZcydkvNAdJXG
	D63MNEN5S4ZoVRT2UuAJUVzUNkTqAg8UM5RsDq38f5GQtg6ZOK4v6+rsX4hk3pb734dbP8Y4PJMm4
	k4d7OOXvRHjwJXJ9J/1y5ez262JreejpPLlHiuO6s7ki3KsGg/mdrg/08NvaSiGa9TaCE5L7LyhXn
	CWJ5J3oGy1uaf5RL9PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2AK-00796c-02;
	Sat, 07 Oct 2023 07:56:00 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp2AH-00794e-27
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:55:58 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1dc863efb61so1841720fac.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665354; x=1697270154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyz/NFb2RrzFYehpdBMm3ykpV/RwzR3J4zJlz09rB0I=;
        b=c8tYClyjmTYll8bYFl5uV6+DT+lbl6xBVCDrUH38w7uiiWbTZTfQx50eEJYN6kL4IX
         fB5H9uVyai5fVKWSaY9LQbnKY8I6XEGzhDg6PHfonXOf2Gdm7W++U9cPDIxIGjMvklYG
         R6aGWfUbW4m6j9UBGNTRQ+c88dZ4bWg6UkoF6ygph9sNs6JM726OEbccUNs1lv5/ZIfw
         CYDC/9qsjWfcuOIsZBYYCWG+wpgpP0gDPgTAk10u9f6CrN7ba86vjfS7RDCktoWktzhR
         D15vfXDk9X8MaA5wvbiUgwcwbYIka+KrCoZ8cU3jR35VZNrnDO/Ig7HZRbHRjDf/3do4
         qnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665354; x=1697270154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyz/NFb2RrzFYehpdBMm3ykpV/RwzR3J4zJlz09rB0I=;
        b=CKPsS0M9BmrKRxktgr3cV7csfCy8pmEHNx7e8q6ELusjvfB/zRIJ7ACTTYUYG5TVen
         GDjy4r0B0XTid2m6lXLFXYM2flZkiYLIJu2e6tSScHN3ZcTyj+zCmOrz2bfCRy/bvZKh
         vyo+P70iWOCOAYoN6NDtOBW9IAg7CJQzWDl3PCpz07QlVfBq5VergxFh4S1wtf8MqrlO
         tAlhwMUup2wXUUz4Zpprn53Grii1pd9fYIUnf1VFYCGh9l36KXWPBKp3uVuvlaJ7f99c
         pHoPR/6qYmEUmE96FNPHWzijtPpjpT9XLOOcNGz1TfdzZgNHCyNo3VHux04LJq+ONOUT
         Tzvg==
X-Gm-Message-State: AOJu0Yzu15CU7ltUuMs9vDdWqcAgeYmhdCQ/AJcdlYMsIyaOv1MF7YZ9
	7ewPbd5rCQQZi0EVdQsPEvA=
X-Google-Smtp-Source: AGHT+IFtQR7vQoLjtYMGn4gNnfGRwBQWdenp2J6GsNGMrzno8OB6IiiSMFDAZeL3agfFD/JQvctO8g==
X-Received: by 2002:a05:6870:d1cf:b0:1c8:d334:a6f5 with SMTP id b15-20020a056870d1cf00b001c8d334a6f5mr12551879oac.7.1696665353690;
        Sat, 07 Oct 2023 00:55:53 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id y20-20020a0568301d9400b006b871010cb1sm858758oti.46.2023.10.07.00.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:55:52 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 05/10] dt-bindings: interrupt-controller: Add Sophgo SG2042 PLIC
Date: Sat,  7 Oct 2023 15:55:46 +0800
Message-Id: <c639a1cd1e09c908c44f14d2156b643e577f0831.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696663037.git.unicorn_wang@outlook.com>
References: <cover.1696663037.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005557_693718_E7C698E2 
X-CRM114-Status: UNSURE (   7.46  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add compatible string for SOPHGO SG2042 plic.

Acked-by: Chao Wei <chao.wei@sophgo.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index dc1f28e55266..16f9c4760c0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
