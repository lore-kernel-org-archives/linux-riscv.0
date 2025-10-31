Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE23CCFA00
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+kWUY3fwt6kwnHBJnGUCjenaIkg9RT9rZvEOlaQwM4=; b=up04/CeF7JM7Nj
	WxKsk/fu0U9TVTE8ckXTuyGO56Q5JZdkdO0oteiqaIw7eGeJYAwqTbLPIh/XHXzEgOGxGNZmnTmJ7
	XGBgNJGFUCH9O6hWYCnEuP3+dk0YonaVFLFOlYoeZR5PUGzkcxvC26Ch27lGTXhv0Vqgy+Ibzgbu5
	LaPOhfjyEWEICVdLLjeyahH2e50KM0K36Xody9CNTQoidFa1Br1LUJTuUkG0ZUkqMoAPcHr21elCh
	ulNs+jSZj7j9S542rd3Z8vXY7ZBqnWdmguLfIJvpC/5sPFjrSUIZFXDX6kr7DdN/7aqzGCwThu4ku
	NO4+ZCU45qdh4jrtC0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEryg-00000006PJZ-1o1A;
	Fri, 31 Oct 2025 16:27:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEryc-00000006PIb-3jX8
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 16:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rZ5u2OHM4W5d6szB9Bv+CCsJsD0TGOZIN3GnPAec3+w=; b=ZMxzuSO2ccdhIWm5zO17X7N0hj
	fZG2XJboLYQpg6I+YlP6jenLMIfuyR8mRymm+D9sMhI9qdXT+fcbaCETx8Gn9C/DwDBQmMEEEIwSt
	HQ1M8dijbElQpMZYfMWHEFQnkvMeijVCekyGVbwxPf6QYmsBQbEMBGhhkuLM5nHSHpMo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vEryN-00CcCA-65; Fri, 31 Oct 2025 17:27:31 +0100
Date: Fri, 31 Oct 2025 17:27:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: spacemit: Remove broken flow control support
Message-ID: <dce4340d-a272-4b86-a7fa-71e6286f798b@lunn.ch>
References: <20251031-k1-ethernet-remove-fc-v1-1-1ae3f1d6508c@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251031-k1-ethernet-remove-fc-v1-1-1ae3f1d6508c@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_092746_929200_F7E0EB81 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri, Oct 31, 2025 at 04:21:53PM +0800, Vivian Wang wrote:
> Currently, emac_set_pauseparam() will oops if userspace calls it while
> the interface is not up. The reason is that if the interface is not up,
> phydev may be NULL, but is still accessed in emac_set_fc() and
> emac_set_fc_autoneg().
> 
> Since the existing flow control implementation is somewhat broken in
> general (for example, it doesn't handle autonegotiation properly),
> remove it for now to fix the more urgent oops problem. A better
> implementation will be sent in future patches.

Fixes for net/stable should be minimal. Please fix the opps, by
returning -ENETDOWN and leave the broken implementation in place. You
can then fix it up in net-next, were we allow more invasive changes.

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
