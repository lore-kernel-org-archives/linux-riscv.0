Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A0E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 02:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9Ker27qX+Ur2jDnHiMQ2WMhBf6PUfx6F/g3+6m2xm0=; b=CEeidCltYkZ2k3
	vcZ+awjY9SgbiWsm2ZcwnkliudnGhgLE1eWWqtSY9vNc/aJTdw3/68wKgSKHMvX6dKnzrKDCj1qrN
	7YMdeyyifIxWkyT6sY5ztd+/11zCU0XdOffgCAEfHxFXZFHIOjBhAUqb3F8y0ArmccPqPH6b8o5TD
	tVx9b9+X4fWQIKzpkBMCgYe4+alJDIDT8aB01WmMezEb6DKuNGAdlytW3e8K4WK+AJ2QvdDd236Kw
	H9T5DQ1vkB/TgzTPIV1xFu85wB5Y4DoVC4Ht8eyGXIaWZSfqLc0wiLKWNJotxCCNm0c25IJs8KVEi
	vnOxkfZU2hmfxceV/roA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtL8-0000000AQsV-1350;
	Wed, 15 Jan 2025 02:41:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtL5-0000000AQrM-13Jz
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 02:41:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21a7ed0155cso107132075ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 18:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736908862; x=1737513662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=i6zaw91JmQM+HqEVyR/HylP0M14l60m4yLHpLMwNFfDuNMuyUn/I9+QXpj7c5lRIuX
         s1LdaFqZnoPM8t28g0vgxdZYdyfD8o3Lm78PCWrFegXNZ+lCuvcDp3ecSCWapmnU10e1
         wDpcfb7PDNljrUTN7UE2329aHXEgA/B6+ceQGcNvJp7DtG0RKgUwoCQz/oOQR0cRaJUb
         27BHdWRwtM0TDVTXAgY5+TcaoqH5xUDrGGjRvj8fTDH0ELGaXZf2fm3hGLIciyASoGmv
         CLYTCm61g964tlOUaVWKdngBlKDgFzCwJQGg3F24xJi73s4OaR4Ilfq0BCl+HCvohTJZ
         tGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908862; x=1737513662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=pUeIIxCPyFn1eVzWjrst16Zv79B/UrSQKRXeVp7SyW9n2vsnR/q0XesT+/FBFTkfIi
         kDrYIShukpKzYtamYEcoSPc1U7gSZCqcW0O6kzNcz/m+TuLtX1XjeGeq1S8xii3c1gQa
         cCjekCWfqBbxsagIWRmFfrET2tPOevIrXisVKgwXOh5MAD/hDomi4uo5sIkI2nTY9Psv
         hoV6w71XCP3ThE1n0NGEffs2TUHBFFXjmiJepc3AvRzD6RCNsLonxwi5r0IQ1tthuRF0
         JaKewh8JC/zHn6llwo01TiHxvJU+K+CtFo9WYZpMig5R+cntjzoOSBXBaLOrdwE7VAAZ
         WDCg==
X-Forwarded-Encrypted: i=1; AJvYcCXDxiPcTb6s7AyS4+KI/O8aaKsj0y4GQqU32FHWLSVWcYua0woUI4aU60Zb5bSC1ihPRuF2iv3AHXl1dA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzwYyOuA698T0AHYao1XO4c+hsAacblaMyunk4u+5x4UIYsBvx
	SDI9E7OfS5ba9lovUzAo+vAWxaSVsOGzSzIcg6H7ynHr7RKhEy9ELmMKgOsKM/0=
X-Gm-Gg: ASbGncuFfDC3jEyTXB2xEZFa51mtguGPhKOvw5bGUJYwz6U8fvVczinaOrSN70evlsJ
	9UKioS8SuHOfe+1L4N2zIVQ8Xlpd+3pjzQZmI/eTWYL4hIT2c2cjABUBJ5xc4K5N1a+IzBiyu7u
	oSCSqW8jksXP+LQBt01x0LRqB6cXd1VN92eunJSUYdb7ZjUfQ4h8ZwCMNB+zqZTxh+fVwH1+fa+
	RihUsgr4EAZbr5QVXN75EkX9Bv/E6KJIA1O2Dvrdyi2qkKvYiZPPuoTz9B7CI4qNxaWzD0fFQxu
	rrXEFMdQyuscz50=
X-Google-Smtp-Source: AGHT+IHRs+ZLjJaMOCMFOSev5yey8o2EV/Ai+cdpqR0LkTXM3ZpNmIhiXmJyiWzASfW23X6Ls0/4fg==
X-Received: by 2002:a05:6a00:4502:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72d21f64f72mr39087001b3a.14.1736908862297;
        Tue, 14 Jan 2025 18:41:02 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm8321841b3a.139.2025.01.14.18.40.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 18:41:01 -0800 (PST)
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
Subject: [PATCH v5 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Wed, 15 Jan 2025 10:40:22 +0800
Message-Id: <20250115024024.84365-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250115024024.84365-1-cuiyunhui@bytedance.com>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_184103_280029_2FFF5351 
X-CRM114-Status: UNSURE (   9.69  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
