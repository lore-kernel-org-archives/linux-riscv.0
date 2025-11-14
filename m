Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F70CDE017
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QIP25sjBYLQAB7wLA+hZmMI4/zFTKottD57u1RM/8yA=; b=YR8SY/SHkMQVJn
	Wat3iVESyi8bYu/amPKi1bZEmnR5omYguyNTNi9Gp0l6T0eNen/+CV1CV74Qrub6Y1du/Z2hSvUn5
	u4ihJxcBDUL1wa6DMPQ3syz/p99EJdaNx0Qs39/phpWMrWyVdr2HOuvqVsxVyiD4ESqx4AzDks7KZ
	ye/1Mahw0Ut/ir8wkQaTk4pfQmjZapAMWmq7jD0DGVZD2EsgGUS5ZvYIM3nJwhoZCjiV+S+Mw9m2z
	SzZMKKYFsF6GQjZavF+p6b76jeFIN1en3gM7EyGApQz6L5TA2C+6vHVs6BCPZkYPGddv2669GJ+DW
	khRFwE8G9n4t8sIQwz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnm5-0000000BhUo-4970;
	Fri, 14 Nov 2025 06:59:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnm2-0000000BhUI-2ndI
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 06:59:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2955623e6faso14617345ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 22:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763103550; x=1763708350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=028lPzzOUZKFDf3wDAjheqfgxvf5fQ+P2U0oIP+JGuM=;
        b=VkESEdk3qaATqHrGT4iDO2pVWAkFlo6LLj6b+QF/diChmK1+XXuWCAwgrZdtvvQjP+
         GhutE5fbR85TmJJccj/JlKzuXt+mWjDZ3rBjeftMxMrcFxk+zNaVB+ElDogh/VprtGRb
         MrBVUB2IiunFCbtWA2K9GTtsQKApLZUgBsIh9R5vry9XEc8GzPQlXOmfmyHTtIWnEL5c
         188yFtRVD8Hi3wBguyZBW8WBdUOyX6kuMtFnaRtIQH6wnbNd+ssI3PUCk6YrgElBAXzv
         J3NBE8PW1LNpHiYbPH2idllbAdijVOcMjpKwRQkIhhzcg7wtaimdBY8MaLI6RPJA+mxw
         raeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763103550; x=1763708350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=028lPzzOUZKFDf3wDAjheqfgxvf5fQ+P2U0oIP+JGuM=;
        b=cLKV5HsuAJGd8spSjx/gtxoTGxUU6+iE5mPzI/CjLqpQvYVDFG2TO68Q+bd5Fodzz5
         coFU9EoDMfeQrb5nRaHxzvRIaeNBTVImwVFfEjD4j2eiTjcBKGHctKJlEe4p/JMBip3p
         oDXJIGTGV501s30CX+oFySDCEqNmG2NgEF+ywo1Cco5Nv1nAj5TTJRSQmX77XviJuZ/6
         8501ohM4bYpcu72ITF0iBhdyqLNOf/uHUuQRgiFRW8hc9PtUUwNpLNWnvxL/xOZT0DXb
         Brei4s/XAwA7KCn2nxvqgK+hTak7He0UCPcgGIH8SG0uxm+JWWZlmxw4mmpRhjEZ/bif
         DRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Vcp+ws738rKKkLe028IzucS90k577AqJ8bXSLDgMdDohJOm6bMq2BMza3ypekp5dsupdKZjnbnOYrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl1qp14EMppM84UYu60XJyNJadQdiasib0ADjwogUGihKujq+3
	MP/y7qbBl+1Mzdw0t09Usrcdrsc7rRd4hTIdaUZV+hd4ER2a42RJOUOK7ovkzyGVAF82y1YGsvT
	4HyJGZFI=
X-Gm-Gg: ASbGncuW8PLeFN8h0aXJt8oWWtbah+CagCix0Ci5foHlqlx1WwYujG2ZTFnns7+pag3
	rI3gpCbLeRmQAhJL3FVOZYy37E6aPTLwPoP95McRTP6SH5TMXAQ9FXFBowNl+KEgwm8ERNFJw6U
	pR81l30hj1YUH7kkgzlPQoOErqBq7wVcOq7w3n7hAaK5YEe/W+Tm+oxOIU2eKxRjEmGRg1Z3cz2
	nXJpAFaDvKXwQ5NqH/BNpZakOGums+OCi6mXh9a6YKwgcqeIJKl9mdjQZZNWupISfJrul0nbuOu
	YakrTf5byWpSOQu6QBMVDz+rHuGqbiO76NdsIfDKNf49y0DwmeJIQ4PiapuZFg0qYkWuJoBuec3
	I1Ky/AJAk5nWmtE//ZPLQ+KgBnlPBErCEczec1i98EMZ00jvcRtsxqnf0TRbGs8lbKU8q6gUc4J
	cwLcFyeg5Ma81pkAJfrwxQjA==
X-Google-Smtp-Source: AGHT+IGUE8wsbPFQ6BIL5ovlTSYUQjj3V+/cGNjSzG7NbBy1gxYwyfBVT6ezJnebJ+aKKIg7eCYgEQ==
X-Received: by 2002:a17:903:40c9:b0:295:9b73:b161 with SMTP id d9443c01a7336-2986a74f569mr21401235ad.44.1763103549622;
        Thu, 13 Nov 2025 22:59:09 -0800 (PST)
Received: from localhost.localdomain ([106.221.223.120])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2985c1800ebsm46306665ad.0.2025.11.13.22.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 22:59:09 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Davis <afd@ti.com>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: sbi: Prefer SRST shutdown over legacy
Date: Fri, 14 Nov 2025 06:58:06 +0000
Message-ID: <20251114065808.304430-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_225910_709083_1C16D172 
X-CRM114-Status: GOOD (  12.19  )
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

Currently, the sbi_init() always attempts to register the legacy shutdown
function as the sys-off handler which is fine when RISCV_SBI_V01 is not
enabled. However, if RISCV_SBI_V01 is enabled in the kernel and the SBI
v0.1 is not supported by the underlying SBI implementation then the
legacy shutdown fails. Fix this by not registering the legacy shutdown
when SRST shutdown is available.

Fixes: 70ddf86d76c1 ("riscv: sbi: Switch to new sys-off handler API")
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/kernel/sbi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5e8cde055264..c443337056ab 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -648,9 +648,9 @@ int sbi_debug_console_read(char *bytes, unsigned int num_bytes)
 
 void __init sbi_init(void)
 {
+	bool srst_power_off = false;
 	int ret;
 
-	sbi_set_power_off();
 	ret = sbi_get_spec_version();
 	if (ret > 0)
 		sbi_spec_version = ret;
@@ -683,6 +683,7 @@ void __init sbi_init(void)
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
 			register_platform_power_off(sbi_srst_power_off);
+			srst_power_off = true;
 			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
@@ -702,4 +703,7 @@ void __init sbi_init(void)
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
 		__sbi_rfence	= __sbi_rfence_v01;
 	}
+
+	if (!srst_power_off)
+		sbi_set_power_off();
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
