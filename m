Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9798CFD646
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfR0uDJg4ZskCDyWjHO7ONwA/j3azYMK53n/qNW29Z8=; b=ljN/sf+d7zlj/N
	xOB8+8mmZXA0kKgPMxmM0v16tstUnebqLIPdxWMcGa2kqWvWY9CGyGKa1nHRsy2iP/Wd1KO3fsgLn
	GEEYqnJwj0pBPLlGktnoG9fWcGPWc3jsqjfn7u08PsBbGzJLsFL8IwUVGOyLOHSszKjDOLp3FVY1c
	4Ms8jyoLwnFZ62Dd8p4w+3DolmicgPP9It52va+Vy/zKufiqU0Ut7wuJN7q+pmWCXe0BBd+1wU9gW
	PM9ndYndLNaq1E5rJzUSlD7G+3/B/XyknXWTF0O1Dg6JBC/fzyh5wMi6L0gDRRgGlIFrou4QocJEu
	Jo9yataQEXX4pST7Joqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUR3-0000000F58q-0VrL;
	Wed, 07 Jan 2026 14:22:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUR0-0000000F57z-1opH
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 14:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 128A142BA4;
	Wed,  7 Jan 2026 14:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64A7C4CEF1;
	Wed,  7 Jan 2026 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795768;
	bh=scgw9KKnio2Dqs8aqrCWQDiazUPc1M9tuCchtwuPKxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTDozbiwWTn7JBodqf5Xn1bOOBqTgf9JVgn9Kk9V7hPzYdOGqq0RHoDAajhvDp9+B
	 8Ow0s0jjZjCJXQrIe6AssJli3QubWUYGjFWdqRIsmcFlLAqF2r1afxJ8LzuG/OPvvF
	 NX0UeVyvZMxCILEr363geXmmM9wHD5CFhFfk8TOHmhagoMpB/H9vSIUPhVbq7RkBge
	 7BzgQ+Xofx1bn8Hhj5MzSZnHYJzHwKWTl6ISsaKVNttcAWGAQQKpQf+fOpEv4T9Gpf
	 lFm8rIQih68D5ja0l0rilgVr3nlNL2mth2jq7BYbNQCKKqilQIVqNGcsYv7lBocMm6
	 ffbUxBm3LxIfg==
Date: Wed, 7 Jan 2026 15:22:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@gentoo.org, guodong@riscstar.com, krzk+dt@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, 
	spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
 <20251230150653.42097-3-jyc0019@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230150653.42097-3-jyc0019@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_062250_489453_D45FFD04 
X-CRM114-Status: UNSURE (   7.45  )
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

Hi Encrow,

On Tue, Dec 30, 2025 at 11:06:53PM +0800, Encrow Thorne wrote:
> Add resets property to K1 I2C node.
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

how is this patch formatted?

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
