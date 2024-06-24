Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA384C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YhaslUfIwwnovbR+VQsGOsBg9/9Jh9voUaPVvpYeddc=; b=x6+zFG9+X5ok5N
	WyLAx7CZxkQRAhLGFwYLVZczN/xNrvNHisfSUHsdHVjoIBN3WOXfYED5gT/UzzxCBrgsOoqDIPf9i
	1xu2fL4hOMxe404SCp4IAhscV4LN17ydfZCUQeXGXuRuH1lVIl2bALxTiuTjyCpFReJVmWyPJvEZl
	vqPi/Z9o+RCq9SBDbAm6No4hn9qhg5UnmkRurQprjixG0smnElXdN4JHEk1uBo570TS+VC3+Q3GRp
	Zrimxo4vevcw6dm89d1mPiQUV9pNQdfEGvj7Qz6pRC7rQtUIYWaL7Silxy387sGcIzRfwZ34Lg3vk
	bCfzgVXnZ7E3E8C261nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLide-0000000Gk4X-0JUx;
	Mon, 24 Jun 2024 12:17:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLida-0000000Gk43-3CMT
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 12:17:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-364a3d5d901so2976656f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codasip.com; s=google; t=1719231452; x=1719836252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K5lWE14O0q40ZM3Q7e7I/Qkwnqb7aa5e7ucmPjX7TUI=;
        b=CqADd2n0CqsL20M9l0PHH2Q/Wr0KbHaDSz/20Sg6xc+ZP9vtTWnI9VdEz+VFXJnX8s
         SyRyXZ0yj/SrhCWXyWbBs5kwBb8V+zGhmhiMXmP9pOnv9xJwya0FzZsdcPxaSaVYjdCC
         7Y8IOZwXc8MmMe0/xLs66t/e7SDCPmphGtMTlAxCkxKmNa2PmxE07TuJW24tTwFFKcQy
         5pMlUrssalW6yBLgzl9PHJEq69oZIf2Id3K0ikBTGhInpCRhS7xJHTvtC+ZxN1N189jD
         a4tW42mq0Y254mHcw3qi1SK3kbujHHUAGEDjCWIQm23saT25qWMf/Mq/xmj5ylkWuGNo
         yThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231452; x=1719836252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5lWE14O0q40ZM3Q7e7I/Qkwnqb7aa5e7ucmPjX7TUI=;
        b=sXCisIhulj8F7MJWoIX4fTc9ERP/ds/zovy17SIuZin1unh23WoyFY3rGOcSrIOTkG
         Sov2ULLMe1wJFVGi4yWRQPIgFxDRlMg/CEdF/+HiLcqGkesjIntn/CP8B+kHObDlFdb1
         CoyDc/++FkkeamRslfxsIczXFTYc/FrffOIOcxkAPr2Krzqfo+G7K2j6wxahxZwMSuNC
         lOKL/KZje/IUrD6B8CKKgm1nDrb+JNVgWyc0r12cb4LMweX7+RukG5rbf8GuWv8uyZry
         odcTJQ7wy0y9zq5Hl7p5984acj2SvDNPPlYYgjZIAgUtY6/w6CqGaiL6ziNalRa4zqeb
         6QuA==
X-Forwarded-Encrypted: i=1; AJvYcCXju6h3lArMwDEHSDloFxvC/WRS979IED+Ly2SEoT8dcg4j3O0GbIrulGRIgIB+eDWTtNEwLs5gDgnUxxShi+93sRcAiIVSFBLrwfOypSEf
X-Gm-Message-State: AOJu0YxIBIP8SOpNU4WUz2WEbkXPSnc/lQx5sWMvdC9qRTSBrKuzs4I3
	2u++AC5HJHTwidZmZEyxVN3dMMj3tL7JS00zxq65KRVKcZG97APJEK9P1d+tudk07dyRqE8AsJs
	nfHM=
X-Google-Smtp-Source: AGHT+IHlTVb4uXVbpvGdrzA3vLqFoPj0qa5FX8+qTKTnek1ZPTk/8klkQRo+HeGDJOeUrnb/fhPXuA==
X-Received: by 2002:a5d:47a8:0:b0:366:f64b:286 with SMTP id ffacd0b85a97d-366f64b0350mr1487982f8f.37.1719231452509;
        Mon, 24 Jun 2024 05:17:32 -0700 (PDT)
Received: from nb152.localdomain ([167.98.108.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6da6sm9869486f8f.12.2024.06.24.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 05:17:32 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@codasip.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Stuart Menefy <stuart.menefy@codasip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Remove redundant restriction on memory size
Date: Mon, 24 Jun 2024 13:17:23 +0100
Message-ID: <20240624121723.2186279-1-stuart.menefy@codasip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_051734_828053_D9679885 
X-CRM114-Status: UNSURE (   9.82  )
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

The original reason for reserving the top 4GiB of the direct map
(space for modules/BPF/kernel) hasn't applied since the address
map was reworked for KASAN.

Signed-off-by: Stuart Menefy <stuart.menefy@codasip.com>
---
 arch/riscv/mm/init.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7e25606f858a..3998d1ca369c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1130,13 +1130,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 				0UL : PAGE_OFFSET - kernel_map.phys_addr;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
-	/*
-	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
-	 * kernel, whereas for 64-bit kernel, the end of the virtual address
-	 * space is occupied by the modules/BPF/kernel mappings which reduces
-	 * the available size of the linear mapping.
-	 */
-	memory_limit = KERN_VIRT_SIZE - (IS_ENABLED(CONFIG_64BIT) ? SZ_4G : 0);
+	memory_limit = KERN_VIRT_SIZE;
 
 	/* Sanity check alignment and size */
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
