Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648D6C53209
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZU9ED1ndokbrISqpuzErmQb6W7l8DsNUTapzQxCAVp8=; b=XVc1OAF1OapBYR
	MQQYIbGhATmbBicZ6bJYB9vRK3WpN0ODEYu1vzhcwxTkh4XpR/RQvgOW4bhKplwGa3lOAjTLAWp2j
	erUYFPJhLf7tc3YqGeIGazREbbeSIb8NfZLVhDMMUl+ohvHqfAkC5V4I50847fRVfgSFVJ3/SpBDO
	yH6877nnmfuRHgCV+L0eA2r5Yb8plBD0b7Zt2ESxhoVK3du5Mm5JxmTqQwYlm3es2jPKH7zi+UIeV
	NFGSl6/WTtL1pzXkdbw3oHrDsMnHD+sJsZ4f37m3LPESTaYJxlsdC1DAZihn3YHjU/QaRPVHttmfU
	BEC3Loq0bSE8QB+zZwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTbW-000000040Em-3oXe;
	Mon, 27 Jul 2026 22:15:22 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTbT-000000040ER-3FxD
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 22:15:21 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-81e9d8f3289so39427297b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 15:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785190518; x=1785795318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm46iYzDB7JpIVB3BJYv0VC8QQXIbDJkUC0QeOWvv5s=;
        b=lDNLDoZiqixEbkCgmGyhlL7YhLMyK7/lOKOlantm4LXdELYDUeEEVCV3WsYxE+auz7
         6+501ShMem8MNbaP3NS9uZQfzFR3yBIdG5fBMTEEy7g7oLuXpI/m3d4z5xH9IsGaC+lJ
         hMRdakDWpns93SuK3e4WeRo250AH+xvIqjwvEb+RQ76Y5mG7CdnHymbIn0LIcuM2Dldl
         3+Y0tho2kGys6F5nFSnIhrgtJ75NBYSGqvVCEEA5VDNw1vUfR7dyls/27GtbNTDK8qni
         0KYeg1Uu4i7cm0pYEkskeuVT6M4mz3zdf8rPRBU8mJ21xuHWDBWr6MRVLIqgkdH5Ufae
         UTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785190518; x=1785795318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm46iYzDB7JpIVB3BJYv0VC8QQXIbDJkUC0QeOWvv5s=;
        b=RKrBQ7IwZ64fKZjlgWdPmlaI6+/mOY0nzAExqOBANRXfPY8RpZP/AfP0GtUgG0w6ZP
         LmCCDnXim7sqrUJ4pGNg4I19v4dQTyuGHTxwzz4gaZWnmu1L8DpA12KQgaUw2Z2EQYdx
         GRKzxzWVOSAfH61CghhhupwSPKt2wW7tri6wPabzMcTGtnZ341GOnZn09SRJqR1L3IeJ
         saRZ26CwfP5TYgqNXoEVIPWqHZIHms3qU86PkRdFIHAC3NwPjmkubrn/WPhmtz8/AVSP
         2OSuSanSkVyDFkHcX0/uBypyVi0PPFy7pwzfwvBU00k0GhgDwnEe2jVtfzixj8hQ73KY
         QpmA==
X-Forwarded-Encrypted: i=1; AHgh+RrSHhXH4sghgWZRARUe+MITaZMUlDBtjckUPYte0E1CgCVkxFQ6Gs+sk17ge01Hncr5k/zHHnrhGyEMJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQdBnJy0iAxx/WyBSuLYvieRBMmrhoPNsP1Taih7qpZchjkxzC
	/bm1efezvyb/7SKdZfDMNHBEIWF9jSiiIf1A3ALzRByHOqMQOp61fD3k
