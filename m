Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1469CC77B7F
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 03:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnYd2l0SYd5PEBSyxG1BCWfIaWCYwvx90rgFUEeVLM=; b=Jpys2hg3W1MXiE
	yD7b3ZhXUrgUSDvr4AZQjIxFtJzHm/l5sABtnornmFYU/sCCw/kyDRqZjnk5VdluwpYv6yJeTUiGy
	cEdrupomu4f7AIuD8u77BlBFrrmGCPKk6YrB4j/Dn+4Gy8rfv7AAlHGSKan1QB4AU8Ts59t6TLt9f
	PA66RWOQSKOu7uzI60kSTGw+3JIx7mHWDbHK9UluPzQomZwTETIWfThXMnHDp+yJG8Lc2cxw+I7OJ
	iCJofVHAXOxRpq852WeJABcIVZqWmmm3SPQJsSCd2AnKlu69d46EWeNMzmgHGQoltHEisBbmcwi5M
	qqBtY3Nh07vzHii9ebfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBP4-00000000Tjo-3o7z;
	Sun, 22 Jun 2025 03:29:58 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBP1-00000000Tho-0NAH
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 03:29:56 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6fafb6899c2so34362846d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562994; x=1751167794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=NRm/leT4s9Qa+IKkQq3fGcm9qTfGpqw+FWKfX1qjUum+9rvxq+SlFsTU2aAhd2382w
         TPBCLBI7gdyOHHWYw/a81O3Kvj2eY2SE3rqmyJbrWqO3q/3NIHiGe4bO01m35Xn1SXF4
         /BnKRwymMAAkle3nMK7dEWxkp+YtFy9TiBgqb8oXayt9XAMa5PCY9TJnsJQUiJvteSwS
         2koXYRkybdEsXSKHMqua5ZvIhRcfZvkR0tROQkn0oI0If//wQquAh9kZPu5qLFdcOugo
         wW1H74ZSlnb5PCFHqRfBwUN+crL0zrd1MUXJUqvUcNIkkIqs0gYC7i0hQ1zfoVkjG1F+
         QyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562994; x=1751167794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=g94GfNHOV3wqE7kAaXlaMFIZS71lc8heGCWJmZ+OnFblfP7Y3fix+goAXN0d/hf0+f
         zXJWj9lvw/YfP2kyXz/USchEezhNhuz3vZJGc6XbQacaLBkQxM8O38acqn0R/1SRtJKz
         EmCT0eQQMPiSjz456YWI+3ZXHfna9yy7M6GFNf56SD1E/0LkUsCBmwTogGptp1WyED6R
         oxwVXXtjX/QVxLc4kZkkzwnTO1TNICeRrbsUSrWnI7oyAt/ow4dCNJtt/y8CjMKJ0vzD
         aDN0XpAgd8e/h5p5D+elBzkeh04+v42p0P5d7LWLhz6ve52QtOL6P952Ryh9peiPayBK
         lVkg==
X-Forwarded-Encrypted: i=1; AJvYcCUophHg3lETLXUmZPHMktO5LrGVAXdkqtSGgzAUiRAHhNYvMQx7S/cYEi4zbWW6WWFUjAadQ6Al8oztrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmMWdBR1lBfWms9t6Aait1bu6Xp1lgbt/OvnPJUzzcObqaa3jx
	VLGX3pIpiKq5C1GkY2ZyHYvYQ6qqWThDVmX5SJpqMt+kwbZgphGWF/zRojP3vAHN1fg=
X-Gm-Gg: ASbGncuBTD5/c5PP1MPI/cHNW0wnBQcfdjnKk6e18QKQXPS4U8Ul4KDpoifTVzkSpBa
	ycSAnjL2c0Tigh+Ip6joBGyNZiwzZ9zSgOYeNP9h8/PdiuxE7EJQNCDTUIrZ4CYLTjluu4pcR13
	keox/dlnoxdcNqEyP8XU5BfWlasSm8KMvhth1R+jDpZ/+39E8ZIy+4xTvYQ36cbiBR0AhXut3rJ
	xd7C14vDExgX3YW7V00JvdhBjwCIaNPqLE+dZyejzTHs78xEbEgYlILLYaIKJ3JttOAWb4xZ9Vi
	kpKNCIjEk0FY5dX9nzKd9oFCwFXEvChMcawDOUbYmFSZutIgbezj7aq2HSZ23b9UcY6u18mg7iu
	0Z/EuHbRD31sQD9lZNgl/Dqby9vnP90KYK7g=
X-Google-Smtp-Source: AGHT+IFx7soANp4iyxPjh25Qy4p98v7iDm54ya/OEbJv3+HBB/XlyEpTgKQt20ORZjbaNTVgNKCyAQ==
X-Received: by 2002:a05:6214:3385:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fd0c87da04mr119950596d6.5.1750562994099;
        Sat, 21 Jun 2025 20:29:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 6/7] riscv: dts: spacemit: define fixed regulators
Date: Sat, 21 Jun 2025 22:29:38 -0500
Message-ID: <20250622032941.3768912-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_202955_121909_14A8DA03 
X-CRM114-Status: UNSURE (   7.56  )
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

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
