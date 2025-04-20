Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC75C369C2
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Apr 2025 07:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfnPgi8L+bOIOb7cJHX5zcXYucTxR1ACRZs/9yH9rXs=; b=INuLNM32B7qr1+
	WdmZjnInWKNj0qGCDA86S5+rCdLVESdNkf27Y8pA6X2mWbrrKfVc/WuTWGRT3qlVDLdM5kUp5zD+/
	h/wZPqx/ajpGQt1Nb5NiqmoqeZlaJCcpXTWAYUbVt4f1Z3NfgATwpj8PkZ9nUYFcnk/2j8ombuQx/
	1TLGBJBOUXyU+fNE3X7mB4kRcPTLiJeL7RQI5LklYxT6MH5/OUGmw6mUNkaA9ggan8EyfiroANrWR
	TYJsC1X9Q2nw+KkL7RX2RCiESu+P1c4jvwEerJTYrEvHNjSsykOsxo1m/0KOxAUU7Db5gZj2P2npC
	SFPZmgIKouOBydQhN/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6OkF-00000002IZ8-0PJE;
	Sun, 20 Apr 2025 07:05:39 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6OkC-00000002IXw-3O7d
	for linux-riscv@lists.infradead.org;
	Sun, 20 Apr 2025 07:05:38 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7398d65476eso2454227b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Apr 2025 00:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132736; x=1745737536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmOqJQRui7bzs7fivZ3106VDf78wzGBoncjdDrfzqjQ=;
        b=MfwwrVBm4Wr0DqwhwsIJT5n9tFyUTDyQe/RiviBam65xkcRg9lbcx6jzfZnQCNIZqr
         eoAjdkjWCZ0L78aKtikXJODwlzf4P02mkxWmQZri9HVp9aUhAj8IP3QTLhfhQbh1a6u4
         GsFZ7WwDxAPcU/duAs6a6zz4SUrB56WhqTkLsbdNsxO6LTTgrDDsaV7tXwcyfh8jzrLF
         gLOfmsJZ+nfDNvQgT7ZxWVU5Ru3dJ+5F1R9O6gYayOg8XouDKslLv2mtnGjl6PSeVLvH
         ktQFdUOdXJlUp0bgQysjNt+uitwdgN7i0dFsZuthuRN2AO6lU0A3+rA6+zB2aM0KN2o9
         zwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132736; x=1745737536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmOqJQRui7bzs7fivZ3106VDf78wzGBoncjdDrfzqjQ=;
        b=lcB9WQENhOE6OZdutkIf6Q+2YiWmlw9BOTOCW29acibDcEaJxVeqW58MKc2Ak6o4Te
         y4LrpMt1N9GjCf99pFskEaUB85GDz3KHRZ1UCYl3DoMY9y04l8p3mnh43lZF4coU6dX9
         3/Lp97j7SnICTZc+hlaPBRD3qLwVpft1wQaHkZPf6tlv5TAsXbH9nS9K7ci5wRIxgqPu
         En/8NRVBtHPiee70uQaVfYfAOBD16AkKaVfiNZhEAWFWwsu7/qE60g0cpYTJgZrNHVmn
         PsYRQUgEHKipesWYRyEAJ/CguMqhN5BVM+2u2KGOVAGQG8FGwMksPxRTEiM9HvIN/dVw
         LV4g==
X-Forwarded-Encrypted: i=1; AJvYcCW0xwaiU59SzG3/TP/hxoGgiS/6H56YgYGbc2nhfLZiJMiMZZ+DJq5ZHT7IpUNJQaNqq0h7ddBqT12VXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymslsIPANpQTeLbI/0GQhkgkW2B6e48ALdH9p0oRT84x2pgXQa
	p/GFPt+eTjW9QIAEUsJ1QWuScy+CKkKohbcwQ4lh7VMxiK2KZM0PQ6+vLiCutWc=
X-Gm-Gg: ASbGncvhJXEdh96CfQoqhNB+iy/z82+UKkiq+lsdscsfHfh5JRcQqqxWO7Mt0mCkcfv
	+D94rpc6vbFxTx1Ui8vQdwvzU1azCR+IuPHDZXXyW/Tjlc7L4j1wWKHJeybjmBUMzAX2ltY25E6
	twEQM6YO7K8iQeiLma30kNKLbWVXhDL2YGRTNsJsoVCIacwdcZxOPzmGcCHDeP2L5MM+o1ze+To
	Mlr9ifvTkG2uSIudxUwFGnt/yVcVcHmBS5gyv10SYvPP3kHIg4wk0b4e/HAXDtHwXAbhq8llZjY
	QcMmFmuNk7wyNxEVuPTIgaX8o44Pz2glZHXHcKA5
X-Google-Smtp-Source: AGHT+IHFuVLoWyEV69AHMEphs3R/4V0RmqgjZGMtJgQzyiUWElzohukYn3f3PlJSmIVrROFiyThGIw==
X-Received: by 2002:a05:6a21:3388:b0:1f3:34a4:bf01 with SMTP id adf61e73a8af0-203c9600f8amr11912750637.17.1745132736128;
        Sun, 20 Apr 2025 00:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:35 -0700 (PDT)
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
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Date: Sun, 20 Apr 2025 15:02:49 +0800
Message-ID: <20250420070251.378950-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_000536_843285_025AA2F2 
X-CRM114-Status: GOOD (  11.91  )
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
