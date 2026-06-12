Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4906ACD98CF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMztvIhbwCtw3eymOqdTFrswE12aXMBZZmlmROt/kGA=; b=v7EOIkkQDw10Pd
	TZ5WlZZDNfHqUzZfnR6jeDgjWWF+Fed4L30/A2zoScpxNoa8+gIJighya4ss3scMMpkLe3tEyolhx
	6SCs+CCzenQbje6ucDf138+zdY/k356jhtnXxzoTANy7SpZ+02ECS7SIKeHby78PHIJcpz4oPl4Uz
	QxAk3lh5Hd/78yhhFS/zWTquXTAUKLbBx9Co64NSZ3oN0gOCqflL2iEzAzT2waFxfp5XpVxqCD+dT
	4F5Q/bSm14GPEg4RjIMEhVr0UoJtbJnFngiUbtLSh0tZgcrsOdo9PRppqRaojE2PElszWWIWiYm9J
	gPSyBcBRdQEJRFDuuAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4kd-0000000BHWW-3A13;
	Fri, 12 Jun 2026 16:28:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4kc-0000000BHW7-231g;
	Fri, 12 Jun 2026 16:28:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E674E600B0;
	Fri, 12 Jun 2026 16:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721D61F00A3A;
	Fri, 12 Jun 2026 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281737;
	bh=+YkxKUKI+ttSACYhasK/qyZ52eMUZtHTMnbDNaJgTnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eMyYsFKVUI/AjLu4yjm2YPH2WCOHHt0vmajj/lYGVjak2UUxMEoPXOfcSQd6EBfR9
	 aOjYNII68yBM3a4I/TCiIw3bRZKAN+l6K6VvvUqD8aN53ypgvtHXwSyKJUGBj8P0S3
	 r5Z21FsWp3P5LFTPi5nbgn4RFu1fKWS8vAqAPIT8fwAmc4Oljdi8XoSaJqg32wn65u
	 pAfPPEonX3LBEnxBELdEb1nRhciHC6EM5SDFFzTqOLezeUD7OxvInbS7j/0U8jF45e
	 mCHqUhc167JQC28Br+UXJfsFJpOyjYK2/yr1BZX5jRJAx8qDNiG89SIj0ROK6QV0oh
	 2nIxjNmVpkwYA==
Date: Fri, 12 Jun 2026 11:28:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: lizhi2@eswincomputing.com
Cc: pritesh.patel@einfochips.com, linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, edumazet@google.com,
	linux-arm-kernel@lists.infradead.org, pjw@kernel.org,
	pabeni@redhat.com, weishangjuan@eswincomputing.com,
	linux-riscv@lists.infradead.org, ningyu@eswincomputing.com,
	krzk+dt@kernel.org, pinkesh.vaghela@einfochips.com,
	linux-kernel@vger.kernel.org, alex@ghiti.fr, andrew+netdev@lunn.ch,
	alexandre.torgue@foss.st.com, kuba@kernel.org,
	aou@eecs.berkeley.edu, horms@kernel.org, mcoquelin.stm32@gmail.com,
	conor+dt@kernel.org, netdev@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, palmer@dabbelt.com, lee@kernel.org,
	maxime.chevallier@bootlin.com, linmin@eswincomputing.com,
	davem@davemloft.net
Subject: Re: [PATCH net-next v8 1/6] dt-bindings: ethernet: eswin: relax
 internal delay model to range-based constraints
Message-ID: <178128173639.1162200.4235173600332300329.robh@kernel.org>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012849.874-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260610012849.874-1-lizhi2@eswincomputing.com>
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


On Wed, 10 Jun 2026 09:28:49 +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Relax internal delay constraints for EIC7700 Ethernet binding.
> 
> Replace fixed enumeration of rx-internal-delay-ps and tx-internal-delay-ps
> with a range-based definition (0-2540 ps, 20 ps steps) to reflect actual
> hardware capability.
> 
> Mark rx/tx internal delay properties as optional, as they are board-
> specific tuning parameters rather than mandatory configuration.
> 
> Update the device tree example to align with the relaxed constraint model
> and remove delay properties from the example to avoid implying they are
> required.
> 
> No functional change to existing DT users.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> ---
>  .../bindings/net/eswin,eic7700-eth.yaml       | 25 ++++++++++---------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
