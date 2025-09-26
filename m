Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB3BCAC5B9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHVji7kqRR4ZxNW1se0DxcvaV1XWnwSCWDTMRVhsf6M=; b=l4baYzT/RgJK3v
	kLXK+evvW0kIrkEnJethum1eOW2vIi0f3VbgivLlub8oLQkKZHLNYCQpuyIgRUtpd58ZibFgfntC1
	OIyPyU10x1YO20z3/ff90dsFbOcy4VfbkB/eyfkFgc6gILsIqZQwE8pxqmziPyyxqB0+YEwtNrZvQ
	kv13mhobXh8UIAuC4WIV4uJsgGewBkS1h1dMXFXP1SS7lt3kVTfx/Wq8wMfOjGNXkqOzm/rPKIeRK
	HvnpAWzYNggOjMgN8/meXT0CHmi+aFnubGG0heKKDZZeELlEtNoNJmPgO0CTPQ7K0JsdCa53BPt0M
	H60FhPffwQL2FchD/+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Cq-00000000B17-3aez;
	Fri, 26 Sep 2025 09:57:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Co-00000000Ayv-09DB
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 09:57:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e425de753so1212845e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Sep 2025 02:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758880652; x=1759485452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Kxy+zDkcHliCNrZ/JPAcR9GylbEx4LYmoR1pgjRV4E=;
        b=cPvW2RZs1hCDPO0XV3lyEij9/+HlbWvQUlWo6cGU8PDommyzqOIEaZ659ASYC2PaVi
         drBFhcHKsoBZp7eJAQ1cLAQRpY68G9rnZTca1xGyXhOamOATuFW+w+9Qc6kOPnmZXHNP
         6Jw6zujK5zS9canPq15auC04m05NyuG2SEcLyRZ0umaU9yWmbgw8GTySPyaVOUvl4ma2
         9KQye///7h7KtOv+4IV0glTziXv04OPckMky9579JfN1ZjmVDo4XhoeTXdOguWz0zJDy
         MguWGWY0aSSQqEZOUkRitwiu8y/LaqwPFXEnXEz+K24p2oYlyGGoPcoMJZfbNW7kgIOJ
         9Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758880652; x=1759485452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Kxy+zDkcHliCNrZ/JPAcR9GylbEx4LYmoR1pgjRV4E=;
        b=lbR41Q7sR49urEPChW+sT/QMJca76J3f0TX52I25SS1PXJJyoWIgHc8jPV4W1bOt5H
         /nfiggfh1kawPTORAAqqDO2AO/QvmL4uDcWCXbuIub7C8DO/1XKTiM4ABW5uiSnHX3W9
         ulFrySeTr0oRFOpmASrjUqsM12RBGV0iv5TiNJlwcJfg0Y74o/sH2pyzcdMvQ2qf27Dv
         8XfYWoxJx/fn4udKKamzQ1zV+Oi5MBFxD4v5S8XyG67Qi9cUgr3HJ1eife6P2sRO9w7h
         8VUop8VNZ8DucXDsnSlk1gCVTCyGP/JChW7+NunZ57RFVAEB6+zNY7giRTzZIqda3NCc
         DeOw==
X-Forwarded-Encrypted: i=1; AJvYcCXc/WThyiEjD3xIRVZ6EOhIOgqEWtDj6r3PRZUos8RF5P+tnL61nKDzpWf/8efV9q0YSGlQavAlRRHoKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw45pnhP92jA1418lgo0h0WOjcFj1cOd9h556ttMhGDJGk7GNLS
	TuqBOjsCai3WjXY5kp/cXYeID7VPo8We1fAKjGuVUk6Y+e/AIU+OporICQBzz+6rzfeUQPIHpqD
	lakOPUE8=
X-Gm-Gg: ASbGnct7u8DBpCHM0fOyWDz2f98QPaAj31mE7ksk233wH5WLBlPTT0/7LwujOpQCO2T
	bLIzsauaaBndpsnU8KzhKkfNYCEOOq5R6YNXssWrz4JCHFoOCny9TmIaMQ6VCm1m40iIOyTms8E
	nAdQwKsLH1NncI1gpr6GNfwsKdJtXcxjjng2ijQsCnH5WcAfOeEi/gAUOnqn8c3HJa65aymDgdb
	W5IKZQ4k4zMEp8Y43R+hfTYz+i/EqUKU0EEsaXBcWljSChRFSk8Q4uIFvhkB4WmIR1i9sHS4Mf3
	X1fM9UEl6BnWBjj2KZVZtRhmBDQeDhTXB+OitwqJ2Jw1JHCtNvvCPXLEu12ak4Emil783tfCKlJ
	77quh+xA32sJhGg5jfLAG0gA=
X-Google-Smtp-Source: AGHT+IE/q7gcEasaydfPlSh1kSSOSBJAZe/1ZBQmjjrYMZ94FaitrgjVEefEJEXUDsJu0At0EET9aA==
X-Received: by 2002:a05:600c:1c92:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46e3dad3310mr19221425e9.17.1758880651763;
        Fri, 26 Sep 2025 02:57:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ab15:a65:aecd:6def])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e34074983sm66168915e9.10.2025.09.26.02.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 02:57:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril.Jean@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: mpfs: fix setting gpio direction to output
Date: Fri, 26 Sep 2025 11:57:30 +0200
Message-ID: <175888059620.38209.6546087887696517521.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925-boogieman-carrot-82989ff75d10@spud>
References: <20250925-boogieman-carrot-82989ff75d10@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_025734_323150_C4D0BCB1 
X-CRM114-Status: GOOD (  13.73  )
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


On Thu, 25 Sep 2025 16:39:18 +0100, Conor Dooley wrote:
> mpfs_gpio_direction_output() actually sets the line to input mode.
> Use the correct register settings for output mode so that this function
> actually works as intended.
> 
> This was a copy-paste mistake made when converting to regmap during the
> driver submission process. It went unnoticed because my test for output
> mode is toggling LEDs on an Icicle kit which functions with the
> incorrect code. The internal reporter has yet to test the patch, but on
> their system the incorrect setting may be the reason for failures to
> drive the GPIO lines on the BeagleV-fire board.
> 
> [...]

I'm about to send my last PR with fixes for v6.17 and this hasn't been
in next even for a day so let me queue this for v6.18 and it will get
backported once it's upstream next week.

[1/1] gpio: mpfs: fix setting gpio direction to output
      https://git.kernel.org/brgl/linux/c/bc061143637532c08d9fc657eec93fdc2588068e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
