Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F5C3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSLQOpUJZfNX1p2bIHPBTgwM3sZ+rHLd44JTC0nwHOk=; b=ERzUOu9h1aSaZ2
	QF3J/9Pd8Hq4pYLkfZJpCiXhMqXHptI60sIPkGr+3GNmLV5AnMpT+vvlFmJUi8uisewHxqBdx9LTf
	9UbW2qinula7+hLyFgY6hO4W2zwakKM42mh0b7EWADotDvB+Rhlsd8/lcGH22xdPVwyfcsW0XfyTP
	EC4hCbPrDvCNC0/qvb3ltGT8m9h5DzdgM/sNZFH1JXMoMZzHta19GyCUV3wYT40puRIv2lQlyVGZH
	9qhIe2lb0C+B1iBAuLA57V/Q55YOFqYOTWhfP3wuDd0AFjrDxpDh+aDQTicDwr8uVSG0uDUU55Ir0
	mZs46UNL++Y8CORx+lSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6uf-00000007HAs-1i7l;
	Sun, 11 May 2025 13:40:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6uc-00000007H9m-1yy5
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:40:15 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3007064a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970813; x=1747575613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVsERMSdIf5sKMRIf3zMFFXP9slyQDAj89Ix8Yi7kgA=;
        b=V5n0ytjkE25StZVKcmf9y6LmE9YUMdlSLM7e01FlDKTTtYC/ekrBc43gI+I67jQRaD
         j0JdoQzK7gNLsltL2ZIyHBl359kfTZxgfO8OxV0Y4pDTFjleEsmkLhXHV585W6D9/I/u
         vnUfULOCT8ZW8lKOyhFQUGV7I8VZagI0Z0uQobZyujdOfO8gVkkXtGOyvC6uAH3+DjEt
         SewlJKSkYf1TIZyIbj+cBDJmQHxyUJT9BLUerplwfCbsjtzqK8zsGqG3FVyU0vN4wfJb
         a+LrFEqPJhZCOOMxBh/In4YPwcnXWOH9x3gXb7J9cYu1NkAz3K4uTNqPOssYJx0se7wz
         jaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970813; x=1747575613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVsERMSdIf5sKMRIf3zMFFXP9slyQDAj89Ix8Yi7kgA=;
        b=m0UdlnES1iSHF7h+P/gNFZq1K12ZB4ECQlCAqptGRHinoKbph0/rUBFqXnnG7hLj7Z
         DsXUUTVz2SPWGYecoM1DkbMb0GUXvJ6FCOBdvxLozUaXQfCnTRjQvri16kPYznspMqy0
         sNpVzh0Dzk+wqgxNTL7tTxfJJnrj7drtlXwdJIHI44/9xdBe/SvvzJHVrdN6rEnIight
         cvTgXBKo7e+PryxUi79hgcV4/DRy+Q9LQF1KnQwEjWpKl8SXbaEcCb2gYY9nLSltM0ZT
         FkU2GoT0bdjiiuCFh6oJiBFvqrTekWtz/uIKPgXrJbobTP40wqlkBQt7WBDB2SEO2X7N
         nqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJmRXHNX5HVhhxhcPm+Dalnb2PaOuS5byT13HLEQ++MkQg2hF4TtuKMwEyckNEiHIN4gSTcTFephOJSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbK5x3VGnBL2x/0k638Tpt/DBHqgYXd9sSEv73QHm8xJpIOQiP
	0JiMy3AAAiHbMl8SqwWiamvJi6xjinOovSmAItLMTxu0jOdfcHEG0AZDa/xi0MY=
X-Gm-Gg: ASbGnctSnVxdK7OKDi382U/J4DmpjTxyvX3GVtPqTE5D37RRrz9PksKEyCxKb+ZtiYA
	faQ/fnb1Jat3RexMwdeHrqU08mnSnqEh6Pb0lQTwB5z/suXdQuML/FKrPnH44BdKMPA5fsnsvSP
	rCCj9MSATA9aD7pdzrLYol4D0iT6FNmHvLgL2LtDIdvzTcKdA8Faul47lxJxxhR6yvzAn7opIWO
	OGt8hNOA4rU75G6QNbrOkRqJFuPlE2m8SrCSvkrDtEJxrHrRLaVVMGX0/W/l5RTGy6T8/ZDTAvc
	ibJDbjEsaPyHk5V03xnSWQ2wfydAwGi/6IA2eVEeuoEUN2DouvCb6L2oQWLufp5bsP5uHKjOuS2
	GvqTNtZooOFq3hw==
X-Google-Smtp-Source: AGHT+IHFdwKqWqDeRPUbNBSRmc+vSywbFgnPqE/8PACRgl2hkEeI3vsdadNPhXxEMsmI76yi2E/0hw==
X-Received: by 2002:a17:902:e952:b0:22e:3b65:9279 with SMTP id d9443c01a7336-22fc91cbb8amr136349565ad.53.1746970813374;
        Sun, 11 May 2025 06:40:13 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:11 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v3 01/23] riscv: Add new error codes defined by SBI v3.0
Date: Sun, 11 May 2025 19:09:17 +0530
Message-ID: <20250511133939.801777-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064014_518242_F0AADEA4 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v3.0 defines new error codes so add these new error codes
to the asm/sbi.h for use by newer SBI extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..4dd6aafb8468 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -419,6 +419,11 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
+#define SBI_ERR_DENIED_LOCKED	-14
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -503,11 +508,18 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_SUCCESS:
 		return 0;
 	case SBI_ERR_DENIED:
+	case SBI_ERR_DENIED_LOCKED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_INVALID_STATE:
+	case SBI_ERR_BAD_RANGE:
 		return -EINVAL;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
+	case SBI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case SBI_ERR_IO:
+		return -EIO;
 	case SBI_ERR_NOT_SUPPORTED:
 	case SBI_ERR_FAILURE:
 	default:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
