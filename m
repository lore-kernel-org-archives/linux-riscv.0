Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0473F013DA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3E10ie4XWDkDrKjLcC84zCqK6cfZ+t0badac8stMd7s=; b=bSd4KR/4R70HXVPpE4OfG9mcLs
	DmGLCh5pzNaqCnFrZDJ8qOeU05kRtK0/p5w7N1+DDk/ZSyzdHlE2YUOCtxkbR/3eBSOXxIGc4Bn/f
	0kAkiFVf2tWkOptD0YFLludu2WRAtcWItSFUq+WM5QDy55rLQTNqQBsSjV6RuOVaRduXmyg1RkBe9
	uGb2dkHeHH/gPwkd5Ati35d1B5X1Scq3ia3SbEshi8h/eV71N3QQt3V40G4eX1Nm/gkAPza35afgL
	dxkeoRK6PLdFf4xhnLyN7WmOpZXEiFFUT+liw20y83Xn9EFg+wIMFGraoXm3O/yTfHLzZJ4CiztKp
	liycl0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23uO-00000003bOS-0sbh;
	Mon, 16 Mar 2026 09:06:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23uM-00000003bO6-2fSs
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 09:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6F4E60131
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B560C2BCB1
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652001;
	bh=5SE0PmFO6g5N3FpnWF3NnhO0iI24+crR4LB9Dp+rN1g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=sRp6CkNXQV12WCb9LN5BXTPngHPzqVKLw9PCkWHb5i0DNM4PFroO1kr0U3hw3Y7+7
	 GfKmPOYRp3+2gKIjnbBQBG08ul86GifJzng/+2YADWRFz/9j3cXTrB/w36YuBwJy4G
	 pD413zTqauSpqdWKxyVbjnw7ScSxuIEJVc4BHk/jhRvWfAszS/8Wc6qXaPtpgPTIg9
	 JLAeZDB6aFWvtzxXJdy+W+vwmorNTr6zXiDccge+LtJfn2pZxeSovpLeD7dP+9jNcK
	 +Z2QDmMkDs5Dzbse/22cRUSVsQ6IHeq86F2j0W/mxPTYWv81mhV8LqS4n4wG/ffNaf
	 ntJ1ML3rHRMgQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so5177183e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 02:06:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2ssT2Taez0BtBacLY0GvVgHfAQY40ZLU/Z7cSmc6/l0T3K9WX20c53sM0yLJxRXvnLGj/fcJBY151nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOuZtmXHT66IR3uMC6HzeU+5q2CIA7B5ntOSRgXmO/A5vKo8dc
	EFBR6EMjfA4uM/rVtY+Ok8eZm+HLvZ4p58x81aKZu9JFVe8VjmcrxChkFWzXSgcEu3BIiJ3A82K
	VX9qribv3lZJ+orQVecxolN5DxAfketpYg3YHj0N7aw==
X-Received: by 2002:ac2:44b6:0:b0:5a1:4f87:27a9 with SMTP id
 2adb3069b0e04-5a162708d47mr2981302e87.21.1773651999876; Mon, 16 Mar 2026
 02:06:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 05:06:38 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 05:06:38 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311-mandolin-sprang-9b9bee9f5a04@spud>
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-mandolin-sprang-9b9bee9f5a04@spud>
Date: Mon, 16 Mar 2026 05:06:38 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdOpUEw46xSFqw6Uc07XQtTBK2ikUtUka1gifGs0X5DDA@mail.gmail.com>
X-Gm-Features: AaiRm53OhC2gDtqTw6o-dNugtNcaIYKHiGgTsAd40UWkKJImg6KvRVcf1Dd4fT0
Message-ID: <CAMRc=MdOpUEw46xSFqw6Uc07XQtTBK2ikUtUka1gifGs0X5DDA@mail.gmail.com>
Subject: Re: [PATCH v12 1/4] gpio: mpfs: Add interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Herve Codina <herve.codina@bootlin.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Wed, 11 Mar 2026 16:17:38 +0100, Conor Dooley <conor@kernel.org> said:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add support for interrupts to the PolarFire SoC GPIO driver. Each GPIO
> has an independent interrupt that is wired to an interrupt mux that sits
> between the controllers and the PLIC. The SoC has more GPIO lines than
> connections from the mux to the PLIC, so some GPIOs must share PLIC
> interrupts. The configuration is not static and is set at runtime,
> conventionally by the platform's firmware. CoreGPIO, the version
> intended for use in the FPGA fabric has two interrupt output ports, one
> is IO_NUM bits wide, as is used in the hardened cores, and the other is
> a single bit with all lines ORed together.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
