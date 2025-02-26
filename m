Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F84C19777
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 06:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifGk4VVnit+9C8G1uJIPlSJOJDNMupkeum/+vzaa3ns=; b=VARXZX9WxdL/Yg
	fEVFOOOR5NDghR4fS2iIZTJzpUBDuPrwtWvK2OaCFV4Mp2CUoK3hZAC+LhXBUsVivPrLgNuh1dmuQ
	1YvX0fjSHr16nh9yR54Rko1HYblW6ykvo97cB0pXoIF/nu+KANdMrcNIpaiH/GAFZxPu7CFff6rp1
	H2BEaui0gWWpCX5SFcGbGNvLqHyXz8PuUeaI6tnVpy3do86OUdjb++LwfrbN6rmqwEO84rn0B08zG
	QiU2kjl36X8YR2tOiBz+tpCw7V24f1MYLn2HoS0KinmdiuHi8KDmFx5R2X+j1mMk7r7l6dAC+gSYT
	da5IsnyPKMqoHRiSBovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAzA-00000002XnM-1iXK;
	Wed, 26 Feb 2025 06:33:36 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAy3-00000002XR2-19G6
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 06:32:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-220c665ef4cso112951965ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 22:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740551546; x=1741156346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLyDt49U/qvQrnUcu83brJz3XFH8EzOsk0B+VADLLKM=;
        b=UFXOwefNcMmTGXwx3//qvpUoZFZRlyAWjA9RPOvgDgs77J8UrHbvrAsQeGRwUuKjVX
         /YTd80RkWAo0gZiWXBjG3v0owpibWdDdWJPZFcbZc7b7SMxuSkzx13w7lWH4cIZ2q90T
         75c8gv2guV6SkX1RmHIk+WYzwVMDkGXbNh2E9E05asX4+GmgXhztGMVMomuJ3arqmMDL
         ldoaL9QUu7X8qk1NQ5lsjFeStArVuKl6UzNqI8JyahFQXooLm8+bfAhZMtP1mLCOha+W
         YWnsCZ0rotaJ6qcdd/e3Zt8ythKw0JpkqMQwWrkzDY4OaqitMLzATyPUgW7UpyinzJz6
         aO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551546; x=1741156346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLyDt49U/qvQrnUcu83brJz3XFH8EzOsk0B+VADLLKM=;
        b=VQX9M0PKZRGJZ0EZ6JYhvAVTXFxx9ph8YSeXCiFDrR96pgoUqYVzfuRcO4FK2tp141
         722QPxQE1Ln7H8wYzIiXAI1YUM2Rte+9t5rdkwCLWXZnCh+HGtPZFq3OaJgmVp/84tOD
         us3XBoXYN4pmmDwt5nTjb0JCwQ0AmEoxtWLgjJrZC2CUVISA8/Mxps8jfnKBrrXUbu/M
         JnaM4jPVXJVci1IkYl4wMg/vlGTZvJzNEhcFGklekxT3KDt7d4tGl3eFZDyQi5WnkzTx
         a3G13oiIqqI1y/bqmszNfv43lt5H/Whf+sj5hcA4hECsTGfmVt5qbpkhA6SS1YipV7pP
         9xzA==
X-Forwarded-Encrypted: i=1; AJvYcCWDb4e2FBW8ZuRO+imJQXO0E2+sa2h6JmDTrMhuFRPklmiGknzCNRcBHK5fp1a5UTmiZoiL34zeyc1E2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF5fq3Aj7yszXHzJ+6qRq8CBoxLP1uHSNb+Lrex6Xh0q4RpVav
	bRvHrTw/gHvJqUY+6nqAWSbRoP3tCr07cq4bGb2oFpUwrvnEGTQXXOyWPTqiYPs=
X-Gm-Gg: ASbGncur3qY12t738QPUzYx9X3cp4JKDa0NIlqAyvVtSIuos1E2Pw3/erAIZR086Ac+
	uQO7SFmYulerqyw28PAyLY2Wm3qzrVUD4vfJ1GYWDNVlrZ+dUnBHNvE99W9Z1/kJo0Z68b0SfvX
	p4yscxdKjDq0QrJ22ph9ngIYT1tnSRt+VaEmssNMBDMxzwi6XT2E2e0Qf0ZjDyA8DRJLGG8jL0d
	F+ajJjGcp18W9OunrXwhQHYNf4OGkdIM8XLPm7zslnlisu0OfjhgDqmGty0x0bEKL+FxBljeM+3
	+APRaTfNZLR+14uJo5ybfX8+ontnQLQHi43ygYdyD2NUmtHYEvjak46zV7bB
X-Google-Smtp-Source: AGHT+IFFs8SZ5lPd2kWTT1U7ETWzPeSTog8WGxZry4kav5NnRHKIbt7T9I/ZeIxsd70AumwEzTSVFg==
X-Received: by 2002:a17:902:d48d:b0:21f:136a:a374 with SMTP id d9443c01a7336-221a0025a63mr347304555ad.43.1740551546420;
        Tue, 25 Feb 2025 22:32:26 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f152sm682599a91.46.2025.02.25.22.32.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Feb 2025 22:32:26 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v7 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Wed, 26 Feb 2025 14:32:04 +0800
Message-Id: <20250226063206.71216-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250226063206.71216-1-cuiyunhui@bytedance.com>
References: <20250226063206.71216-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_223227_312246_BFB4CBDF 
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

Enabling cbo.clean and cbo.flush in user mode makes it more
convenient to manage the cache state and achieve better performance.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 40ac72e407b6..a8b726d0dab8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -32,6 +32,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -91,6 +92,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+
+	any_cpu_has_zicbom = true;
 	return 0;
 }
 
@@ -1001,6 +1004,11 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOM))
+		current->thread.envcfg |= ENVCFG_CBCFE;
+	else if (any_cpu_has_zicbom)
+		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
