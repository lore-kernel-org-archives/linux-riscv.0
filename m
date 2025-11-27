Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81678CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bn9coQb4xm1Zs2ofX9t3l2zawg0DjfWKS2XHddZ/7cA=; b=bh7TPK6HZVfXnm
	TaZd4/GnOiE3tAMjlGLwMk22/M6SxcyOYvcOZzzyTkntwyy4TU7VfrZMTLWwirZATnS6mjfEFbnw7
	mxl1M8g1t3PUZXSJIAO7G719PPGx7o52zzUfuFjCF0f8usFplLn153OYcyxQk89nVx0nWMg6cjYsu
	e5WpoANsXogs7mpC+t5hwiz8A7wQ1rVAtcgnRijtY5zk12IrITvNd9lBcMIoru5mLNB4XMOONFONO
	6KWUUC1i9llWNQ2BlS7DcsqaA+wlNx4LSb7VnR867CqFocoTbKvQAYz1ipDkXT4q2NxO4S/X5W+DA
	SYwG0tL/QIOqBbUfr8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVsS-0000000G4Il-22VN;
	Thu, 27 Nov 2025 06:53:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVsP-0000000G4IP-3Z0Z
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 06:53:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-298145fe27eso9109415ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 22:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764226393; x=1764831193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIm0qhUSQJPA8+i7JRVoDjMxtkUuF0ITyjHKbEh3ZwI=;
        b=ABC8HHCl13cN1IFfcuQCeAidLuKsCKqaiRL3hdC+TtzweqGgjJWrxZZbuGb6LX6mA1
         7CRnGqx9MagiDDHRRuoxQmeuJ2O450BbV5r9hCR0KYazHFGZ66U/rcGYWSe44TIqWGMu
         lt+5jTJXgbTXQKj45ycDfK7lv9RepMUsAGcXhEGRBMdmdxRDInkILeOeG5TO7/4xxiEp
         V7f2X4dJeLJ1cQ45YTCoYnssrN/JSa9Q0a5pBROVf8R4DRYlC9CD6WkoRP6xVu0BLckg
         4a+IaibwT/SEhtJo06Sdb0bJlp+Pd0G8+O8wSb0mP9zqAa/1al5HncxlUHtDlrXZMq6a
         8E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226393; x=1764831193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIm0qhUSQJPA8+i7JRVoDjMxtkUuF0ITyjHKbEh3ZwI=;
        b=abSq9yssyz7KLK3Ph3jMQsZmTo5meFIdYazqFwcnDZBP1neIP/dQmN7ePb4HW6gB5n
         b/6EN+S0IGTPT+qrA/tuErJrkeorUiGXhLEAE2vy2HmPuBqx6EfucX1CXcvzGSO89Wc+
         wC0SelNO+kPMQ+9xoTZhNA/W7jMoIkx1nVHMAiJmbJRbS4yJXLUs+4nP6WDYpRZBgU+o
         tHKQNOV41pq8QGcWbMW5mEteeZdkGcIkm0IJJVZ6XNxaqvJxVlCO8YKkdtcij8t6Ki1D
         lXQX1CWsav+SMKQnWdZ3Hm1IeAdhU6Ho67Qevem9QiA078QYw8ddvqaOZ0LPI9Qqrv+t
         /y+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx7ASOlyZb3u6gLfrJvzxkwwGbRJki4XVYSMT4LRW1L38LcZlwKeKWvBPvA5e8LGuYVNAbxNWJPxSkew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjM0Ug6kYs4Z5fYm3P8Yds/G/2LaB3U1zkZpImSAkKrk8e9IqH
	1xiOfU42XypqCuCYCiFNzUClv2MLtrUmc2JnlFoNJ+0FoLacpazzMYku
X-Gm-Gg: ASbGncvO7GLrd1KblcUjA+cqCKlsJ+Yvh+i8dZJmMiQqRrrZ57IekIs13tn4nuqj31F
	mrKjJN6penxJFytkjE005QxlphPr7lJmQMTUuPH97X5XWjRIqQk8gxhfl5JphSWsUF7az0eWaRf
	hIqdnMn0BOBMp5BWnA4dsU6XmLtf7Pjg2r6vmt9S+yxQMHjogc9vCL9Rh7x8dlSoswhTJ/0hLBi
	rJ+UURO2hyidKWj4ndoEl713o/jS/X/fvNffew3p5zf/mHO3E4FCyILb7bf0AKMgu4gPT7pveDP
	rNqb77fH0H+Vy0F6I9X2TL+wKlWcqZt3ZYR0P09oBKEg6uKlErEQlr/JCfp3HgBn2mbYeYjBszP
	qgzsMS0xLInrdTQjmLEwvPS73TscQoi+ZRoAuWHLfOja7vrAC0T1Onf/yLNYAi8b2Y1Qr0CfImo
	6ACD2rZpFfZg==
X-Google-Smtp-Source: AGHT+IFxjfjFGi0PvEP/u61Bpv2hr8HsmsxEwlN0jZ/EvMgNsPa1VIJ0a+6QbWVLIFVefWx5VjPgfg==
X-Received: by 2002:a05:7022:a8e:b0:119:e56b:c75a with SMTP id a92af1059eb24-11cb6835484mr6656832c88.31.1764226392879;
        Wed, 26 Nov 2025 22:53:12 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm3208764c88.0.2025.11.26.22.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 22:53:12 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	huangze@whut.edu.cn,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	sophgo@lists.linux.dev,
	thomas.bonnefille@bootlin.com,
	unicorn_wang@outlook.com,
	yu.yuan@sjtu.edu.cn
Subject: Re: [PATCH] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
Date: Thu, 27 Nov 2025 14:52:29 +0800
Message-ID: <176422633734.834799.16302142544416130381.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126172115.1894190-2-stavinsky@gmail.com>
References: <20250611082452.1218817-4-inochiama@gmail.com> <20251126172115.1894190-2-stavinsky@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_225313_890330_FA421239 
X-CRM114-Status: UNSURE (   7.83  )
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

On Wed, 26 Nov 2025 21:21:16 +0400, Anton D. Stavinskii wrote:
> I've tested the current dwc2 FIFO configuration and found that USB
> device mode breaks in ECM mode when transmitting frames larger than
> 128 bytes. For example, large ICMP packets or iperf3 traffic cause
> the USB link to hang and eventually disconnect without any messages in
> dmesg.
> 
> After switching to more conservative FIFO sizes, ECM becomes stable
> and no longer drops the connection. iperf3 now shows ~130 Mbit/s RX
> and ~100 Mbit/s TX on SG2002 (MilkV Duo 256M).
> 
> [...]

Applied to dt/riscv, thanks!

[1/1] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
      https://github.com/sophgo/linux/commit/1d3ed9920a193e5d99d651d6ec1dbbe215ca172f

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
