Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9A7CA0EE5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 02:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLQOT3cRtegqdOZu4QetuOJyfZE2lwx1MO5fVzyBzHo=; b=kOXZ3o4xtTACrx
	64sZudbYzN+VMLIPKBBYPzlC3Z47qmsF8GjvJct7R37lI/v2IKoVJeG/Bsp3zHeAl1Kyx8qve7WWK
	drl8IZhVgAu48sXFR6sZrKI65xSlVx2EzIh4cM2at5JIPtW4QF0cVAgPDhDqLPAdqqqu8CiI5kycI
	VDWbda10rX5fcMTx+NBHFIDDHGpYma/LGTwexcFPaeXmPB99WNzzGUuWuVcaTzsyK4NSfGGy86PZx
	6XsNWptegt+ir+JZlix8A//deTFxnvWxgDAaO+TaZUX6BQIC2SVtj9nUguykAa4FCOW6cp//boTPD
	XELR/X4kpYXmPWEc8A0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1X0-0000000CRKd-3EBT;
	Wed, 13 Aug 2025 02:48:02 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UV-0000000CQkA-2j9S
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 02:45:29 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e55cdc7dfcso7833285ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 19:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053127; x=1755657927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=jSBaWoWbw2I+SZgtJzSy9QdKtTf+HrtzJ4UC+G9gK2fxxoa8ci4e4oJvG3quRX/QqD
         SsM7fmueI8IrTbvLaFnW9hhmAsJntIZhBptcA2VbDUHlu3B8bEhQpfNoCjNQbnDEdDuV
         pypcT4KZAUPYe4pV/7EMzIcsUq8Bimhoj+oMyBzDF4eG4wF1yIxIFciUX20LoNRwdJd0
         YWs8IlKQWjBTpoDRCzjkIcLqTlJSJGPCw6mVJg9DduL6BWznSLfcOiZHxG+MulV4st1f
         r21bYIA8q5/UIgG5EgjJd/F9oGMre+GThBLoWEJbSi3VIPLHwkR5PbOFPltXQrsq2En4
         UV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053127; x=1755657927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmHcfUIrXFFWAxyqlPf+YQqXo4C+Q0QbA66Hg5xFlzs=;
        b=YREdsHNGx4fO+Zv3O21KO6xIsgGR3g4Y7RmCjVc2X4RL+TZ2XV92qyQHy0YebEKhGn
         vGjh3X1lej5xorKWauR6qtftcCtZ9T+h0Z+mxxOu49qtAX9p1dJZy6pCJObV1Gs44MMg
         2UZWzxXPI0SJfqRk7wCzQYpyCLV1zCdM8uokyKBbkr5zlMBC7aqqvIYBlKB1U/X4y97e
         KA/lHOwXLXNp1/fUZjTDTkh/UCj1qp0fx8ZNvsdSkT8xzLtyBNTfglbldf4DeJEiKy7t
         W8GGEFvhwRYRrzR4QJt0LU/Kh70cRGtaXQpAp9INRqD6XOGyczBsI93fgpAce9wb+k8L
         iw3g==
X-Forwarded-Encrypted: i=1; AJvYcCW4nMIc9t7RPxHuJYuEwkC0dKoaFL718aunbBiAsc+hyo8ra7vUWqxJRRVT1/1Fub1r7vqlTEEz3q/XMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzRSvGZB61hWM50Uxs456ViVJP9ZlTtp1rHEpA6Fx2zBexLh0n
	AGhkFCVNTqdcXExX8qnPqvTTqlwrVB9aWgw+K+ezXiuSq8x+YpGiGv4MN7L5QYqnGYc=
X-Gm-Gg: ASbGncvAQj9jD3YbJFXo89FDAduwCwnOHMOHwzjelTVtQubKk2uombxIUWw3jXRT5en
	SxT3btkkHL8z5k7l5tdsjPtlhz9X46j6WQAw/p7Bs2V3X/YxGRmpekJwXN/M+LfE6+WhmaSiCvP
	sDiYAI5pfSMdB0F4nGIU7xzLLEOncyZpWraw5w6cDjWh0PPWuSet5WpQ2mPXAjBSbRjaR43yzxx
	05dD6J8SFeRS2UafDN9IAlLPbwPYQLQTHvsyuY6zkdrQzj6PTyNEZLU1vO7Dbd/SrDsf/IFyXPt
	TFuZDtHMlE2ng7/tCRl0sPS8pVkjkC4PhnlY+PoxITReUHr2OMCNdmubWMYEyHg3TIRHnEhRfar
	nuqhZN5DtdhCvQ0p9teHSB5lka5DNms73aviKYQnVd+wRjhG38sQeeXHF3D8P9inNQw==
X-Google-Smtp-Source: AGHT+IFoJ7UdDYgWZatV5u4GKDu3Y3U3FYyZUg9TQH+UAQsNUabAIk5nOGAMecrX5f7XD0yGFSpmTg==
X-Received: by 2002:a05:6e02:170b:b0:3e5:504b:420c with SMTP id e9e14a558f8ab-3e5674a2d6amr25649635ab.18.1755053126723;
        Tue, 12 Aug 2025 19:45:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:26 -0700 (PDT)
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
Subject: [PATCH v12 7/7] riscv: dts: spacemit: define regulator constraints
Date: Tue, 12 Aug 2025 21:45:08 -0500
Message-ID: <20250813024509.2325988-8-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_194527_688612_5EABBF7A 
X-CRM114-Status: UNSURE (   8.34  )
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

Define basic constraints for the regulators in the SpacemiT P1 PMIC,
as implemented in the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index a11a60b9f369b..a9a2596a94e89 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -68,6 +68,110 @@ pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
 		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
 	};
 };
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
