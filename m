Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54699CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VBtBdvbg3wjFOnRRzf5UytgNkBThy7cr62PlTEfOPs=; b=Z02X+q5MrkieSF
	xbN14U3siQlZFQI60l6ynp/V1xtvXHB4VlF1nF0srKywK7kpkuvimvC7J5oz7vl93RtTxX0gdEGtI
	o/PhErxYkZcWTx5f2caB+A8GtfcjL9jUiPxPDn17ll4c4vynggv4U9Qgl7CRhdwfN4BiSzTbROdzY
	djsjQWF/XQvrBg5HpUBwAZ4lQmKo2BNqekzbEGJF7iiLFvoWKQ3pmbEoYfMtPVa35yRE+rlkI6qBT
	psrTFGt+9GPhDI/+DQr8mDIuDDazdV7tUVkgJU81t5Xj0MZj5H/i5HhmKkn1cxZa1anRCe/4gfQZ4
	ekNWOhzh+Jv52jliqwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97V-000000021Uw-1p3a;
	Wed, 29 Oct 2025 16:33:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97U-000000021Rb-0Asi
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Oct 2025 16:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=; b=BMIVmjAkAxoEvHEPKxmRkhOq5T
	DimvvpzF4Mo9iXwSkBDPLgLit9gsdszlMsdhTDlRUeEtgG6+7zfeoIFQvoz5oCg8CQYSn4KimHAre
	j9TdHiaQrPb351tb3Y0XylhkRVtpDU85jXojUTQfk953eTjXdatbNgpHZeLeZgD286awuaVWxKAl4
	HTKCfXgQGP9LdBXO/bUHFot14DkmtUmISNLl3gSTuBpe2cvoJl2NbK/maX4CPx60gbyiTjNcQkLLE
	Ho83a6Z5tCMkD/RfZoGEqI14cHe5x7Y0g4098e6nE+c0k5ZKujoWVf0cCBppX3NPwoZ/8HOdnPoWp
	9uNH52eg==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Fh-00000007Jdd-3x2O
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 15:38:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b4aed12cea3so12339866b.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755632; x=1762360432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=NxUjZMbH/jEJDwrFBfzFDtTkrNyOH/SW7lmvLKlJW9FvIX/HDCPNzlBbngMHEbt1c8
         ytuVz4gf6hyhLdGjMQWoyfvCev8J3c4Uv2zL7mEbwWqa6drtIxgetlMP051wfMJeT9I6
         mbqzskZB2Mg/J4QopX2y/HB1IwDMpv3lVYeBI5zlDpS0QSoykeEN9WRvlQoqzEc3GRaR
         HXMJ7svo7UAZ3Swz581brY/ncrUeht5jmVY2Gr6N1HSTNrIKMw2Sv/xm8lE1hRQXA0Y+
         SlAqFOO1B3znsghXfQ0tBZfFOfD+YXq6aVLiBWqCddr8Y1Ng2eqhfgnrdieWRY+MAlxf
         GWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755632; x=1762360432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=dU6kwDgTNja89gpNWrHMKO6ij8OZwZXb5U7+re+h/q5xGxSwhSMudAWSq7jZacx56c
         qwFZ/Ge6O+2HB2ddWgsD4Xh5Fvnt6Pr9vO0Gflo2Wa/xoVTSknmk8tjaEQWGuQNyR+97
         ShPUFtGN73YISAyuqQZOiU9wuGyacdxPcFpaYQLhr+qt6T9o1IfdgPopZgk4XTGEy43j
         T2PZHu+417bW/3zod2uYZgCMJRBgJbOMNB95fE6zXU/VVdCYShTFnPvRoZTbRWXoE91s
         y0YYlpyIwvN6tdZ2LLwXg1DFIqyfaO0tsNH0kbYRIGl/HhZsysgYvEAP6Jw+HPcNV39B
         th5w==
X-Forwarded-Encrypted: i=1; AJvYcCUl154tTeR0tLx9BmG0k43pZGMc/eyhf/ydsC733gBN7wxCQedMwVoWSLGdW0C3HxIPN6GO8u+VTA6ZNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVU3/Jhtf1/ycStRnS1KUrVCaZUxKBnPlVE0uH15NZP6uRO0uc
	U5XSsOPSdcSr1yjMQK8roRqsUejn4cYHFDaDyJfasfBm1Gg89F0LK8oz
X-Gm-Gg: ASbGncvIxHOdyOscGVW4xD12M1v9eKxJIKvq/Iu2eziM5tktDZzejhyQy6v670L2LRQ
	61gV3qtUB6/vop/3vj6558ma0kzcUFjR0yqgSvv4PeIeJ/Cbwdwh8sh4wK+kAEk07xbUXM6jWTf
	ABnpwRos3wlCyNKTq5IY4X7XIEYJS3qkyo5Zahun6sKrNeT1qELo7cyt76ruEnuVnuiuyQayjLt
	hKkwWQePvcVt/0jzXhLYvhbKA6tSPXRd/w4wanHq5NyUtfJokOuLcI3fgB5DY0jl+CkhIdgiuol
	hQgAKz8InPmT/ltSNNb3P/X1AdruMm7RwICmXZF8Y1SKW7vpj9C1+XmLtVCHD0rPrOE85m+S+lM
	Ay+gWX71FvIRY4lD4G6ux8OcGDMjAnoq3XwFEaApAI1R9rcAWoTFO5d5nMrI+/yG8ArcaBNSNjW
	LweRbrH17CJyxToTW9Qa8+HTjE/ItUEDzpIudIO8Jn3IShxTXjHrWMTs0IT2/CgEFdjtLt
X-Google-Smtp-Source: AGHT+IHRieiPBGU6MC5P5jZHI6G/6PD4P6RVg3Iggx9u+yanu4koYZOv2T4MUr84z07ifr1PiVwzxA==
X-Received: by 2002:a17:907:3da4:b0:b6d:8da0:9a24 with SMTP id a640c23a62f3a-b703d2dc3fcmr322653366b.9.1761755631652;
        Wed, 29 Oct 2025 09:33:51 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6da1e2226fsm1067814666b.20.2025.10.29.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:33 +0100
Message-ID: <20251029163336.2785270-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153822_155556_28706634 
X-CRM114-Status: GOOD (  15.74  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/clk/ingenic/tcu.c | 63 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index bc6a51da2072..8c6337d8e831 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,29 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
+static const struct syscore_ops tcu_pm_ops __maybe_unused = {
+	.suspend = tcu_pm_suspend,
+	.resume = tcu_pm_resume,
+};
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +453,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.ops = &tcu_pm_ops;
+		tcu->syscore.data = tcu;
+		register_syscore(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,42 +482,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static const struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
-static struct syscore __maybe_unused tcu_pm = {
-	.ops = &tcu_pm_ops,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore(&tcu_pm);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
