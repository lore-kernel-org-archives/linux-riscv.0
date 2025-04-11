Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEA2C369B5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXbHhEn+tK2Bqwihz0rIga9qA6Vk/BWVDQw5dVA+SsI=; b=IHFXHP2KZpWWJk
	TQxCEt5XhwKLCqtUf/VkJvhLsQVOd8hkH3GbYzWX541DGDDN7QBG0GfWdHewu3yULV6A+CRJoSinp
	PVz15Xu9Fo8gUOw0saQWcLQ+eqFoJOeEn88VcO6KU4P11rdfft/vLiBjWyGQ/MhmiRNoz58Fy3KpS
	9Ve/XTgeK48UNHJagVN0aWKkALdV5QlaRnocBrHYsNBLJ9v47pdjKuhm51C3/qCJiHNSNkLmF7ldO
	kVbKNJi+Ji3ZZvps/Foo+xRt6z6FcOPo7e0/fmn6v3DNSskZqiTxRi4es9dBPHHkgHoRVjOaKNnxs
	v9tz3Odc7lJmkycKQDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESH-0000000DvJ8-1ehe;
	Fri, 11 Apr 2025 13:30:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EF8-0000000DsdN-3UWw
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 13:16:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22409077c06so27435495ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377386; x=1744982186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz09ttaY9JsJuScjIjTX5PLx95DbvCz1+uszRy+OQ8A=;
        b=pA+2kzfW1+7G6HJfJaVwKTCQulEr08Sw5ID2KvHFXlqklHNJb44jStE/Pi3wukqWtk
         RbYLqnFqJc7WGNv+AHEst2/Dt5ZqYu1LdgR4zLEy0N2sZ5RzVM1LaoEd9icnpSb8/f2H
         9j+S0O/SsSNyoYzygyjSRrAT+fidybPYTTuQDTgTsBMN2zcrvVL3vQUAuIYirTNAn6SE
         iu2Q6Y9GGRL9vpI5SkUFNmn/SSX3qd7N4AbcwizGDJz4PqFDnBp9oKl6IFN0DrMlZX1u
         BCusxm6oNpu5Rmzjj7A8/aS+3NGoosggb7p7Vb1XxGaAmYQc2OMs4TrE0DjYT3fAdrUk
         l3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377386; x=1744982186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sz09ttaY9JsJuScjIjTX5PLx95DbvCz1+uszRy+OQ8A=;
        b=IY61hhILzo4oLX0EXaaW8CuYZUIB0qUmuzHK/iBttlZRpWlzslihlL+hzhierDzCvv
         sKtTCvi2v6CgDunFPdYzGHyVr1yIQZHBCjDK+RVl4nOFlm6FUfdowoChk+w97K9SMFST
         SWFjEfA2LrOdD6mdBaZDX1VdCQgCgkLPE8fNJnZEP+ccDFEtX7X6NFffKHFA/fqiWE3c
         li0TsWnkARBQf5O4VzZrTy26yk7I6j7K1+w7B9sM1nnbp8zvKGU4wzfF1InPagVLxV3E
         jvYN4fBGmAgpLWaAuGabOhklvMwYrsFyUDnnn7n7eDK3Qe5vq8YzSlRoTtsXFHZmkGgO
         NkXw==
X-Forwarded-Encrypted: i=1; AJvYcCU7KL6/I6mvjgXIpkoSMMB2HwXf8/REoqB8DDtWcsDgM2YJByiIiYI1r/6S+JYHHPoFBZONi6w4X2Us3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqakHf4SZP6lzjU+Q3tP4tsDMMVnJEc4LXbj57d9mopp6L3OIs
	PpPduXAD3sb/WKMWgxhSkn0Fb5cSCMzVIMCvQbZWHoKnle7jdQXQ/oDEOIZvpfQ=
X-Gm-Gg: ASbGnctXYcomASjZ6/WRm7CjZRw8z+BybfqlqypHs+f6dwCtPESgfPU3RyzCxc4oIuO
	JDsuLbQUpqNsouHR6LKgvVx6bCkyVEVYHfpU1xhkxqsqeNduC6T/5a8VW6Uw3X96A7+jETypguh
	rTtKBK9C/VylVz0AR3WDpOEmldszdrpoXMTL+Q0yy098PzUOrweI+CfbFrcLDgHUD0q72lycQSB
	Rx/61VVLSC79EKfoI3XYKc+n/H/wOkk7TiqIfQhHq4Ifw1/5UlXP8YbeyQhqtpCICLcLvGBhDDE
	8/Fg4YMwD6otSUyDAreM34H4zYPoZl4=
X-Google-Smtp-Source: AGHT+IEMvfP6Fh97oRNaj3GVNlhjSqFygi8X/wqAMQAzRVrntdPfe+jNArlUN0+OLtqmSujGxJFQ0A==
X-Received: by 2002:a17:902:ea05:b0:223:f7ec:f834 with SMTP id d9443c01a7336-22bea4bd7damr40806085ad.31.1744377385993;
        Fri, 11 Apr 2025 06:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:25 -0700 (PDT)
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
	spacemit@lists.linux.dev
Subject: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support for BPI-F3
Date: Fri, 11 Apr 2025 21:14:21 +0800
Message-ID: <20250411131423.3802611-8-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_061626_867408_60C4F38D 
X-CRM114-Status: GOOD (  11.07  )
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

Add a PWM-based backlight node for the Banana Pi BPI-F3 board,
using PWM14. The backlight is defined as a 'pwm-backlight' device with
brightness levels and a default brightness setting. PWM14 is assigned
a period length of 2000 nanoseconds.

This configuration was used to verify PWM driver changes, with PWM14
tested and its waveform confirmed as correct.

The node status is set to "disabled", and should be enabled when the
display driver is ready.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358e..d04b57ddeb46 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,32 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	pwm_bl: lcd_backlight {
+		compatible = "pwm-backlight";
+
+		pwms = <&pwm14 2000>;
+		brightness-levels = <
+			0   40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
+			40  40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
+			40  40  40  40  40  40  40  40  40  41  42  43  44  45  46  47
+			48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
+			64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
+			80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
+			96  97  98  99  100 101 102 103 104 105 106 107 108 109 110 111
+			112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
+			128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
+			144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
+			160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
+			176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
+			192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
+			208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
+			224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
+			240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
+		>;
+		default-brightness-level = <100>;
+		status = "disabled";
+	};
 };
 
 &uart0 {
@@ -35,3 +61,9 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pwm14 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm14_1_cfg>;
+	status = "disabled";
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
