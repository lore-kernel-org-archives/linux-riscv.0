Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB7D2ECE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcm1ch/VjQzc0eJ5ZIQ2wwtr+2R62id5mz98KOST8cg=; b=KcDmblZwPGXNTn
	q+MrWrRS4uKd93wZlJDrvKAWKeH64WHl/ob9ziTiLBCLoSHRyGXplMPJvHetzRJjtWGMl8DjPz8Li
	tYoEtXt9vGP8hkc0VrTH5UOoG4rro1VapHf511uceOJhdbSBHvM5zBa1P6qelrmQ74PsPuWrB4ZtK
	EBv4Q6rsctTKM38aKwNWH5ymUHLax9Kz75/52WgKe3Z1vp9L8iEpfHPHLqzY4GWZG9thDkFFLlrtg
	iiDyuoGv8S0dFGwdvSyRJB2cltPluirPB1frqpG7kwpSN2sc8xu4gCyOLZpsXNBx09lx2hxsgB/Sz
	Q0LFstfRVEhCC+nsMdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viC0m-00000003vVx-0NTy;
	Tue, 20 Jan 2026 13:43:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viC0j-00000003vV7-3BtQ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 13:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=heuQ1Tbmi8A/rtNvMDuDrfbmSG1bgNIXq1tHuJAGZt4=; b=acaqB8Dd7K4ewFfzDhla1CfkRN
	+Tlp+Dk9kYrkVLnFW3d8MQ/kAdrwUbXdGbwASsXTOZbC/21HoFvQp2m+OzZfAs8UAxXEjsO1Wv5gO
	9Rhjt+Z5Vo1blGocTs4EbYM4u3vKPpQ/73CFA/Qyxhx84NSYFFqCqueF54o7Ytx0LT0I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viC0K-003gOw-Qu; Tue, 20 Jan 2026 14:42:44 +0100
Date: Tue, 20 Jan 2026 14:42:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: spacemit: Clarify stat timeout comments
 and messages
Message-ID: <0f74cccd-4198-4a8a-92bb-4d4e6ae63e8d@lunn.ch>
References: <20260120-k1-ethernet-clarify-stat-timeout-v1-1-108cf928d1b3@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120-k1-ethernet-clarify-stat-timeout-v1-1-108cf928d1b3@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_054309_820071_19F10676 
X-CRM114-Status: GOOD (  15.65  )
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

On Tue, Jan 20, 2026 at 12:19:23PM +0800, Vivian Wang wrote:
> Someone did run into this timeout in the wild [1], and it turns out to
> be related to the PHY reference clock stopping.
> 
> Improve the comments and error message prints around this to reflect the
> better understanding of how this could happen. This patch doesn't fix
> the problem, but should direct anyone running into it in the future to
> know it is probably a PHY problem, and have a better idea what to do.
> 
> Link: https://lore.kernel.org/r/20260119141620.1318102-1-amadeus@jmu.edu.cn/ # [1]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

It is not clear cut, but i think this could be useful in stable. It is
not actually fixing a problem which bothers people, which is the
criteria for stable, but it is pointing people towards the solution to
a problem which will bother people. And since it is mostly comments,
it is safe.

Please add a Fixes tag for when the driver was added, and base it on
net.

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
