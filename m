Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EE4D35660
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sx+8h/FpTnCt2eJftMTRpkFJOZXSgfJD8Bgqvpx/1Tg=; b=OWhGmIHZDr70zM
	S3ZMGWqgYu9cCsJjGRSy8zhkYjYVaDUe2K0GC9jdZVU/LwmiEKhO/chj18bpSJw+rb4WsjBOJiUjf
	OpP0KOHZTaBtROr9GMkqaW1sSPXYDnzV5WeUwOCqnrb1h87E/P46y+x17LFI86D9/xZOdF+wht6VO
	hn4j2fRGlUcbAsL9zLmcQRPUUEkjrZUnD0/2IaXTOyANw1cR3DKmtDH+oMnqYwOh1tfZgJZxXIJnK
	MnerMuBxGuD5Sg03I0srtbY/l/OLyZY98hUt/y+RXsVAK0awD30Gh8AJpTt6aSnDCD/DkqklXpay4
	12qp6TFWZsESr5du88OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuHv-0000000FFsf-3pp4;
	Wed, 28 Jan 2026 01:24:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuHs-0000000FFsI-3FSJ
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 01:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 639B64342C;
	Wed, 28 Jan 2026 01:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6F1C116C6;
	Wed, 28 Jan 2026 01:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769563443;
	bh=zWQSF+eV1gOie95S0/r7LJ+YoKdKXI9YPlReRAkCHLU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G9Y5hbQzTbBidacihpKIJr9Odc/oR5CFooSJKh0uzM2rdbMVg/AYYDyi7y8Alco0w
	 n4Ln5QDS37K+tGmojlFAg3SSgtztPQ0to6qXDmDoyaGw/qgvrUggHx64Kd0CBpqxfL
	 x6620UeVKJj9VmWCeBv4jvvSPXOS40V7eY+DRQIoSFfiCOhad1F7om/oVPseY2T81b
	 OJIlOrhASfg3/A3B5fUBzXU+csTqgCkPb2Ih1P5Oh93TXI2N7KIFKVChGvUYPTvuvm
	 iCzyLqelec34/prSs/6NGNqAL+8q1CS5U4vTtZErx0ExZreKvh2emETD6sJ0POypZ9
	 /Jkn3q2ZL2CTA==
Date: Tue, 27 Jan 2026 17:24:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Tomas Hlavacek <tmshlvck@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Yixun Lan
 <dlan@kernel.org>
Subject: Re: [PATCH net v2] net: spacemit: k1-emac: program frame size
 registers for jumbo frames
Message-ID: <20260127172401.4bb7bd83@kernel.org>
In-Reply-To: <9f424b4e-b83b-47a0-8637-3df25e504be7@iscas.ac.cn>
References: <20260126135919.77168-1-tmshlvck@gmail.com>
	<20260126171449.83288-1-tmshlvck@gmail.com>
	<9f424b4e-b83b-47a0-8637-3df25e504be7@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_172404_842439_681B0D92 
X-CRM114-Status: UNSURE (   3.93  )
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

On Tue, 27 Jan 2026 12:58:21 +0800 Vivian Wang wrote:
> Oh and... maybe these should be priv->ndev->mtu + ETH_HLEN + ETH_FCS_LEN?

+ 2 * VLAN_HLEN perhaps?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