X-Gm-Gg: AR+sD11Mf8iaxLXlm8dlq6AIi8/Wj/14Z5PnQuMnZrcL0aBiHE+JL9wu8w3jD7Uj6YM
	6Y5TTDAGm8m4ZJ0w1yJR860RVVOxuPPQj6f/o2+nuoibJvJULF1vkq+qF5dMln5BkZNywkjAySw
	ySlZ1DQTzCT5woIT5w4gWoX25YV37NDJ/Csrq6EL7zIZFGQAtjuJFx7QGuperKxiOv7d+y5PlCx
	/G+KYOq9DCOnGu1aCDoDgI+IP8RX00wnZorQ7hii9PfR+s9ogsYySKll2aP7aFtKDtPVfQZWLOJ
	y0DSZAeoLTPwDyL84lJ5a1IpHfx/daqrk+mBQNTN1/ImCEZrcjYNK94i203AXnsPhz/ewUluFB2
	W6BRfqDFIGOmC+7M3IHrl/ZYV51QUsqwq/sWGIW3e9/R1yyYtJ7Raaz+UclJ7zQPRcjSXxBYdKW
	lLmkukLLbJNqz15Ha7lB7RPnz53W+vInuvWij4InPCJVyvk6RJnM/tu1e6xWZChPHSrg==
X-Received: by 2002:a05:690c:88b:b0:80b:de9c:8a2c with SMTP id 00721157ae682-81f69cd5e94mr34808717b3.8.1785190517962;
        Mon, 27 Jul 2026 15:15:17 -0700 (PDT)
Received: from localhost.localdomain ([107.198.84.185])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6592ec1asm37854037b3.45.2026.07.27.15.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:15:17 -0700 (PDT)
From: Paul Sherman <shermanpauldylan@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	hchauhan@ventanamicro.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Sherman <shermanpauldylan@gmail.com>
Subject: [PATCH] riscv: sbi: fix errno mapping for SBI_ERR_ALREADY_* error codes
Date: Mon, 27 Jul 2026 15:15:08 -0700
Message-ID: <20260727221508.5179-1-shermanpauldylan@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_151519_853559_CD3B4E9E 
X-CRM114-Status: GOOD (  11.06  )
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

SBI error codes SBI_ERR_ALREADY_AVAILABLE (-6), SBI_ERR_ALREADY_STARTED
(-7), and SBI_ERR_ALREADY_STOPPED (-8) have no explicit case in
sbi_err_map_linux_errno() and fall through to the default branch,
returning -ENOTSUPP (-524).

Map these three codes to -EALREADY, which correctly reflects their
semantics: the requested operation was not performed because the target
is already in the desired state.

Also add a documentation comment enumerating all SBI error codes and
their Linux errno mappings, making the translation table self-documenting
and making any future omissions immediately visible.

Tested-on: Milk-V Pioneer (SG2042, 64-hart RISC-V, OpenSBI v1.5)
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>
---
 arch/riscv/include/asm/sbi.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda3..b067eb08bcc34 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -651,6 +651,26 @@ static inline unsigned long sbi_mk_version(unsigned long major,
 		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
 }
 
+/*
+ * SBI error code to Linux errno mapping.
+ *
+ * SBI error codes (from the SBI specification):
+ *   0  SUCCESS
+ *  -1  FAILURE           : -ENOTSUPP
+ *  -2  NOT_SUPPORTED     : -ENOTSUPP
+ *  -3  INVALID_PARAM     : -EINVAL
+ *  -4  DENIED            : -EPERM
+ *  -5  INVALID_ADDRESS   : -EFAULT
+ *  -6  ALREADY_AVAILABLE : -EALREADY
+ *  -7  ALREADY_STARTED   : -EALREADY
+ *  -8  ALREADY_STOPPED   : -EALREADY
+ *  -9  NO_SHMEM          : -ENOMEM
+ * -10  INVALID_STATE     : -EINVAL
+ * -11  BAD_RANGE         : -ERANGE
+ * -12  TIMEOUT           : -ETIMEDOUT
+ * -13  IO                : -EIO
+ * -14  DENIED_LOCKED     : -EPERM
+ */
 static inline int sbi_err_map_linux_errno(int err)
 {
 	switch (err) {
@@ -672,6 +692,10 @@ static inline int sbi_err_map_linux_errno(int err)
 		return -ETIMEDOUT;
 	case SBI_ERR_IO:
 		return -EIO;
+	case SBI_ERR_ALREADY_AVAILABLE:
+	case SBI_ERR_ALREADY_STARTED:
+	case SBI_ERR_ALREADY_STOPPED:
+		return -EALREADY;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
