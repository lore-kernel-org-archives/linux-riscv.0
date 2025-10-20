Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D26CCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 03:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDC/34S7lQvLGtIqFcjMV7jz6P464vtBIc3CKVnLVEY=; b=RNZ/meQoqP4PNx
	tsVQNgZU2mlMBMXGMv8wjH6cCULsdMvFMMlhco041sQ7J4V/SZTNai3pE6SGJVBgU3Z5rQzAl6opQ
	vRjFrKUuP8bvV4gGAKcxuM4dUi5E1UPlW5J0RU3M+NlULFzHnrnsjtyug9dHv6vs5f9R0jeF8v9pX
	nc3Xo0t0AXXQt6XHGGsRfTxU8NTBzgn22ErxdboiuYFb0reD4u/WPuxbIfgDb4h8bgu+HGg54ImHc
	tUgeQCL4javpAxaINlI1EPSm6d0c6yloCRltQsDbEOBZf6Y5eiJlEsMQEC8igFeKLBG+maa8pTIlw
	2WroY3lyIikEXZSU8Cew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgl3-0000000BnJc-3LNs;
	Mon, 20 Oct 2025 03:40:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgl1-0000000BnJL-3XUx
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 03:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=; b=ATavzsJYkO1FNLiXhJ5CO+mqIq
	EkmIcbnKh3p1EgvATn75bll9by+yDHWlF3F3q9F31lcr8WDlG5KKoBfZdwERW7s/XOsxSWvTa//FY
	MRFH2PATQHHVeUSWNkPk/E0+z7Jf4hEjvFyDjQABiH1YePYSERkrKmudYe4Cfc6vbYJELb11sAYc7
	jJKaiB9iHa7DrOci7EuwVIsh19Iq8r8/mJDhqMe0l6tJOJTo4slwrfZRDcDr87S2BmHEjekJQ+ZhJ
	m2RRtkIKfaXILbgUPhTZtZYbnw2y8964P6qlKPS5kCD9eGURu0vJZVrBMC9GLehgvzEXolWAhQ/MI
	FxJj3n4Q==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgkv-00000009TeS-2VsV
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 03:40:25 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7c28f5cf0fbso510441a34.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 20:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931617; x=1761536417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=m7eJFuBHjqk2I0RYZ3S+jFk/2GEkAotI5I5a9DvmwIUzN19ApQYzKvA8KG5ityDxzA
         vzc9PoKCT6QfeYqcu3b8nsjMYskXpX2WvUTRaek9s6L1sZ0EHo/M/BnASeaHzpMYDEpQ
         95+gKNzARLhW25E1YZy3IfGxgJwBRKJtxy/jFntN6o7K4dzbZyLM8mtjR493Hy9Rn9lr
         stP7elPtFwg8ZpolYMOIoOsj+SeI08rVoTO6OE3cAMUumNghrZQDYahCMguW2SBCyJTT
         8SjLY6Zu/6OMuY/jWkkM2IV2Nq5665AJEsTxIfG80EhVlqMEV0LwxKfMfsn7NII1ybKS
         EWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931617; x=1761536417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=CbT6mpnpMywgr8xcYR/VDeUyrgO8XTUPH5Yn5lUfB4dHefHln1zS95K0wqzS2nV6ZU
         KkznpZeIvY5RJAL35XIeySEgwGbjOWmao0dpI7b2qb1tGLb5V6z3p10M7+CiBib5H06E
         EJsuzLQWg02+WP0JFU35gYsTI94qEEIYY28apiiqGD549bDX9D6kAnH1k2Cl2FYvc8Kd
         dFxU4evzVtopQo7Fqjh/L+nT+XYVCeeugS3J8YxmjgVTLKN7yXVWLTfTCkb1pem0PrZ1
         S1wxSOxe+tZGz2SIRdMPhc1Na3qIOpcEGWX61Yzn1AUlWXq+6r9ysGaHRMn1q6ZU8DK3
         Z6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrbSz3FZV/YL6VKPFkJioz2aYW/BwovIc02PHfwk6JC9Fg22e1WWuwPnUH61rTbIRToerAk9KEoWF0Vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVlFVZWi+KD2j2YuQppL69YfFuhxHygvmwH6zCPUS3OWmpLfaY
	9JA3BJa1HE4M9Zyhelg2hVIDjY731WrGG2VjvVqXoPSAxHQK+xWQKjkI
X-Gm-Gg: ASbGncuav/4WZyX+fKpZfnSG7ZDvWpoZxBr6gjNedBX07OsiJ8BEkVr6dcjB5RsZsuI
	/u88BSnPpo468pOZYeyzmUadJPNkfYFfzKweEAo144YJls6GwDVUX69PZHcplnsLS6xZcbQEKZ+
	iFKgIY20iSAPnsBhL3gwHu3QTTh5zzXkMsU6s8CtfXF0YR8lswaIEyK5xVW8R69A9S4/LD7iAoM
	zMacVIhUxHMwNIafZN0Dq7Ywwtmfpy/gVh3lTkGoi6Z/4E0XxSDz76gX9wQ+w9sm0q+Rk20Q2Hs
	tryflZ3+FXhspTjS2bklV7FwOcpn/DtoRfSXBZZsYy/ASsd+UaN4pUFDHrDOW/lBg2LJ5+F5S1f
	dbAQVP7OeBBT5bGFbOoQtuGPhQqDcY/wM3B4MiPPGmkFcCCL9JscrVA0ScwF82ThnegWeE2HgEl
	vfmTwAQ9kY8w==
X-Google-Smtp-Source: AGHT+IEVqNvKS9S5hpOT/qYLHXX7hyjUj6rvW+z7uFgHoCnVtZJK6EaIoHbVUJTxxJ6dp8W5m9QPZQ==
X-Received: by 2002:a05:6830:910:b0:7bf:75e6:5ba with SMTP id 46e09a7af769-7c27cb0a0dfmr6276999a34.15.1760931616913;
        Sun, 19 Oct 2025 20:40:16 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c28879e8d5sm2272678a34.5.2025.10.19.20.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:40:16 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 4/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
Date: Mon, 20 Oct 2025 11:40:09 +0800
Message-Id: <50a753f9b8cbd5a90b5b2df737f87fc77a9b33a7.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_044023_153877_D86A1DD2 
X-CRM114-Status: UNSURE (   7.87  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for Sophgo SG2042_EVB_V2.0 board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886..0cd0dc0f537c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -152,6 +152,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
