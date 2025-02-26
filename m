Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE81C021BE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3JKRgPrniwYe7JQ6sa1SJLwbbYm901Cce1wq4WdSh4=; b=M4/IKOUi96ywuP
	vtRkqFUkKgxpcn3BnJHMxetlp5/NjzQhV6qpSm1oDJ4I0fAyAjyXGfLfUyczxUMms505146SL1u9G
	d1bc5f9+7EK4qlDoIQG5ZjhBYxZXHvUotARZGqLXYuQDVfoIW5GuNlXnFLFmMdh9ia9jfMTGyzAK5
	V/oIRFT9x7mkFvqJwCKQfujtp6/TisPOFmYAmzwWb4Jf0wurjiDDSzKwpSE5DGn/+0o+DoJn8Npj3
	8PAfJGjDzRU7lIFoKI0szyteUByjzQ88guV7K/8VxtbDp1/VZeUOY+NP8TTPJw3GBViQ+prIMfwt9
	aQ9fjrQN/Nwt+cwj7w/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn80j-00000002Hot-1lqG;
	Wed, 26 Feb 2025 03:23:01 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6xg-000000028xe-2hW0
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 02:15:49 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5fcd61e9bcdso2609214eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 18:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740536148; x=1741140948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHGavz6z1XAW16p7P/7q7QGD5LUvtpVWO2vRaC4bQT4=;
        b=XgVsknf/9P+9IIgddfy0QIe+APR1xVPI9a+xMaX3P/6t8s8usHf9v7mFkIzhCYcmh+
         q6LkmMyRU61AsCWsR8WMOky4hrRi3zL00F4I74VtQHanYdj9/ilIe/f7DJ29INy7Y7wv
         X2nTOYtMQcAQiekzg2jLoZV/05TJtGiwUGY8+C1EMvjlON4fV843H6wll6rs9vEAehIo
         UT1z35ncnQs7CPdlwZprw6xOLJrHVTWBp8nqM5ROblloeUJFxRhtRf/00S3Z5L9wRgcz
         tuM7Kn/N0prDXv5r60FYt4sSeCQaJ1B4D2fL0hDR6eZAd7JDkEpV0gvAG0VnmX4iaDgA
         r8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740536148; x=1741140948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHGavz6z1XAW16p7P/7q7QGD5LUvtpVWO2vRaC4bQT4=;
        b=bSqH0/FJadA/O+Vo9TzZsPIk38ZWyziW79g17tn6j9gU+KyUXfNI4aF3lagEujqI8M
         P5V0zUatZR0ibweeAp53fKceS5/o1yk8uJygDtRJG8COHpcl3DHCOf5AOXj5Acu1/UJw
         KMTBW7ednEtLz0zF2hoDO4PZdckPjoi91F3/TWubdcLKB+JQsxkRQpi98mIm0znUScXm
         ojqsTFBhxzxa1yUTyQmDVXNeaZavE37BL8dyUz5iEzMidTJkPuqMnW3LE5wo0gs8LOsi
         GBvN/m70jBzOdT3zSpYS7c9aFZhaMRqyforaJNLUH5jNceOspnbfMfvHY7QJ2ENqmulU
         aBig==
X-Forwarded-Encrypted: i=1; AJvYcCVgJTVfc1Cq0n0muiydJI/IagT+KzU+9d6Egj7d0fCLIwyR9J5z/DqGFFzS+G9OB2y/hoIcykJWMkNJzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPq39F4i3uPcmLnNNhOmvcs7NwTfVvXndetldF3CkoBFp82ZX0
	nTILRjtY3CLAwGwYbepxDi21RU54bnvkkaERPNt4DEAfH1jzRYc2
X-Gm-Gg: ASbGncsLxjoqlqGpZVvq685CjNKmsa7l3jIBxHvNqaqxGhPVMriL5tAu0TIHnOjKbew
	KAGtO3WsY8M5HAoHHhOUjRGX0OwZuxp4RAxCK/GulNyH87J8sRnhNV0epWIPwuqZjumk2uJ9vzZ
	lIqFKIB7tRGk/eL+STU6ww7d9CQmbvIB0KDdY5m5ObhWPS9h2NeJABfIgez/HmSORPLUs799V+o
	+eyN81Ax37+lYkfOAiWh8txK0SQffAcb/qn8eMoPtU/qDimwdI6AwjP1IFeTP2XCc3jYNQH8tV3
	7poWYw+yjSgVWoiqqwaeDrhOSnvGql2vZsQN
X-Google-Smtp-Source: AGHT+IGLYc8zwdtfmLaEsvbdDcjtt1ROPr3PJkWV4l0eqsn4p4lu2DNAkyhTkGMvz1D3nRQo2igqow==
X-Received: by 2002:a05:6820:1b92:b0:5fd:f8d:3870 with SMTP id 006d021491bc7-5fd1a77973bmr11258701eaf.4.1740536147732;
        Tue, 25 Feb 2025 18:15:47 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fe9410df0dsm523864eaf.3.2025.02.25.18.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:15:46 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v5 3/3] riscv: sophgo: dts: add msi controller for SG2042
Date: Wed, 26 Feb 2025 10:15:37 +0800
Message-Id: <f47c6c3f0309a543d495cb088d6c8c5750bb5647.1740535748.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1740535748.git.unicorn_wang@outlook.com>
References: <cover.1740535748.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_181548_682624_F83A5FAD 
X-CRM114-Status: UNSURE (   8.87  )
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

Add msi-controller node to dts for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..fef2a0e0f7a3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -173,6 +173,16 @@ pllclk: clock-controller@70300100c0 {
 			#clock-cells = <1>;
 		};
 
+		msi: msi-controller@7030010304 {
+			compatible = "sophgo,sg2042-msi";
+			reg = <0x70 0x30010304 0x0 0x4>,
+			      <0x70 0x30010300 0x0 0x4>;
+			reg-names = "clr", "doorbell";
+			msi-controller;
+			#msi-cells = <0>;
+			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+		};
+
 		rpgate: clock-controller@7030010368 {
 			compatible = "sophgo,sg2042-rpgate";
 			reg = <0x70 0x30010368 0x0 0x98>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
