Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A9610854D0
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T44lChMQRuA1ekdW1n8gFn7IeLO571lIftcw6y5nRjA=; b=Yal8SsXWegItg5
	ml5P6ynFj3Y3RvYzfZZM6fr9Liro98pBoYcwQnDmDWgmk7uF2RoorlevM867Dw/U1TNYTF6Gm7N/B
	GVeHcCzXw/nECP9PhTV8MubHjv27pZ+D+o3KGvzskrZxZ5+kWAr+swE+jlo0Oh0W1k5Ap5T0x4OvC
	BnsdtMoruJZsXIj2sU7kfXLPL0r3+ymM0l9sl7wYFZwXFpKLa3XJItZYkq89/8dgmNNr1eipz0CMm
	IyJgNBypO50Dhd0DfxJQOJGztMLbLKKalSGyIM2v8HlWF8R4cbMeCP7jlHk6zR0KjTDkHWyqLvMuh
	4xtmwTmEQr6vZN3vLtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mmD-0000000862h-0hWh;
	Wed, 18 Mar 2026 09:01:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mm5-0000000861p-16Ok
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 09:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94A56440F6;
	Wed, 18 Mar 2026 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E842EC19421;
	Wed, 18 Mar 2026 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773824468;
	bh=Y7NA/QDIalWo3D2nRcGD3UiRiGnKtgUyJPIS23k/YlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNYnbJhJQKFMBTOaoOaL8B3vntvOGTJkSyS/fiTuXvhdF4d5UlKf03QNdWwm6N8N+
	 xjbBULijEY1lvlNOH023Kplgl+ZhyRFTN3KA7jzoingqBX3gHGgOqGE7SQMroxZRrR
	 UHytpJQlqFMRtaYh71y5QfcKcbh0mXpmbDBUyKMw5nDLst6AY8qZLaq6ONVvd6z5K/
	 WR5ytD4+hI8JcG9hAjUodVBrcE53o9X/WUS8VeKiaaR/PTpKeeY+jxNMD+/4bYHS25
	 EFyGlO9Ui/E6U1G8a850TbCwzg/cdM1X09u/MKXtq1pjYN1usq319IIJLZnqUm87z/
	 mzVhOiUfKgyNA==
Date: Wed, 18 Mar 2026 10:01:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
	Junzhong Pan <junzhong.pan@spacemit.com>, Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: Add USB2.0 support
Message-ID: <20260318-belligerent-boa-of-resistance-4b98a0@quoll>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-3-d89f59062ad4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317-02-k3-usb20-support-v1-3-d89f59062ad4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_020109_320341_CC618A0C 
X-CRM114-Status: UNSURE (   9.22  )
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

On Tue, Mar 17, 2026 at 11:53:04AM +0000, Yixun Lan wrote:
> The USB2.0 controller on Pico-ITX board connnects to a Terminus FE1.1 Hub
> which fully USB2.0 protocol compliant and provides 4 ports.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 24 +++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 31 ++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 

DTS cannot be combined in this patchset and must be split. Don't mix
patches from independent subsystems when you send something explicitly
targeting only one subsystem.
See also: Documentation/devicetree/bindings/submitting-patches.rst

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
