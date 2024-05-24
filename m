Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B3EC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxBlq3AjavPdFktKF+7pctS5IC8mxjWHs+WFk90PQ8w=; b=GHdVUWAxHknIe+
	J+zve2+cs/NgDiWgkMMNU8mBWN6PLHCEG5gHvguwovSFcDMo2cu8h+kUSHuVMZCB4TSXpIQRptql3
	qMKZqMAFfIzNlxLnfSTiqu9vn9eY0tIa0S/F+0Q+uSvJQVWiQI1zra38cBGWf2UIbioDneXidevq0
	jDFwyxFPwwm9dhyzQY0Pn5Ijnd+TiMFr1i/DhdgRRMpYzN9bvnm/kQiGG1aAIpgWl4CaBD4QZ6GvX
	G/pCKgE6z/8lsahYR2HzbyaWeXAXx9v829wgqzBbkV9SfwncKchrOYnfmXtCayPhfMdg1c4sszvr2
	BYiVNjCTJLeCmcXnHIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sATAJ-00000008mbT-2LjF;
	Fri, 24 May 2024 11:32:51 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sATAF-00000008ma6-3jLv;
	Fri, 24 May 2024 11:32:49 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-df4f05f4cc8so2747576276.0;
        Fri, 24 May 2024 04:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716550361; x=1717155161; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+FdDMqfYCOb2sKqwmEoU3h3Dyjm499FpbBKjwJhpYlE=;
        b=CHVbu/5t82z3ZFsTSYSViXW7zfa4MEtUWbztQK7f8rQs6hMKFCfibFtZXXlZQPlLw+
         nHZHo/JA4GKrbViwFwxCA3n+lZdhZhiHQzTtRQObtmTpv4PjB8OhVAdO+bYVKnEuZHPt
         nwgL71UXD6jq2fTWh0aGC/Jm31oyEE7h2+sZdTjxt1QLyMhgk2V4Aca7zLYWjxkcKUdH
         zVnpxZMfwt3cwLU6AIfiOxw0AA9U3sBSFvOXL8tOBMq5GEI2LPM0vlzk5TE6zTBtwNMe
         xukMx9qaVSohgDg9iucwI3YUaWxVhNpYZnkc7MXvuXnynXQ6LRfEJ4YODjHS8EBjTdBq
         2PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716550361; x=1717155161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FdDMqfYCOb2sKqwmEoU3h3Dyjm499FpbBKjwJhpYlE=;
        b=LbbPAhsW04zT7BFNNWg355J97T/Srqewbo8UnC4n79wkyH2pmfI68jjR6pnVQyWjs1
         bxeeRPWhS+g86Wdey3iHS6dEnJKlJlj7V8AQMCKtY/3zQwO3vJD9UWfnQ+wu+atFcT/o
         kTAF+9OUINiZPFroj7lFw0XjXoWq7GQASkGJw7anmrICiZzTE6Crs/P3XAaGdMrSQje7
         X5defWmKkElg3UqJ7YdygXXZMrchElueWGRYcD5dpaHOpxq+p0ZNNEGBw5tvL560AU8p
         vANY4rBD50kZfGELR/3VbdL5is6n4GKSI/Q7SE3kHont85GXibXITyPm9zfl0mRJUXkh
         ayRA==
X-Forwarded-Encrypted: i=1; AJvYcCUxC6nLuh37SedFjwaHjozZqd4GLOyJX333lBP/mgG/HwcDVhilcxHHgd5/KofSTmsYz0IIhWPc7950eO33bl08zSz+PVTLEu7kRvO+mig6sSMyDDKUE2Q7+x8bvsGS8BaOSYPljxJVf+rG/MICG1iSpEm9FLg=
X-Gm-Message-State: AOJu0YzRYaCgx1ymtt4GyVsgP4IT1AuvSc1qTumMg1yfE4plkGdjqr3G
	dIbaQ8chPfAq1VUefX1I52ucEHU4PxPURIntBSMTv5Lkoz9CY0lTETuCkor8A3VFhqf0O8Z0mHc
	nx21Nq3pgf8N+55L1wk1k5WoXoDM=
X-Google-Smtp-Source: AGHT+IEUNT8qpSYVeFnLdK93OupqdGs3ueGj/G+IJ+fEMIu7n+LnUqnYTr2e4NhRpeaNvCqdhdjlRj2DJtbwV9uDHPI=
X-Received: by 2002:a25:824d:0:b0:de5:5255:ceb5 with SMTP id
 3f1490d57ef6-df77218a263mr1853899276.3.1716550360799; Fri, 24 May 2024
 04:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
 <Zk6yK3U9tgxOxcBb@titan> <CAG40kxFxE_Oj+9aCzGku0a3KFHpuW8ai=gEkV9M8==5gwmjdEA@mail.gmail.com>
 <Zk7Z-MfdF-YKWeJ6@titan>
In-Reply-To: <Zk7Z-MfdF-YKWeJ6@titan>
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Fri, 24 May 2024 20:32:29 +0900
Message-ID: <CAG40kxG0yM0+ge3=zX4S_MQevuNQ5oWAvtmTPXAbHHk2nmSYew@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240524_043247_970983_593CCEDC 
X-CRM114-Status: UNSURE (   9.32  )
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

Hi John,

> Does Linux guarantee a flicker-free experience with setting up PWM
> channels, or that it doesn't affect other channels?
> How do other drivers handle this situation?

I've noticed that drivers/pwm/pwm-fsl-ftm.c and
drivers/pwm/pwm-microchip-core.c use a similar approach for shared
resources between PWM channels.
They simply fail if the settings are not applicable to the hardware,
much like this driver does. However, I have yet to find a driver that
aggressively changes another channel that is already running.

Maybe you're right; Linux might not guarantee anything about this.
I think all we can do is deliver the best experience to users within
such limitations.

Best regards,
kikuchan.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
