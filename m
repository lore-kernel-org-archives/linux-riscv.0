Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458EEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnnQ6vZHe/glcJU5fS0B4b7vt3YxdA76spRYnL+rffI=; b=hJctxrpXEpRH7X
	SuLQBjEznb3lsHokeF4P1hDCfzuODRUg3ut/kA6KveSyWaGH0YO9XVN4lZ7Mw+wbGPgfPt7w0SNA+
	nGdQiE/N428UOwxcOIX00/bWULidD7BtBOFi/Iy5sNLdEiCnO/F4kGuh7bkgmBnonIIUr7XvT27Lz
	KYgll0nneEJzq3uY9r8IAkUegN806JgNiHAdpmvn6jsRURLBK8O4PUbi7C0/J4W2iMvD2UI4jca6i
	RJ1b0FNrVzi9TjXIjZyiuhtQ9PjDlBHdbqEgZ9fS40pjC5Ht+fT5zRXjifWzRSzo1+jbMbZAdVmqg
	GEUeWvcJO1cZ7my2L0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHBG-004xJH-G5; Thu, 10 Feb 2022 21:40:46 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHB7-004xDJ-8l
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:40:38 +0000
Received: by mail-oi1-x233.google.com with SMTP id s185so7492935oie.3
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 13:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nB7qzXaFNatnaTZQJRAInnjQf9KiqCTDZAFaYuusV0=;
 b=L+ZGFYNRoNLbHVhM3KhtWzMWcXEDYyJA7aw1jmcFUNm9LwjalIvnug5gAOBoaVsGAi
 XAfgYWak1dxQzZ5ghazPUUea8fGTUL4XYyIyS3b6NW+CmQgYLVmzlmTGPyvdu36ntJE9
 p/WWwPx2fjkcKd0nUagR9y6sxwOG6zjfJTQ/wWjLi9u+NSP/xV0hSdCGSkoc8CSEy4Zh
 Xfmpchix/fMksPHav7pOiVse8m4TiWBP74rJVn9fBN60F/vQOUJa2ip5dMXv/LouxZAc
 odHYF6dZ+iuK1KlWP32f8JPsVtkzl9VjkswCDQuIxLTMaPXm3Tnh3rK4m5SBJ5wSZl2Y
 E93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nB7qzXaFNatnaTZQJRAInnjQf9KiqCTDZAFaYuusV0=;
 b=I9pWjUw3tDbOp59lVEmUNSD7/dniRnL78OUjT0GtfmOthjFcNdZXv2tB2RxNZDAiTv
 Gci0DEdQr+Flm1+0tX3aLKAAE9dTZVeZvlbP1dpouIst6VubtGlbN5eF41rKrfWfbUSw
 HkIPvgPXO96/g1+o+y09VdWDw2mRCR1Yi32u2X+zkxHZWUg/psCREJDpC6j8KsVEz7Ks
 q5MQAbuBxqaV8ZFXYG9PNQ8vpbGdsBzUBRsVcWiT270R7diZqLhoeJtGCJRaDW3EjH1o
 EbEOabvdNFBNweqYjFKhVOwJgAKcjUk5c74w8DvwPOEGjkecxP8odDAMlV4rNcSyzbFR
 si8g==
X-Gm-Message-State: AOAM531C6iVHbZ9VNte00YezmmjlmzRh/2petZqjCWBeshOENoQrW9P7
 gvsI4dYBGebka33hLnTO6HrpQQ==
X-Google-Smtp-Source: ABdhPJxnj59RepTjd/uznzgrpDdO30O9r7af3cgqYy9BVCSUocaHEleDWBfL7GJ76jB38zMSSwzmAQ==
X-Received: by 2002:a05:6808:11ca:: with SMTP id
 p10mr1942733oiv.74.1644529236740; 
 Thu, 10 Feb 2022 13:40:36 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id u5sm8700000ooo.46.2022.02.10.13.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:40:36 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
Date: Thu, 10 Feb 2022 13:40:17 -0800
Message-Id: <20220210214018.55739-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210214018.55739-1-atishp@rivosinc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_134037_336354_2B2E9B7F 
X-CRM114-Status: GOOD (  10.53  )
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

The isa string should begin with either rv64 or rv32. Otherwise, it is
an incorrect isa string. Currently, the string parsing continues even if
it doesnot begin with current XLEN.

Fix this by checking if it found "rv64" or "rv32" in the beginning.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 469b9739faf7..cca579bae8a0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
 		uint64_t this_isa = 0;
+		char *temp;
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
+		temp = (char *)isa;
 #if IS_ENABLED(CONFIG_32BIT)
 		if (!strncmp(isa, "rv32", 4))
 			isa += 4;
@@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
 		if (!strncmp(isa, "rv64", 4))
 			isa += 4;
 #endif
+		/* The riscv,isa DT property must start with rv64 or rv32 */
+		if (temp == isa)
+			continue;
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
