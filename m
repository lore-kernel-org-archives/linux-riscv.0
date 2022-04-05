Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34670C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhRoA6k3RT+6QT615y+wgsXqKHkCq1/vMYidgLBQtQc=; b=s/I7UhhwhVdSJB
	g+ehMSipBJikQ10c45MxnvcTaS83B6Ty9sllwFM4ih944js48vk4mFrMjQZcN9YvYrdG9JTKtH9VV
	zA2PJFMYMuQ8sLa5hMelflQKFgNjuTbaZu+B+7cVO/jSbK0JlQVauLY6fULkmpDeUOatv6qMdLNZh
	EH6hPzAQoxb6zWb+xuDNvy8/7DSSs4TjcBj0k7Z9QkAIoqdoSrLwj+aKYs/spsQcwbdoPvlEmVFc2
	+xBwCztaPZJ9nVidYRQ1/L3E0J/mDIpTsojDYYswdrW86whtStU7sVXRIkvg+nLapVtSUqUar2jWN
	dlva/mFBarQCNST10t+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbkbL-001YzR-2e; Tue, 05 Apr 2022 14:56:11 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbkbI-001Yxp-96
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 14:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=gxwZZyo5mJHFdc5jTFT7QqaCLsw7lI5fo+F1b7YE5EY=; b=tj0VGuaGKqsh8pAvGV2eOLQPln
 z0CR+o2k5Xc4Q7CeEWT1gwyzMjfWkciSJTmfFCaIQQqLLGufHzMb0OeFVz8ny96ds9oS+WzhAYQZf
 MoWYxsQMzcT2YHkIiogfkyZHLz8elBXdhNRJ7IRZYl7RxOpuCF5qUjSTdfCPY5kNq7gw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nbkbA-00EGBq-8H; Tue, 05 Apr 2022 16:56:00 +0200
Date: Tue, 5 Apr 2022 16:56:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, apatel@ventanamicro.com, netdev@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com,
 linux@armlinux.org.uk, hkallweit1@gmail.com,
 linux-riscv@lists.infradead.org
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Message-ID: <YkxYgDnWNxeXou3F@lunn.ch>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_075608_354268_9BDECDF2 
X-CRM114-Status: UNSURE (   6.56  )
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

> Is this some sort of lack of support for CONFIG_PM=y in my clock driver,
> that's leading to the PHY getting stuck in reset?
> Or an interaction between CONFIG_PM=y & the macb/generic phy drivers?

What clock is driving the PHY? Sometimes the SoC outputs a clock to
the PHY, and the PHY will not work without it. Sometimes it is the
other way around, the PHY outputs a clock to SoC, so this might not be
your issue.

Maybe PM is turning the clock off because nothing is using it?

      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
