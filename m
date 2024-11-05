Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321B4D2B944
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrZWXiyKKm4nEGHBRQnqPUDQRsgBXXVDa1+C4B4lDjo=; b=rQvPR9tyDbtWQk
	k+ig9GB8XRWz4MArme3HYcoUi2EE/NnorsF60cwecDf3bF/ERNplO2LOh/H8+0bShxA0Du93KLyre
	Q/lAYiRr6Vymnn5Bnww+1qTtvebeKydjwLxRuk6El8+VLJckRPHfZ+1kwwljFd7uv8cDaCrXMIQuN
	FEldaUX6BuUFg0q+pVb/pZ6sTv6CJEVed/itjsnU84pDxt3RIClLfefezlLyu9ZuqK18kuaWt0/GB
	zdYMDnC095phAHB3nPWYO4/r6311Mv2stA/3cxlMXJyn8xelFSJBjZE/HUhrhZJ3t9U4C3OrlJsZ/
	ocvsOKa2N51TH2M+wYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LlC-0000000HTQD-3BmY;
	Tue, 05 Nov 2024 15:46:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KR6-0000000HFWK-27KN
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 14:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7197A43376;
	Tue,  5 Nov 2024 14:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05166C4CECF;
	Tue,  5 Nov 2024 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730816495;
	bh=DJ/kUd+DBcqBgpe9qw/202KtCsDESQxoQDuovJy9AQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUQAY2VtS3S95xlLPJHAEpqhXhFN/LXpztOjF/kPPM/auScTwyu7fJlj83qI3qTq2
	 eGMUVeYB1hDxalbVG1VgnVbIyoIXHF+qzzDtYl9ztg2XOxBq5Zg3a2d+Pwn/jdlWuV
	 HoJ2oXv6Du+E9lmDC/TP2SfcdRgMT7dslgdTfMBQKvo9Sbg/+UrIcb4aNnrfPsSQTz
	 /gY+V2FSHPwKPeQvmMTpFnFoSDkr2+uGR6RRONDrLY5rAtj1PHomzXnZWGe2g2e+jG
	 nrrcUELFRfD0cA8IfnTBdnNRCd5QNXDt3gv0AUiVR21rvuWKqheYcs29A9oenP5Y7z
	 hjqVsiuVbAeaQ==
Date: Tue, 5 Nov 2024 15:21:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC
Message-ID: <o55tg4zybyfroh7on7b6pxwbkw46fgafryzlc2gczmgecxr4ph@lptxs2timypu>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
 <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_062136_633473_74845E37 
X-CRM114-Status: GOOD (  18.63  )
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

Hy Troy,

On Mon, Nov 04, 2024 at 08:23:23PM +0800, Troy Mitchell wrote:
> On 2024/10/31 19:43, Andi Shyti wrote:
> > Hi Tony,

Sorry, I misread your name :-/

> > On Mon, Oct 28, 2024 at 01:32:18PM +0800, Troy Mitchell wrote:
> >> Hi all,
> >>
> >> This patch implements I2C driver for the SpacemiT K1 SoC,
> >> providing basic support for I2C read/write communication which
> >> compatible with standard I2C bus specifications.
> >>
> >> In this version, the driver defaults to use fast-speed-mode and
> >> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
> >>
> >> The docs of I2C can be found here, in chapter 16.1 I2C [1]
> >>
> >> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
> >>
> >> Troy Mitchell (2):
> >>   dt-bindings: i2c: spacemit: add support for K1 SoC
> >>   i2c: spacemit: add support for SpacemiT K1 SoC
> > 
> > As Krzysztof has asked, please do provide the changelog, it's
> > important to track the progress of your series.
> I saw a compilation warning sent to me by the robot, and I've
> fixed the warning. Should I resend V2 with the changelog
> what I miss or send V3?

Please send a v3. When there are compilation issues, normally
patches are less keen to be reviewed.

You can add the changelog in the Patch 0/2 to avoid editing all
the .patch files.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
