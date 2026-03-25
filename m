Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3B1109C04F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae+gwZucbtzYDkcCfxLtlNNal+U35TmrOn+GFcVV880=; b=oqKrm2Sg4s9AYM
	cSG0dbL/ld4GMd1UMw5syLXmcmQvkZynRUnyqR1AW/hejIK1KLgp2dQa6sZ/L3MZ2ol+35tI5f2zs
	x33911YLz6hOuJR8M1bsA2bxKZs3QHPNYL/9KjX4LX1/ty7kNvqjJgeh86zVHQcX58in6GtKfdxJv
	J87F4wYZPlJLcI/QWbkZkzWO/sqA9rkHGtK0ooD3vgJfN3BIXHmk78CoC/emAPcfYjRSbF6BOyUCb
	r1qEVkvVON9ATMRRo2HLRm1T/8AxoS1lA3lIn+uaL5r1TeXZu38oPhkwy7VbZRZnGWuCX7G+T4GAe
	ksNdbSpDHI4HsUOe0y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Sa0-000000042Kt-1tGk;
	Wed, 25 Mar 2026 18:03:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SZv-000000042KE-12GY;
	Wed, 25 Mar 2026 18:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAC5044529;
	Wed, 25 Mar 2026 18:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8DAC4CEF7;
	Wed, 25 Mar 2026 18:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461817;
	bh=z+3MKcnaVgxUUEFrOwwtAjO55jdTD/Aap52HWyvjU10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cgbXDzFKuEwm0erfN2A14a6MqFPpdOFQ+JZrgxmk4/cS1JbAJDF8DZga7kHsEW5bZ
	 zDYC9Jir/eUEG4lbfiVZe4uP96ssgyIY6mC9r3aGjmXQ+dEfU+oewxtydbBUifUGEg
	 qTuY79FjkjNFPwzlz+1D0lSMPKb0UQ/USGXaohr0W/6ZhTtG4INz1/q9/UDHusbsr+
	 tfkSjgKZdLFKfiygvCDhjoEEIJ4WTeYnnVLTNA2ZfTTtVLbiBJUxuK0ALluwhxtlfH
	 5QX5ElCYZzn8oYIv/rLT+1Y7hF027n1q3Xh4asYYc2UnGeCba+yIuvBc+ygqYIvYKQ
	 ZZNqfjEBOpdLw==
Date: Wed, 25 Mar 2026 18:03:30 +0000
From: Simon Horman <horms@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v5 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <20260325180330.GL111839@horms.kernel.org>
References: <20260324073017.376-1-lizhi2@eswincomputing.com>
 <20260324073408.439-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324073408.439-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_110339_310412_A967C267 
X-CRM114-Status: UNSURE (   8.38  )
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

On Tue, Mar 24, 2026 at 03:34:08PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 42 ++++++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 66 +++++++++++++++++++
>  2 files changed, 108 insertions(+)

Unfortunately this does not compile:

$ ARCH=riscv make allmodconfig dtbs
...
  DTC     arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dtb
arch/riscv/boot/dts/eswin/eic7700.dtsi:300.28-330.5: ERROR (phandle_references): /soc/ethernet@50400000: Reference to non-existent node or label "clk"
...

-- 
pw-bot: changes-requested

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
