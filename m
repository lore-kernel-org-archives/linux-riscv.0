Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08D6D5D695
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 22:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rO78oNEmMzWK4autbwhxu7tytN8/AZGtawO2D2c+nY0=; b=bJirg15d6QEAoJ
	omFcGsokgoEz9hdhlSy0Xsq6HV29NCqEQL4w6ri+El+9DNOXqAfLlnDDG7Tch3KUg7+8ztDek82oN
	hJ+Dk33i6R3UVTi1zfEuRrUcmAyeB56pri1oKB0mIhNbZWc5zR77Llb/XCA2qnOtvIJCD6VuD8S9t
	uRu3Hz+7O7AcRqJ8qUMQnOsQV1eEkfUx8vsfWhKOVWoArHfj3YJOpMl68t/2kdEX0wh6e+ttrBTAF
	FEHlSYGY97Hx1sW1c1ZZemJhSgi+ImEgVbaI76DeaYeoU3n/PTAmAvU4BN5+oqemuW34Nqo0yaDXQ
	/OXD2zFWZjYCn1gxOYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9BCE-00000008ZYr-05Pa;
	Thu, 07 Nov 2024 22:41:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B8y-00000008Z1R-1zyr
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 22:38:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-72061bfec2dso1263027b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 14:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731019102; x=1731623902; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4UvGiQRb/HT4pWVa0ytwnByFfKeVrmx8fuvu8SCUmU=;
        b=zSNYyZJ/WHddqJ4KdB/l1PU9lzkY9YWIZPyN96iVBGDTeYhRfYS5b0xSodM+/Y5nCY
         C0iILHzbZqxotVSXfs/9gfbayYcebsGZkJ7Ziz3WMiTPjBhj2+OkcSOOB249bftU7S8M
         MO08RVOI9HVtH53Ozz77XEliMiRm3WVPFuwq2o80Bco6rz/eV2V92azo7lJLmbn4rMPW
         tK0XcoZavU+Pa3V6x+8oYTGYAanPFIVz+ywHRy7Bp+SD2ObKn6bwqBnE8aUqWig7VmXL
         X8zTdUmx1Z0EmHz/NmqlYOvg94V1oTx9nxWSoEcyC9xLX5ycW0dtK6xuWoY5qkvJGzzV
         N0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731019102; x=1731623902;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4UvGiQRb/HT4pWVa0ytwnByFfKeVrmx8fuvu8SCUmU=;
        b=iz2SY7Fy4eO90t84GbogARMY1RUHpl407VY+mm97e3S9y93p92WmA5QQNFZaCYQ12x
         LrPD3smGLp+MY262Qe6aKYy02dL1WO20IXFBwkw8cxFtKF76orertH5NRnI0A7x1LX+j
         6q8miFBIGMCj2uQKkOOZF/8v4rBiyQf7xz+bPUtqvIg95qH8gBxEBk5DG292WfDsScRB
         CCKkFx6mxD+eapSZI15XKG1eAGWtGfcQkF6hY0PxYUim8zXIc7laSmRUiMJ2P6QBCkdJ
         WfOaWyuc1u2ThMOsN0tUpkRKceJHLSDDlDZdBODPzFLoQNDrEbess5PY16uPsvh7LCbu
         CdAw==
X-Forwarded-Encrypted: i=1; AJvYcCXdfLt27cdN8Q9tfhyeiaKPnKuRaQ/b+RolMJz8vwfVV9OxgjyMOyGM27bGiFMiSX7fl+LFEw+iyzv/Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBHcizF40JD/ewfFiU5oPnWNYuLEaYspgFuM9O7DvJ/xe8ngOc
	hduNHfMjBG6Cnq++lKpQbLzO+EqM1LYHau3++txdBL4pNGNJc8+UBcnG9+qNbsE=
X-Google-Smtp-Source: AGHT+IFAGtuApDVBC1UkjKkykQeZF5MXvTyzKLNYeIltKFs6LOqDwTb8M1Xi2bDrIl1p0NkIIZMN6Q==
X-Received: by 2002:a05:6a00:2d1d:b0:71d:f7ea:89f6 with SMTP id d2e1a72fcca58-7241337ff2cmr967888b3a.18.1731019102464;
        Thu, 07 Nov 2024 14:38:22 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240799bae1sm2227897b3a.94.2024.11.07.14.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 14:38:21 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 07 Nov 2024 14:38:03 -0800
Subject: [PATCH for-next] riscv: Fix default misaligned access trap
MIME-Version: 1.0
Message-Id: <20241107-fix_handle_misaligned_load-v1-1-07d7852c9991@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAEpBLWcC/x2MUQqDMBAFryL73UAiYoNXKSVE87QLMSmJiCDe3
 cXPYYY5qaIwKg3NSQU7V85JwLwamn4+LVAchKnVbWeMfquZDyciRLiVq4+8JAQXsw/KjrD9NGq
 re5AM/gVSP/MPzbmohGOj73Xdb2hvE3YAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=VKdNQh3bXS+51IiXDHYAOf+7QeZT+DkLAK5ZUVQq5qg=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7quY3DQugNfPO5piW6yZa5ew5bzfNoD8wCj4588whYz/
 stWcljVUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERMzRn+SsYtWs3wxcjIbrtm
 HStfXDZL/MX/2YH7JRg7t910+MlVwMgw+3bI/Yvh37/NmPj1uqu+18zTPV4Cf2Rqp2UesE9z83v
 ECgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_143824_757470_B2A6D6EF 
X-CRM114-Status: UNSURE (   6.83  )
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

Commit d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses
supported") removed the default handlers for handle_misaligned_load()
and handle_misaligned_store(). When the kernel is compiled without
RISCV_SCALAR_MISALIGNED, these handlers are never defined, causing
compilation errors.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d1703dc7bc8e ("RISC-V: Detect unaligned vector accesses supported")
---
 arch/riscv/include/asm/entry-common.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 7b32d2b08bb6..c2808561df81 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -25,7 +25,19 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 void handle_page_fault(struct pt_regs *regs);
 void handle_break(struct pt_regs *regs);
 
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
+#else
+static inline int handle_misaligned_load(struct pt_regs *regs)
+{
+	return -1;
+}
+
+static inline int handle_misaligned_store(struct pt_regs *regs)
+{
+	return -1;
+}
+#endif
 
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */

---
base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
change-id: 20241107-fix_handle_misaligned_load-8be86cb0806e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
