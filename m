Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34754CEE327
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tp0wnrTf9plP2KWbLIZYvR/L2qXEXwv72AIkX0mI0EI=; b=SEwG0PCOqtg6ce
	IH8Y6hcGTBnKW6JKw7HTewWG6ILb3/JDbj52kZXJdgl9tJp5daQWxJGQD7HieEvcHj8q0+GxEscy3
	1C6b5gKHPqjbOyu126q9uG+rjxirbyoHZNU0PKwVBnFBoNnVFtj5fxlxnHOotWhwO0/f06knk32md
	XIajSh4oIlKjFxGQc9anVvgkrztM0dX6tJAtgo8XwEtGlKb6yMonXI269JM43bUT4c1O6OPo33ehP
	tjidvtcsSw2VZi2VPO3ptRcbCvr0BybylFmzCdt2tITt4WxUGJuW0yZJvxmxIfrvASrWtIzhUmIt6
	ZpqsXxH24M/kKaaBXz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLONZ-00000000hSL-2Dix;
	Tue, 18 Nov 2025 16:16:29 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLONW-00000000hRc-3d6s
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 16:16:28 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6A1FE3FB6A
	for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763482582;
	bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NA23H0BRIHHg4VdBucuTrC+dBTTq9NQRQotNCm44yEeHuwXYI1R86DbMXnuG6/I0f
	 w5CedOqT7oWnsT8BzRV/eV+MTnkdEeFWteaDqsMCSKkTVd8sR+MlA4riZgJYjPnj4b
	 8zDxnMpYldgCkidZsOqBuxWNra+GHso6H6QjsgoErt5PFlbUuezGCVUDsb2XcSjajZ
	 fELUsraU4iWMyy0I6/zY6v2rHGi8CsloAzSBuyx2mlyqJmOqvzoCjMCwoJIGq8ssUP
	 27pX6wZL91yj3dcLyk/S3FIXh/AE12+TJUKB3F09GYDBk400+ZPqn8MN1VNqQxvrfL
	 xqDkoGPjLnrGt6cqobEdXjlAyL6NttDfRP1UtksjM2J2qHVxGbiDbpqYwIZuyge1cn
	 thcXSnOqtSIrFZ1dybbZZpZc2BPc6ehTUvZtG+kr4FTlv2G7XcRdnvLTNJCpJ2u3sx
	 PVoFKPq1kAnfs76dCYE5Q9H9GSjme1u4llmOautmshzZFw7A5reUT2XvI9/UvsK7MW
	 cZqvu8Rp5dxSFa/HscRzhJjgbft2ut+Nwuc5MEH/LN+8ObSbWT4L5qfK08OG9/dKHR
	 BuTWEueC+Teud0k+aTC+7KkuWCF0UsJlo5ffrv9EOQm5OBHgEAH2xa4m0p1tyl6MfP
	 KmIRj5xIKgEIHNj4dIJUAmEU=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b70b2a89c22so554752666b.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 08:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482582; x=1764087382;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIyOErqpwna01AMHHTOqB9yVf2/6iPsT5MoLCulL3dY=;
        b=R85Tp5p+t0FZ0lfbxvBA+0g7BDOgPJdjrpdtGa6PgcWTY1Pw0DvJLwcm9bhA/6vrZP
         iqMZ1Fu3dq4gSZy3fbcKJB4/wG3wsCj1gbbJLWyj7ylertWlyMr3Vb6G2YKHozcJT4SH
         Gpx9JQSqCVKo91wCUZhQQcChPtWW6UrDgctieoDnJqT/xLmasiIiqC9KhpF/DEifu6z7
         dfhFn8wI/Tny1C2OVpLacG8LZ6y4IGsSBJ4pwEcHCVOc3rRehKcjJcxWg2wu6Un6+C2C
         Sr582kYBs3c1oK076/p+XN3QUIbgALfPLvf5+mWEBi6c1fBZe0GLr9z2jLvvAC5Z/BpZ
         Bfrw==
X-Forwarded-Encrypted: i=1; AJvYcCWjk6MiR2p7JilJpBoN9Rc/mBPGl1Dsp9JQ0CWhk2Ssngu9Tz16mDpnlK4CQLIB6xi/kqpuZQiBCz8ufQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRflXgQaqzJegsp7lPuYBmvN6fkitI3bxAzRFG8cYOhQB9FUEJ
	irol6nAOo71Kql0ZgHRg5W71yH3afKqXjbTFZ0moUtaGbNu3gJdhtIWKdPJgytF9pCTiUs4nOy2
	REDDbpB8CkYphvkTDfPrcR19DCVg5JuBPgDsml+dIi1NnNWIKt3rDq8ODqca8gHQ8q3TES3/77N
	/awSvEabiGoqXEnHu+cncAuTogu7DXwILg8fkWttFOKCPQUWjRplAewIeQehLJ
X-Gm-Gg: ASbGncvltQ2cO7TKTy6f6IU/aJVsGd9fnt242qOz5TVf7cWHDsqHghO7F47H4U/lFmJ
	JGqeEp3K37IQsMHHoO5gTR4xZuz+OcIZSCs/IGTOCz5ymADrCkyyoWlExOQuNuqnk0RAXFkBHu+
	5xRybnwUlkL4Sh1FfDw3yVOPq4y2kIXfSTUyiWPJ8BcsH2ORNyFovrgw==
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id a640c23a62f3a-b76346ef9cemr3649466b.4.1763482581772;
        Tue, 18 Nov 2025 08:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBn7K4EsQ1/VADA/bQzwH86ZFXAYwYh29/z7evvXjdMBNS0csaU/n5+W/6S5nKTtDNtgN/9vlYqKGmpyFhzys=
X-Received: by 2002:a17:906:c10a:b0:b61:e088:b560 with SMTP id
 a640c23a62f3a-b76346ef9cemr3644766b.4.1763482581386; Tue, 18 Nov 2025
 08:16:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 08:16:20 -0800
MIME-Version: 1.0
In-Reply-To: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com> <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Tue, 18 Nov 2025 08:16:20 -0800
X-Gm-Features: AWmQ_blHnUdEuO_Xk-xLGxCSBj91WsT4QrqSPcs0Pl7bY6VmfVJn7i7Sg1yCEAQ
Message-ID: <CAJM55Z9Ep6xAR_TP+dCrSqWWyk8n=31-W3H4Ad6BkWUAWsbObg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
To: Alex Elder <elder@riscstar.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
	linux-rtc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_081627_230842_F1BFB144 
X-CRM114-Status: GOOD (  11.26  )
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

Quoting Troy Mitchell (2025-11-18 07:08:08)
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/mfd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
>         depends on I2C
>         select I2C_K1
>         select MFD_SIMPLE_MFD_I2C
> +       default ARCH_SPACEMIT

Can this not be default m if ARCH_SPACEMIT?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
