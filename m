Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D89C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUDT+Ce8bAAJ5UZoeAn7BMwicIibt7gq4EhgqFNsmzQ=; b=T7qsW+ts7DWui4
	UOnXbnoJ/u3S3XoKo8cokWjh7Xn1lFnGzHomSpGySRchpSd9EhDwxMyn3TMmgKqeYR7yjEtECfdiO
	3lmFpL9z8ihH3BlFoB0uFrOhsjwgK5+QLNA6+ZGnNKyoScPMWLokO61KZjPKAZ1qSsJos/3kVvbo9
	SP5GlmrWI+QaVd2gwgWgAVsDPy1Kwl2cS2ZEAXvEmmNh22ir2mvvvXzOtPUit5i19t3bTP398Mt87
	FW69rwomeDN0fmpfpbzr/QLW1+5XvXFQcjvQ7qwwqHigxbpE/TXCnYviwCryqTBn5kw4rPfrvp5d3
	puwzziCUwrNibSgb6ZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbjBa-001995-O6; Tue, 05 Apr 2022 13:25:30 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbjBY-00197M-Nx
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 13:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GMTFemwBkT81roEqY5EW/cRE6P00Wf5M8QX9OYOwMoA=; b=Ufk4Wd3cNhTFeXGKmWtuB30YTS
 su3xAJN+XbLcT73Xd3oZ7ULznBLmvaNP/MSxOJf0fCYT84I1UVl5s1EuEzFdenDJKR7o6Re0KUYm/
 Khq7pw0+bJak6NUI0GCU82e7UQPDMPi/6C6SqXJTJRCOORGBqPWPtVQ3Xg8C/xWpmhp0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nbjBJ-00EFhM-AR; Tue, 05 Apr 2022 15:25:13 +0200
Date: Tue, 5 Apr 2022 15:25:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com,
 linux-riscv@lists.infradead.org
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Message-ID: <YkxDOWfULPFo7xFi@lunn.ch>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_062528_817278_4E1E4C6E 
X-CRM114-Status: UNSURE (   5.84  )
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

On Tue, Apr 05, 2022 at 01:05:12PM +0000, Conor.Dooley@microchip.com wrote:
> [ 2.818894] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)

Hi Conor

In general, it is better to use the specific PHY driver for the PHY
then rely on the generic PHY driver. I think the Icicle Kit has a
VSC8662? So i would suggest you enable the Vitesse PHYs.

  Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
