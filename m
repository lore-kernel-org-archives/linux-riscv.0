Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE10EFCE4B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcv6XEY5n2Ut8g8Cy8QE8el3xSfr1iVnjem7m0Fla/0=; b=auh/ThyywWS5Tu
	4VX2Z2HI19GhDL6uEO3d2e4ypPwNI5gpfK7J9kQrMezcdf9Bz3eFie1hBpiKQUcvFVgOKgaO2QELh
	uoABlmTilYBmNzPg9pBlc1ldItrf7L3tYmswscDuWAs7jaYdrWAqczTRHVzOlDN8ZwysRNtXUrf5I
	GQwF/wxO1Z36YCLZh8myCcJPUQhawciCajKsAXRqjRQrApNVgIXF66pKgAZC4CN6HSbltRSyypd++
	NciiztMzqjI8hagFIZ/+U3H9jPqFjPd09gCv8KYLxfk0cB4P2trD9H/2d6NwMvAdtI6eaam7aHDuG
	mwkAy8/qNrh9OOwufgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtIY-00000000TsC-0FVy;
	Wed, 04 Mar 2026 20:58:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtIV-00000000Trq-47Uh
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 20:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nJEhDLvUh+H18Fkmzg3CFif9ky3ccbPDC/ejtdiiJKY=; b=JjdlpkUHcTrQd+IgT8cRmCyU8V
	9XTH4ze8fSFJUfXx/QSPU5XgITc3DPwpdsSN0Q+rA2PZ1s4AL21O505m4aEEIobNeuN2dD+FGdOSV
	ffx2jzzabKJdug+Jqk3HDBCOTGCwjB0yjbaXha3Lu9cQcMkWsorYrMx0ExeQum+noiEw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vxtI5-00AAqo-JF; Wed, 04 Mar 2026 21:57:57 +0100
Date: Wed, 4 Mar 2026 21:57:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] net: spacemit: Remove unused buff_addr
 fields
Message-ID: <02bbff3d-1f27-4b03-a963-660bbb7facee@lunn.ch>
References: <20260303-k1-ethernet-more-fixes-v1-0-0ab0122fdd14@iscas.ac.cn>
 <20260303-k1-ethernet-more-fixes-v1-1-0ab0122fdd14@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303-k1-ethernet-more-fixes-v1-1-0ab0122fdd14@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_125824_034075_D3BE7958 
X-CRM114-Status: UNSURE (   5.35  )
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

On Tue, Mar 03, 2026 at 05:24:18PM +0800, Vivian Wang wrote:
> These were never used. Just remove them.
> 
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")

If you are giving a Fixes: tag, please use the net tree, not net-next.

    Andrew

---
pw-bot: cr


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
