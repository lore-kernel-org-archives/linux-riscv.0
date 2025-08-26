Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D60CA0FEB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVbpl4A+Ge+ZQML3ghY3xm3ifGI2eD/P46aCc9TPguE=; b=yIFUbNuhJbhvig
	NYAyALuyrd3azt7ACWr2RLg43Fd8WCVle4CYXgfy1b+ODYN3iQCY33NtF6MJlqIUDIIG9v6/CPtjG
	vgVOuYSzLS/2b8bovq/RhqXfFpYtYNhBwMqeDVPAp7aOkWO3QRw1wUWN4Mi0ox2NaeHjLdfSinnet
	YfbwUiVbtRyRzioNLVfx3w6xKpt50ZVDjmvazmwb5Yk5oiwy5tKu861Xrv9Zxq7vE1ghh82EzFEPn
	5COixdcGy8UBRR9tUM36CVRapDxfAXQ8p4Ls0A5g3fC+6IneovkPVLiigTSxwbSr/RkzLWL18bEqG
	4TEctmG53hyYbrTrrWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquN3-0000000CCnt-2ftU;
	Tue, 26 Aug 2025 14:09:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqu0g-0000000C91W-1DT8
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 13:46:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso49739835e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756216009; x=1756820809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bgIZihST00M2CtyLVGqxcGCSa4PCOhuFDLrOFCRzds=;
        b=D0hdUyrWy/N8sAe6xwI/cb8zxKuIpd6sDL9TUWerTifCttPoKLFSeRZWRSMP5rpMts
         5nj1cFOTjyfH4FFt+3SjQHjatXJb4Sv6DEjofa2fnHADMwnnPvObWwjNMeHi2I0xD6Si
         nTWdOFBsjkgLn+nO2NCGqi++zvf3KBQ0YkBDmS9iQ1KDY+V2TAWFNIGGoxslov6+S29S
         u1a8ng60dX2XrLoB7rXWQ+KTqkcoWPEf7MhQSZ80n3vSWM4RaPg44V2vls+6cO19utDY
         uuFTIM7Y2rDngXf2+bVQ4szHTD1BAYScmUINNSPf8SQHFdZjKi374P3aDThe/xMmhEE5
         z3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216009; x=1756820809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bgIZihST00M2CtyLVGqxcGCSa4PCOhuFDLrOFCRzds=;
        b=BKI+1y4DGZsGPVwh8bPrK/dYeVUXSk95vda9KTtqjS0QTGXaJPD4sJWXALaIatgxNT
         my9wQnSk/9RTsRmIvjLiPCmObef5P70JNIsNP7iGl0YXwCIwbZ8JdndyhBvHCRyDe8fP
         73DaNT6OiF9ehneY7UbeK3SPuFZYGHkmuow1uqwjgkNmBc5abnHKTv75wmqvR1RZGrYG
         mqGCP8NIz5IL+FTpmDhbce7AsLU+tIKPAl5OKhozZSi1OEwnLdzd2scZSHLOcdLSB5a4
         qDM97ba1+XSVWb+IpF3K4MLDOYcsAZ9M0DxCoZTHsGJYt+n3lqc9O6yb+QZcbdPT8E8H
         7D/g==
X-Forwarded-Encrypted: i=1; AJvYcCUyo89fOWQU5g20vRb8/VhmAurw6EMSuQLUggXSC4ueZLrZLTaxaSWUfNUcTYQ6/MN84THo90wyAXg3hw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw36w51hELU/ecAbP5WHDieB09+E13m3SVM7ElcMTf/SusFJhbL
	q64ARJd2cqZZyiEsm59/UsgYy1RulSulWXVruLRtsMJbWQcNICddn6U0goMewpUfmHU=
X-Gm-Gg: ASbGncuTMDYH6UmUiCuSZ2PgQQOXtgSgtuVcfnhztGeRoDa2Tvx/tp6YWQCiH8q2zLp
	PO72RR45NSeX99QsRYhxmK/ltksPGWw6PLKxara8N4aAzw1/TQq6rytwpC4DnKDL+xtkicRr55P
	OYlhIrTvidnZP87Y2Lf0ICBqY6YBzjg0NixYCHotaz4AqU7jdwb+cnRriWEnNR4g78NEojP0GcU
	ZesRcOeWLWNGMraFYt2ppkCmxYnfQrMk+ngBQ3fV+NpDrLgNtdRZUzzBfeaRN1Tus/ODsG6wKF4
	eQL16fu3SvYTnAv75TQ/e1G2hFaimHAwHpG+zOioq9tbg6+waeIpB8lJlgcmedDajeAtZuvEnee
	zWgefQ7XucH8qptsnerGX+Qjm
X-Google-Smtp-Source: AGHT+IH/vtben+jS8p+rxXWOqr702i8ga9ZchZdA6ANpXGCersQKl3QS+kocMs00UNNWRezs+Fzb3w==
X-Received: by 2002:a05:600c:190e:b0:459:e3f8:9308 with SMTP id 5b1f17b1804b1-45b517ad4bbmr141075015e9.11.1756216008734;
        Tue, 26 Aug 2025 06:46:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm16231162f8f.47.2025.08.26.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:46:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Date: Tue, 26 Aug 2025 15:46:46 +0200
Message-ID: <175621600512.33327.13991412012918423626.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_064650_328732_D44DE1C0 
X-CRM114-Status: UNSURE (   6.69  )
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


On Thu, 21 Aug 2025 10:32:14 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Minor whitespace cleanup in example
      https://git.kernel.org/brgl/linux/c/604642fc148b5d98fbe5f55e4c2688f9ee0b5868

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
