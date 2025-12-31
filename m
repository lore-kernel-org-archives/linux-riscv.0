Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA25CEE57CE
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 02:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yGQyBVgyhEFZHOR8MRd5rzS4DpNUY+bibkhTJmK49Y=; b=OsKADZGGII36ID
	/4An4/Jh5AqjEq00ovCHbJuHb3nUCy1CO7t4v7FDsJDUQ9I2ooWyjr9jDHavD2Th4eDYq2ah110fA
	QAghmzqWU7DDPlXL3I4joIn9k6uQGpu4V8vz53ifh8evo41kdnRQkFDPbzDngxV22X49BbTtKGe2w
	0qv+O8wEWqJDmq/6JcItrvwDnK9jMN7mGq1X8GBtsNOSu/B4HmrCpdBGhav3Rcz5F7E04TgmhcK2v
	eBrZTEnKduAMQk1V+8jmNVIiL8v181ksVyQZXRS1AkNF8lDHSqIOBI51e3tdJVCR2bgqfq/16e5j3
	J9lEPIllBVfffUNdgREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valf7-00000005Ysg-1k4o;
	Wed, 31 Dec 2025 02:10:09 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valf4-00000005YsF-2wvA
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 02:10:07 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2B55B340C98;
	Wed, 31 Dec 2025 02:10:00 +0000 (UTC)
Date: Wed, 31 Dec 2025 10:09:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
Message-ID: <20251231020951-GYA2019108@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
 <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_181006_775875_42FD9FEF 
X-CRM114-Status: GOOD (  19.10  )
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

Hi Alex,

On 18:50 Mon 29 Dec     , Alex Elder wrote:
> On 12/26/25 12:55 AM, Yixun Lan wrote:
> > Due to the auxiliary register procedure moved to ccu common module,
> > the auxiliary device id need to be adjusted, otherwise reset driver
> > will fail to probe.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >   drivers/reset/reset-spacemit.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> > index e1272aff28f7..8922e14fa836 100644
> > --- a/drivers/reset/reset-spacemit.c
> > +++ b/drivers/reset/reset-spacemit.c
> > @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
> >   
> >   #define K1_AUX_DEV_ID(_unit) \
> >   	{ \
> > -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> > +		.name = "spacemit_ccu." _K_RST(_unit), \
> >   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
> >   	}
> 
> The above macro is named K1_AUX_DEV_ID().  Why don't you
> define K3_AUX_DEV_ID(), which could use "k3" in its name?
> 
that should also works, the idea of using same macro '_K_RST()' here
is trying to explictly tell users the clock and reset shares same name

> Anyway, if you go this route I suggest you drop "K1_" from the
> name of this macro.
> 
or could further refactor the code, to make K1/K3 drivers share same macro

anyway I don't want to change this patch, my goal here is tring to fix
reset driver after clock common driver refactored plus the modularization 
introduced, it's more proper to leave those refactor work up to Guodong,
since he did a lot adjustment to add reset support for K3 SoC

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
