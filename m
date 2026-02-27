Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775FCFEFB60
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaUTs7PTG/K3RWjS3qkPhOzyukqMq+SCLJTcY4FkQJk=; b=spfBgyRIiT30fm
	5oWUtIHXh5ZoXUz+PSwO9zblUEhfXbc7f29y1rbY5OpYE+Y5H3ZIp9Flk3vls9Gy1ZYHy4xJoi1aZ
	wfIlCrVKYcRMwcz4ViXBmPjy6hPxABoj8l14zDBTTh+GA0uEnkXNkXFgmzejPm5extsn+BiQe92Kl
	xSTZzhkoUUhjU3zU0nRKEbVNFs4SYqOfD+5eLIGx9+WKJfXa8bWzNdQkvG2H1riRUYojb9msglOZU
	MquhZ0Rsz5j8Gx/iyRrmlIt+U7rMFxy5ojoNagl3thn0vm7r4b8oLbNGKYyahrxfNWq9czebF9uLg
	V+TCwz46ExJLPBPUYtiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzmK-00000008cxj-1AmB;
	Fri, 27 Feb 2026 15:29:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzmH-00000008cwy-1jh6;
	Fri, 27 Feb 2026 15:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 214B243FDD;
	Fri, 27 Feb 2026 15:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAB8C2BC9E;
	Fri, 27 Feb 2026 15:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206157;
	bh=De7bn/n8BhoSPhSHTVWvjQ3gSzdmOOwqj1HR6u32gyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YdVCf4FF07nzKBY1Lm1XDnYJp3Zfeq6d1C57FvUX0RDDzQTd6AESAd9y3aA3dBqMb
	 2Ug6nxcJMhE5ISeCuIVLrDrg2eWRW51S0A9F0UA0n6a7a8B3MGp0Nks3pENJN0AHFZ
	 VOf3rxTVamIla2N8KwlTFd+3Z9tlnBTi9nuNcyswhLSI8gTvaMsa0R9+CJB9Z5pJCk
	 tHQ7nZnMwIzYvNRw4OycN1IiOx2cxrKdV1EfOgQWEzf0N43NifX48T0LW5SFRC3WD0
	 Y55Pwz+yXwykk4cTUJmG2VorAtndh0OMxtj0H7oUohmZConR+aLbHi1JwfErFc1ViF
	 gWZ0bU48qigfw==
From: Vinod Koul <vkoul@kernel.org>
To: gregkh@linuxfoundation.org, conor@kernel.org, 
 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
Subject: Re: (subset) [PATCH v5 0/4] Add USB support for Canaan K230
Message-Id: <177220615264.330302.188095105582835535.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:12 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_072917_475312_8B05CD6D 
X-CRM114-Status: UNSURE (   7.61  )
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


On Wed, 21 Jan 2026 22:55:21 +0800, Jiayu Du wrote:
> Add support for the USB PHY and DWC2 IP which is used by Canaan K230,
> and made relevant changes to the DTS.
> 
> This series is based on the initial 100ask K230 DshanPi series [1] which
> is based on the clock and pinctrl series. Check the details in the link.
> 
> Link: https://lore.kernel.org/all/20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: Add Canaan K230 USB PHY
      commit: 50357e7d7992ba8f02c87ff7a5c4db17918635da
[3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
      commit: 8787fa1da603e9e51efff11841e97b5d374aef34

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
