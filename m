Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319C0CCF9E9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6e7O69FMDlY5qL4ujALKiXliMgD4Xzx060e9KgBZsk=; b=17WiK4TwwGAnGh
	7tIyAJkIDjdOKeMiVIGbuKac6xdZsSthY2cMZWSn6arg90OyS1d+6Tb2DA9VOGUQ445/sMDe13iJu
	65MBdLkfmV4AtdPJG41bWLSxT+9m6swsen7vZIciGyo7fOV/a3uJd0yGeK+8wChoTGZnW9bQYyibu
	mC/H2/vm6aW03iZsnDVCTMFFyiI+VjVW+6vxWQrqsq7U5Fief8AJi3L+MyE3L/RTJ/rMT18ICXi5V
	1MsfUnFL6mVcG9ylxMtDX15SSNA9Ry+cEgevqym+8WCbIdWghGWSj+g8WrOJZjbpT4hbh4a3AVc59
	/mfgSyuPLXsi2wi7tg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stiir-00000007TOJ-0Yp7;
	Thu, 26 Sep 2024 07:15:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiPw-00000007PVM-1kIW
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 06:56:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71b00a97734so569459b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 23:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727333759; x=1727938559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBjlL5kJGWFBAGi9ogPc+NvNpZhpYyzyT9+ZEo8HCi0=;
        b=GlZf2+bz6HSaTPwQp/T4K/sAFvs44Mx85ItPOq4fUv+zb/9mVfxf0tmDsAdu0vP95L
         vw4A9/KaOMD+rXT3aTWuluOdiTlhe+6hR66Gr7tXqZfsZ5FvWbDIwcPdtIg43dBBfdKz
         I/BGGQn+BV50Hx0phTTHM9DkldOcVnnbJpn65CMi04GPL3ikvB7rODnKagUaeNGRYZXk
         vzE+ssUYOlz16i+iSkOFW4ISxrRAacGexYcwzML41UuCLhhR8TuFmQZR6+pBCW23gqWF
         bAZb3MaowF0ir5o8+c7yOWXpIVjvPTtvOEHEDBSCm+lvvsYfBivCZVp/LULLyA/qYoVW
         3whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333759; x=1727938559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBjlL5kJGWFBAGi9ogPc+NvNpZhpYyzyT9+ZEo8HCi0=;
        b=r/MSq+x8pH2SkxwLw1hKPSQLbNy7IJaB14qwATIxN+UvQP+HbgcIScBCpAR96P5hj9
         6aYOH8JSAr0Q7deQ0odJMEAqxzqL34VH2VfiAMVI7dl76BQ1KMvLZBZUlLidmF2OTrz1
         Eg5GxpxrkRRYwKw+vzhaDhHTotmdUlJeh7shUyMyDrg2nQi2fOtyz809FMbnS5DB6TuL
         MwGaCSpSwmkyovWMSAkOGD/p7TAGeGAQa2CZ2DhR4GqFShmvbByVvLS23w70vnoKdanU
         p+PuVd2iIMGz8U9I0n/FGfY8wd4PbXl9GMGItENfihFzoFE7msaYzQW3s5eSzdcYwwto
         IjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN3xnSYyxB+PHqb0IaJ7+ELVM9Qj8mzKRwa3yhsEJTS839i2JxJ3DO/Yqf+tvA2E/Tf1nyKU0rwNBMnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/QieX83Uq3sYeu1AmDWP2jUeQkpNJRSRIE81glC4rzgK0h+u4
	5ptNVM9iZtxnpO6BhSI1FFJbI/RwIdoSVti3IZYMQ7tvbbIeuZ4KrbyrMtuflzM=
X-Google-Smtp-Source: AGHT+IGRVC/omnADRGlsObbkjgi01W+xceim4yTBxK4kFMLlr9FVYoKLagm1JteCLvHw13sLiTwW3Q==
X-Received: by 2002:a05:6a00:8315:b0:718:d740:b870 with SMTP id d2e1a72fcca58-71b0aa95107mr5923632b3a.2.1727333759199;
        Wed, 25 Sep 2024 23:55:59 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73120sm3592352a12.68.2024.09.25.23.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:55:58 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Nick Hu <nick.hu@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: Add stimecmp save and restore
Date: Thu, 26 Sep 2024 14:54:17 +0800
Message-Id: <20240926065422.226518-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926065422.226518-1-nick.hu@sifive.com>
References: <20240926065422.226518-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_235600_574317_71502A30 
X-CRM114-Status: GOOD (  10.16  )
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

If the HW support the SSTC extension, we should save and restore the
stimecmp register while cpu non retention suspend.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 arch/riscv/include/asm/suspend.h | 1 +
 arch/riscv/kernel/suspend.c      | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 4ffb022b097f..4dfdb7134d0e 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -18,6 +18,7 @@ struct suspend_context {
 	unsigned long ie;
 #ifdef CONFIG_MMU
 	unsigned long satp;
+	u64 stimecmp;
 #endif
 };
 
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index c8cec0cc5833..5d9036ea6784 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -30,6 +30,9 @@ void suspend_save_csrs(struct suspend_context *context)
 	 */
 
 #ifdef CONFIG_MMU
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC))
+		context->stimecmp = csr_read_hi_lo(CSR_STIMECMP);
+
 	context->satp = csr_read(CSR_SATP);
 #endif
 }
@@ -43,6 +46,9 @@ void suspend_restore_csrs(struct suspend_context *context)
 	csr_write(CSR_IE, context->ie);
 
 #ifdef CONFIG_MMU
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC))
+		csr_write_hi_lo(CSR_STIMECMP, context->stimecmp);
+
 	csr_write(CSR_SATP, context->satp);
 #endif
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
