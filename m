Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE05C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIm8wmUxuDqQICscwJ7rDVu5GRiZALz1xlrqhiQlzh8=; b=NgTAa1Hvsc0AqR
	YrSiUrlTiYRqngSMIVUolJD8tapmOf//bEQS7BnZisL9kEgghADLVvol7M2U6Bvvtn9lFJy88swd3
	YI80nEdvfOBjkCekkTe/Dtc/dLPLpg61blaRLzdvdiZCiBUP6bVxvy76ygc9W9GXlg5DyKRAFBvAI
	96jforfkUqfSAsXXCLUPw0BweeMX115wQbLfqmFFjyd3BTAEgirGBrSEEQSe1NLBKYG7pqDnAM4iV
	K5g+X1CnJaykkO6Ypgc4wvR4Wo8YPFeHZ+OIIGLKJlTdfZEz8xPBMd7mGsYyQgbfvhdLdPwFZVh3t
	Xw5f796csnocBBPEzCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCi8f-003q3O-1U;
	Fri, 23 Jun 2023 14:51:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCi8d-003pzo-1H
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 14:51:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-311275efaf8so720025f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687531909; x=1690123909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhZSgj6bpUo/705/plmFjcm6PUsGWACkSEON4vQAII4=;
        b=rn1fual0Mz6TDpK+3vlaxFQtzuoeKXztrBpXY3wjAh+sHDrQ8xPI9QfS6voemk3Fwl
         UVU6yV0ZpCpr9TNFQ/C/lP+5MmCA1skGpE8lBwZBL2j5DjHT1HeWimUwNJms5Xq6ANwL
         9mKmwahi7YMaZx2M9bzmyfVC6mUn5rYhXZOK1w7Y+rLJeLCP+z7wuc5pnlGzfRaBHsm7
         0ILKr9qaBUsyt/oSK22ey8RzopMtW3qzv6epOhdrhDOYf0RZVivhERgl4M59mnD2LOHq
         iFv5g79lruagIKsDPvgvB+FqB+IDV+accT0vzfHAv+ieZoE93h+ze76L3t7eN7MII+JC
         p6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531909; x=1690123909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhZSgj6bpUo/705/plmFjcm6PUsGWACkSEON4vQAII4=;
        b=bA/nsXmnPzyFPtBPQQhXm9itOKEzYozuLAamCtgmOSflgxBueu/klo0ZMgd5q5L5jU
         iikqQf1qK8nNhoF05UUNBcz/CqY+m5deMSlyDMYQ5G8KhFgp4LmTD/HEaPt724ZCoruU
         v68o82HeenHB/Q5XTTcQozFtyZgRiogmhlgKACMcvcRd9vNxFyqgWLxZ4VR921QjmCNp
         v6gGBX28PQe/t5T8GA1mRV0fQzgbVbI5WJijKq1Fk8uENhmmXsJVYjZbX/kcSoVk9OZy
         7LZf2p80tpIme7GnSDvB+edCTmOp2FwxNKvQbGlVJBDhkciXq3x0cr3dIIMU7t+D981M
         /8EA==
X-Gm-Message-State: AC+VfDzoHUdvG9Db7cxf1rAt7KaQyLdd1r1H5woMi1MYDAMkkn9A5g4Z
	vIMlcQhcuFRt+spAQhXlKtYDsbjaERI=
X-Google-Smtp-Source: ACHHUZ5B/eh6bQ1Zrp3umUoe7CU0DZsC4zBzCEUGrPSKaPyNWIHXvBnlhS7B3OlFNJbNgcGbQ1Ol0w==
X-Received: by 2002:adf:fc47:0:b0:30f:ca87:8e09 with SMTP id e7-20020adffc47000000b0030fca878e09mr3818910wrs.30.1687531909041;
        Fri, 23 Jun 2023 07:51:49 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d4283000000b00312780bedc3sm9691276wrq.56.2023.06.23.07.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:51:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 0/2] Microchip Soft IP corePWM driver
Date: Fri, 23 Jun 2023 16:51:32 +0200
Message-ID: <168753171968.1191890.12812740879836968278.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230518-reactive-nursing-23b7fe093048@wendy>
References: <20230518-reactive-nursing-23b7fe093048@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_075151_430502_D6546427 
X-CRM114-Status: UNSURE (   7.74  )
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


On Thu, 18 May 2023 13:29:19 +0100, Conor Dooley wrote:
> Another version, although a lot smaller of a range-diff than previously!
> All you get this time is the one change requested by Uwe on v17, along
> with a rebase on -rc1.
> 
> Thanks,
> Conor.
> 
> [...]

Applied, thanks!

[1/2] pwm: add microchip soft ip corePWM driver
      commit: 2bf7ecf7b4fffd87d8eb5c072395239d6ff54728
[2/2] MAINTAINERS: add pwm to PolarFire SoC entry
      commit: de0bb6a8883342c19a5d20f28d5430169f87373e

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
