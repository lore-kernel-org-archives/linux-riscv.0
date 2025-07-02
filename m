Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE03C83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnYd2l0SYd5PEBSyxG1BCWfIaWCYwvx90rgFUEeVLM=; b=Nt3hNy03k3+Enf
	3Kp4hP0PPYhkrXQ7UgIY2fZ0+CFYnhFgewPb4+bwPA62OTgUKVO3S1FA4Sww49STtho3nysng9HCm
	dkygJr4QBys3JQ0Y6wjT6ex/KsFAWPgXE/saAuO3td4ulh1a4C8u+C6N0bWid5RpY6Ym9DDZskVcv
	9BBrQ2hPqBv65wgtsxHrhJil3SPRBhAriP3Wd7gpI0NKHTlYHFf/4OQ9xNqpOoR/y9t9qb6GqLA+2
	xVeiw0bKDCHR/o8uPwRMQ6y5oN6y9UBrmfxFwCKy/t8SH0CZFGLJpPdIpvIkcMxTWfnKCIL/DHEUE
	oziJc6Y1ZLhBo/K7F7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58p-00000009bg3-1xf3;
	Wed, 02 Jul 2025 21:37:19 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58l-00000009bd6-2Ry7
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 21:37:16 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso82484016d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 14:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492235; x=1752097035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=zF+uldBi0goVWmub4qSVboW3ZMHAH0qYX0XCi5SLgwsS/m97devy6ggrcFeXpOTqUf
         qym4MSleCqCsfXgMqAxcujrXyGcAr3RorrDmQxVYPpAwhQi+T5ZXexVIzf0zg3BHptd2
         6BaLQtwMu/+Pg+AAVyRSFFz093s4GS91kTKOEfpRs6OKHAQguDjau8nl9hXenaBV3f30
         TiswZ8ZW5q97ebQ1oAuZVfhIgYigIUda6yO/xNb+px5bEAWaYA2yMPv1GuXMCVtNUx7e
         xx41xDXIlKCSgLR2gaK9G0Jlm/Y1K6osux2iqK2BsrDtezsXKabIDpNdhvomlrDZsmot
         tFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492235; x=1752097035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=l0y4PP0KIJ3zVqJBD+IsLN2rbniYRCf+wOPdDE1fp22Oook+Lfj7xIQEtCFC7wx91i
         NlYvVPEQqXk0TsremcHFrhhsatBGaqTB4YJuwsiv+QRtsDTz50Nk69ogT+PHLtAdTOAw
         zzAPFP6Xza61EMNvdXXeZtjwqCQ/yxQq8UM63cCjxXYwuiMsQE3/+xsBCzLKpW/9MKa9
         +3yBgxyxXhLfNFw8jYNjgzj9b24eksZprxJI+LCBwbTxHpWRA9bA8Svd9s/jsyFzBMtE
         GBRpTzks5WtYoQ77mEviVCXl/gqtOuDmdMFu4G6HPZ9Rj2dTKSCkLmNPbK9qwTXx8kS+
         rgNg==
X-Forwarded-Encrypted: i=1; AJvYcCWMg6/65tJyRitQCHRrxonidWz4zygBxUnBXgAHeIVkTk5v3myIB2vFTZkX1jcUBNoFVObqXGSC3OYGLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTG+cR9LxBMFSDEBA38AC7APhylXbLnxVVmjgu19Sht3YJTbQN
	FX8N2VOQaqtUuZ7nrX9g3dnPffNzFt5hL+SOEUXWtFZs14EVJLaSp9zNtDuitagygL4=
X-Gm-Gg: ASbGncvaQ+LNAkBtL7nr3Nf+hukOZhUtHn6pygIsVBKYMF3Bji3IsZ6DtSZZCrdDJds
	otQp45cHOP7DJGE6+1CzJsCJYIfiyPNaJgbrh5Xe42vrw8htLFOLXNKZ6Xov3NH6qH5CBS6ztFw
	FEPaeW9Nj/oa1no//NCrpEU7PJ3dWQ/MYaSixRu10zx11hbXNesFJa0nsKbwi3tE0yD4dAfwZIA
	2fxfvRsBfdcHNJnEyxljXl7a83gIGNReB9F0+fKJGvt6mdXPv2zPGc0M74AQJx9cv3AmTbtlApc
	UR/q+K8nljzLBt3tNrst3EpkkKmDsVW2K7C06CKz7cTTLqRqi0O39qdJcLh3+CAqZo4veIXIH35
	iXbuurSDPr6s8uSjdisxXVafLr8XbG8xx/+U=
X-Google-Smtp-Source: AGHT+IHmuE1Hb+fdqWuuRSoeZlf3aoCIg4RErjvlQJxeD9KbYWIor15tIIiabP6Dq/CTktn4FVDAFA==
X-Received: by 2002:a05:6214:c28:b0:6fb:4b54:ebb with SMTP id 6a1803df08f44-702bcbf5777mr14378456d6.14.1751492234758;
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
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
Subject: [PATCH v7 7/8] riscv: dts: spacemit: define fixed regulators
Date: Wed,  2 Jul 2025 16:36:56 -0500
Message-ID: <20250702213658.545163-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143715_621685_42DBC8DD 
X-CRM114-Status: UNSURE (   8.97  )
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
