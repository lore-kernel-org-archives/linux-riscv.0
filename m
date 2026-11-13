Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB8360A383C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 12:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SL/mpnIA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Qeq/NZj7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BtENiiR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i3Q3HV6zc2zt/AqikTU/EwxdgQ1MKamdN0CMS98U77g=; b=SL/mpnIAp531NCqXDip1DB+q8V
	pQL+KUl4Mq/xGp5qx9msu3joUXcAx2PTIP8EAEWtKoJ7rjE/ydNazM/F4xKx9wTxbWudhAvyolseJ
	OiicmUIjIh6kWH1l8iybqdQVLyvhjTFERiGz9Y7XxjiP4RiFiS6pgXHQUao8wpfvxibSyhvLt8NNu
	zpNkqiOQFBmGWHsOh1w7laiWfNsXFqvAAwQ3OXCMjgZCshgnu0BFQwPrSwknFvVP7rETX0O76u6Kj
	qRmkHQ51F8OWnFzz1QIVyd0FCtIPBlk0fsedv7lYCUpwWwByxG0OU7enooao0gVuoBH7/f80Nu0M9
	mV9XSnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqKR-0000000Cj6c-2FAi;
	Fri, 13 Nov 2026 12:24:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqKP-0000000Cj5B-2kor
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=; b=Qeq/NZj7Xap2xpd+gBotGuKOej
	YskRaBiUzE8TQQsUIuSWO9t3AZIEnd7BeAQoJwS9Ei3vgc3JBsGN1aXPFwtzW/M9gd0ujP8X6RMaf
	CwloEWwhVixaD+bT6vv4oJBVnewaOUO+Jsz53KJVTt1AdtfjNo6CFKcF8orWpNhanAzXCutyo7mRb
	N4NnGx2x4kHEL0w1oCJBNROC/kTAwxOi1aN5ta8VJiqsv/TzumDyDgrFQjZlWQh+sRbd37nceNv5w
	9R3MkLyNe8hXOkvyyXukP+dRJOEFQQcSJEYdxD5SJ3SNFLmDr0lptwsC2SEQh6rZ6dXR7ekI3L/L/
	eAwcTvng==;
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqKK-0000000BF3n-1h8S
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 12:24:24 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3704d30b84fso1165339eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 04:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794572657; x=1795177457; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=BtENiiR60npIZv1vZvJ1HZETNgDCUJACErCrt0etBUqMBO8z/G9Ftse6pbu1j29kJQ
         k5hL01eYIuICCeNTX6bPwAaQg6rvpWSoS+X5+VUxvna8KfzrvS0guzSprQm59PvlRh3g
         kAih4QnQlbC7cNLwQyXkzaHyAAeCdiMAnHPJ16LAn6OaBEwU6lTvsgOUJ2jrLrfirV+n
         eVjTxWtrouNhP0EUqXmFbonmFdWCLcuwgGh1adman6ca3mTULKTqxkUpxxKCKDmDgDiS
         /tTUFfHsjL+zbFdHpH8yK+nH2tMwVz8ldd8FULfrS8rsVsecSUblvzL+HgIEvIljWv6B
         L8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572657; x=1795177457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=hyO5WNbR+Ald7gKV4OqW9DHCHbEpSdk+XfV1TXwVtCLxbUvs3frAJi0nl5VB+jL6LS
         6oMYYn0zV+m53yZ20xGmeOxUjnThNEb/Zat50t5KUjlHKFdsFwu8SGJqQwUlbv5hTim4
         vH3MNyihwWIkn532HI1nJntrtFrlla7L0LYV8Edp7cvofndvtPx8fVu6L/m5RZbTqOot
         vrhjWkc4drlA0GUxAqPI6UyoZSGQzYaY1Jv8wGF63g2+neZrug/C23WKfMGn+RkOxp83
         COYU84WakBSXsktbvQZ57iLZeDSV6jSS++sibV2AwdW4kdIvpKsXHXzsG5xxsVgYvAL3
         Z71g==
