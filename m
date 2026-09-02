Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D4AC61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 01:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6vk/8Ek6XZc9ClF2R31wUYob9keX1uSjjpO/jqqJe8=; b=NxpEXLAy7vRr82
	sXFw1mMWg7mJmyIAvfWumMpo+/ikzy85mhdH5RM7V02MxkqNJX1X3RVH312QJ2/OmOnwUFQX/hYcm
	xMUngsO9jvBvogd9f0yEDGttUkhCFsHcOfJRJiyTqyUPXlp0NTTipdsWrw5aRP7ak8y7SCvCvlBVV
	yCvwTbcT27jvSP3ggKuVse/gfo6fMhPIgtq5VsB7ZzJ6+GYOIcM17yB/54d46fULHkmWnDcIZCaUe
	FtVk5ECctJcyTsyRLANxSVXXhgyou/50QCnHgh/5xvqDRu3eawxVbYzmsn5xkK0p5HCmsYSZQ74lH
	hmmVb5tsu/pAbZFChcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZZx-0000000DcgC-0GRu;
	Wed, 02 Sep 2026 01:15:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZZv-0000000Dcfx-0cPy
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 01:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28557600C8;
	Wed,  2 Sep 2026 01:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54F11F000E9;
	Wed,  2 Sep 2026 01:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788311749;
	bh=zkIqO04UB6m3GxxrUtR47PTw99N26Fi59GY1OPoGbkI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=eHGxhsBrOfmPhd1MGSaCsZkDW0687840MC1GU6Qsm6pRNN4e3zRCnFYAW64AmUGKF
	 cq7cn4bG78Ilc5TaKPKwEdJw7Q4GDKCpGtcZ2wypRNRnUfnwMDPib4Fs52KhYrxfu9
	 7XHW7gBGok92gHSYF/TLwUfXQ6q9DZrOD/v/3C7xIn5c9QMb8qd1dxT9PlpKOjDOMY
	 m1Z/aLzi7N8ZYhBH4IFCFtiHLNqxEFzZ+Mokskss8A8FBOoQMe4PluNgVXs87otbms
	 wsUmlWHIEYnraIjDZaElIXfbXg0Am2SvFyBzQR2X7OVFhA1+JSNfLZG/XF79reei8Q
	 3aeZKqx7e7c+Q==
Date: Tue, 1 Sep 2026 19:15:45 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Conor Dooley <conor@kernel.org>
cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Daniel Lezcano <daniel.lezcano@kernel.org>, 
    Thomas Gleixner <tglx@kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
    Andi Shyti <andi.shyti@kernel.org>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
    Jose Abreu <joabreu@synopsys.com>, 
    Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
    Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org, 
    netdev@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: riscv: cpus: Fix yamllint style
 issues
In-Reply-To: <20260824-outpost-mandarin-532989726b7d@spud>
Message-ID: <96962a7c-3ab7-abc1-60f2-48bed0eeae55@kernel.org>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com> <20260824-ultrarisc-dts-v1-1-61ab7aebe9e5@ultrarisc.com> <20260824-outpost-mandarin-532989726b7d@spud>
MIME-Version: 1.0
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

On Mon, 24 Aug 2026, Conor Dooley wrote:

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
> 
> Or I can take it if needs be.

Thanks, I picked it up for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
