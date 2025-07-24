Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E408C87FCE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIsIFA0hgJ/9/sfwKTOyXmaA7JMIQhqYztCX3Xgrhkk=; b=uEiT7ITQGYLX5u
	XI5WP+aFp4UtfvniI/y8jSjPPP8Re2Vt+sw0meDgwiwOtVoiovTx0Rb1QpxjJGqvVYnPbmt5SIKmH
	33Q3GBOySF8DktYWGVuHlWNynJfbm23zkXJSOFqp0Q4xk2T4uldDDRaODuzKNHAwfocyyBSWymodV
	vyUXUxhhdP4lxGFDYT1LiYxKwwTRN90xeY7hEJyYjuBwrGxdFsKDCkk73HmrRA+qABy2XDcWCIKgV
	2HHmzdaR0/1bEmqPO1/dy2YZjr5Klm8IOOdjsBIdy3TysIn38+VxxaF8Bmu7a1AmrkpoG75VvTF/4
	iqi0Z+meLZEPa3k5iRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VQ-00000008NxX-0H04;
	Thu, 24 Jul 2025 20:25:32 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VN-00000008NvS-1mmQ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:30 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-879c734f0e2so45896739f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388729; x=1753993529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBB5jxvs8tf52E+gAfvEPPxENYUnIxfjNegdT7+viL8=;
        b=RREV8STSWFbmrQFGxDx9vSQRpmfsJ+AIxQN77wCaipVuIrkMvemC3Y1mlbW6QCicQJ
         3xNlJooza0v+sTRqAgzn2t4L/LUPgebNUiZO/OV6Yu4SM7Y+8y5TMStZM4rX3Hkv284C
         6IRDG23oTuWrH60r8MWGkaZzryfF/NWXTvSn2gMm4x4NRKZ1WH+zObHlXtCbHPm1LPc8
         4ze5a1N5nxm6rv33bkfsRegIPCHqnyk6oC44DAlfbNAg+RBAt9X7HIFf47g/Wo2f8+kx
         q0SjK4pkgonZ0ZDW2YU6tQloEaUb6wn/sAcWPITyrRrpPA2uEQ6pLyKkmuPyyCzX74Kf
         1zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388729; x=1753993529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBB5jxvs8tf52E+gAfvEPPxENYUnIxfjNegdT7+viL8=;
        b=asTdndJ025HyCEZOLbuPsRWdtIC++RcJYpIXWL4Foq9GDioCODyq+BVtWoBDIQd71R
         sar/A6Ni370ooAGHBzAgL8l1lPOU5+SCt2jzK//pwVo9SSCNiSlLhtJD4YZnJhvV/a5B
         RWcC0nsSSRkk+H3XNf+M1oyBW4DwxVOHVFSR4POCBhhP8ygHR6KTo72yyZSTyGSdJwbN
         uULCjyk4uLJDvwrw7GdWdYaIyofEhVulkGey3rlIogn32ujdLFPsRMes5xZj+s7rj4fc
         HOfC98o/8EW5FVm5YD+UZ3O/veF9wtksoPvA1AjkfE3VnCtcn+EpMfUEZctnoCbXGKUK
         L5GA==
X-Forwarded-Encrypted: i=1; AJvYcCVZPkg2U27Xy5eEDWQ4OBGkReDfb/0TtdTJNC8AH0LVUQWeQpDCOAfmgp+cBAM+YJnsG5xlFda0/dmVrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRT7JkFx9TSIgx4g32sxyfUC/1BgWmp20ICUBNVPqVEZQMYFrf
	pCUNCph10TMQYrTT+XWq4zaE6RZxUlDIDKpmDtteeQmlOlnLET5iPGW23taYzIhC9Jo=
X-Gm-Gg: ASbGncvwD+DVUTQpC4iTKqNQCtqKkxRFVoCXcFBuAYirHi7Sz8OScVESs2P/ceDF3HG
	iSpeoN5RxcLqtNHVxGIok8AcpuWEtZaQ6EcHhHEEm6YY3SBZbe2GxDWqNuWsj/BNySl2eKkpIoz
	5zETLDCYh4i2U0FZE7tbjActXAPn4nGpXSls77rxR2iQPWMJAmQpBmErSRK7wiXdZL5xNrCytNt
	4E49DtQKCQWTWwcR0tDxQ8TpIiAcJz+0Ptv5pthZcYtUWIj2YzpODCvD4X4SNjiCF3q5CfVLYUP
	seuPeveYGYyWYRnso77De1d2HgDzI6M9urk5BlkQh4MXR4pGq1j5QaPnlKaKlrnwHcaDXKCJToj
	2XWWjOut+oQly6eTgw7hUzyaOv5YkNGYekEGf7Ooq
X-Google-Smtp-Source: AGHT+IFA8t+gyzjGKf5ISSrexvmdiq2MvEH9qXOnl6ziXQ6Yu+XepclK9trDk+vKuFcx+/4K7eM8jA==
X-Received: by 2002:a05:6602:6d04:b0:87c:3495:41b3 with SMTP id ca18e2360f4ac-87c64f2f532mr1543017839f.1.1753388728685;
        Thu, 24 Jul 2025 13:25:28 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:28 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/8] riscv: dts: spacemit: define fixed regulators
Date: Thu, 24 Jul 2025 15:25:08 -0500
Message-ID: <20250724202511.499288-8-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132529_464134_813BF357 
X-CRM114-Status: UNSURE (   8.00  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
