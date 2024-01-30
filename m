Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B9BC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m74T00Td+/mKbql+dhymmU/XZBiHQ8xY/TwrE5uKrVQ=; b=xz3PLzE9EXsR4m
	tAEy1WoczPTckwqmyzB2tL7cySovS+gyxImNgJHcj4sLSw1LsoACGlbfaFlON6LbPUgWCi4HmUpFP
	mM661NrPYEuLg4Q2VRuJ7y72bDHrIkJxe2FaiR/JYWHMTTukhZmKBawFX24aH4ZLHtcEXKUIyLWmb
	sScpn1Mmv+NiWpB7v/FPUZIsjW+bsA47PX5WYdN1m2TfTq+hAgnQWXJ/GH2/h6XRvSRg7o4LULujs
	aRybtlEOhE14OwYxTpbMIg9aBlkwcal10uCeT3fZl77mIO4XwS/Kk2gjwbDIyBTxIkqHgxafBhWnh
	QzolIumpqjVRIcZCc+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdGv-0000000EspZ-4AN4;
	Tue, 30 Jan 2024 01:50:45 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdGt-0000000Esof-2XLp
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:50:44 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-216f774c827so818232fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 17:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706579442; x=1707184242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pES1Be8lnleSkC5ZTbu9K0AiFC/pOlb++5x2f9+FMkw=;
        b=AGTRHlpJEoQZK6jv8XpA7D78iuW/FNdIvjJ8OZRVuOCoS5COqEQYxVA5EUu4HB1FSr
         f/WTBvNqi0oB7Xnu2XWKSA3p3erG4mUvnUYMYLvfBYhQ8VhKLduB3WKVIDvlCKqaUwhq
         CZZ0WMqG9LV1AKzUt3ADbLmmcCnACoCZoTC4JQCzZwQR2PGyuovFylGJ9dEYXwg013EJ
         9os3zxqB3w+S59FsKbbsaDJvBlHHk7zE5SsbaOcnREtMBB9ifxg5BeljOwm+8S6Fpgkc
         0S6F5MbjZNu2JRW8JaRmwmMgZZDTw1qLrq1HMkUkrtZO+lzruhYOwlbohnks1Q4q3PXi
         w8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706579442; x=1707184242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pES1Be8lnleSkC5ZTbu9K0AiFC/pOlb++5x2f9+FMkw=;
        b=qLAiEwiH0dYRpwoBec4b2uKoldieyLU6UFaLLITznPEdyAk9Tc6KIHtyg2WRORn6s8
         mPba96Uo/24fS/8Wzv5K9uCS0VnKP6e6FnrfFRyHSXFNgwrqoipsgq2Bw3IbislZSDA0
         jDk9n0Lf9L+KP+N4PIMt23SAaQIj0hoTaI1zbvvbJQyhDOKfuyFdh9J4zRrmMX/gBgkH
         a7qWMW2YBxPRG20Ys0Yl9NaTgk9Bx7LWMKIKFqai6JhDQhlPq1loOxk83yDgHHLxJ5Jc
         Iw11MU6XYU4yVRZE3nUQyMBkWYeNQM0+17LPSBwuHLHroZcekDHrUu/t+XWiEB9rLScd
         jydA==
X-Gm-Message-State: AOJu0YzSaCMxGYeEiPpec9aiUuYJ7vFREOem9fgM6LL8DsCPwDyvjYpk
	u5YpQD7oGMvgLpu3/39exeCdpIqmw/LX5jw/fjQnU/hWqKZ/i35o
X-Google-Smtp-Source: AGHT+IGio/t2XsWrOwzRM9pFgzBhPyxcBq77pykVY6hy8s3dWZl1ypoMVNAtpSg4J8UbdBCL7VCC+w==
X-Received: by 2002:a05:6871:6ac:b0:210:ad08:8f47 with SMTP id l44-20020a05687106ac00b00210ad088f47mr3292623oao.36.1706579442391;
        Mon, 29 Jan 2024 17:50:42 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id e12-20020a056870450c00b00218496d80b7sm1894855oao.29.2024.01.29.17.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 17:50:42 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	p.zabel@pengutronix.de,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v3 3/4] riscv: dts: add reset generator for Sophgo SG2042 SoC
Date: Tue, 30 Jan 2024 09:50:32 +0800
Message-Id: <b2f5d7cd2d3fccfc00cf4563d2dd7363b0fa2fca.1706577450.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706577450.git.unicorn_wang@outlook.com>
References: <cover.1706577450.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_175043_665634_CE40B4CF 
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

From: Chen Wang <unicorn_wang@outlook.com>

Add reset generator node to device tree for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index ead1cc35d88b..eeb341e16bfd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -6,6 +6,8 @@
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
 
+#include <dt-bindings/reset/sophgo,sg2042-reset.h>
+
 #include "sg2042-cpus.dtsi"
 
 / {
@@ -327,6 +329,12 @@ intc: interrupt-controller@7090000000 {
 			riscv,ndev = <224>;
 		};
 
+		rstgen: reset-controller@7030013000 {
+			compatible = "sophgo,sg2042-reset";
+			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@7040000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
