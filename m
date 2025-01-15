Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D31C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 06:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o26AvdLGizwjUZPuMq6mZ2TdruUVGZO0G5woG2TDkFk=; b=sS64s3o2SbaBWU
	pSk4L6zD+dxyp+KQO91goepd2c09HjuCvSmQx3glruwk1KCbCpELV6s5STuynQl/3O1M5mR9RWGjn
	JcZIX3MSJEI2zROdCCRFfSXPzn3V8lBFMnO6OWtoIlv9fFKBwLmwtVrgi21NeGeWIBc4WE5N4Gsdr
	VeY43syhQsQ9SJokbe5d/Yjs61peUYfDmYa8naOaJllQIWGZdlWCdlCC1rB9VDMeHJN/AkmYaygmm
	23rcy9/1NkPPfvZvzYJQF9XcV6hQd9KI5l87naPiIb8muqKntl3j9VRSZ3QzsZwMnrKG6+M2mXcHY
	SFzAu6DfcGTmW94UfjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwyn-0000000AoMF-1s3b;
	Wed, 15 Jan 2025 06:34:17 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwyl-0000000AoLB-0Ekn
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 06:34:16 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3ebc678b5c9so3456374b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 22:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736922854; x=1737527654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsPuBRXPrRe+Bt0PCOpU8wnomNv8x15d/msImOZKwTk=;
        b=ja1rUQXgecrdR46LjKhzDzC9uda1WXUcPBW/vBIh7UKy3EOBQo0Oe8IT+4jLrsUMh9
         XUMRIdGU3x5CTCQOT3Yeonom+sDpIMUPT4+ptk0h6cF4RdQgB4aHrxH/sfccbYONm6eq
         MmmkQ5kLXjGZO6BabNsa+sNnMY8GumlrWw4HTLNXMpeR206afWTdqN2Cj3MWNttXgOxi
         m1fjetU6jvwmh0id3RB1umo0IKHSgduoazCJ+Y8SWSPDTA+QKWm1OxcfNtFQA/KeDKTT
         C/kyLAvWfDPJ3aaBXzVwLr+Eqx+jyDpk+tSuNrBZjZQP8Kj83ueCLtjJQ0DSp3KM1rmN
         qM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736922854; x=1737527654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsPuBRXPrRe+Bt0PCOpU8wnomNv8x15d/msImOZKwTk=;
        b=I/LnVKCfYG9oTHzJh7uVhREqnlMJGckyZQWjAP8GvPgw76ekoz/IrLq527cTxYA24j
         A8LUC5p9hgU2XGFtKpG8Ls3KuUd1aKE80D2C8i3KrD/gmFYLZNDiwa23PL4cXGZ8gCi1
         eojNmweH4lOH/7G5OuLvTPMUquVplcAgDKzwC6XPBdI4roVkV5AyimyjRZGKp0vIZFkv
         jeZDHDos5x8gr5DxT8vKpSQIDgQQPPsmxaJNiVfWmXb4W0Tm3CrTvSwz7vbElikmwdwg
         8V4/wzAh5RGwbBnwbOiMT983ecXKZYNkjYMvPHI5sfS6/CsOqGD8HYHm8vo+X9ow2uyU
         lbfg==
X-Forwarded-Encrypted: i=1; AJvYcCWnUWiqdo2RNA0muev/bB8SjeDxPI6MQRqn4TxgzlyU2C5rjNHC/LrzEqMF/KJtAIFSkgDjcWMB3z0bvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGuvEut2GVZJNLdSbvy0zHL1eWHFd4+lYC7VbYA4LvT/lKL1tr
	ghCfVBx1JuuefNjWspxdCyV6pTTjv5TBebSgkulthjYpPonifFvT
X-Gm-Gg: ASbGnctgK3vNp9PURIWcWv+7WvWUgBj8Hgs9Ab+dvguDUblGvqOoPWI11kv/SMiXuZ/
	gyeoItJU9j4/Mfc8h5zvmMaZQdv7BbcCLcm0l4jz63v84m9MSF0F0Li/CMVeTd6YZbaeTgbHatz
	syF4pBCaxvvV9OmfkqWHxyHf9ELn0MfcWExRKaLs+mRH2WqgHDUvlApFDJFZ62hfKOEZyaxlZYc
	w+6dHbblSElCdfmZFC9/lkQUAmXuLuWgEbM4wDRKWDL9dSh0IfymAgyi69hHEhbl2o=
X-Google-Smtp-Source: AGHT+IELGwamiB2gMcY8O0oJQ90/3MS8jb/wwVW95TfJxiL1SCHLWtPN8hXbGGAxJTWF58sEAHjsPQ==
X-Received: by 2002:a05:6808:1783:b0:3eb:5562:34ba with SMTP id 5614622812f47-3ef2ecba226mr17767634b6e.25.1736922853795;
        Tue, 14 Jan 2025 22:34:13 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f037656039sm4739635b6e.17.2025.01.14.22.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:34:12 -0800 (PST)
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
	fengchun.li@sophgo.com,
	samuel.holland@sifive.com,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH v3 3/3] riscv: sophgo: dts: add msi controller for SG2042
Date: Wed, 15 Jan 2025 14:34:03 +0800
Message-Id: <cbe5711193e8d0d1966c5dce6c1f9d7c444a0d69.1736921549.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736921549.git.unicorn_wang@outlook.com>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_223415_098351_27F4FC9E 
X-CRM114-Status: UNSURE (   8.84  )
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
index e62ac51ac55a..02fbb978973c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -173,6 +173,16 @@ pllclk: clock-controller@70300100c0 {
 			#clock-cells = <1>;
 		};
 
+		msi: msi-controller@7030010300 {
+			compatible = "sophgo,sg2042-msi";
+			reg = <0x70 0x30010300 0x0 0x4>,
+			      <0x70 0x30010304 0x0 0x4>;
+			reg-names = "doorbell", "clr";
+			msi-controller;
+			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+			interrupt-parent = <&intc>;
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
