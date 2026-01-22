Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B12D3EE64
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CwFW3TkuyoH5SVgcMN9ES1tpMAQ9SWRuXufap8A/6w=; b=ozTsUb8h1RYMvk
	qbmLmvkY1/Z3Tu4XH4F+S8OSVxK3oBK/bURBEP6GiFZqso+2ZQovzwZNx0IRbfI3AxuRpZwdK77cC
	u2gRqDsX7MHTiDyxTotQW5ZBRAf+/NquNfjsO4HISrgJOXlbR9EHsHP9jx0hD3fqfQLVlUa9/oZkS
	Ws/SH5hMxSN8ioM0xI9uL8Ojft/G2vM0kauVbKl8Zh1MjCA71aqAG53AFBojP+2zsbc3/1TywGO+M
	sMjer1rZE8JlizjFEMUpR2OEn7MxZ3THKRhi9t9G+sl0sDi8+2sZ/KcAOmI7hxh6jl5cgsk1JPEmk
	WAiMi6ryVwnthtx/dNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuZJ-0000000785a-2v3k;
	Thu, 22 Jan 2026 13:17:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuZG-00000007852-1p0z
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 13:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gmRCqXSnQWS9fdVWGswfFh7XixYJdcyajsnRAYEfYcw=; b=2qRBYCS1v/AwxR1+18R8KWM/dI
	8+tL0g4HLaPmUnaHbJUVHROgo/hWpRtJnqf8Q6x4MQvFWfh57Xn95ciC9qV5itRJ1fW8VTQ64nQTe
	nrcgNkKfgr0Xf7o3SdRVd6RamysgcezF9Bl0DjVjgDGj5j+FBWeKrUg4pymObHBMojqw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viuZ3-003yOv-DK; Thu, 22 Jan 2026 14:17:33 +0100
Date: Thu, 22 Jan 2026 14:17:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 1/1] net: spacemit: display phy driver information
Message-ID: <b4e0b1d2-cd6d-40f3-89fc-c1bd41c82480@lunn.ch>
References: <20260122080001.73921-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122080001.73921-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_051746_470507_0CF179D0 
X-CRM114-Status: UNSURE (   4.96  )
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

On Thu, Jan 22, 2026 at 04:00:01PM +0800, Chukun Pan wrote:
> Print the PHY driver used and interrupt status after connection.

The standard way to do this is call phy_attached_info(). Is it missing
some information you need?

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
