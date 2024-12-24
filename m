Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625A2E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t/Nh1NquTtiuPqak7CK3nNef2SFdvMROLDiHRfEAxNU=; b=Zw62aMZxtow2oD
	lg9/49OGKG7walYc+TP/Kb5CB4+RUJ7ZuMUJ41g+dYbt+VR2MvlNBf+MIw6KsH8ypMDOlvS+2SP2m
	Ro2dbRXg1KVjklIj+fLv3HppnjzsKAPkmjM6gO5v8y1f5+up4R7sxacftz+eURkgsi6cp435muxto
	ihuGyVWOkj0+xMmIDlvBI/JJsm4xY8L4626Lf1hIbd4UMmfgCL7feSU8GjPo83VAJYmMXM+n1xpik
	gLOF40F6aTnCl/rBrT716BT/fTLqMed8SsErBqgyzL5Znq3aCJIKF+hU30ygOX4yBEXW28H0cQckw
	8Fzst6rgmrO6d0IKIM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4Cg-0000000ByRt-1bdM;
	Tue, 24 Dec 2024 12:40:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4Cd-0000000ByQh-3oG6
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 12:40:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21644e6140cso54056135ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 04:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735043995; x=1735648795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h63UEgBoo3OlBZkGqbA1hPszqb23xAlCHsMCBjLn16g=;
        b=QN63P8s7S5+iSP93gJoibJfW9GdPqdN2dAhklpMom6CZY5sS5AdKAft/QSdy4zuABX
         9+PWq7ZsbFQ4VTBA+tyInSMftrgqsYk11eVoBomkxLlFbkIMUrdXsN7AoUGlSBUVM6qy
         QQRX5sBMlKydCe4gSMiDyAanwhV2+Y6Rc8j0J/670MxQI8GXdqAqSbq/WhblQSaZCvdk
         hEp/13FYI52RbxwmGCQb8g+RU3SvsongD2kgmHlc5rFMSSO63uMGhN6tNq2KZSsZzIqU
         CCGcPQGiK667e132mFfOAEPsF5Gj/rZbsrAeARCKU04Dma2AEWziQVCwjeyHcV7q1qwv
         taNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735043995; x=1735648795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h63UEgBoo3OlBZkGqbA1hPszqb23xAlCHsMCBjLn16g=;
        b=CufeC6yDQ15GuvgRyQXCMQE7L2Bl6+Wb4kylby85qOMWd74SPSK68PNfsahBEAv0Bn
         0Yt9rk0YLzZiHn4sABCHWSfHKitm+hPQ8aeo+bbvZTUdILCtPOq8qvvxqSVAXvzgAo6D
         yGLVzeEw35RARoghfSYijVgnVPs/6kqQzvaQkeI7BVknFyW5tT6Qc0Fd72FmHxL6wKIE
         fi1PJ5gY12t1Ag1R8hYjJYQkEH5F4RzijPM/n1NugyKhbPg6kh6l1l4E3rtKQ38XNGMh
         4evkgPrEAH0wRzy6Tac1mUh3aAiNrX5k+1TaDp3UqdDBxHEPJPS5YNiGEnshGNe3FZRq
         m9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUj5ww6NqJUniaWQE9tidScI5PqF5zdEhPoCDRRa9Eui70DAVRFvgSqFUpiYhy5ypux/teZuEfBAuDprA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7/4+OpRIiI/0ShgNZ+wvLVKd1GqUmujLz88bJMbYl2SeKAR9s
	fsYpMxwv5MtFAci22ldAU0DCuVbBBZs/yGI/GLyfwf7dbKN0Ipae/A87M4xbx3c=
X-Gm-Gg: ASbGncuYchuS2VeII1npTIKoiFECRoSE9t/ZExex45Dbyj4OpqKaY9+c8YDyXP4ZSAL
	0YXX1DuavGg7K7pzOXAorcAjtkO8kT2UhStXWPvNe3yFY6mkHFaV0jtcT2KHjs6SqIgh6jqcOCe
	YJ2NhFKnor0yT/ByRx+DxyIkvvGI0gyXJkZQoNpfnojjf97a3OH8lA6lYMY8krOHMf5R7uaMYM/
	MI9bzYcsopmfwQgqRGInIctxKD3wQ4DcY/aKqfp2HhTjJ4/hd3QZ30U7M/7DxELNqvlsaK/5gIF
	C9m8VUmo3v1fpqs=
X-Google-Smtp-Source: AGHT+IF0C8CqYoZCzd8tMQZmn/flQq7GafbIBzpAHhC+CWRw4cNqcwZFoAgrjOQIxh72JMmXwYgyzw==
X-Received: by 2002:a05:6a20:d81b:b0:1e0:c30a:6f22 with SMTP id adf61e73a8af0-1e5e080cba4mr29952751637.40.1735043995218;
        Tue, 24 Dec 2024 04:39:55 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.228])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e4057b77sm7386550a12.83.2024.12.24.04.39.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Dec 2024 04:39:54 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	charlie@rivosinc.com,
	ajones@ventanamicro.com,
	samuel.holland@sifive.com,
	cleger@rivosinc.com,
	andybnac@gmail.com,
	alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2] RISC-V: Enable cbo.clean/flush in usermode
Date: Tue, 24 Dec 2024 20:39:46 +0800
Message-Id: <20241224123946.97486-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_044000_137462_C4933142 
X-CRM114-Status: UNSURE (   9.24  )
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

Enabling cbo.clean and cbo.flush in user mode makes it more
convenient to manage the cache state and achieve better performance.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..60d180b98f52 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -30,6 +30,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -87,6 +88,8 @@ static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+
+	any_cpu_has_zicbom = true;
 	return 0;
 }
 
@@ -944,6 +947,11 @@ void __init riscv_user_isa_enable(void)
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
