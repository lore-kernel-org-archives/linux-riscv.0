Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB4CC3ABAF
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJkifxLWmW+Bp+pTZCx7lhy/y5oQFbsG7w8c8DzIKmI=; b=BoPQiII9p+A+GW
	KMVAxDzHY9cXzsM1BALmYlPRu+Moo8dfdfDxo3dE9l0plCcCv8eI3eRum0M0d4/XB0EN3b4fSJtL5
	D8sxIA9Cy4sp26YluXNSaxsg9JBUtD47rCLWGitDkiUngQJzUptClbwv0K3SpqzZY+1ysc9HUjrbd
	utofK9duy8TGCr8M5W/DbEi/bFPMcQqX7pNJcraafucsNVQ7puekUpimWAski1opKziW4GZdDDZx/
	dQe/PDHwFaib6oD62AE31mNywfp35MXilsDFJhbmvzZiiIxJRUAvQJloo4X2qlmNhyhdc6S4iaaxi
	mFztoBaSg8e5RqguiDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gmY-000000091rz-2nv1;
	Tue, 29 Apr 2025 08:57:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gh5-000000090X3-0ohZ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 08:52:00 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so5460446a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916718; x=1746521518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYS2eMiVk4Xt0bu0VrX3eSLEVjDrDZlAzYja2cax6VM=;
        b=gK+l7mpaFtSkK3B0fPKDoRK/DjEpa5Gnxf9pVKW5kaNV0vmPatqTMox88v6PxkK8YX
         4P09gdS4Bmte13rMnKAUWSh0/mPXVzWrddfhiKRe2us3pxgsiMPRiT0WpGzP0Hbs5yRp
         4dVM254oM58mmcV65JVRHODRXATSoZ4cz2Niio/5XnNHfAbjwUTHxPLXxI4I4cup3yms
         ixltpX99M+vzFApG/aM25XHFHahNi+gG1audN4hGPyBnIj2WMYaEvqiivky950pVrM/8
         VpTJaeIzNHD+ybHJNWrlzU5uk69NhQYBG9riilAMM+eJb3vqz9adbhqReFchUZKv9u3c
         HS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916718; x=1746521518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYS2eMiVk4Xt0bu0VrX3eSLEVjDrDZlAzYja2cax6VM=;
        b=SUwCoaGXXY+8nyRU+s7Yv6qR+xqWyDaSdNnpjuk1FjHHdHCIYTE51cNoeIulqDiZmr
         TEIZWjCZUIir4Wx1Mp1ecaZXWiMLUk2bD08KmZskYjkJcco2dmzkV8vB4aLjUqMBxe3S
         fiivChvvCEJuPS6OBg5Oe0SMbysrrZ/sZi/yLBIYAwgpeL+tyWz3DCsnfrGLR/17tAqh
         m+3K8XpINlgEwb7z8Gy1WyArfM+bsXnM0B2rkHu8/8t/8K77OrOuo87LTS3DVMZ+q6Xv
         t2PNyyx1V7E1VMabECLl7Xq5fr3Y1DlfiMZtBG+OSgXVpqvwv2vDqh9uwk7ODQGxmcOP
         QCfA==
X-Forwarded-Encrypted: i=1; AJvYcCXZgJbrJOM2Vfpf9AZjVNsv5OhqxCqLjPkdUVJAygZ/NCPYaK4779FcF27XjbH1LjjlYM3KIYm5JM8qsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAY98H/d1u43T8amvDkkej4CAOY1nXcSirwEhngEw8U7w1rTFP
	Arl9CBTWiKdOkvgjrJk+NKrLQZ4ZYRe2zRNlN0fwfZ0Ki9xv7Zvxv0ckKplU5LQ=
X-Gm-Gg: ASbGncsgEdU4EIBr96Hkz1+QbjpT0jBG2Sk4L20s0D4A8enNK2tivj5XIEp4VO24rkM
	OmWfGHkP23UfgcfLnIdTCsiIyTZSS38w6XsRA0dEma3RgOHBrQqzGuJN4mdI/NOLCN21HSqk4Jc
	61eW3Yx4xSfsMYXTbC7eCorb2UrC8X59JbjnFHjmIzkRbSD298HJrQunm9+HiQke+UkLsHWH26K
	QCcXs6ZMBR7GAh7n5P7iOiCYVv10nqQoRlcrzJ4T4u14YFh7RRv8TOIXQQVsiLRdNlWfKIalsGE
	l+wkgxY2sW48vXNxTL8kCNVVWdvZhW4sNKJdgZdh/x7/ZCqUBJbw0liSZlM4kqObjGr1mfklV9J
	avsXt8ORMZbfJW1o=
X-Google-Smtp-Source: AGHT+IFY1/NJQY1EBeDwxCimqA2xJLyNhndajPdetd6CnjlEWVopEm9ixDmG0zsCZTOnJTyyL/yb/g==
X-Received: by 2002:a05:6a21:3a41:b0:1fa:995a:5004 with SMTP id adf61e73a8af0-2095aa9a073mr3324411637.26.1745916718351;
        Tue, 29 Apr 2025 01:51:58 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:57 -0700 (PDT)
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
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Date: Tue, 29 Apr 2025 16:50:46 +0800
Message-ID: <20250429085048.1310409-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_015159_229948_C20C69D1 
X-CRM114-Status: GOOD (  12.02  )
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

This patch adds the option 1 (hence the name pwm14_1) pinctrl
configuration for PWM14 on the SpacemiT K1 SoC.

PWM14 option 1 is used for PWM-based backlight control on MIPI displays.
This configuration is present on all existing K1 development boards,
such as the Banana Pi BPI-F3 and the Milk-V Jupiter.

For reference, a more complete list of PWM0-PWM19 pinctrl configurations
including all options can be found in [1].

Note: Since the corresponding functionality for other pins is not yet
in use or ready for upstreaming, this patch includes only the pwm14_1
setting.

[1] https://lore.kernel.org/all/20250411131423.3802611-7-guodong@riscstar.com/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change
v2: Discard pwm0-pwm19 pinctrl configurations, and adds only pwm14_1_cfg

 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86..195eb8874f3c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -20,4 +20,11 @@ uart0-2-pins {
 			drive-strength = <32>;
 		};
 	};
+	pwm14_1_cfg: pwm14-1-cfg {
+		pwm14-1-pins {
+			pinmux = <K1_PADCONF(44, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
