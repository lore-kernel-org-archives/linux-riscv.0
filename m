Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4888C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 22:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dleo4/W4mtoBp3zMX4RhWAps7j9uNAoVR+AU89lSBGw=; b=KseZP79uzT/2z/
	h7eZupCWzD5m1jtEQZC+0TRdG/KgjxTHc8FhoPtia5vHj+ggqn2R64LeXqMsgd6OYslsOyTyhxQJL
	mM5CPmR8NyRpxBJRfxZZSyZktF1fKtl4zNkMO1OSijNdICTzTAhdq2N9TAtLEfQO1f15bIWtM15cc
	l59GtsaMhZvXlJSxsw7jcVsCso7TyNcwL1w/IFrSnEeSJFECHkHNvsPjszsapfkDgc3N6V/TK8alu
	ByLkjIwFSOVC0Y0Un6LuryAezDVq6SScsXAmLCFiIulweQZ9k0T/LtCRfEhi+JEEBZpGVqoueJbGu
	QWpYIqWKCfqm4ZQqUNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxEcT-002D4s-2c;
	Sun, 29 Oct 2023 22:50:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxEcQ-002D4N-2S;
	Sun, 29 Oct 2023 22:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mItQr9Lnr2C07koQ7ptJcY2nYrj1Tv7N3viIjaS79mo=; b=O4z6s+bSQrfPzDDmeay9WJaB3d
	6DyWIwTIhL7JZOJeso/nzNcfcqgwCRchXJOb28e+/nsHaW9AG4w2iw0aYs/b//6B7COSqtYePpmZE
	ejpmJpVx3mLK0a39nksWbIFKIj6n6mS3qFBR1PKPntGjDw4R8tVaHA3jZWq87tDvjXtE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qxEbw-000T7f-KV; Sun, 29 Oct 2023 23:50:24 +0100
Date: Sun, 29 Oct 2023 23:50:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 11/12] riscv: dts: starfive: visionfive-v1: Enable
 gmac and setup phy
Message-ID: <e837e707-5b01-4b7b-8362-0dc62883fdba@lunn.ch>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-12-cristian.ciocaltea@collabora.com>
 <f379a507-c3c1-4872-9e4f-f521b86f44d4@lunn.ch>
 <f05839c0-7a78-4616-bedc-6a876b7f4bb3@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f05839c0-7a78-4616-bedc-6a876b7f4bb3@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_155054_796794_67223C9A 
X-CRM114-Status: GOOD (  16.86  )
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

On Mon, Oct 30, 2023 at 12:41:23AM +0200, Cristian Ciocaltea wrote:
> On 10/29/23 20:45, Andrew Lunn wrote:
> > On Sun, Oct 29, 2023 at 06:27:11AM +0200, Cristian Ciocaltea wrote:
> >> The StarFive VisionFive V1 SBC has a Motorcomm YT8521 PHY supporting
> >> RGMII-ID, but requires manual adjustment of the RX internal delay to
> >> work properly.
> >>
> >> The default RX delay provided by the driver is 1.95 ns, which proves to
> >> be too high. Applying a 50% reduction seems to mitigate the issue.
> > 
> > I'm not so happy this cannot be explained. You are potentially heading
> > into horrible backwards compatibility problems with old DT blobs and
> > new kernels once this is explained and fixed.
> 
> It seems the visionfive-v2 board also required setting some delays, but
> unfortunately no details were provided:
> 
> 0104340a67b1 ("riscv: dts: starfive: visionfive 2: Add configuration of
> mac and phy")

That board also uses a YT8531 PHY. Its possible this is somehow to do
with the PHY. Which is why testing with the Microchip PHY is
important. That should answer the question is it a SoC or a PHY
problem.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
