Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F0BC46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvDj9xENAtW6KOMnt5UggB/i8EnPUfdU7hcSFNpbJYo=; b=cMWCzGRxXHrgQT
	7WODg4reO+x8ZwiR4w0PhD6+p8xZjxee7ozykMik+YVP7USuJLSvyKpOS+P3/i9ephH5Jfnb91ivU
	S8XcCck64oftccFt4xjjVDYt1U59R1GdzenJpeZDVSS4tmpr26/c2rdha6VPN4WeY3yjPyGYOgEw4
	1ehjyvmdjGkELAlnhYyfjd6MnMK58xWErPAc3o3d7mbadm7ZXvyVkJk/tmXIO9hadJ4em43+a/kc9
	3fT1UnHqsaevBMY/NjFqf0rOOLnCKLoB2Vq6D4f5wB8gDCY2vlswAzAXttoTra+FJTTei5UKqSb5p
	Vdkh/bAigsOVSSohXtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE62-00FVk3-2n;
	Mon, 18 Sep 2023 13:15:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE60-00FVii-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 13:15:25 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-503065c4b25so2726944e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695042921; x=1695647721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO9jFtHKdL/VA2yvoAt0QPSgBvoVTbEt9F3nOYbDAaU=;
        b=UwfedFiKKsKqMDafOHpt3W42xOEJm8PdDi2nk9VNWTaNgSCjzCkEhhywTnL6ir8XcT
         R4ouPChF7SCPzLgfaa42LK3tXuQApyxnFODgucrGIwIz3Vb0vJqFL2fKyN1BaxE/MG/A
         1jCCttvIL529U9Ie9d2TYwnT0mwfM+0c6GrN5y8+YwpOaT2friY/wvlm/SfKUpDA62wP
         W8qaCyZAotGWBnfQA55Y363MHsrIc2HSXn0aFnXx1+bHcd8dfMGbm3wxAv6Kz2J4HxrG
         v0R9U3SjEF9tRRZmvrpzKjZh3bnjioOeD7ey6QA+a3yTkcAG5ebVE6rJUtUfMy8ZkZHZ
         PZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695042921; x=1695647721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FO9jFtHKdL/VA2yvoAt0QPSgBvoVTbEt9F3nOYbDAaU=;
        b=nAO57rr6GQzQ4DwqxiSCsirFFSeYFbT/N0Lq2VAonKhmV4naQHg36O9kz9mjUreUHg
         WnZaw7RIEVsIEwP3FTA3tFcsb5MtVO0Ezk5J3GpToxBkUdgt5snIpR5sSs54Mc4kr0JF
         j+AdMQ05rjLdtCuUx/n7QttcpbG3QEqm75M1ib/30f2+S39cLRJY3OpdWBvXcee057mI
         1OALeIV/J6EetEyQJotmFM6hAVA6easH0WuGnJ8UsMdugC1VRveq2g0rh9D2942vFgPl
         8L9TouOwy+fV+xBies67itt5UJzKudSF7xmJTnqHri16op/QWbt0CCtnZi/RcxhAsNtw
         hNoA==
X-Gm-Message-State: AOJu0YxAxvVCwEv9nTNws85MxCzKBU1XV1F+Aaz6vrePSGZEb9VpWIHl
	HY43rAg2o0e74IP7BUthRVw8K0ONuoPU2uKsfXg=
X-Google-Smtp-Source: AGHT+IF1xMj+a6HUdDfGm7K2pUhrfNWIHtT8B90y3c/kxs+izdBT6mSVTwYqC+GBD5mlUYIGYxUqww==
X-Received: by 2002:a05:6512:31c7:b0:500:9d4a:89ff with SMTP id j7-20020a05651231c700b005009d4a89ffmr8834854lfe.62.1695042921045;
        Mon, 18 Sep 2023 06:15:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h1-20020a0564020e8100b00531050807a9sm1835055eda.13.2023.09.18.06.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:15:20 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	xiao.w.wang@intel.com
Subject: [PATCH v4 1/6] RISC-V: Make zicbom/zicboz errors consistent
Date: Mon, 18 Sep 2023 15:15:20 +0200
Message-ID: <20230918131518.56803-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918131518.56803-8-ajones@ventanamicro.com>
References: <20230918131518.56803-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061524_212207_71E92732 
X-CRM114-Status: GOOD (  10.59  )
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

commit c818fea83de4 ("riscv: say disabling zicbom if no or bad
riscv,cbom-block-size found") improved the error messages for
zicbom but zicboz was missed since its patches were in flight
at the same time. Get 'em now.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..f9ac2717bc7d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -93,10 +93,10 @@ static bool riscv_isa_extension_check(int id)
 		return true;
 	case RISCV_ISA_EXT_ZICBOZ:
 		if (!riscv_cboz_block_size) {
-			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
+			pr_err("Zicboz detected in ISA string, disabling as no cboz-block-size found\n");
 			return false;
 		} else if (!is_power_of_2(riscv_cboz_block_size)) {
-			pr_err("cboz-block-size present, but is not a power-of-2\n");
+			pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 			return false;
 		}
 		return true;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
