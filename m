Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97156D0D7B9
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBY94a7eUqDWVc5EoMEU10dcLd0Tji8y8XF+tR2VXdQ=; b=y76rtOugq9RAzD
	DIkW0O0rHC1lLewS1UYs4zd7a569Kq5MZ1OB73GS6/1b/1OsGcGgJa+E+QZhiTDS9BG6KQj1Ztc62
	0cpKLxM5M6zvdgSwco8nKv0/sjCZDuxv9DBdsw3tHaAMjiJUzSzeyhVfD+du/U7t+SU6fZ15YearX
	bOzUW94stmDMny9NR4Qgx0qV4RGEsWxFeGgeW/LfNc79tqccZJ8a8sESiGpWYETB+yB+Sr+fVLh2Y
	jEg2twCwO5R3QdLIqCQtHkWnvkozd6eaJ+pbtrwDKLxxPhOIrWk+UslDQtYSl5gQTKN16BWKa1+q8
	4nTJhyknYhcy+PMAvPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGzn-0000000Ggsh-0w2p;
	Fri, 11 Oct 2024 14:51:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGwU-0000000Gg3K-1l55
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 14:48:36 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 253BE40B07
	for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728658113;
	bh=iqBh7nzoh4RgidcVzY4detvGARn0I3+5VA/OmJU1Iu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=efParbGWB01VrjoKWpz/zHaR/jKQjfxq8jGGzHc+H2nPhNGpic6Xuk/vzmYkk3qJb
	 xNY0B/ytkO1bePO/rg/gtfE2+yog5n//h0QjeFgtpAovHErreu4MwlD5AyuBRQ+z6O
	 NieG3BSYGXd2+YP7b9UhC5btzNtQ75wbI8AGVPiy8nZM1HgUD1yLs+jNlOgJv+1UW+
	 wHYPU/UHRw5JsVTaR0plpXBP7+uHhMHRe3EQYFLkl17jcmr1XFRQPNEAh+cC05cB9l
	 D6dMRCveDiTdEOkAWQkFSYL8D9MCPx5Z5IKarXZ8EzudWue6ANhlm65iiWozTqEyCL
	 MDKJanLrW67WQ==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99d308c147so24975466b.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 07:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728658112; x=1729262912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqBh7nzoh4RgidcVzY4detvGARn0I3+5VA/OmJU1Iu8=;
        b=OvGmM92T40JOH9+qzbZQy6+fw64Fw07buyMTkWfeTkJVelpxKNGKevxCAQePcJ7PXY
         Eqi9hXq58zmbqwGb3GxxKhNG+PY6Swa7ElTr85hnB2bSJ37TL6r9SM5uzzl3yqAGfsm4
         3Z8Waw4d2OcXlxosadMdfY629xrUp10vC6QmL1U2Mq69rGKByoaa3ajPXtI18H6eew8I
         J7kw3cRRQc4pAoOaw4QKeIUe8XTynsKwPbOFTAUAtG/t81bByznQETmkf4IVHyc2ZQtv
         e3LKOZpEBhsqeoCm6OmVoJVIaewT2PGistTzAUA4mRx+9lndCansIGE8mYo1ZlOEcAjX
         mGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzdnxkBrgcxAXZ0REOmYldCUoazWLZn9jGA5XHXL/R5exLSU5oY77iJ6zvPbrfMu9n+nbxUgGRoN6/VA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ltL4A0aEjf4qpUHGR0vwcEIKOVhI6UQRGl9aMxnjg2mKt/S2
	7GbuDAemULzWdT7qwnTJVR/JmosrsexasxSNYsINFl9lwxX/BgeUQNXItnTJEYz62POgSOJJnCt
	vKt6uPCxfQmYuFdFlktMDcvAk+IGPePEH9Q8EJZCFGmI4kgcLus7FtzH7xeQOpsf/UwXzDz2yvc
	l0aexrbQ==
X-Received: by 2002:a17:906:dc8e:b0:a8a:6bd8:b671 with SMTP id a640c23a62f3a-a99a0eb825dmr782895866b.5.1728658112559;
        Fri, 11 Oct 2024 07:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjQsLbc6u+mCW6UAgHzZ7I5ogU9vr//qu3BpEYvisyFo1ZiWCcvFSN+KbnXtVt+gsG6NG3Rw==
X-Received: by 2002:a17:906:dc8e:b0:a8a:6bd8:b671 with SMTP id a640c23a62f3a-a99a0eb825dmr782893866b.5.1728658112081;
        Fri, 11 Oct 2024 07:48:32 -0700 (PDT)
Received: from stitch.. ([194.62.169.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99c0c89bfasm54134666b.162.2024.10.11.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 07:48:31 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
Date: Fri, 11 Oct 2024 16:48:25 +0200
Message-ID: <20241011144826.381104-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_074834_645805_A1EE9A2D 
X-CRM114-Status: GOOD (  13.25  )
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

Limit the casts to get the mux data and flags from the driver data
pointer with each pin to two inline functions as requested by Andy
during review.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 8bd40cb2f013..7474d8da32f9 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -152,6 +152,16 @@ static enum th1520_muxtype th1520_muxtype_get(const char *str)
 		(TH1520_MUX_##m0 <<  0) | (TH1520_MUX_##m1 <<  5) | (TH1520_MUX_##m2 << 10) | \
 		(TH1520_MUX_##m3 << 15) | (TH1520_MUX_##m4 << 20) | (TH1520_MUX_##m5 << 25)) }
 
+static unsigned long th1520_pad_muxdata(void *drv_data)
+{
+	return (uintptr_t)drv_data & TH1520_PAD_MUXDATA;
+}
+
+static bool th1520_pad_no_padcfg(void *drv_data)
+{
+	return (uintptr_t)drv_data & TH1520_PAD_NO_PADCFG;
+}
+
 static const struct pinctrl_pin_desc th1520_group1_pins[] = {
 	TH1520_PAD(0,  OSC_CLK_IN,    ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
 	TH1520_PAD(1,  OSC_CLK_OUT,   ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
@@ -590,7 +600,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
 	u32 value;
 	u32 arg;
 
-	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
+	if (th1520_pad_no_padcfg(desc->drv_data))
 		return -ENOTSUPP;
 
 	value = readl_relaxed(th1520_padcfg(thp, pin));
@@ -660,7 +670,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int i;
 	u16 mask, value;
 
-	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
+	if (th1520_pad_no_padcfg(desc->drv_data))
 		return -ENOTSUPP;
 
 	mask = 0;
@@ -793,12 +803,14 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
+	enum th1520_muxtype muxtype = (uintptr_t)func->data;
 
 	if (!func)
 		return -EINVAL;
+
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
-				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
-				 (uintptr_t)func->data);
+				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
+				 muxtype);
 }
 
 static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
@@ -809,7 +821,7 @@ static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
 	const struct pin_desc *desc = pin_desc_get(pctldev, offset);
 
 	return th1520_pinmux_set(thp, offset,
-				 (uintptr_t)desc->drv_data & TH1520_PAD_MUXDATA,
+				 th1520_pad_muxdata(desc->drv_data),
 				 TH1520_MUX_GPIO);
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
