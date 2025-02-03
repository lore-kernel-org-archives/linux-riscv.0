Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A658C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89/odvqIWcLwfWokreG+707fcRZIDzWdrNUYprdPl7o=; b=rpbh5qnHn2ChaY
	cgqd+ORt/g83WdsfbTnLh0JgfuE+W4o5z0fW+9ZSYwQYKWCG/Q1seX1Z1E7qqJ+YLMVfYY+5PHPEz
	hdLFnmv0sjoNyUvM/dSezJzeuZ0BgyiuIg9VVARMhR5neIH07MsfOW1/WApiI/rAkOKTwcf7Spz6c
	ywXnFAKCJux2uZC7Af8eoE/r4+o4QwYDlh+7aXDmAUWBT62PzNjEqZFWaaXvmXF6Mqp2BDvRNQmqd
	3w0o7Ma05LlYaz3UTFU9pvDaZmR1gOainlTRTcy1FKJaFHrNn3IQDFJIIbztlI6YkUxWlOjYIe1Gc
	5cBNr+ezXEOqFbJzKq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9F-0000000Etgb-1IAE;
	Mon, 03 Feb 2025 08:49:41 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9D-0000000EtfK-1s20
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:49:40 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4678cce3d60so42824121cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572578; x=1739177378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asyaJaTKEI2I1t9xzdu0UJ7536vRQbg3knNHFZYwbZs=;
        b=m5XihedHrsTpyV9U6TrBpLeMCRp5dKP4JCCs3vAIkHj12kptD+odfp/+zsLzLA3GDh
         UF7OhQdZJq5lo3KRhd5smC4VYdRXrLEHtCZywVHEgb6gSo35mzitB4ZqI/jKBEhoqmW5
         qHpuIhxSUc9SR4FRHeUL6bLFfN3eZJti4L1JH/pzcuwp/Pk813/PuoNUE/98o+g2ah/k
         Aw3PuSjo/4HhUkr7obEvVsGYIA/wdC9utYPZmHY5Js6jVytFOr7b9aAi0bPbsItBa9Lw
         +VASE8mrRHybsx7/TJDO3iHhVRSnX2j4sjWPwPXDOPmz2s/Fvlhck/fPXyq6du0Oonf0
         voyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572578; x=1739177378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asyaJaTKEI2I1t9xzdu0UJ7536vRQbg3knNHFZYwbZs=;
        b=MKjNfB8EN9/r2I19CyX8Zx/bnr4mUVL7s57EFIgidgOIpNhGLF6EDkBC4OZ6/befw9
         TKPea24NKK/T2TVEYbWNvZS5dChBJOESrHrdfbzx70toWgYlZ/CPPNpWLX8J9wOEM6Hf
         /77QzoKb4ph1CmS9SyMlVW5yNIEj5xwapA9MFkkoQwMvLvVJfiYjVKeAwgSyV21murhk
         SscyvKWEsrbhcTe64GDAB/WYXu671VcyEzA/hZH1HUZMhS6meaTHQSsWO6QSSsHTYOqe
         ciUTS8UmB0aSe0ohu+mn8N1FLOrCoq5MPY8UEJrvhwIxm3SInk/qcnqJ3HoVVSsQQRhe
         Vj8A==
X-Forwarded-Encrypted: i=1; AJvYcCULMLnPlOOjBnOg6za6JPiGoJrIiy6ERwMErxuWH8Y+YLyITthzgdeoDDMHUGd8wWt8Yc60AZd30oaj2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyoGa//Gen28+VPt0AnjWRMnxxT66F/9RJIUtg4aNh8aAyIpfB
	lXqy7rrTl2yxx1xP0BF+/hiVyCJOpOKmmCvulALLf52da6k9tZq1Rhpz8tVAD0E=
X-Gm-Gg: ASbGncvTW3NzrtfhqbN333UEzk8nu+tMVNd03pVd6D7/8kkT3FFgzj5jxGTvXnfaruh
	NZzxAmd9VjOvsZxrYuMajG1h982hObq/7Af6i2ZMssqMap2oAFIb0XejGdrfopRgcGsXZjKxXRG
	j+4TPNfJXo6u8yEpiqqRzkA903ThMpywTANM7yWLezeBjiJdrd0cn1R2oxB+BGVNB5kNWg3V23h
	1CWBBNip0VRKHCPxMXn5jwKzsiyYm/VgEzfNoEai2bGSLjqxOzQaVcGpjaGPI8BX3pwrKLmvolp
	2PMWwf3t4wKBAR+rRB//BoDQ1AI+ne/7nmkU+bQMdWqRYMCUrvEn7mA=
X-Google-Smtp-Source: AGHT+IGcjaF2SJDXsNc6wLt4ldMm5Rj7yqw3jGMd8EZTRoB/t2JLI6T/ZVSpOvzgm5WgVhySwgNT+g==
X-Received: by 2002:a05:622a:2594:b0:467:7cda:936d with SMTP id d75a77b69052e-46fd0a1e8bcmr332465921cf.14.1738572578196;
        Mon, 03 Feb 2025 00:49:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:49:36 -0800 (PST)
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
Subject: [RFC PATCH v2 01/17] riscv: Add new error codes defined by SBI v3.0
Date: Mon,  3 Feb 2025 14:18:50 +0530
Message-ID: <20250203084906.681418-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_004939_482416_FB747BAE 
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI v3.0 defines new error codes so add these new error codes
to the asm/sbi.h for use by newer SBI extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..972eecccfb2a 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -419,6 +419,10 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
+#define SBI_ERR_TIMEOUT		-12
+#define SBI_ERR_IO		-13
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -505,9 +509,15 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_ERR_DENIED:
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
