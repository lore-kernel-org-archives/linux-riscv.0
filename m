Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779F0C072A2
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SC+ugXGcSBH7nv+yLZ+mU6DxmdjRJQBsFCdeD+6/fg=; b=kA4LXBEcaMrujh
	ni321MQ7CgUIliYo16QqbfphfJ2+8oRDlfqvkw9QhqcknEUMSuVcQdAtwQoqZ4iCSkP+LcN1en+UF
	n9NwS768zJnwOVdvEqKD4e3cvVC+ydTDA+rUSltsmnk/eSev4Ji05G0Qf/pgvvQTC596Yas5oOagY
	jBq4PHQNr0SIeDtKCkGrx5F7I5sfflY2xFx6vc7IY+3b6IvT42HkMJnegEIh2voLLa5PB+Bl5sANF
	5EL/m3usieUXZn26nk2G9jUnjuSOcmdp7pmILjMA9vbnvNjfo25SXiU0sIUJA93NwhS7ClCXI4J7A
	na+GyNkm9/pLlIOA/HhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4kVo-00ANs0-17;
	Sun, 19 Nov 2023 16:19:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4kVk-00ANrM-33
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 16:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xPOxEf+NZ24lKgdIU2RmKY0Md/5YZZjsaANCVnQCO4o=; b=f0wyT6U7p78DnnZFsltB0nllVG
	aC3nL2wxWa+UH6DSLqnTFbXFi5Sm8iDhik9lozv4hha9NdSbCjjIL2lW7hpe514tyeNx0j4brgzfT
	v6KCVu2EqC6Vd91ST78IHZnlWD/83zt8SFj5EmWcIm777APICj1qO7/yRGmGv4JkZ8Mc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r4kVV-000ZVy-8A; Sun, 19 Nov 2023 17:18:49 +0100
Date: Sun, 19 Nov 2023 17:18:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: HeinerKallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S.Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC] support built-in ethernet phy which needs some mmio
 accesses
Message-ID: <b8c29d27-e0a2-4378-ba5f-6d95a438c023@lunn.ch>
References: <ZVoUPW8pJmv5AT10@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZVoUPW8pJmv5AT10@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_081905_006358_5A3193C8 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sun, Nov 19, 2023 at 09:57:17PM +0800, Jisheng Zhang wrote:
> Hi,
> 
> I want to upstream milkv duo (powered by cv1800b) ethernet support. The SoC
> contains a built-in eth phy which also needs some initialization via.
> mmio access during init. So, I need to do something like this(sol A):

What does this initialisation do?

If you are turning on clocks, write a common clock provider, which the
PHY driver can use. If its a reset, write a reset driver. If its a
regulator, write a regulator driver, etc.

      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
