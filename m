Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D5CC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 17:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hs7YiYp0lxr9IJ5oB5rIMp4uhwLJw7c6Jt/5IwFkxO0=; b=lix0m8zV5j68xg
	p2X00o0RxUxftT/Dp4IngmBOgvSwX/neNOhMrs8+SXSem+ACjqK8IeRe6OX2BaeADbf7VUpf8od+4
	w+aqNXWSUCc+pcdkyoGqjFST82KymvBCph41wrz5voiu2moUuFkOApu4oltJgoVVtwzwCtUZM/Tbl
	HSHRxaiRCwlS9obEOL5Av4/iQ+PoKOe/xfs6A5UQfz+KulW8f0VfziwY4uVdfhz1BpBbJare9XwLr
	jl4kgIkO9DZZ8NuoN+HVcbg+cQ1ej6v41LRSwJsvoG+T3MLQUMOI39p75beEY+pkPEfQimOAVlFeH
	6chFNl8MZ+Cd+Ny/JEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrj-00Ag96-9I; Thu, 21 Jul 2022 17:21:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrd-00Afwc-B6
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 17:21:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id d8so3219490wrp.6
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SXLvUdDnjJEodQJ94faqLUeDy8d1elhS2wljuKyR9r4=;
        b=OSGxsO7g2K40pu0NwLqzvnlUz82CEbFPTvtAHhq0Lt42XIo478IZ0cVHDyZcv3LzN+
         doQwS0X5S7UHIxC9NIByl8mpgfD+9fykQt8oCdaEmU61OOI4m/PpDnv1MosqFBkN+Mm6
         Eah/SZ6SreSS+CWTZNEMdvTvTRoLgblAU2dfyUrMl5tNJESdszbOWXfe3Gd+tsC1mNIa
         V/LZjsE1Rq7iYgiJNcx4XZ1FcwcPBXWrZdOyi6bpWW07Bp7wovr21Nkp97BOPnXf9a9S
         k2mwT8d9r+UvMll3RAl+MpEmvZNnLBOi+1iHTbqB2z5dlGiFL851dRrd2FQgyyixo8v7
         HSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SXLvUdDnjJEodQJ94faqLUeDy8d1elhS2wljuKyR9r4=;
        b=7JVeuZd72FQcn70GgwytY4qwPD2Zx5d/iZNxb0bKvTTtdeIUjXQAmCLoRIFGLZIKR5
         /zAUp6XYMWBbQ35Y2FMEmoHlKfDhCw7FDTtQqwxLBbr/CZhf0GPvJ7Dzpoy98ExfaWba
         1LfA966xXw2dQVm93ZhO1oeWfK3zfzzVhSwY6+1x5K7z2BnX3Zj9PV/2olRdaG8EUtPK
         C06GySuL1/xuUwzTq2l1myTdyiI5QlynoeAR4oEeSvu3V+w4nUE4LcvazeAWGFymhL5C
         QVcPiClIRBAFV1xBbkRJE8qXD4tcYw0M1jndAZ7/9gm8cz0qfCD2MD2YYPs2ZVCrqt6U
         Y9wA==
X-Gm-Message-State: AJIora8i2Qi6sN1oU2WkAFe0iuxT8Lcpap7qSyNdoK1Q05b0g73zFn7C
	VY5nAC+yzi+SJnryd/rgIqdVp+82MtCeVa+5
X-Google-Smtp-Source: AGRyM1sIASv9vmR7KNGAFsXqp4jOf5Se7BsMQgouD3zNrQ1FA0oeq0+2XKTq6qHLn4chl5q3KOnZWQ==
X-Received: by 2002:a05:6000:1847:b0:21d:c149:263 with SMTP id c7-20020a056000184700b0021dc1490263mr30567246wri.449.1658424086844;
        Thu, 21 Jul 2022 10:21:26 -0700 (PDT)
Received: from henark71.. ([109.76.125.251])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003a2cf1535aasm2455697wme.17.2022.07.21.10.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:21:26 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: u.kleine-koenig@pengutronix.de
Cc: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee.jones@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v7 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Thu, 21 Jul 2022 18:21:10 +0100
Message-Id: <20220721172109.941900-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220721172109.941900-1-mail@conchuod.ie>
References: <20220721172109.941900-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_102129_446100_C939296D 
X-CRM114-Status: UNSURE (   7.79  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add the newly introduced pwm driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d14a446df13..c785765c66b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17510,6 +17510,7 @@ F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
 F:	drivers/spi/spi-microchip-core.c
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
