Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECC7C83F25
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnYd2l0SYd5PEBSyxG1BCWfIaWCYwvx90rgFUEeVLM=; b=A8dHW0JdgaM9SY
	uR123zTMwjOdXbxOFCtAGySIawxxKV1Fz3myxVLFImy/eY6qDv7fSixcADWeS/5u/QyaN2gqwvreo
	V5YCqpByxHq+3mqbLNlHDK4At68OyuXcBHzMenMFdLW6yHm8fAk5N+t6549RAWjDOn8+Ts8nlZlM3
	EVVDg7ZKG43bng3zIzxvzyyVUl9Bhm5MI5KEsIRnOk89Uk+cqujfeWZT22nxM3EFJl03BsaRgpFpA
	q5JeqRKQp2Za2/82UnyNZi7G1QYFhalS+rKxHftoUS1CvAlvX/0b5hPxIBN3iFcUQhERdHhlY8SYa
	VvFCFEPspFecEfLK2vUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxAR-0000000CqEN-2IUG;
	Thu, 10 Jul 2025 19:42:51 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvQY-0000000CdPV-1uUk
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:51:23 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4a97a67aa97so9279301cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169881; x=1752774681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=EmNi5+3C7BIYWQaloMCqq4WWK5Pc62hLnSMu3yvceQ3eQ4JNn/IBglNokhLHZSGa9k
         jrU3Ssb2HHP3FdsGy5Gs5DL/xjg2yzOLkngPijECuuAdOW/aZuw9hV0+zVgYI1cbD4Ln
         L09NyLHZs18XxQhmcIjh9SAxKrGGp8gNsyTYInLCe37aj86wOUsVxfGSn58Ab/GzuiEV
         fD6Vhmp4z54vdFg3CT89hvsSOaekjoF3Kxd6g8fGQpNmZfTCjIPJbKDXStGmO+pWmxMq
         6cP99W6BdqL+WdOTJJ7OR6WjteRS4CTcOOV8hjW4weaM6iw3P+2LL9NfXndcpRKKkpRm
         snug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169881; x=1752774681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=uzrpczLabT7PzPVk4AldNLENUivh6UmOhJDBBDcr3pkKrn3FW3WhsM9QM+HJmCqVZc
         dufL+gwqLHWnfdtRdhPwvFDQrbq0tuFntIKF9LcgYj2k43eVK+r9I63W6gDuuEsp1DTM
         W7S36Qklk3TuzxUQaORKAYD3lhqKYvja9yjP3/cCdnwOqWvSbm5UI/MFeq6JezZ/BY2u
         Ncciyvv7sRjG9svHrj3B3el8VezC66SZWglTQh4JJQR5CXwQlpIxNy1vjXQIQT9PEPj/
         Phdm/uJky2L9It+xp+BbaDo8ZJwgf+eBgRRr82MLwUBLzKZGIfUmq7lP4tzFVPWQiJMN
         iLzg==
X-Forwarded-Encrypted: i=1; AJvYcCWSTFBLX0M1b36BtaXx1ODFli7+RsNQYzK5VWZtINivIbakuImnnLE0n40G8QifRTS3IOp+uqhewyGVuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbsaqgO0gozhhziniGSNaY6UjqUOjTURWb38szm/415W0EPj9O
	CQNFKay68dviI/tqqu4in5DLFJNP5Y4BT5bPiKVWL0gZ1hXMdgbOd6KFLxi1W+hABwA=
X-Gm-Gg: ASbGncs9ImEKTiU3nc3SxhyAjkaEW2Yhk8jZrdtTg0VpYciP/3qnFOueHMtXabwd7Ps
	ipKAs7JFMU1qjTnskgpBv9JDQsa7TotQJdK3rtBVdvYxAGn+vBxNWnfqWdH4tYc76pfSCSx8sy7
	QL+xiU15m2m8s3mHEmPoFrXzSYaNFlQfzj5CSceGJu27yWKUuC6ZbXIj1/QAk9zZmlHR6GoQl6z
	gapTZZQuO859ohPkECSNYeBVPI5gXYRe09LXgMITJJ43bMc01iIn4p+bFCTCV5EQOokd2YC8+i4
	3DZ2997XhlRfUQCkL7VUveEeQ8+YsUwtqUYSrPvm1XLlDDCt4I7RfBkDwssZQZNTsVcDjrV7vWs
	qGw0ALud1+2CTj0fe1Eax3jLYjqOfMhgR2+c=
X-Google-Smtp-Source: AGHT+IHBaLoGy+mXI82bk9r9JVDCOAUDtCda2f1J3UcRVBL1tXN88/2gwPEvHSrFuX0VVuYTud0GuA==
X-Received: by 2002:ac8:4e07:0:b0:4a7:7b5c:90a5 with SMTP id d75a77b69052e-4a9fba23006mr2458881cf.7.1752169881236;
        Thu, 10 Jul 2025 10:51:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:20 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/8] riscv: dts: spacemit: define fixed regulators
Date: Thu, 10 Jul 2025 12:51:05 -0500
Message-ID: <20250710175107.1280221-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105122_490062_4469096C 
X-CRM114-Status: UNSURE (   8.56  )
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
