Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C42EE7716B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 03:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FnkNQIbjFmjBR7N2WCBfsW9ag94FD8pSxpT5aQwSCU=; b=0RBUFWNdS8EaJH
	i+8iw9LtSDOll9tQvaZYJD/9NXHeNaecfg/w0soTxK+7v4Cox67IQW8WuZFUqEiXdPJ8129FYvfMy
	D3tg8Z8A13PXT0aywdJ+RB7lwSmJRK0M5x2KP/VBLl3NmC3alRFpj0m1RN7i0G9PvAb3nx0JqLlRg
	WTxLfKrZk/syC6Nt2cxec8EYpOOODKdW2iP0KUW8N4HDIfih6uS8XI45542RcirSTCTFImLQIE3Uw
	dDMm9EMY8i4J76ilBFrIe4dhI9bEoXW8RqSmBwN7Wf2+JDHNPZDWWUi893Km7HgOdfcF65SVXhgaU
	+OOfVBcrP+0IVd0U/J+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIftl-0000000BMlq-192l;
	Wed, 04 Dec 2024 03:17:57 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfti-0000000BMlF-1As3
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 03:17:55 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2967af48248so3471988fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 19:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733282273; x=1733887073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mixRlBZnAzl6+RGD+SnJtrTgxRDsBgCOJYnL66Xe1tk=;
        b=V+UQWigT+hkW0KyD4XXq1wUaDwLVru3UCn/MRdaFsk/6xNlOsgJLG9OEfS6W1s0R6N
         0dQLBgc46bR4k4UGaM5izPQJMCxJiJrcU7LPENQ0h4oPsBMLu57wM3DSuAMyN8XGLajw
         vL73xkD8fd+ax6IZVRVl7jvClPjfyTwx4zYyYtjXCkWG+1EHFtjMB/7F/UWF6pI0UzEE
         QAovKiAOfddqU8nisYAXKu432qEydqwIssMMToZxNCrMxvolLV6hy2bkj7JsvhWpBMxI
         bkiWGZk1V5E1nz24sh4KKveODlm010zsBwNcYh2mTxb3VadUV+jpnOoVUz97heZd37yi
         ZOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733282273; x=1733887073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mixRlBZnAzl6+RGD+SnJtrTgxRDsBgCOJYnL66Xe1tk=;
        b=wRM8kngnUwKv03tmaNqF0Ho4ZNis9VLDvwrrWTzNHVStJYejyRXShXCSnpIeWdsrTQ
         zitqbpgqiygNyRxx3NTbsJJMpCj4f5jsww/7An5/Qt6fopA22AfrUtDZQe5NMLBqaMWM
         1KQHzKNhFXJ+rSMHmJ1Ovi0OZSauf13oa7nrdkVC0bxvXMNl+1u24YY+M/0ntaVO+ELY
         Lfdscaw5WGYn5rMJ3htfvuqjWGXSzlsBFgAkHa6lEypG1Lbtd3DjpNjirc3zxYkLyh3Z
         96Scu20OE4Oq8iXJ+xZ2UC2hLgMpHVyGx0D2KLcDz11DOgjU9hMyJ3TVQZ36aiTd5Mu4
         fCxg==
X-Forwarded-Encrypted: i=1; AJvYcCU/u8eTxsQBjC/2d0Ie0/lZtzwvJZj8ZuZc6+ILHu2Z9m/NeqehJsbbYjEUXU3GTBEwudd9CALW6Fk46g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQqQ6rMLFlqzgQOB8CAZEvUXHtIgjtxnlEPMeca8YkChwaEBMu
	dWH5dzKJmyEkVBaIbarXgt5yqL+E+XZLYlSiHW4edXxtWDjsC6d+HS/zSMA47IA=
X-Gm-Gg: ASbGncv6sthjlVrTnmVYoNBj5cqZTbwbrxd6Nc7n7RYc/17I+nLe2nKXpnlDkWPpI33
	Mc72pMDp0wnwn85zKkdWUKEqrXytvnVozOf0ZbCJzHAX0OPjSO21GPJmfqRzjTfqZCGK35n4sF1
	dg/chE7AF0rRQmpYPc/feflfyDugho7YFKkwWtyOG0U4/4OG1gLiaaTbCYv+FsY7+Hya/I3Rh69
	ylkifLGytnSzHel9wZubiefA7NwOGeJKFvjlbUcLEA74H0o9qHrymZ5p9Qf
X-Google-Smtp-Source: AGHT+IGAAZq0BZqx+M5fXCuGO93303qiSaJYO7mY7gecCr/3SuC0Sy1KChSb3UAIulwKdXP909PnVg==
X-Received: by 2002:a05:6870:3d8d:b0:29e:3eff:dea with SMTP id 586e51a60fabf-29e9b08c0ebmr1787227fac.8.1733282273522;
        Tue, 03 Dec 2024 19:17:53 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de8f31cefsm4185404fac.2.2024.12.03.19.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:17:52 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v6 3/3] riscv: sophgo: dts: add pwm controller for SG2042 SoC
Date: Wed,  4 Dec 2024 11:17:45 +0800
Message-Id: <f40dcaa5d931a5c2e5e9dee0c602edd5f778050f.1733281657.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733281657.git.unicorn_wang@outlook.com>
References: <cover.1733281657.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_191754_318619_FF982C15 
X-CRM114-Status: UNSURE (   8.42  )
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

SG2042 has one PWM controller, which has 4 pwm output channels.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..77dd65d79946 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -165,6 +165,15 @@ port2a: gpio-controller@0 {
 			};
 		};
 
+		pwm: pwm@703000c000 {
+			compatible = "sophgo,sg2042-pwm";
+			reg = <0x70 0x3000c000 0x0 0x20>;
+			#pwm-cells = <2>;
+			clocks = <&clkgen GATE_CLK_APB_PWM>;
+			clock-names = "apb";
+			resets = <&rstgen RST_PWM>;
+		};
+
 		pllclk: clock-controller@70300100c0 {
 			compatible = "sophgo,sg2042-pll";
 			reg = <0x70 0x300100c0 0x0 0x40>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
