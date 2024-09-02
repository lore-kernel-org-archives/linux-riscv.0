Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F730CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GjkqhZyOU97yBUKSBGg0NnmA8Gnu4I/2bZ5zlRLRFw=; b=NYKH+551KGS+Sz
	/LHSjGSrmW32lapmQu0H2XhvbZCAqUhvDOQwi62dMp8MkyP44it7WR6xGjAZci/g0LAA1y/5cA1Hb
	BLfn6EjW1yudgUtIN0Rt0ijjkwljNsXTxgKtNL36lpOitEhv9g55pgpbWFBp6OR9/C1aR18+ytgG0
	RvcwuxgR9jf0NwxpVImKgnLCwdBO2C4jXYLOLtd5goAjvd+LRQQOitjiQ/EESBuUMeUi9zyf/wTIV
	u+tWufRwhaXH0x84XMaDU58KGXH34VeYl/oc5lvb16SyI0O9Hrzd1+0zVVaCOKqXRXODaZPT/VC+F
	2BzANrArjejS0rpzQttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3hY-0000000DlUY-3vim;
	Mon, 02 Sep 2024 09:50:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl3gb-0000000DlEV-3QEF
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 09:49:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so17090865e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270564; x=1725875364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZJOnRKxxutEChlIW+5PAtmNmotUPz7eaFOc9n7zpMA=;
        b=liHaCLVlT5LO0njSciMQL2394kTPaBCoRljXi0dog673yP/P/o6rEsMiiZ75o3NJzg
         7YROdORSqGthDj5iD2OlzHZZVgPi2loXscvETDzM+udofHm7wDWkAagKxQLsWc+bn1T0
         B7YPOg3H3y3NOvkrXy2xf7FNuCqd5ic/tnMS5912qdu53tIDkLOl4+mFP70aoTlPFPC/
         yzUW6w5EFHJg49SZ+28i0WfT7LR6pefWSkO3wcOCVEPf7cOwnBPvPFxBNUv6KZgKmbJQ
         u5bO3ftpccVqMaPRWBwkUTTuSqtC0mlTeV0TlARzW7oyhCkvg/Q/QIi7iwIIsHAvUe+J
         Oilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270564; x=1725875364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZJOnRKxxutEChlIW+5PAtmNmotUPz7eaFOc9n7zpMA=;
        b=Y5UmzUqZXnBzb63fP6b11xyaL7AyPXcA/ML/AxlFVTuLo8LVpqqvbLki2kFw67RNQW
         SN9I0QInmcD3IpbIw4N/Ew6PO6ANxS0aYEnt4B5rBFoG9fi68Ye8xiur+MvNSnTx8rUP
         pCfVc/llBj4MC94H0TRazKo0/+LaMoJf2R9oqLDKP4Paob74wiDVUgZdPacARtciUoWy
         ckvqWCq3t5cvgU23qjQ8oCMDiwcCW7Qsh8U82syUlOk5xsrpvdO7qvcy7KVs3R7/HGxH
         8FKQSTZWm1wNqRXz6BeulolK8oNsf2QV1M1PeRA8DkPtot+uFjpMd82uwYaxC9aUQ3Gc
         NKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqIe7ehnu5QdN9mEYtcoBFilcwsFqxr7wDPYmfqI4D1biMjJTSeTBwwyhtP6/j0B7cXsqVwuWTWsPCpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCYSaY4rkfSPFDkmWH07yTkficmgy7AJWDTgX6jiv+CQ7vVGyM
	+32SKOLFvOUB6l//gixNi14XzJM7xUzzpQsFzg7tvSk6HAiMgeOmpyfxvdiMUsg=
X-Google-Smtp-Source: AGHT+IFPE9DrSMLqeufhX66yLGT0OKavBe2zcsQBz4ANdf9tEN6d/UmYFJCTb/y4f/xkAno+0UHlVA==
X-Received: by 2002:a05:600c:1548:b0:426:59d3:8cae with SMTP id 5b1f17b1804b1-42bb01b9302mr119554325e9.13.1725270563591;
        Mon, 02 Sep 2024 02:49:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df795asm131691865e9.21.2024.09.02.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:49:23 -0700 (PDT)
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
Subject: Re: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
Date: Mon,  2 Sep 2024 11:49:21 +0200
Message-ID: <172527055993.21602.6768562114748623429.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org> <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_024925_885297_F5520847 
X-CRM114-Status: UNSURE (   8.64  )
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


On Wed, 28 Aug 2024 11:35:59 +0200, Krzysztof Kozlowski wrote:
> The core schema in dtschema already strictly defines contents of nodes
> with "gpio-hog" property (with additionalProperties: false), thus the
> only thing device schema should do is: define "type: object" and
> required "gpio-hog".  Make the code a bit simpler by removing redundant
> parts.
> 
> 
> [...]

Applied, thanks!

[3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
      commit: 98db29d1b4b7b1fe9b54d11e66a396fc37a73c57

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
