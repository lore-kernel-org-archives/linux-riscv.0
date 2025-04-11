Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42AFC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCwpeJkX6l35mJlib3TIV4wp1wxv2AFaWM8wWPUztV4=; b=2WX4nWD36iQnfb
	xk/84kdJiIu4GmlNKZamWtiA0+b2yIrzkPv07ZgZ6+KhqQWC3Rn/FY4+DoGzs7KBQTsqRw64SOg3+
	apXiEqflY8F+UwpS/RdJXBafE4bF6lZKcG6Ki5qHmymH8uc6k5bt6y/+rt5ToYQ6sJzc0t/oLtEj2
	DqiHaZzf+lQyOhIuJd+LBvznlNG+0w7qdh3fAhHDsG77m7cBzl+M8xidaxmTGp5eXyfyDokQp9+l7
	hl1yNyDv6LI2m5+AGWfiuKNDYSAi7hu6GL+DoVRLspgOiDjSiKng8YUX1xNpJzmKSgKjMxQt/dPlW
	30ox2u+rQUqVU9nwGVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESI-0000000DvK7-35sd;
	Fri, 11 Apr 2025 13:30:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EFX-0000000DshH-14GM
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:16:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2260c91576aso16232825ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377410; x=1744982210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UqYwabiGCbW0lFM+J6bILwkNakAnqe4wz5kWFQbMVg=;
        b=ZHwM3YEBMeXZanXYVEkgwlzCoA13y1NrnwXMryf7ASoe8Ljrb/wDlEHmlMa3AELHUL
         X5BqJZi8nEmtpCJoGDZ6rqHwruc/0OzW7mf/UPfdCpsMA00sLBcxNAVOAW8L7RT+5mNX
         SrU6VJknuSq1NG9Tc5Zv3eBAyvWCXT+NqL94DvBQEqaYPzLmZHVRIjRF653etxVM3hlz
         yVXX4atUsT5c9raX7PXBfQlLbd016+WDNjLNwyK7Q270cWwvUTscrYtIHiDh5PSeoxkm
         OYnQM4ZFp1C2qkABBVevRfTVeZFy70FRw9Yidtn61op/nBEaWUTbrFH2H5Kc0RWBKwPD
         2TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377410; x=1744982210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UqYwabiGCbW0lFM+J6bILwkNakAnqe4wz5kWFQbMVg=;
        b=PQQkY2G59JENXhFHnPmlIssGoRQl+gFyNKUuiykmappQCraQP207PKKahp5GHdTZ8G
         R6ZFDO3Yg5WXmnE4W73NYlgbFNIfxOsPBoT37Dic1FGMNcvcSSbnK+QQaw3tiBDayUul
         05sDWu89vKlJxZxHErCDVH8qSUhy4v6vK6FXW30hCAUWOJFnb24ySMiK9lEI/q3/ZTyi
         ihNMnvVlIMFoVV0DMkjEedSY5wuMJuD1URzVpEeY2dQgzrD+26rf0eAvOW3R4hFc8OPk
         nfDZR4iUd88F+4jEqqA+3h9BD5q+x3FwmidoNfGZ1XOuqHeA356eBwUNAsRJ8QmPS42q
         OMLg==
X-Forwarded-Encrypted: i=1; AJvYcCUL7C801ZkUFhBNFqyskNwsgBpqAjyD7YoiNtxv604F5QGuSTarOHILLVXLPTGtBO/g0j2FpXjXdu/lPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzolTvvHDTUdfjoacVjYJi2accHtfdjWBNSbs2uXtvCBUhLM4CQ
	4sLA/3PfsnEOq7/Ko5im7JsOVoGkMFZleptOB62F1s2IrMKrgLSe60YlI4lt5qQ=
X-Gm-Gg: ASbGnct0IKqofUHHikCgME1ezHha8NIypxAISF5/PLPoShxSnOOXkr6RDhW/kdcI1uI
	f4oW+IBr7OVl67lJT5fe6POvZdgmsO+grUiurF4UtQyfH9qy3Rj7bWIqGH0XfwynJyPUQZemI8q
	imW3ugURyy578uQh3zdM1sjCqm9WQFjm8Bih/U7Qttlt7IUhdVPyyer1Q6wFso8tDeVQdugekve
	vKv8PT66CUBEpEs0D6hdTPOSkO76MVWM+H2Lbnr3hlZNJmT5RqK3eUzcmD/BGzkFo6XBL4+pBWn
	PIB/vp7yPwLXItjEwGymQIQcs2Q7leg=
X-Google-Smtp-Source: AGHT+IECvokSxW4TE1t/6GjH2KzEiHk/fDfcTN3ty6UKV6n7k5pcSeZTqv5IfUu12KUb+He4PBCOnQ==
X-Received: by 2002:a17:902:e545:b0:224:1157:6d26 with SMTP id d9443c01a7336-22bea49616dmr42095625ad.4.1744377410365;
        Fri, 11 Apr 2025 06:16:50 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:49 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 9/9] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Fri, 11 Apr 2025 21:14:23 +0800
Message-ID: <20250411131423.3802611-10-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061651_296746_A8BDA6F0 
X-CRM114-Status: UNSURE (   8.21  )
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

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4888529df1d8..9bd972867e0a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=y
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
