Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA0CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 16:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shycfoxK4i0YkTtDBVWI87ZEsclx6/w8vXUH2IWe7MA=; b=Kmstyqyk39kFTc
	0FkQNJa31fvkczAfdkzoyKLNC3RGwOiJ4xva9FGJiiuWEmp4Rv8At8a1mJ68pP8VYr14Gjh9EqLJt
	RWdIlyUaByjA47knIsJ3EGa2H8cAoTJb/FYg4annH1cIOa1htgO5TZXcs1XfZVS+irxKCgE8S2un/
	RMRRPy9zcQN6qQRYg3VkzTbwGMAnuSct84cyUcbl+WxPEZU/17dPCqu5r1HnOL43zPO1n1TwwMyz2
	/28i6LxzSgt/O6H5wOXY2ZQ7vhx8e+4D07JmG4nWQcvbap9EdXl+c2nq52RDnIjSglJtfbI6JmA/B
	dNrF16gbR/Hol6n8+UrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01m0-00000009K9V-0zPT;
	Thu, 25 Apr 2024 16:16:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00kY-000000093Dh-2zCN
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 15:11:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e4266673bbso9486805ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1714057860; x=1714662660; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AY93I7EEs+BmoPEYFWkauRLMs29koe27zKuQPhldmBo=;
        b=bZnZTrENKwCHQQ5ynEcDSz4cLlHW36dkK4l2zprbfnZuGCV+gltgdRXDhgzpCHVzgz
         AR9V0KLD8uix+lzgxlgBKrH+JM2lmv9bvSroMdN6cpZiMKu13mnodPPhURGvrdUDFS+b
         jFrXJ+D2zejLyjoEf+y5sTioVisnzpD2cq3U9QyTLZl34Dwc803TXsQbeTR2YrnRkDbp
         IfZT4zgO5H12OBCbPTEDruaflpMOS1NsNrL8hLyfnAQOAxm+U7v0g5WL3sgR85UAbQq3
         FYzTjUFjRoTCI64S7Swa+z9getyPWkUZ3S0lrC9KrT1cwODRunU/6b6dIQ3Lbz5mn78y
         Dv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057860; x=1714662660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY93I7EEs+BmoPEYFWkauRLMs29koe27zKuQPhldmBo=;
        b=Zk7Ob7d7YgbQvg6qJxgWvk0IY9qXo0xKPUjX5lSV+iCTs1Daskxqf1HQAPC1CWAB9c
         UtmnMamhCsvXmRS5qa5yM1UuCo3CO2Un7Py8KHHY47bXKBC7VpJ1LnmvAnjiWJ9O2Wtl
         wDzKM9kXMsVnl8UUrA6lSwJYfKM4gC5oC178ceDv7vfpx1AT8CGMpj8Ykf1lFeEqyW7C
         fHIjgEEnZORoNxPDme6P6gMWSaZzoMjOqApG0CJR8uxvFpHIdegHfbOd7igcCDAUOjZ0
         XN0sAvSCooO/OcQpCgtq8deWxpmLfqEf6KZe2dy+WyDexYSBv5iNCHm1xqYVv2SJdZKw
         3w1A==
X-Forwarded-Encrypted: i=1; AJvYcCWbbsTABxooxXm49Ixyvz57iM0T9792Qb1j+BNX4oZ2xdcj1OCSyEZsQndSP3xMD5Hm+5En/AdTbyxnlxccNYMt6RQWwPMM+qYSr8uEP9j2
X-Gm-Message-State: AOJu0YyJSXqqnFRA6OoYhHk6FT9TSmkK7zriT2XK0joGW7EKrVX4LwYy
	dA604N/dszdeNSYPmVjPFIOW1C6L2SCdCwB+Q0TJRh3627+ZhtejWZXcdDu6LWc=
X-Google-Smtp-Source: AGHT+IHvY7DZYX+EkssFptxYTzjgaUmPIJ9qGQ0l15Q85PHvyKcG5KvOmHeKEH1EXyvOyznu1y2e4A==
X-Received: by 2002:a17:902:f60c:b0:1ea:5ac0:ce46 with SMTP id n12-20020a170902f60c00b001ea5ac0ce46mr7023197plg.66.1714057860114;
        Thu, 25 Apr 2024 08:11:00 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:d29d:de91:a86d:7ccd])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902784600b001e2a3014541sm14130260pln.190.2024.04.25.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:10:59 -0700 (PDT)
Date: Thu, 25 Apr 2024 08:10:57 -0700
From: Drew Fustini <drew@pdp7.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, jszhang@kernel.org,
	guoren@kernel.org, wefu@redhat.com, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
Message-ID: <ZipygSDkbuFWq6q2@x1>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <20240425-boxcar-maroon-f07c5aba9272@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240425-boxcar-maroon-f07c5aba9272@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_081102_880262_AB5AF890 
X-CRM114-Status: GOOD (  18.61  )
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

On Thu, Apr 25, 2024 at 10:00:10AM +0100, Conor Dooley wrote:
> On Thu, Apr 25, 2024 at 10:21:31AM +0200, Thomas Bonnefille wrote:
> > This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> > and a default configuration for the BeagleV-Ahead. It appears that the
> > TH1520 I2C is already supported in the upstream kernel through the
> > Synopsis Designware I2C adapter driver.
> 
> > As there is no clock driver for this board as of today, this patch
> > series uses a fixed-clock named i2c_ic_clk.
> > There is also no pinctrl driver yet so pinmux must be handled manually
> > for now.
> 
> https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com/
> https://lore.kernel.org/linux-riscv/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/
> 
> These seem to be the most recent versions of each. I guess they're both
> just waiting for their authors to have the time to get another version
> written.

Thanks for the impetus. I've been meaning to post but it keeps getting
pushed down the stack.

I'll post an updated clk series today. I do now have the emmc working
with a real clock property.

thanks,
drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
