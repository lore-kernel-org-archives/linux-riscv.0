Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF3C27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAKR6u7nLPbL51RNjOLNpR0WXjvsvxYsPSE2aaL6uaw=; b=pXIY2LEiFpRyf3
	a3afsTtRvS6E5Re8gbfRx012jxn54tfmdRMFFgF2pfAx+CmjG7XMoTIHGqRz9ZITvgzDh/TvAiznr
	aUCSr0KuyTrII3PA+VDG3IvtwVFoE4X3x4Tr6SIE8ORluUpkw1LH0WqkI3TxlKLsMhukBC+DNacvT
	KbsNrkJOZ3HUbLU2YmHeMoyqUrpq9XpKPfQX5E4PUJKuQ4x23Fj8PWOhzmOaj2/vhqkgxBn23DXBG
	xBIp4uRbbf4jQmGEejCmxJp+5SzzSiWZPSQvRNpsmH52/QRkQIukiRgI6azp/hODMYRuurFMrO5AG
	CcfEcClQKA1qKJP3A3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHVa6-0000000EChQ-203Q;
	Wed, 12 Jun 2024 21:32:34 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHVa3-0000000ECfo-30Rj
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 21:32:32 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E7E7845E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718227945; bh=efWY5Xij91b91tKq7ztvtBG+eCPq3ycx19cYryj8860=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oo2oEiyyL3ZzhorBWkO098Y8kGjUikJSut6adZZ+QuiVg9sD6pBwlNbtD8xdO86g7
	 VjhAzclNtXZ6eEwjezQtZcaAL5gLkX15SIY+XSQa9CkdpjOa1+selaXInvIT3vc1kD
	 hCtr5Jm5IhZz7QgkCyVz2mGQNGzSIcrVlPBbS8lOSxCosy8WlhPR7BAt0qB6mPWKyS
	 wDKXtMJtO2lZOZjZT4DbgQTV88zRh5PuOneeDWSymSxvWOG8LDFhoi++hJAQt+S2uM
	 4/GjdttlcfdLOcR+2mN/rNrzpZ9sDrx8Yj6nEHM8HUFeNzReqjGivLn18id3IA6Qpy
	 WEEJ+dVHuju7w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E7E7845E09;
	Wed, 12 Jun 2024 21:32:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jinjie Ruan <ruanjinjie@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
 jpoimboe@kernel.org, tglx@linutronix.de, rdunlap@infradead.org,
 xiongwei.song@windriver.com, wangkefeng.wang@huawei.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH] Documentation: kernel-parameters: Add RISCV for nohlt
In-Reply-To: <20240604114005.875609-1-ruanjinjie@huawei.com>
References: <20240604114005.875609-1-ruanjinjie@huawei.com>
Date: Wed, 12 Jun 2024 15:32:24 -0600
Message-ID: <87le39oniv.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_143231_763372_4829FF57 
X-CRM114-Status: UNSURE (   8.64  )
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

Jinjie Ruan <ruanjinjie@huawei.com> writes:

> Since commit bcf11b5e99b2 ("riscv: Enable idle generic idle loop") enable
> idle generic idle loop for RISCV, but the document is not updated
> synchronously, so update RISCV support for nohlt.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Fixes: bcf11b5e99b2 ("riscv: Enable idle generic idle loop")
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
