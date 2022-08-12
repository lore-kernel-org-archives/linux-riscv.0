Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A041C25B08
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 14:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ApXCbxkQL55Ffxc9owDOiG8aVjMeoK79m4LgSRZeNc0=; b=L1tDsqOFCYuxEH
	QH+uy6OmG0yFbgm4YKaFf7qqmccIlQTM3lvMb5TbYGjm5/QfEOPBfYdLXj5MzmsAr4vWtOgNE6lda
	kQ+DDMz8KjokKLC0UJp1ME0A4lRvj3i2sZwPw8osdnln8QwGSLmAaTBD9+ddlhaMnF9DgpYExYTpc
	WCQP3nKHdFdyHi5Y7V1l0REygN6bkiHc2hJkBfah4xLBvr4ZrpOAnMyHsjrjtyq7f26wua8yfWnCN
	Zhk59s9btPFFrTOyPNafx6U1B44t8E/jfGHe9BeYpP1pBTE38Nip+j9oEBJBkI/5u5gCUIGA+Pfvh
	rAs8vb8LDbShLjDuEQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVaH-008tVi-PF; Fri, 12 Aug 2022 14:24:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMVaE-008tTZ-7K
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 14:24:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id 13so863603plo.12
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc;
        bh=3UpPx6QyEFGn3Wb0R8R3j1aJNvl0aHE+/LenbNKUiHs=;
        b=NZqrJ7AIy/BD6Phmqc4rrwexvgC58KwTe5lXEQCvZEpXQvHsIj+c4vN621WhUm60TP
         NawG8N4ZRAvLBTtsKsM1r+XR3hJfoun4OqaNrsVTdxgfuOJ7JKVk2g3K9esxtBHtOJJz
         yMYT0A6N5gyLDbyiPsSIZeBHB5MhYKg1dvAKurpKADPUlZIjnP37EskTauhWjZHSdl/A
         38e2hQxdyCauYOrO1cNLku7xkscu4tRRIalpCjsmUT/arGuPeNzDxSthKfpQdxet9e1n
         thTJk8A4+ZZEoOSxlDvYs6iL0nbOkIxpjyPZG01Eyw6LpQI1nWhs8wBoyv5EKkz/KUQl
         jAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc;
        bh=3UpPx6QyEFGn3Wb0R8R3j1aJNvl0aHE+/LenbNKUiHs=;
        b=seaVxIIu2C5XCVXIngxh2AkX0auDvxCi5Y8IJuAtvG4bLJeMfTYqdJkni9lZq83tnT
         UfHpOWwZn2e9wrBIWB2Z236Jwz8HSb2JKPYcS0j952K0qI5ykrrOvIY4onLbi+HfgrUz
         UKG08424igvDs2lt8Wa14nUs7POs2iPyhfZujkOdUVCRAVDkuQXC8ChhfGqitF+shXyg
         Mds9irOx9Q8frF372CjfY6tBoHbsPzbe66mLpcVypHT1MivEG5KnR1QGpKBdraicgOS0
         sBGRwypp0s5bTbZuuaQYyn8xUeQHsq+XQTIdJopv1Y9S5qIHPR+qQO4brAzKKy+D9b2C
         gFyA==
X-Gm-Message-State: ACgBeo3nudPLathTFHx601bTtYWSSLfDQkO9PXDO0R1wFYXUf1RPN4rn
	HQE2xUmjVxTbKkvBJX9yDKYU6ZUAoG0m2w==
X-Google-Smtp-Source: AA6agR7YfdvJyY32xaJiM/WhyG9eaDIWiwJPLHY3oFk4QvYnIvn78x2PKbhRdntcBi9d/OSGpKp/mg==
X-Received: by 2002:a17:903:120d:b0:171:4fa0:7b4a with SMTP id l13-20020a170903120d00b001714fa07b4amr4096488plh.45.1660314255852;
        Fri, 12 Aug 2022 07:24:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902f38b00b0016c4e4538c9sm1785786ple.7.2022.08.12.07.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 07:24:14 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't truncate a hartid in the cbom-block-size mismatch warning
Date: Fri, 12 Aug 2022 07:24:00 -0700
Message-Id: <20220812142400.7186-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_072418_496607_401E2913 
X-CRM114-Status: UNSURE (   9.01  )
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

I forgot to update this when sorting out the 64-bit hartid code.

Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/dma-noncoherent.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index cd2225304c82..61a4337cf7b1 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -83,8 +83,7 @@ void riscv_init_cbom_blocksize(void)
 	u32 val;
 
 	for_each_of_cpu_node(node) {
-		unsigned long hartid;
-		int cbom_hartid;
+		unsigned long hartid, cbom_hartid;
 
 		ret = riscv_of_processor_hartid(node, &hartid);
 		if (ret)
@@ -103,7 +102,7 @@ void riscv_init_cbom_blocksize(void)
 			cbom_hartid = hartid;
 		} else {
 			if (riscv_cbom_block_size != val)
-				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
+				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
 					cbom_hartid, hartid);
 		}
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
