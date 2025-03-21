Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D0FC36001
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0aSWXVLf/NB2XCagnlD1w4bxtZ3v2OXajjJ2343mDg=; b=0Vz37XcCxTdxHf
	r0lMP6gUC2XiD5ACEP92mLgg2KLH7xFivQsZMkESyningMBWvJHbCv+gFaJMb0VmZuU/CTypzz21r
	NLlid3lsaTfYBogueX2m9EUtw88USybgK1Vjoyip+lYEp+/OWnYoC9g9CZd4elclM9XJhqsOTcr+s
	b0QNgDMfPyW/V4fpMd8AP2/85c3Csd1Pkp6CzlsEOfnhzAmjGce4NZCdKKmdowH2HgeRj6R1LVfCG
	GfmnSuziaqRWPRvdf5RZ095QVBGVbK3mpEtNp1SjD4EZGTi4LGB9/yeE0FH25GOcmD6/jFFQGXzLk
	9k2k3rHu8fs3tXRfUb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tveA7-0000000FHcl-1MXX;
	Fri, 21 Mar 2025 15:19:55 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tve8w-0000000FHMn-38oB
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 15:18:43 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d589ed2b63so17365935ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570322; x=1743175122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=RXvZMwpuX08KWti1khkFE4cf04NZYcHTfYnrGKTslmyrlxcR98Hhg4P/OR/JqPGBfu
         9218NGBtzIs2h66ATg50moPsHkuZDamh06ZmhjRbGJ6zsyca0J1CY/ySaQPKZlAp2f2I
         qH/Kua3b3EP0DEECkUSsdUYlnmg0X2KHxkrYKNT0cgGK8AQ9CS/PHf7A3NH08ZyHmByw
         Ee/+rCa0kj+LVSD4lEJPTLEoh4qkl8Q+zfDJz5Zw3BpG5WbXDwSLxBV2hOdBJeJ62Sgu
         TnSHWY/V9QOUVT0zQXTJAza8kL3dHbXxOkoWilxRFJGb/tNNo/zXS0X5/5n7DAZka5Mu
         pT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570322; x=1743175122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=lXgh0rlrPX5EfB8Y+iWHKiLztUs1Hw+9Ixc7qnSa3rpLWpvPJRmca8IP+cNbZcOtOs
         PpjJBeMYiga6qxvo7YKH7z0n9syf/j+MXpAnrN+SJVPJLO14ZMife+JsqFkigms2XFqY
         3AIbP9fEG4GUEZ0Mi1+0viP9il5qySHpCY7cqysdb5N8MNvVH2X5SKEvb3LR8qIRD8JG
         jcjmhsMu07dFPPX+TyYf5RDzhvRm0lLvANXEt2ZUhmIcwqpHs+9jMd/dOvu4O8hoj75q
         RZfvHv7QeuDuxHvluMx9spwPCPXp7Wtmdu54BvVexNIYSal/7lN4uX694FMdPliHIAnV
         1zQA==
X-Forwarded-Encrypted: i=1; AJvYcCWf0PHg7ZoPYy4wU75biJzk2QlsShfI3wSh1pKX4UkF2lYZXUDEVUkWJRLCE27mHC86pXnnd9hc0YNiyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjKlK5G2wgzf4sWyNI5YJgyzm9vQArxfRjeiVRHAYcHaQcj41h
	iCwt8YRlVUmJaVM9WfDp/+f4TxIZvTN9/2wPBsuujf9xkqJw/nzmt+gozmuOVrY=
X-Gm-Gg: ASbGncv16meSSvFM6ruDwIPNOjdHU4+ETlUgzL9/nTYuGfPJvAt9vWmgQaDl0I3M2wH
	BjdCQvxn0AR4EQA4k8Cbhn7n9xb+89xDA4jtGWSaolskaPVH6REhAqMkQ9AICix79HGvLgcuM4m
	5mggXQQ5raUeNPfoIoMLwsgUPEwbW0GI7dH3MHQiSRPlErJSbpU1eJZGHA+vLWpn7/xiXikJ3CW
	WqneHh4q9Hy78ZbLDYiCTUsSI02OVimhuoR4wYJ8mVZLpj6HueSNM2/EhCWESCn1XcnawRzp0zm
	QZiSD0ygHZns77nlz2U60UymgmkiU17ByQU7xEAjW8ILkHkE79F57l36hwmwwMC97AMu7oJfrOJ
	ApUtJYwQyncL8y5lnY0tUq49q
X-Google-Smtp-Source: AGHT+IFo/JEVnsqki/6fdgfg3xjuRm3SDdlZLf3knFyzM9tCDQmdiRd3jcBZUEzW8DfADwT94MufXQ==
X-Received: by 2002:a05:6e02:188a:b0:3d5:8103:1a77 with SMTP id e9e14a558f8ab-3d5960ce9b6mr45841105ab.1.1742570321661;
        Fri, 21 Mar 2025 08:18:41 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 5/7] clk: spacemit: make clocks optional
Date: Fri, 21 Mar 2025 10:18:28 -0500
Message-ID: <20250321151831.623575-6-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_081842_777775_8383A7AF 
X-CRM114-Status: GOOD (  11.97  )
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

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index be8abd27753cb..17e321c25959a 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1830,6 +1830,10 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
 
+	/* Clocks are optional */
+	if (!clks)
+		return 0;
+
 	for (clk = clks; clk->hw; clk++)
 		max_id = max(max_id, clk->id);
 
@@ -1903,7 +1907,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	int ret;
 
 	data = of_device_get_match_data(dev);
-	if (!data)
+	if (!data || !(data->clk || data->rst_data))
 		return -EINVAL;
 
 	base_regmap = device_node_to_regmap(dev->of_node);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
