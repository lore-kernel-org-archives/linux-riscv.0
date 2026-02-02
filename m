Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A73E7FDF0
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2x9ujp/gD2rXyUuBbSxVwsNh8jRQxwisl+Nf/MRwYyI=; b=iH3ybcYGhFc0i3
	WwNB9fhWyAuqEot8SPUV/FSS6EJeK6oFuC12ncXeKl5RqdVtRfyssaR+8D7Q93pCmoxjjN+AlAqYG
	CkyXMRpESGFz7gGm325hy2KbFzQdj/dnyHfMO0rC3H+s4cEPi5dlO9bGLxJRo48FrxDPl+kH7wqrm
	amDyGn7YXuIe5rgQTeUTfxza4Cvh0G711I1iHMWD6dLtijIGcGPDIdD9j3nAVWbZ4qDCQfyu663AJ
	1+IqcweqMgDLD/952WfnkDpQzSICRz5dIC7vC/I4xVW9JEu2cWXejLxJGPI4LVnOWZiMwzUaN4SYq
	E/WH534cqXxdH8mSzsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn1hH-00000005fX2-1QzV;
	Mon, 02 Feb 2026 21:43:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn1hE-00000005fWj-34Gp
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 21:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X+rJcB2Y3qMDo56ip7zmJMMV7jKekUzDLMK8Xoy/uag=; b=4kOt8Uz7i0mzzy8jrwtiH1Kwzx
	uUOJtiRZNlPHGyAlZwIPCcxtxOolOVgw/aXNtkbbMovey+opbxKkDEjn6Kfqt/NOtpGxsjjnbdBSX
	8GTXNJiALuzNd0KGnzWhsiAqeqBkS3LfriJFK5UhOJxrBKQyTaka1VOmJ3c/PUbDVjTY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vn1gw-005sFZ-Kg; Mon, 02 Feb 2026 22:42:42 +0100
Date: Mon, 2 Feb 2026 22:42:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/1] net: spacemit: display phy driver information
Message-ID: <35c9e98d-58f1-489b-a635-4755f518da96@lunn.ch>
References: <20260201100001.33102-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260201100001.33102-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_134300_773435_A375A7D3 
X-CRM114-Status: UNSURE (   5.74  )
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

On Sun, Feb 01, 2026 at 06:00:01PM +0800, Chukun Pan wrote:
> Print the PHY driver used and interrupt status after connection.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
