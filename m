Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE34C83F1B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2J+1uBQuZh/5VzsqLpG6bi8eJ/SqycDbJej4lXyRrc=; b=I7QtpGqMKbo/0H
	5s6G1Spa1bJoR2jb2utQx7p0qgMALvR6S96+V+9/flEqNrNfEgXYz8F5VYrP43qpm06vChtxGkZB7
	EpGrNngtNuxxtYwkfm0vga/Yz5YRAmsLgAlxziIz2v94aX85XCdcK47V7skZL8cDK4Sck7RjfO2BD
	tUo8R3N0+xbBLb4Oe0U+Z/xb3qMKICEzdwXYxX/QA2JuHOUNb5mW3RFXs0JUJvKwY95PDys3yU9Tp
	BfyB0lr0h6Zw5KLF4NzMYNKxHro+BBmB/XpROETkLOi5Ul0boHLneL5JXBu3tcbPfZzNFsBMzkwVz
	Lk+tH172Fs6SBSanW1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsVD-0000000C9dn-1aK8;
	Thu, 10 Jul 2025 14:43:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqlu-0000000BpyL-23G0
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 12:53:07 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-237e6963f63so5600135ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752151986; x=1752756786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FODh5LEn2POoazeC0llsDNSZPOaGEqIA3oG6I9SOPao=;
        b=ZnEziTiEUqJ+bZPr6lK+st/wpv+TNMIIGAzec1MmEn0iGXbJpHo7psADLDO6LVoS0P
         1iUoSuJzyqdT/DXcIymtj71fIZuGNqueSIBkkTiA9fcvzbjsnZSDWIKU+jP0yZxeVyl8
         8UlTQaoBCZY6s5Nqj3KfZw6B4ttlDgvjXN1Aludsrqe6MKBeXrmZdcSPT752xjWUJzNh
         Pb712KxO76LMTtUR8kYQB6K0yoVQZDY0aYgXPREQu6I68rfmZCRmcgkm31hQ+doelPu8
         wpR8TK6qFjGFckBtN3RdimtzK88S6D5leLTOdxTpgpDYZZuZNTJpL4rxqCfJJbEA5Mah
         nA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151986; x=1752756786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FODh5LEn2POoazeC0llsDNSZPOaGEqIA3oG6I9SOPao=;
        b=wETPTa31f4KR0HS9OpmMT1Mz78CN2/RNTpWTIMTlrGxxNOx/vCReUEojGZYlTX+JYh
         eDFuk52uT3xskItiyiKUbIagUSnphz6qJ14vVfq2Rm8OQ0tKKGRuZCUzqGxCW8uXs+eM
         KL3FgFxXNwSI56BeLgJOoMfNjpT/edgT42syfK5+P0Qj4ps5DjDZA6FAtCH3ONErp5Jp
         0Ap1W1KfOSYchewhb0NlguMroL2ygXBDUKl2MDnL294xctdBY8TOSJ/YGcPuSvviChQW
         OPwpBbEFVh1j2r1K2E0FjiYlM/C0FLSnuKeoHKEmhYQ/1L0WRXkSaakAEoHaewrwiABv
         OGJw==
X-Forwarded-Encrypted: i=1; AJvYcCUawsWg/lm8fmoma262KncCaGB7YsYQqFaKT4dMqcY4jnJWsJoegUgtEWlLRyy56kUPSy/dVCHQbklVRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEvjDDPUc1zZnh0wedGXXPrktCl9TeiXnVSnGCxkGkb0J5mGKQ
	nrs9e6YDOGAefSveR+EZ0wS2BCp7gvjKHymf6ACHD/USRSucoL9LNj9DASoh1bY7baU=
X-Gm-Gg: ASbGnctvjyy++TTMMlMLghw4lK8EScW17KLRdLiHVqxyl0i4RcfZ7r7p4B3fUVt/dfw
	n0OJFiYeOFyyTQYA0FgLELQnWEbLUD9LZKPFNZuXjDc0sJFPu4kFgCYbe+b33rW+V+kJw/up8Gz
	IlSdmuTFNiE18QnYwCFiuIYdeExOzoC2BEYUVP+mBajKECiJihC2iHFV2yl3QzsheMRHVPEiBA3
	52zljSGjP/wjCJho9Czij2BEgZBdeTxXyU/KtFouwfSPl/eJJwKqdBSZ8jjU2zpChysQMSed4t8
	s0JYGGOqR+Wqoe2Iyi2xsRsLVBV5HV8jd6+RALNwxf6PoGFLrMfFaAQJjMBNzvTihXM6hTf+eMH
	tI9LcnQx4Osrb6/kR8owGEe0=
X-Google-Smtp-Source: AGHT+IFK15bpyfOg1Dywk9BgVb8ZqGEGvpGQYgyG2hJu1g8/wtPz0YTQM4PXUYaqFOy2dAQIXo1d1Q==
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr36705025ad.8.1752151985837;
        Thu, 10 Jul 2025 05:53:05 -0700 (PDT)
Received: from ventana-bhyve.dc1.ventanamicro.com ([49.37.251.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359c68sm19230715ad.213.2025.07.10.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 05:53:05 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH v1 1/2] riscv: Add SBI debug trigger extension and function ids
Date: Thu, 10 Jul 2025 18:22:30 +0530
Message-ID: <20250710125231.653967-2-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710125231.653967-1-hchauhan@ventanamicro.com>
References: <20250710125231.653967-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_055306_532580_8540B9A2 
X-CRM114-Status: GOOD (  10.29  )
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

Debug trigger extension is an SBI extension to support native debugging
in S-mode and VS-mode. This patch adds the extension and the function
IDs defined by the extension.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..d1d906bc5365 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -36,6 +36,7 @@ enum sbi_ext_id {
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
+	SBI_EXT_DBTR = 0x44425452,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -430,6 +431,34 @@ enum sbi_fwft_feature_t {
 
 #define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
 
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
