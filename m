Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8741BC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgvpqeMXFXudxmhUhj5d2rYTiRoFkMt9S0RPV2x5Zms=; b=gLJJnCa0GLzkNU
	SBVwSuf7QedurL2UoBvqKLKsXaKzu/J+qXhpKrHrpA2Mj8IDiiXiArjGvAuapGxKW7vPFcnn7IDPJ
	G+cTJg2AdpueeBKPQZIF1igJs6lyi2JAlceVSd1XXi3lV5U89fh6TTf8spZNX2+ebJ2rYPA61Gpsi
	X3J3IW+M40H6q8Zmhx25xQHosoBqD14wjesp1TQOxJR/kVC5+GIG7lW3f3QeFXJD68w+lMBMIBYh2
	Hvx7K8AuUuOh7zrCkPDrVAOeONIkZy5ixfkgPrLQYLZabrtpWpVrhZ8d5EMu5WI5PaA5TLMb8ps5M
	47uj58hH204TJ723lXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohl1-005xOu-V1; Wed, 11 May 2022 08:31:43 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohkv-005xCf-T8
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id v11so1368701pff.6
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=Enn39BPEC4WUCYgELDojANydnjOiUN1oJPfCEc+x7uM=;
 b=Gp1gHM2j10a2iPLDhakfJsNgJKi88y9NRLaUJBNlnW78v2BGEQ6XPJOGBfu8m0uRGL
 ibNSkQX5XwNmXbNfZ/MftsJHoyONfRJ4hQWYcLl30YYlJYJ+Xg7pEcTzQDyCeTdhUTHh
 DWq8wd8Ezo9GwqLFMGv0oTzGHGR98VaxEGfsgKtehrYnB9nk3Hg1QLDYQmB7C8nyDlUU
 6XHZsSNESqI2r/wwwmz8exjfeW12g77zkQUDVncUsUKqXO2Jtg9tihNhKjZYCY9Dtqij
 0/WesLi+oyRtzIZUrxVWn8YdkRHR/wbZwgGn1vGnUclXV7MdLcIijK0Qp6+gxp8U+pnM
 xenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=Enn39BPEC4WUCYgELDojANydnjOiUN1oJPfCEc+x7uM=;
 b=La0kY87DlcnkR8Cf4bAlBqLXVVdDdoWAsttxcRGJVj+Ik0Uiz8UWd666T1bjmzDB6G
 yDHnadanCjo4ffEfi8bTdXRMlzRlWLpSZ7xRyEt0t34rq3Rph7x4iP+OA5NvzDtYYRSO
 KGjU9ZLHW4diqplvFimt8VWxqqLyeQ4Zfu1HXMK6/EP70JISIsY9F2B8EcLfKQb/HPwu
 tv6HL/ubJtMaIdAqP/HxcY+2xk1kK7YQknNHrI6sZFjSmu04Qqi9UaDUlrk05A9/zfyd
 k/AfzTpotMR6NVZoxOuNwr14QSxIoFfwy5XabNVSTc3BHSOFE/ZXu+RdrmU6A5yiy1Hg
 HjJQ==
X-Gm-Message-State: AOAM530FdkL/GgxBlY3GX7sUd/vh5IqQ3gz4NVHVb0uxfttI/0Atj5la
 4OWZP9Xq00AUXDTQPIvdkrIDhQ==
X-Google-Smtp-Source: ABdhPJzLN/nX3jESsXExXLfGAfX6dzBT5Ut7+OTmuducCoEMrkV+w/HchNMuYIp4KSucZL/AdZONwQ==
X-Received: by 2002:a05:6a00:2484:b0:510:7f57:30b7 with SMTP id
 c4-20020a056a00248400b005107f5730b7mr23823891pfv.70.1652257894092; 
 Wed, 11 May 2022 01:31:34 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:33 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 03/16] riscv: Add new csr defines related to vector
 extension
Date: Wed, 11 May 2022 08:31:13 +0000
Message-Id: <5b13445101fcdef8706aaba6e5a480e31ae56e03.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013137_985659_9F561391 
X-CRM114-Status: UNSURE (   8.50  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Follow the riscv vector spec to add new csr numbers.

[guoren@linux.alibaba.com: first porting for new vector related csr]
Acked-by: Guo Ren <guoren@kernel.org>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index e935f27b10fd..ac95578a2908 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,6 +24,12 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS           _AC(0x00000600, UL) /* Vector Status */
+#define SR_VS_OFF       _AC(0x00000000, UL)
+#define SR_VS_INITIAL   _AC(0x00000200, UL)
+#define SR_VS_CLEAN     _AC(0x00000400, UL)
+#define SR_VS_DIRTY     _AC(0x00000600, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
@@ -31,9 +37,9 @@
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 /* SATP flags */
@@ -268,6 +274,12 @@
 #define CSR_MIMPID		0xf13
 #define CSR_MHARTID		0xf14
 
+#define CSR_VSTART		0x8
+#define CSR_VCSR		0xf
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
