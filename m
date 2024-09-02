Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC9DCA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/5IG1xKPIfNKutsUyYhg45bdoHi4JPgsGpfcicFv/M=; b=1c/Y8PyhrGHNFq
	pho/KUGP2lYEcB4p27DS6DfHsyO2WE4Mg+0F7nVVFpd+H7vXqJWmpWvKm9IMwMEzRTEKKhId6utWD
	0X8UK1PXj/LVifbBoqXA1Wm2+tOvZaB8AdpxsLtEiUldgCjNNLcU8YnZXRygUytzYyhsgXH3qTJHF
	ZhUnN2kcKftLUSgkO+KSsKXeLV4VOxevd5xQkhRoERJD8/4ZPBYk4GD+RTIQzzlc9QDQenu4FPjYY
	sjaAraSEws3rNRULkZcZyztcuGwHf+N3WTXzSMQDLohzhbienfTT1COSQbxoP0RDW7MIo26y+dQC7
	eVrRixLlrVlqvuu1gNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3hY-0000000DlUD-0JBJ;
	Mon, 02 Sep 2024 09:50:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3fo-0000000Dl26-2saP
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 09:48:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so17755335e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270515; x=1725875315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbxcEkt76T9GZt/fg4Jcw8wx9AJnOQd77mqSZSN+ck4=;
        b=hyOLRWfVeGCcAECxBhJbUvbQfBcwM0gALzgLoVAyFfezq44dajHBWSoI7ZbhRt4sui
         Omf3+zNa8JNdcPmTt8bmdNm8PkZf4qKkA4djdcTgjWCVVWQTdL70vMylO91oOj61zpMn
         He/sk36dnXZ/ajgTLjy2NixgWpTD3Y4tkylHI9vzDYmZoKONenNdr13LMt3fs4Q3aMvx
         b5zvWK4KofT8Giin9SkF6TfCl+B/dsxNhFf6MPL9bT1KNWTmFGoB6CqaAytvT/esbrr9
         1Tx1Vi7ikHzMST4jNZepBGl6YEHslwrIXRZZBM7NXpFldswdDaQXLRihfsvz+wC5liCh
         DtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270515; x=1725875315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbxcEkt76T9GZt/fg4Jcw8wx9AJnOQd77mqSZSN+ck4=;
        b=SXJBRfNn1u+8HT9ur8CdnK3f/HC7UdyjxQk37p3VBMc2TPF0rqaemlTVQvBGk5r7fE
         eFe9+FWsolI8M3NUO2mmca8dGuCY0qLnqFkVi4KAQbRPwV+BpwC22VgrMaqx2ZE8+4o2
         QP3k5wU68iZevDDqMLJKFYhLv5MlGCFgX/+ORAPegaC5Vh8AgJH/BxIeT9GjtM9CjR2x
         uzWO3rXsUd/C1rvIPh1utpR0j6JAnO1OVaN1Dh9kWQTzTpAShkvubnOuexyfEw6ZzOu6
         SZLYyu7omS50axK6gjU5rTK9VQHYxNMB+0Bxk2CtvFD3OqAXOdsNuGQPE5VrpMrmU5nU
         kwYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxZ0E+28SHh96tHYIhb4b3oRMPyOVXO27fJ+/65KsHzJ8Gwd8gRZPgU//i+IC6y9HepcKieX9UURWzjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye3xpRZ7yw5ifWDaJEjIrkQMj29Mbl2olzYl9+9ZtWi/R7M+Vy
	e/usOf9prkgg7WOsrNRT4Hr77K0T5ONKDEApO/Jh8LEn1Ifa3yqeaELlWZCSyYI=
X-Google-Smtp-Source: AGHT+IF7hvbwuW4A6Gp8/WmsXKfPAcTMn7Cze0fDD5ugsq9mnAbtwMteHUBdg1kKX+fyaVbQTLE9JQ==
X-Received: by 2002:a05:600c:4505:b0:426:5c81:2538 with SMTP id 5b1f17b1804b1-42bb01b92e0mr100921455e9.14.1725270514148;
        Mon, 02 Sep 2024 02:48:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba7f9f94sm67701665e9.0.2024.09.02.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:48:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
Date: Mon,  2 Sep 2024 11:48:32 +0200
Message-ID: <172527050971.21449.969240784108554117.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_024836_748077_5C9ACD3A 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 28 Aug 2024 11:35:57 +0200, Krzysztof Kozlowski wrote:
> GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> properties would be allowed.
> 
> 

Applied, thanks!

[1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
      commit: 6a9f2c1b1cbbcd49a1ccf18771e68f7cf52709ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
