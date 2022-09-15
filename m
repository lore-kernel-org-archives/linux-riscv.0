Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F67C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 17:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BUGRlCzIg68HTZJFM0JX1KWkyUjrVGaVRRAd7zSPWB4=; b=KEWZ1BIezC2CMp
	KFPh2qn76Bxr477q4+omEs0Zt6Wo7JG6yPAmOhShyNK4+EhhA1K/sQS73X0Ha15zRsJjMGvx7PIUR
	IwTlFMubFwsTE6lVZIQl8e52Jg327pMHBIUZfq+EJIsu2RfBuemaW1jeZQqS7eJT2FA/4c8lCSieu
	aJcosB5lpHaHWk8qKfhswXN9VNwWfOQfyJt+Mu+cyFD9GpHriTngit9zSIeb55FdgBJO3haa9LMnm
	/swPFvw0kGo0Jr9Fh/z5adhsksvP4ghlQLwhIlpxDthM6XJumiyZA6jDITm2IP7Z0NSVAARbG3mDD
	xHAFeNcpeOJ4RfODylng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsMa-00DuQp-IE; Thu, 15 Sep 2022 17:09:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsMX-00DuOh-5F
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 17:09:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id b21so18965052plz.7
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date;
        bh=MzjLsWwsMEvtVQwS3kea8WISTV/FriCydKOmRGB4teU=;
        b=xBwIfRQwAA1eeHVGn7Gle9nSvFHhulkm1NHZ4qEpV5c7x7QEpLApvpCnGDi8X+teXp
         PHXl9LYJhxBPWdDPbKAKXk5gBRvEXCIK0QwmuhCn3NbRynz4tDFk4lsQGaojbZ6xXH0P
         4Qx8uZUcVIwZO/obdevZ56NoGnrLU5hLUeuh8G4Nn7S8bAx52raNF5AwrWAHbmih0ATW
         yJ1pBkTGtMTzhxyuyYwSq6MUm0RNJAsR7sHpb3Dj9B9C4RhGdqvHBowZhZgZvlvGcwxR
         Cakye7NL3OKGLRkWJTR+w+pjlVBVkjE70S+bJ7J45RinxpbOXXaahtIoXw6xyXt2jGZ/
         dMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=MzjLsWwsMEvtVQwS3kea8WISTV/FriCydKOmRGB4teU=;
        b=0yU6B6DoEcN6+jpPqkRaBrWfQnjQelDy4E1YTvBzmIcT4LPV8GNXLRSXdqERmfeV2d
         cPFoiGZZqU04cypLRWBvpjCY9WZnlvqXVorI/PndMQoPYNTdCgwHbzI0Gdk4eI4zI5ae
         0jm8KCInan4X7HjWnkhz9tvqcGbvdA8/nsmpULOeziAE4+atEkvB9H8d+OuW9tT1AaCh
         tT3a16S41uaRStjmu6Kwg8XmCG+n85yBg79L58EejUFBGz7ZdD4NBhgW49yI1w693Ri4
         9K4uC5kkqrZ1vayCuPnG2B576pqBAuk6dOWQJMfKg3e3tq8UXrc0GLZOx4GmoNhGqLHS
         K3IQ==
X-Gm-Message-State: ACrzQf0vQC6WErQy+uz+9pLJEZY69m61SQiBrrTBbNY+4TSQlqy/CiPz
	c144hrf5x2R8nm+6hFAdW7L8XQ==
X-Google-Smtp-Source: AMsMyM586KF92oK5VWTnmlyZ9k5mOf2fCMkYo84u76aDioKF8pkhbfbU6NiVoAEeRNESc8fpl28SKA==
X-Received: by 2002:a17:90a:243:b0:200:80ea:a6f3 with SMTP id t3-20020a17090a024300b0020080eaa6f3mr11846063pje.9.1663261753546;
        Thu, 15 Sep 2022 10:09:13 -0700 (PDT)
Received: from localhost ([172.58.30.147])
        by smtp.gmail.com with ESMTPSA id 72-20020a62174b000000b0053eec4bb1b1sm12657540pfx.64.2022.09.15.10.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 10:09:13 -0700 (PDT)
Subject: [PATCH] RISC-V: Avoid coupling the T-Head CMOs and Zicbom
Date: Thu, 15 Sep 2022 10:09:00 -0700
Message-Id: <20220915170900.22685-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org,
  kernel test robot <lkp@intel.com>, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_100917_438537_713CDA2F 
X-CRM114-Status: GOOD (  10.94  )
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

We could make the T-Head CMOs depend on a new-enough assembler to have
Zicbom, but it's not strictly necessary because the T-Head CMOs
circumvent the assembler.

Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/cacheflush.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a89c005b4bbf..273ece6b622f 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -42,8 +42,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
 
-#ifdef CONFIG_RISCV_ISA_ZICBOM
+/*
+ * The T-Head CMO errata internally probe the CBOM block size, but otherwise
+ * don't depend on Zicbom.
+ */
 extern unsigned int riscv_cbom_block_size;
+#ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void);
 #else
 static inline void riscv_init_cbom_blocksize(void) { }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
