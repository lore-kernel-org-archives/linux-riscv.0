Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5A9F99C86
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 05:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Xo51KCarlJ6TGkbwE0IW3SSESl0ti8giF5xEJjztdw=; b=Iy/8US1nTUEkva
	vLoEF993luSHHM0WG+IsAvdPa7T6vgcQP+BICF2fgsbQ/G8TWDticiuXRZkk5yGbaXKZDAXfUfrTa
	FKqKNpH3Upwrl1lsBpOZpFEHzsiMyf6jHkaOZwdpmMy6bGrCzdG61dyzFwdcAA9fbJ6fihCmknZBy
	BnK5jKHjR9EaSDpNX8qJefzy+jVUW+Gc6UcNJgrfhJJDYXzw7/fFC6+GZJ+mTNLfG0D7gcO7IHopL
	KTV4Nb7pTqVgDome/eyomXWpcx2vD4lcMfZDKH6hQXgkY7Fsi28DzL80yxofdkJOs11u6e1Gg0XGR
	NW7xPRTbg7ae65oYxeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhBJ-00000006Rcr-128t;
	Mon, 20 Apr 2026 05:28:25 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhBF-00000006Rc1-20hD
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 05:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=yD0tFhjGk4Iefxd2PfqrqTCyGwJWD+2Ym
	vsrWstWyM0=; b=qVLtq1WkugPR87AefPywq8IdU5NYeaG/ll+NdwaZVr3iLU565
	yoZAhQXWgfuBhvf4cJyw0VTaruH/R2OoG8k4NWyMSxq+UVCiltO7wwTpMji04dzr
	cegWIz3f27SXZ6GUO+tYwcvb0V9mxYqyvP4NYtZyQoI2p9Of5Pmd1aNHT8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUKLueVpsH8CAA--.1560S2;
	Mon, 20 Apr 2026 13:28:43 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] riscv: ultrarisc: 8250_dw: support DP1000 uart
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, Zhang Xincheng <zhangxincheng@ultrarisc.com>
In-Reply-To: <aeHlaTIKm1wl0J0_@ashevche-desk.local>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
 <20260316-ultrarisc-serial-v2-2-6ab3e7fa891c@ultrarisc.com>
 <abfrDBeJrValJR9a@ashevche-desk.local>
 <177641113786.3193169.8990532982066985425.b4-reply@b4>
 <aeHlaTIKm1wl0J0_@ashevche-desk.local>
Date: Mon, 20 Apr 2026 13:27:58 +0800
Message-Id: <177666287849.426965.12290556566565086842.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776662878; l=1328;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=P9/Oiu3kQIkJb/NpuqfPAVmLxhp49AvaTmRzYpwIzRw=;
 b=eIKQch2jGWuWKaIN6LzclmglnfU2Z5aymgJwTpPw/uDrkz0XSZsnJ/NFzKdeVAj+mU+F0J9ZE
 nQxwV7EMb6HD+aXy1Xq8v8B6sqJ1rE8lOInPIN/hC51y/XXxF3UCMkh
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUKLueVpsH8CAA--.1560S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZw13JrW8Kr43WF15Gr4Uurg_yoW8Jr4DpF
	W5Ja15ta97Kr12vryvvF1Svr1Fgan7G34Yqr15Wry5ta1Ykwnaqr47tayY9F97urn8Aw1Y
	va4YqFZxXwsxuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWnhrj0AIAADso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_222822_203557_ACC26AF9 
X-CRM114-Status: GOOD (  17.13  )
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

On 2026-04-17 10:46 +0300, Andy Shevchenko wrote:
> On Fri, Apr 17, 2026 at 03:32:17PM +0800, Jia Wang wrote:
> > On 2026-03-16 13:35 +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 16, 2026 at 02:33:23PM +0800, Jia Wang via B4 Relay wrote:
> 
> ...
> 
> > > > +#define DW_UART_QUIRK_FIXED_TYPE	BIT(6)
> > > 
> > > Seems unrequired.
> > > 
> > > But to make sure, can you elaborate what's going on here?
> > > What is the reads from UCV and CPR registers?
> > 
> > Apologies for the delayed response.
> > 
> > Our DW UART implementation on DP1000 does not provide the CPR/UCV capability
> > registers, and reads from both registers always return 0. As a result, the
> > autodetection logic in 8250_dw cannot obtain meaningful capability
> > information.
> > 
> > To handle this, the current approach is to skip autodetection and rely on
> > fixed configuration via a quirk.
> > 
> > If there is a preferred or more appropriate way to support DW UART instances
> > without CPR/UCV, I would be happy to adjust the implementation based on your
> > suggestions.
> 
> Why can't you provide a CPR value via the existing quirk?
>

Thanks for the feedback.

I will switch to using DW_UART_QUIRK_CPR_VALUE in v3.
 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
>

Best Regards,
Jia Wang 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