X-Forwarded-Encrypted: i=1; AL+hErGx3u15X+9acRASgGBA6NAE8WWSyi8VeU/MLm5NSFoqrDvij47oAP0vFaNG57OLcghhKdazBCeRW3PjDw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/8fFXF8PbuWSybg4PmMei0n2n1Ju55MVykIBbU+MLLbq6gHIfe
	U2l6tBxsS+5f/IRoHGB8Rc3V4tE71R6NMQg/6AACs8yICxRnGMzk3Jhz
X-Gm-Gg: AYBFou20ktZG/L2eMYQkaD/sL8cHiEGIeNJMzcsuJ1jEYKBvfC8ojUb4ezFAdF/8MBn
	yyuaK7lTMlMPX4A0UWF/zRI1iCdY40kOYjuby+VWTzhkuHu5cqSni2FYhTvyHZcsp+msHKKctmz
	tRknxNVOy+z2wSOysi4GDmJJBHZiZ+beCdYu68Ch/vfCoUZhOMZKzZV0rLJfvSoXTkaOVJ/JWgJ
	xUQ8U+Kw4wa+NwHpfvvdxDR+nXSndLWZ/lGdL9XTmF1hDb2o2YSejpCPLqe7Bm0QuVlEKPSAf/8
	KhAKFX4l0sgrGwMLsqba5dZHkn7YutJ5Gro+pKVLe1fX8jUjQSNtsnxvUk4vEORsrrL6vKmS82W
	EZelROiLfAQ2zhSlKM3ltyuAKRT0Ae/fSnYu07yqEXt5KQc71G55xVuIhklwwTJiPYSgJc2Fr/e
	p5FEB3AmBqLHlR4lPNqzXZCPb+w5EmBO9MIeVJAShpKgTKl1HwWiNusxMxFSjH8sxWTgKg8CdLf
	rOjMBNteW719Ot23Q/jsNrwphog+tujqsHD3/Jta0zasKdeycJoj11gqGHKsLQWNlcRX/lzkN8O
	XtszFsDWd8ivHSlaH6iS68HyNWfOPw==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr1692885eec.30.1794572656803;
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm7242488eec.16.2026.11.13.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Date: Fri, 13 Nov 2026 20:24:05 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature
 trim cells
Message-ID: <uot2mqhilzdfngqcwpipdo5xzncyvesmw2hw6rqk7mnveer57f@6m4cqzotx53k>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-4-duge1256@gmail.com>
 <au5Q9lYTUegeEglv@aurel32.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <au5Q9lYTUegeEglv@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_122420_325049_A6ED6EAC 
X-CRM114-Status: GOOD (  20.92  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:13:10PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-06 14:05, Jiayu Du wrote:
> > Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> > fixed-layout cells for the temperature calibration parameters stored in
> > bank 0 and bank 7, using controller-relative offsets.
> > 
> > Leave the controller disabled for board-level enablement.
> 
> What is the reason for enabling it at the board-level? AFAIU, this is 
> part of the SoC and does not require any board level hardware. Therefore 
> I believe it should just be enabled by default.

Agreed, there is no board-specific dependency. I'll fix it.

> 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)

...

> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@120 {
> > +					reg = <0x120 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@19a {
> > +					reg = <0x19a 0x2>;
> > +					bits = <4 8>;
> > +				};
> 
> I have tried this patchset, and while I can see non-zero data in the 
> /sys/bus/nvmem/devices/f0702800.efuse, both temperature calibration data 
> appear as 0. Is that expected?

I see the same on my COM260 Kit: both banks contain non-zero data, but
the two trim fields are zero. The factory 6.18.3 kernel gives the same
bank data and temperature calibration data. 

The thermal driver change in [1] reads the bank 7 trim first, tries bank
0 if it is below 8, and uses 0xd8 if both values are below 8. This handles
the zero-value case. I don't have an explanation for the zero trim values
themselves.

[1] https://git.openruyi.cn/OERV-BSP/kernel-spacemit-k3/commit/334d70cf990d4e9a9899bdfb758e47732ba5d519

Regards,
Jiayu Du

> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
