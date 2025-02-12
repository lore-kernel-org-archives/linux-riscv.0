Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0136C021A1
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 10:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deL9yQQokrHlyW5E+0m3wTqlG6p2KoYraAV5gopeP+U=; b=DP2wJZRvuuQA+D
	MazIZoBjIV3Sryat4amsQcVCG+7mmBTkn4/LxIq8V8exZs/64hmv7eU1apTYMd9hTvhajibBbsuv/
	EfjAuq9I7ZMj6K+ETSLgusUounEGmSRTNhatrC0RHDi3QOqxUJLsrVOqwWbRHHxWwO40UcK55+3IQ
	sDMPWNaJOAeWHtqWaAf5DCMKzra3yNzBBt40iNDqDlwZM+AWGqWWWnZe2FeH9TDWxBjQUEHtgUvOw
	5pWFyJF62x4fwvaSXWcOhO4EyGqqfd/F9BYCx67PwB3zvk1uUrQEJR+l2kJQACnKX2B3DiVAWIXLB
	6WWsDGJh9ej+C5oSoi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9at-00000006uXn-25Mu;
	Wed, 12 Feb 2025 10:03:47 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9G1-00000006pmX-2N7j
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 09:42:14 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3eb6b16f1a0so1791572b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739353332; x=1739958132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0SNOa69PLoDhh24/938sy/j/EaHqARH0GqI8xpTJeU=;
        b=PhKCru1caiSyAgIpZ6GJGjh39aSyGicqm9KRUFTNQZxM9ebfM3SeUIEWXGK86DiqyT
         P98o8L0HBsXhdLWipcwG4rGKI6cM7V2tUf/femfqmUL1lIl4JGacNykJfDnSfkECicHs
         QYvzgRGl3TvqqVi64DFVcDb4k163H4aC9E8eZm6pYe7qI00/6YzlDLphvcg99Q5X22uM
         Ulf4CG7W/sr7iPvDfpVJpAR7WKe51zdSRizc+vcoTIdaLgdDfWFZoMYkyoxB8jRNpq4P
         +IVtqB7+igldee1x4wvx8RnoEtZe2XoVpBR8QUU/UoSLie1Uzztq9WKch2x6m+m3lsjW
         LMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353332; x=1739958132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0SNOa69PLoDhh24/938sy/j/EaHqARH0GqI8xpTJeU=;
        b=F3MfcAaxIYVkE6aqDnCL2xpEORsLulRocN4v2mJaBMEea19jpIsowfVKXP7wYF2Tzv
         SCn8eEz/sogsAIhfC6/gqOQiLl0CdjRj5VFcbgS1Ozvo8itS2dmZMcnarI9IY9ZaXQnT
         aYKfFhS86BvSkJdnB/5qYLbFN2m+xgMmjIWGOX/OgsvZjt39btimC5w1gKaD75/lSp4u
         UN5md4ri3jSyXQ27FzQmxYM8XNbkyMRGye0IXKSvoLZuIlcWxWlU7AWKaE/02z74Ott6
         zAgObxd2caNaspl1BWvDQCk1dMqeyWK9dEUflygf5/Zhsy8tq1T277kOL5n0lwlaFizq
         Rs7A==
X-Forwarded-Encrypted: i=1; AJvYcCWlJwQduWrhnMPsP391sHo1ckxO3Cl1wOXC9lxACOk3EYUT1EYRdAoO5mphjiTnZ8c+e1yzD3tuJX0N5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQih/CCi3d3Gvuy0FL0WmP8XCvRTWn6iYQ4EIw4tItbn6YDiq/
	pDvIcUBt2vTXrSn6XbS9DGabXbuPDS68Lj0HJlEFKhpiV14nahde
X-Gm-Gg: ASbGnctXcQBS3pdMKTkeiYmm4zPv5dv/GY4n5jMjoR4peFTeNZvBXePHTaUJtwzLx2p
	nDJjiSWOryKPR/hRUdJLEcjlk33SroXVEjTOUuuFgIv8Cq1oqVoDvUxxnZfODehnTTDqJ6u+YFM
	9ZVvDLt5b/Hk6DGRAElraOkoxCXxohqUnmsdgQpG0J3ka1cBg5WyjfRj/toUe5V5/m4VTChu4lK
	6kVqn9sxyHpO4VLsdOfA5TuYDCHzc4iJk1Y10yH8XhrDRB4PynpWJDgVAMhpkHzHhMKaodlaD2b
	MZc++jS69/3cDYSRLi49NCmiUQ==
X-Google-Smtp-Source: AGHT+IFY7RRL56SET6zwjdVg9vVDKQYGpxNInNa+Dsu4BPAw+Y3SHcAQvuUvGrIT5JAFo4U62eduNA==
X-Received: by 2002:a05:6808:2187:b0:3f3:ccb0:ad4a with SMTP id 5614622812f47-3f3cd70d9d0mr1961675b6e.31.1739353332373;
        Wed, 12 Feb 2025 01:42:12 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f3c4735c24sm1583180b6e.41.2025.02.12.01.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:42:11 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	inochiama@gmail.com,
	sophgo@lists.linux.dev
Subject: [PATCH 1/2] riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
Date: Wed, 12 Feb 2025 17:42:02 +0800
Message-Id: <dd23362328f77dd91aa9354848bbb0abad0f554b.1739351437.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1739351437.git.unicorn_wang@outlook.com>
References: <cover.1739351437.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_014213_641935_066D4382 
X-CRM114-Status: UNSURE (   8.64  )
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

Milk-V Pioneer uses fan as cooling-device, and speed of the fan is
controlled by the first channel of pwm controller of SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index be596d01ff8d..74c997ed8283 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -73,6 +73,13 @@ &uart0 {
 };
 
 / {
+	pwmfan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <103 128 179 230 255>;
+		pwms = <&pwm 0 40000 0>;
+		#cooling-cells = <2>;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			polling-delay-passive = <1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
