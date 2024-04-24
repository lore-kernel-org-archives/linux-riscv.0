Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795E2C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 20:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41VHW2imGhKiSVwE9ulv9dUStXQiPep8WvbExyBuWkM=; b=MEH7IAtkolM3ug
	jtPQXuqN7UoOUQov6VE3jy0pqWy5Q8urMVLIlT3Iijuy2t0V801ynHd2cb9mRPyWlhFBRCmzrtDNP
	1nuUCgAfNJGVjDC9tn4OfRjJkOEF9FZ809Ylo8i+PAKTHUiKuIhdaZzFanMTxzMkkE+HYYa94DkuI
	d4cBF6RQXuTm843+HM0HJFGV8+VVE6QGzov19hjcRWWsGWQZq4unXN88BHiWgjCYJYxwhHzgC30La
	pfdK84aKYyw8S9c0GhvvL+mA1h0phAeq6+Ngbra/z6sfO3ydzHZqTVOaJyVIMdqyQ6OImgj7GVSsg
	zLRtul4l64vpThSiWx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzj5S-00000005srH-0OOA;
	Wed, 24 Apr 2024 20:19:26 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzj5P-00000005sod-11Ak
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:19:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AFE140003;
	Wed, 24 Apr 2024 20:19:18 +0000 (UTC)
Message-ID: <d738dfc0-66af-4dad-bd60-a68c900bf807@ghiti.fr>
Date: Wed, 24 Apr 2024 22:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cache: sifive_ccache: Auxiliary device support
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
References: <20240410232211.438277-1-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240410232211.438277-1-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_131923_445865_64051020 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Samuel,

On 11/04/2024 01:22, Samuel Holland wrote:
> As of commit c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a
> platform driver"), the cache subsystem binds a platform driver to the
> Composable Cache's DT node. This prevents the perf subsystem from doing
> the same for the new PMU driver[1]. To allow using both drivers at the
> same time without conflicts or module linkage dependencies, attach the
> PMU driver to the auxiliary device bus. While at it, prepare to use the
> auxiliary device bus for the EDAC driver as well, which significantly
> simplifies that driver. The actual EDAC driver conversion has to wait
> another development cycle to avoid dependencies between git trees.
>
> [1]: https://lore.kernel.org/linux-riscv/20240216000837.1868917-3-samuel.holland@sifive.com/
>
>
> Samuel Holland (4):
>    cache: sifive_ccache: Silence unused variable warning
>    cache: sifive_ccache: Use of_iomap() helper
>    cache: sifive_ccache: Export base address for child drivers
>    cache: sifive_ccache: Add EDAC and PMU as auxiliary devices
>
>   drivers/cache/Kconfig              |  1 +
>   drivers/cache/sifive_ccache.c      | 94 +++++++++++++++++++++---------
>   include/soc/sifive/sifive_ccache.h |  8 +++
>   3 files changed, 74 insertions(+), 29 deletions(-)
>

I took a quick look and I'm not sure if the whole patchset is a fix for 
6.9 or if only patch 1 is?

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
