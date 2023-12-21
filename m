Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40591C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2w2z9GtOO+pq7CLEJbij5ERMSBdSb6zQ9LrCMCwSTZc=; b=WlfWGiU8ic+HgH
	+oGVWKPdSXaEi7LMcA2309nhfDq+dEeYSiYNn5+QcSBnjW68Rx27eSBQj4OPKCSrxTejrNJOt1C6E
	gl42auwvnrYSgkyquMcB4xjjMK2vaYCQ3xQ91omgOgr1V6vGYFNth9BzYTEC9/CHW8LLdS45QFh8M
	flXqlfkPWa/oF07VID750EYWKpaahuuuNVgSUQ0WtQ1nysaC08jTvct+im75tQDuu3HRwY5Bv65Ep
	aPaas9oVscY0vwkgisk1Cilc7yFCv/MFjhrjo58ViFMWo9M3Ym7r+maaUaGRGo8zb4+Y7lGEpmcPH
	HzQh306J+wxOa7peQ/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG14-002NrV-1K;
	Thu, 21 Dec 2023 10:10:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGG10-002NoB-2f;
	Thu, 21 Dec 2023 10:10:56 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-553a65b6ad4so782512a12.0;
        Thu, 21 Dec 2023 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153450; x=1703758250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF5s6M+Wn1BIKkAOEW/8xBSTlKtmOm9F7gA3mT6ZChs=;
        b=jhMWjqosglXOJCOx/Ablg3sbMRfJVH1Q/3hEi9uRn2Ed/xLwCvR0DTAiiJJbmfe6cF
         b6D/5qdM2pv353cCp6XbJPxn1Q++UPzCJN5hEPT72PGo8nPJ6qIt5xbmkM2Px+skVqtG
         dodupz8LcknafU5UdfpaZsrbqDFOkoYly0K+fbZN4IjIiKzpsIuTWqE43WhIp63sYrfj
         VMPyCaYk3X2YyM0128QGj8jibjaqlsszOua8KIyJKTy2vpPlqkgIwgT+qkBkQwKhcBhw
         5bLdIQPLBEiIJe8LbrN+0JGttqyb4UXni1JCR2ombOvAqRymGnqtY3sOaXsSRjbmHuUM
         jAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153450; x=1703758250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF5s6M+Wn1BIKkAOEW/8xBSTlKtmOm9F7gA3mT6ZChs=;
        b=sYFxt6v4VW2mpXYapoBeJ0gIIe0VTKnCXW65kTIAA9+g9CafRdWeSfIL+wJ2y0yEwP
         EDb/Oo0l4ReK9m5lPRPeESDoBYUQMvNsGLY4Ve+UZ5pYLI6PzNJFwTsUuJKU9UiPJohq
         9bjTCWq/jQgmVi1Qc1CAeNR28tUW3oypIfYIMNa+ExrxLNXXdn6+LPTqdncV/ThP9H50
         G/Y3DBfmKrdwZj+a+U8+d0Cf7bB+LvcTERaGP/NKrGbP6v1HjUPUg9j2WNzemw7PEX90
         5WIO4+zQPoAs+kT82+KsR7H+z4Qk5O0jJYf2ujyw6oZPBgOhMcHIGmOa8Sko+KtPhTF1
         SXkQ==
X-Gm-Message-State: AOJu0Ywz8T/YjWHFk4/ovL1AtYRibUv8panRG89KF+Wsj8n/VHXNL9Ok
	n3ME1b/ahbOq4JPbrVbQfOI=
X-Google-Smtp-Source: AGHT+IHL1Ma08mPb9cC1GlQdvGSlGcloQ/GpQp0NxOsffwhypNZRsAeFEGADJz/75DK6viyXViInjg==
X-Received: by 2002:a17:907:3f9f:b0:a26:a1a7:a67d with SMTP id hr31-20020a1709073f9f00b00a26a1a7a67dmr675031ejc.46.1703153450118;
        Thu, 21 Dec 2023 02:10:50 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:49 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v2 2/3] cpufreq: sun50i: Add support for D1's speed bin decoding
Date: Thu, 21 Dec 2023 11:10:12 +0100
Message-Id: <20231221101013.67204-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231221101013.67204-1-fusibrandon13@gmail.com>
References: <20231221101013.67204-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_021054_863835_1C06206D 
X-CRM114-Status: GOOD (  14.68  )
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

Adds support for decoding the efuse value read from D1 efuse speed
bins, and factors out equivalent code for sun50i.

The algorithm is gotten from

https://github.com/Tina-Linux/linux-5.4/blob/master/drivers/cpufreq/sun50i-cpufreq-nvmem.c#L293-L338

and maps an efuse value to either 0 or 1, with 1 meaning stable at
a lower supply voltage for the same clock frequency.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index fc509fc49..b1cb95308 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -29,6 +29,33 @@ struct sunxi_cpufreq_data {
 	u32 (*efuse_xlate)(u32 *speedbin, size_t len);
 };
 
+static u32 sun20i_efuse_xlate(u32 *speedbin, size_t len)
+{
+	u32 ret, efuse_value = 0;
+	int i;
+
+	for (i = 0; i < len; i++)
+		efuse_value |= ((u32)speedbin[i] << (i * 8));
+
+	switch (efuse_value) {
+	case 0x5e00:
+		/* QFN package */
+		ret = 0;
+		break;
+	case 0x5c00:
+	case 0x7400:
+		/* QFN package */
+		ret = 1;
+		break;
+	case 0x5000:
+	default:
+		/* BGA package */
+		ret = 0;
+	}
+
+	return ret;
+}
+
 static u32 sun50i_efuse_xlate(u32 *speedbin, size_t len)
 {
 	u32 efuse_value = 0;
@@ -46,6 +73,10 @@ static u32 sun50i_efuse_xlate(u32 *speedbin, size_t len)
 		return 0;
 }
 
+struct sunxi_cpufreq_data sun20i_cpufreq_data = {
+	.efuse_xlate = sun20i_efuse_xlate,
+};
+
 struct sunxi_cpufreq_data sun50i_cpufreq_data = {
 	.efuse_xlate = sun50i_efuse_xlate,
 };
@@ -54,6 +85,9 @@ static const struct of_device_id cpu_opp_match_list[] = {
 	{ .compatible = "allwinner,sun50i-h6-operating-points",
 	  .data = &sun50i_cpufreq_data,
 	},
+	{ .compatible = "allwinner,sun20i-d1-operating-points",
+	  .data = &sun20i_cpufreq_data,
+	},
 	{}
 };
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
