Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5BFE7719E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P9Ker27qX+Ur2jDnHiMQ2WMhBf6PUfx6F/g3+6m2xm0=; b=R7jheAbaY/zaEm
	jOQ5QDhDOSARnvdmQjOgJnO+6pwpMm8l+8Z6LcqHsZtQlldh23FCmdUFICxAJsI93ZkcP/voojxSw
	SiN2CJEyZv5em9MJ/FE2FH09BUkvlhR4OGUFvbOFG7dN7BqNuxk6IYVv8AVRqDosMawYCt7QJdiYj
	gPIWj9C4Bke+lpbWZaSH1rLQuCUN0EskG+dcQDYcFVOU/0hguntwx1F5aeUTZDNGPcvSMksrPlqu+
	Fbpff5ckfx9DuqiugPbxOOL7X4Bzu8A2bRs2NxoW6umPLUM1ZakwUpqD80cE3NT4u21BlCrzrfFY+
	iXoV9Q/tyX2O7mRY9Afw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFxK-00000004QCQ-2EkS;
	Mon, 13 Jan 2025 08:37:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFx5-00000004Q5R-2z0H
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 08:37:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2166651f752so87444135ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 00:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736757456; x=1737362256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=EZEBKfkJj2xwqmeM+UdPGpe0DR1Cfiy7DXqCJc3IaiRuTIIOh3THrS6WBrisHzceP3
         qCsF4lM6BwZ/MXjxps68uiZ9Wuiq3yAZAM+J8Pfo0ibP1pLqINqnUE+lLlyB8XJ2hWDz
         G3JD8Ukjk+bFJEmX8c91RyGfR710+61YWjq9MNXAM4Cq+9Iat99ILh8CMDYdML4RQ9ev
         tsjaJxZNX117HKlzRkj+jem/xA7IlZtRQeNGNpBhWcppptRaWkDX9S4ScB+TniL9hIbh
         upHQN85XRrVFID5fYTSO/qSixa3XzbQQyn+XsnNNmDMuTQWeFuseCNap/jpPz778BTr1
         2sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736757456; x=1737362256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+lHU8O3OzxopxeMRFW7AZqN84liiT6mDTuuIRoGMNs=;
        b=hi3EIoGi/odFxQAtfX5w7YtUgmzaX8iuVFFdMgaFZNcm2eSMGeusVRSbIb1NZCjNsf
         zYWvEDKXpqC8BUhxXskF5BiwOoZ6J4KZcvKussQvIAGMyN+ZIQ+eA0X+TgKW3Qk/x3a8
         rHKjWY8Ql4ZVORimCfKGuRhKiTO0f/dsj0wwp1YwzJyrT6okbraIBzbzAMoFrKqjpD+c
         HLIlF2ImyoGN398gvoaZX/lr4dj2zpTv/moFGtPqd+k71MocIMPR2n7I0/Q2L3/0NUs6
         reUEptN3nBA4X/SloM9jM6bc2WBgO8FRD3SG5jGGJeqOLHYV9dYBSFOl0OOkLKrXoyX+
         2RSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWehd2Kzbka1HcVuciMzax2nroTXxQqE1e1MVXeb9ulsuhYlq2o0c7NE/X6QxOnLz/j/NghDVqD7N/FJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2BlyDsxAQbubE6FWYj8B2O5/2COmfXZkJ0d9h1ocxP2WEMURA
	SV55ULTCvaWzY0Coky4LGRx1MziVrNLak+Ivx/hkh9Eg1D1p2eRF70DpsPcpgug=
X-Gm-Gg: ASbGnctZJb+a+fLIdXeFzS/DWsrFS5s3wKtkPanhZHBtqTZvREYh/EeGgVZSk+J4i7D
	swxjqk5GbruOLxvAqmPbrYxSvTent84mnIXgzx2OGLbRVorQR5ioYIKznRghCCHvHCLYLX66ACn
	Em5VHSPUaTWFH8xzbtIDMUPQUcTWs0kYYAkHd/z35UeBPwFV4YGuoZCpI3VuXlsVY6SxziPpqbL
	DUpU1SGOg4ViHZbq2h/OpcL+IAAoZoEsNCrVo/0cF375Rz98Uw898180JL4OO3oKXU7TdwMB6NS
	zSX8KjYmGHI837E=
X-Google-Smtp-Source: AGHT+IE2vpLLAbTwFgumER+hiNZPVCtR/vb8/ZvSUV9VI3AIzL53lbAShlejX+qABV5VNq93sKjw+w==
X-Received: by 2002:a05:6a21:33aa:b0:1e1:afa9:d397 with SMTP id adf61e73a8af0-1e88d18ea9dmr30431962637.15.1736757456055;
        Mon, 13 Jan 2025 00:37:36 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07ceedsm6427433a12.6.2025.01.13.00.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 00:37:35 -0800 (PST)
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
Subject: [PATCH v3 1/3] RISC-V: Enable cbo.clean/flush in usermode
Date: Mon, 13 Jan 2025 16:36:33 +0800
Message-Id: <20250113083635.73826-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_003739_751147_B65DC72A 
X-CRM114-Status: UNSURE (   9.56  )
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
