Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89839C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 00:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ed0ujlEmPFi+s3JYjzkeqNoceVwaoqK4AzYJiaH9vTw=; b=h2hKR9bZ2ljUGp
	TlRaKmY4ZXftpQSN7GILVhu7kHg0RXCD2+MXwX08x4c2wnaT6SUxfcrzkt4iCkztD/dMmhRJCdH/f
	GMlJABooKs1XHRdH2OEtDy1MvISFEtpIcJulBzQv9gsTbhzqCAoNysGstHRAZnqSYBCC+PWmLgqCd
	Gc1jKvCc1qAWqb3sjtqHvzq/bdISSEYCt22W9af32Xd/lT2M0wmaOhoz+1qLFOLaDZS1Lk8levyuZ
	9x+N8LTDGpQ2WSCvFMckmAYr1UjoNL1WojmxGSGKdisIDk9JMSUowQk776awQS29ancdRv5ltAB0D
	ZNRTJ8gocj9g8v5jgE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcxs2-000Qkt-02;
	Fri, 17 Mar 2023 00:22:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcxrx-000Qj8-1r
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 00:22:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 82C95CE1B42;
	Fri, 17 Mar 2023 00:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08207C433D2;
	Fri, 17 Mar 2023 00:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679012569;
	bh=4g9LTlLaYE3kacEznOgMJk6HocV0DFXGW5BGuLMjR1k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=srCuaYO2jTw8X0C3hS178up0Vf7qQ2i17zSSOYHBb1UO84yCq4fe8UE/BzJUeMsjh
	 BCWk8Fn/vrwhe8Fh2ExrDPkcGm342KBioES4AOHyfM2BwhRTh9KSoXhkyT6H6c0Yah
	 nSbMIf9zc3MqmZeqwc+XRL4nNtL7APHvYJiKjNikBE2Hg9CE6TEAU5bUlJFuPvFRCy
	 CChTPk8aQDMlGP3HWApKvafihnOzDffQExKoq2i7aAK3Ku6slxxjaF3ymNhrNBHNte
	 LZDRPftHwfD/H6/KpIcNT22SSj82cYDfmXwYetJkWL7mZ+LKn8hoFYoJfb9RkhZ/cv
	 6UcqjX1ROn4/w==
Date: Thu, 16 Mar 2023 17:22:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Piotr Raczynski <piotr.raczynski@intel.com>
Cc: <Durai.ManickamKR@microchip.com>, <michal.swiatkowski@linux.intel.com>,
 <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>,
 <Manikandan.M@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Dharma.B@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Claudiu.Beznea@microchip.com>,
 <Cristian.Birsan@microchip.com>, <Nicolas.Ferre@microchip.com>,
 <davem@davemloft.net>, <linux-kernel@vger.kernel.org>,
 <edumazet@google.com>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
 <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <pabeni@redhat.com>
Subject: Re: [PATCH 0/2] Add PTP support for sama7g5
Message-ID: <20230316172248.7e05016c@kernel.org>
In-Reply-To: <ZBG9ZVjitIT5rMf0@nimitz>
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
	<ZBGvbuue5e3vR8Fs@localhost.localdomain>
	<cedc50dc-bbfa-d44c-1420-f72acba4bb81@microchip.com>
	<ZBG9ZVjitIT5rMf0@nimitz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_172254_557862_1BF821EA 
X-CRM114-Status: UNSURE (   8.81  )
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

On Wed, 15 Mar 2023 13:43:17 +0100 Piotr Raczynski wrote:
> > It is already implemented. Here the scope is to just enable it for sama7g5.
> 
> Also, since commits lack target tree (net-next?) I'm not sure if the
> patches will be picked by bot and tested.

The tree_selection check reports what tree it ended up picking, FWIW

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
