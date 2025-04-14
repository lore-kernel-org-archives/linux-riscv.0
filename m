Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9BEC369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9BXqKQGh+ZqsxukPw+3hDJDsDBHnVKkP/6TBboJpMfU=; b=C/mjQv8a6Ra4yh
	c6puAaaqwL9mukDhT0IIWKdHpRHejjuG4TCDBxfrPccJnSpqab122F8antb8bevWq+Bntog+px/i+
	vR/ZPSjQP7jXa1nQKIP4G+s8ytnrnPq6hJsX1HR735Mh4Iuz5m2ya0APYQ9I880c2tc5nHDDfHHNM
	cY6qaxiZ9zR4Ftk/VKe4beXWNewsqIwqS9iTYMdmRBlmSxO4RpwtNihuYwi3luxlFRW7rIgMh6qvS
	KrBvLQ5GP0ATXplxD9wvWWQdo/D1BOWqfG9AQsUhMVA/Tiivx3r8n6C3FugMZAOxFGG0QpgN+stld
	Aperap77HXhPgtwIRrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4InX-00000001vOx-0XK1;
	Mon, 14 Apr 2025 12:20:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IdL-00000001tRw-1XxX
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 12:09:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso45962235e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744632589; x=1745237389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zE3/vIaDDm49Ow0awT1xfzab8Kaog4yG+YjbBkNm2n8=;
        b=mQccs1dLJ4KFIx2c3GpTwfVgG6nX1+aZVKaDFSXFomQg+AQIZapd3rywcXwwnr5UpG
         64VvR0NoKwoSNNPASPNDdRn7/VSn4uOYQOlAQJVFitLWgQyQK0TeHV+Um0VgdIKwpMuk
         9/nhG+auzSPJl7g9E3IBK2yC/fWphVYPM8Bt5zr8YVwwqLKYfM/+vF80lFCTF4NoKTx9
         auZEexceEJV8NykJAu5A4dKpOwzxaTRJm790MUwDBeSJ4Xo2Z2O5DYhbzmiJM77bArDy
         2kwtUenSt2sspufC/Lnp3o6V0EXmTNmMsXDSm/joxWVME5xzMLYrMlM/5r9ejAXw+gFB
         rZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632589; x=1745237389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE3/vIaDDm49Ow0awT1xfzab8Kaog4yG+YjbBkNm2n8=;
        b=X6eCNqKaH0u45cBK4y7ESQGsHPlXBFgGRbVboYe9JwzmqlTb/ZUikrc+9kG8VZT7Nl
         UbJvRiQpyQrKjCzMWvEZj9HzJeEUr8NNDbNsU5gica5SdPUj4C9C5RkapU+d8YQVtRGn
         rg3FGz5bOIuW/2mKqw1Mtewy5OhuGQvyWd/zg8+OpcHc6M/h8zbKxLa5ltmncKzaCUMH
         cFa6qA1Y6jg3inMTnPMByMrbXfwjbY3tGAFsY9oSQ9xj9k8PeYrtThSTNoy6mXX5Uha3
         XQvdkFl9DHpo1tm/+4c803W/n3zuJihMKnpUc2fk16oZgs35d2suSpLt3+L0R/5KhIV1
         yifg==
X-Gm-Message-State: AOJu0YwpOLUwslB6mz1r/AholZO4ypYS2rDNmKFpKLOmyu3FNtWFFaSN
	0Vda0TUhSz4HkBzkVr0P40gX6I55gpuT14Eqj+R06BEcHRgirHMr03jjzWIkx7GqIp+DTRI292Q
	WjO4=
X-Gm-Gg: ASbGncsUyf0l5iRtVmKDTBG6nPXNHs/3fRtgcuGvEU8rQDMEzER8mStT7Xq6oae69XQ
	ao078CZOaRwk4f5aO86B2qRE1F2eptsQgvaM4r2id/eUZcsCC/rZPKPjDsc0e5nqk0j3VC7lkND
	gb4oiUV/GllzO0L/47+dTbM2VPy4mLHtg1Iwimvo2GUSkn7L5Y0OWQCVeKZKWjPzAhpRZTFgQzc
	x9Df3n3KruzGULwQYoE9nRAjMt5TEGuP6I/ojBiC06aXPMISy8bjes1MuWRuInq/bz6nw0hklHd
	QW6ZvFMjKPISH/nGgJjw3I0z0RCm
X-Google-Smtp-Source: AGHT+IFNxS0Xit/RMmUSHhm4BTUKEcgXGGkLi80tu1FflJzbof+IkBnb8Wny7dyxa/mkRZ1Jg7nFRw==
X-Received: by 2002:a05:600c:1da1:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43f3a95de2cmr125882165e9.16.1744632589124;
        Mon, 14 Apr 2025 05:09:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c46sm174308315e9.13.2025.04.14.05.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:09:48 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	oe-kbuild-all@lists.linux.dev,
	charlie@rivosinc.com,
	samuel.holland@sifive.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: Provide all alternative macros all the time
Date: Mon, 14 Apr 2025 14:09:48 +0200
Message-ID: <20250414120947.135173-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_050951_406877_8B11529A 
X-CRM114-Status: UNSURE (   7.43  )
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

We need to provide all six forms of the alternative macros
(ALTERNATIVE, ALTERNATIVE_2, _ALTERNATIVE_CFG, _ALTERNATIVE_CFG_2,
__ALTERNATIVE_CFG, __ALTERNATIVE_CFG_2) for all four cases derived
from the two ifdefs (RISCV_ALTERNATIVE, __ASSEMBLY__) in order to
ensure all configs can compile. Define this missing ones and ensure
all are defined to consume all parameters passed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 721ec275ce57..231d777d936c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -115,24 +115,19 @@
 	\old_c
 .endm
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
-
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
-#define __ALTERNATIVE_CFG(old_c)	\
-	old_c "\n"
+#define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
+#define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#endif /* __ASSEMBLY__ */
 
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
 
-#endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
 /*
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
