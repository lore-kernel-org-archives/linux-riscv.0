Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D13C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 05:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJsRnSKelLOC8XBz+qVJXIu25H9aj6/dwbrAb5YWzqs=; b=kIOdMYaET3WEjk
	IUFNrJwNoLYVu7BqH7bDCGw74CCtNjew/xL97lQIVSFrzogsRvJEeoFPJ/pJ/prXtD5ZW510dpna0
	1gieTRvS090WWYYkLpd9ikJTnsoyK+BiyovgNMyRZJWHl8DD43CubhYWaW6ehXo6Rif9q+kaxivCC
	A4WlDDkKP6ZWSEzODo7mFXw0K9ReP/RnHtt5D4TbHGzYd33z5SJcfdpDRfo93ZVcTnL2/m0lpu7Em
	Ivz07r86Ol/tfCif5gbj1xZ6oh6KZn1jg0Gi0KpX+jUe7JLXVsorEydEmwOpJsK5wLkIdybk/IxAC
	cOCUul1fRCeEUUFskZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA12R-000000056SV-267i;
	Thu, 23 May 2024 05:30:51 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA12L-000000056Rl-1l4e;
	Thu, 23 May 2024 05:30:47 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-df4e503983fso1482348276.2;
        Wed, 22 May 2024 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716442243; x=1717047043; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jeP04vuCdyKqyKQziTj/qCMLaFBjvVxkxdMxPwwYkVA=;
        b=d6xKusqIf2eJbKgO33z0xq3GhIcVD0UkXGIhWQgkBmrbQcvNuXqvNftcUKdB1/Vixs
         6SolhI6hn9vFEhqQwtzfHXfUKvVEXLEBMSb7OLNeg74RE1AFY1CqnC0/8O494JWJqa2f
         /98VYEAfxM2ku1HFv7eh+bXxfQh9KQD14RyMGNfAMCC04xkIt5ExLayMzDsy/JibzzyE
         fL5gP0XFQhV8UBy7mqPcEgc09My2Ohnm2jjFa7GpHI11COhKpgYfVT/VV1ceZ8Iiz7tS
         zbLR4rP04CDAlQTFxBxZ6OR2u2OpJMvVv3IuvNOFGqdrWHr4Ks7OFC1U5uhwarLct5Ja
         m8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716442243; x=1717047043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeP04vuCdyKqyKQziTj/qCMLaFBjvVxkxdMxPwwYkVA=;
        b=kTe93/a5Xnj8CfCYWB+xcCpdvZfgcfjp9nqnq5815ruowRqd3DBYE0kmdL5wuwMPcB
         4gT7taEZZdQNeGeCr9V4OF/t//HXttWlfR5C2UjStTp7FdH40whcJGjk+fdFqFAOa9kS
         a1Z1TDb86voQbWDWXX9jC+5hvVlH32OBX3XWDm5kkwGmrtxAKWE3tmfJyfmQdkMQLJu8
         vTDTuTx5vyqXWItF2wu3BWsewRGpj4j8xxcEVWtBGEBY+JP+VxvxdW600Mb7zSkAwvdV
         NqRiQK9GVNXl7AVCSnuyhaLAU0Leo1BCIGmpDe421JhQNC+QaHh585veBPi05r3zKWiZ
         Tfnw==
X-Forwarded-Encrypted: i=1; AJvYcCVt3kke+QMJiEoGi8bu1yomLb3Ioj/y1i7fu7uBHYd47Iccnuv/aKO3mV2J8V7dAPQ9WM2NfJRKCkCuIhKkegxUATyqJZTaXRAZKAnFYr8AMH/6W6B5us0TT3jolK4d0EyuAyMi4qh4yzQx0Heu3h6s+R3BAyY=
X-Gm-Message-State: AOJu0YyA7dAeiUvZziJFFy9fOhvEpX2iGJ8Qb1qaNr6NxUlE36Ow84O8
	HqrKzW75EMv2FiEKhG8i0/nBQGymCKTPiEOsq4YWxLSDboY977A9+kSm8T+fVBzppqlxzJv9FLA
	b8ku6P58lICNc74WBDH3OvcD0+n8=
X-Google-Smtp-Source: AGHT+IFwNmf9mikTsRKBvOMdbJUka1g4+AANDd7/jGjpPbZNh3NDCKIMRlgEx8AomEr4C5opC2T3EcB9FDNaZkHjtF8=
X-Received: by 2002:a25:a347:0:b0:de5:5510:1d4a with SMTP id
 3f1490d57ef6-df4e0be4b93mr3401384276.34.1716442243001; Wed, 22 May 2024
 22:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
 <Zk6yK3U9tgxOxcBb@titan>
In-Reply-To: <Zk6yK3U9tgxOxcBb@titan>
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Thu, 23 May 2024 14:30:32 +0900
Message-ID: <CAG40kxFxE_Oj+9aCzGku0a3KFHpuW8ai=gEkV9M8==5gwmjdEA@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
To: John Watts <contact@jookia.org>
Cc: privatesub2@gmail.com, aou@eecs.berkeley.edu, bigunclemax@gmail.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, fusibrandon13@gmail.com, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, mkl@pengutronix.de, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	samuel@sholland.org, ukleinek@kernel.org, wens@csie.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_223045_485424_D7E8563E 
X-CRM114-Status: UNSURE (   7.06  )
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

Hello John,

Your method is quite impressive and challenging.

I think PWM is not only for LCD backlighting, but also for signal generation.
For instance, imagine an application software that sends a stream to
one PWM channel to synthesize sound by changing its period (plays a
square wave).
By your method, if the other PWM channel is used for LCD backlighting,
it may flicker repeatedly on DIV_M changes.
(Or simply both channels for streo sound synthesize, you may hear lots
of pop noise)

It means the setting of one channel can affect the other, which users
may not anticipate.

Best regards,
kikuchan.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
