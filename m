Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E44C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x68clzazouDi0L+Tdt3dA32+WFk/MSIp/y/Pn2ad/AE=; b=UCewNrtQ8k9kev
	rhEGGd2WJzuDyOrXR039UajHwNPbWFJ6skCARDNsyso0U/o0X5+UE9OLzt48O/UCmJYKpjei3Aw+l
	8w1UHMSkkA/0mwxdMdjrP1+y33WpIxhUtJbkcfGRJGpPUu3q98sNVTGtrTftemGZ0CHol4ZF+ua4x
	exK+rw5Ly/MmZ6PKsyDm66b2NqLtoUDdY8vg91/86iVLcMiyPuIQ/vQTmpVIWKVfwUkxP8MhH7IFo
	LkLf54vh10IYZdKgXy/vdorXXTeDDVr06c81FfTR3gsPX6W0sjXAbztaOFTmC0VtM2DpzJnfbh+L6
	T5dkwJvP6O2oaCmVjxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwo-000000039YM-04x6;
	Tue, 22 Jul 2025 17:38:38 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGwl-000000039X4-2Djr
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 17:38:36 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-704cb8b1314so34956216d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 10:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753205914; x=1753810714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+/QVWVAbMlmawQzvkdd/uW3i3+BBW5J3oIOfjWO0MU=;
        b=ji5OCTpgGjUp4DrCY8nzgUHyFT1EdEnkxYyRQQT8UGvVfCAZhen9apDwwfm2cJW1A2
         hBBGoal3sO5fVMeQNXxJjkznIlNNL5Cj4ux3A8+msYoGcdBb5pLr74u8hRIhWht+VDAc
         6yX9kMsDyRufEqfNDh8UEFg49ZaLS435EEnITOzqSlnf8sfNGv6wNWaDiWSQC4c0U8Js
         CahhnBnzrJjK9O6xPdHGbUTWfptIc88prNLAmUiZF2s4US9T7FKWSg4UUxpzpjOqvxTa
         zwZ4nhW3H7Fz4Mge7Gt0kjYNijHj4lxvGTRKW2Zj6a9XL6OFANOr5DcTnpjkj3s4N/bU
         OFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753205914; x=1753810714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+/QVWVAbMlmawQzvkdd/uW3i3+BBW5J3oIOfjWO0MU=;
        b=vLAbTlTmzbFWc2tc6PNR7J93EMrroB4bUW/JCGhse0k2peiBZ2CK6SWcm1rqK6s9DH
         CheHIDNyoJCG6YQHXFBL8wrYjePniG+LYBxqEtit2m5ShjwWviVqT/pSE0jhW65HNB2+
         RaQAV8jZ1QGBog7nep9HruceqZm2wwzR00YidWoDzn9oH+mQo2MgOApbQowrz1gKBIc6
         AY+f3kZGB5tsIRuFv8w5sdc9ponj38Fob0u8KdQqmaw0OuWt68LWg7228zR7jOD8E5f8
         yIHkZ/nJXDNIhOEbq0sZNoN5DhN5Eo42S/WmLUvnK5esfuH7BecrlKlr1d+PObsSUOhR
         6/DQ==
X-Gm-Message-State: AOJu0YxS9zhT/KFOaq2yTvMdkarf4SEhdel8gMDIl/bMIabMPcd9bcrk
	XNZnbBIXumHXp6dosn9IwQTO+2IVaPAfh+G8NngcadEpA5rNCcih3WnD6XMHYx6JhC6tWHfUYRE
	0K1CG
X-Gm-Gg: ASbGnct25eqPMYAxiwShaYHDzNVkghqHyTmF5t5WpCgat+8PNdGGnE/x9r2V9PXltOY
	Bc9SaCnuzuwvy9UdoyLL9XW4lch79N7OtRCnnoK+TgFne6jPOlmW2p5p5f2+KF6sBxrzdUU9wD9
	5PpQ7BBwSRF5qW+xyIEaSgpsx7R8CDB3TkcklnmgSyLWVgwAR88WpoUQ3sXM/U0ZJMZTZf+CKvy
	1Qzgxjp89HkY9UF2tVV1n05zMot66Ttgq6FZxb2JKMnMgCQdoFxl3YPDFiv0buMbLn6Y4lwlNT7
	X2yEFDDHLHjIYN26PWUm2g8MYpkC4wq5lLVgRCbG29Xz8yB3lPmoxJzVl1WE/AxIotVQtATRI3P
	uRSn1We5JjCSup++LbWTr1o1fAYbdYN8f3baLmqCpNaEo67QC7CzXNdTjnfwG6GR8f+qpHWksZP
	sL0/8rvnnbWW8=
X-Google-Smtp-Source: AGHT+IG6SNdAeEQgHa32J5nhXO7PW8gNm0clufSPeGcbDvffqcuVjPUUxogWKFcpPDYTBay+0VPNTw==
X-Received: by 2002:ad4:4ea6:0:b0:704:999b:e5a0 with SMTP id 6a1803df08f44-704f6ad3e7cmr422679046d6.34.1753205914143;
        Tue, 22 Jul 2025 10:38:34 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b783sm54184536d6.73.2025.07.22.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:38:33 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Evan Green <evan@rivosinc.com>,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [RFC PATCH 2/6] riscv: Add SBI debug trigger extension and function ids
Date: Tue, 22 Jul 2025 10:38:25 -0700
Message-ID: <20250722173829.984082-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722173829.984082-1-jesse@rivosinc.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_103835_568549_6559A4A7 
X-CRM114-Status: GOOD (  11.44  )
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

From: Himanshu Chauhan <hchauhan@ventanamicro.com>

Debug trigger extension is a proposed SBI extension to support
native debugging in S-mode and VS-mode.

The proposal for the extension can be found at:
https://lists.riscv.org/g/sig-hypervisors/message/361

This patch adds the extension and the function IDs defined
by the extension.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..be2ca8e8a49e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_DBTR = 0x44425452,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,34 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI debug triggers function IDs */
+enum sbi_ext_dbtr_fid {
+	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
+	SBI_EXT_DBTR_SETUP_SHMEM,
+	SBI_EXT_DBTR_TRIG_READ,
+	SBI_EXT_DBTR_TRIG_INSTALL,
+	SBI_EXT_DBTR_TRIG_UPDATE,
+	SBI_EXT_DBTR_TRIG_UNINSTALL,
+	SBI_EXT_DBTR_TRIG_ENABLE,
+	SBI_EXT_DBTR_TRIG_DISABLE,
+};
+
+struct sbi_dbtr_data_msg {
+	unsigned long tstate;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct sbi_dbtr_id_msg {
+	unsigned long idx;
+};
+
+union sbi_dbtr_shmem_entry {
+	struct sbi_dbtr_data_msg data;
+	struct sbi_dbtr_id_msg id;
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
