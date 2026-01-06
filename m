Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87239CEFD0C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3N/dX3iqvlD2RCFEzmH27PkdarLc3Oiw4z7KjdLg58=; b=QMnAJ6ZVpXCf/X
	qB1hjuqIRvS9HSJgD2tWaOTshvJcLeiJvPhEGfYrCvERwMXZ/Gijk+3eA5gFu0wOwUTSzp6GG9/5I
	IENCe1oF8Ig+ZixDMAV8L4DvpQvaOY7wv9byRYtlDrsDxZGyEKHELiSVyR6E15Cynt71CqANxeZ1B
	78KJOEiGQaRrWOJxnRAVY62H7BsWCVLiUWF1/NO261Xw3rYEybrI7Puy0KcH3IqsF1I2PCwKEyZLG
	vNfQVwUwJ5dn62eK59CsDEgnta1ruLyuAo15hpSQRx/H7HTO6/AQJYQH5MbEGTbhDUxqHNid+ajDl
	6rnpNmAOvAO/IztfB2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFX9-0000000DuJP-33dc;
	Tue, 06 Jan 2026 22:28:11 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdFX6-0000000DuJ2-1v4N
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 22:28:09 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7B48C340F7B;
	Tue, 06 Jan 2026 22:28:04 +0000 (UTC)
Date: Wed, 7 Jan 2026 06:27:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v3 2/4] clk: spacemit: extract common ccu functions
Message-ID: <20260106222753-GYA2092678@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
 <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_142808_551520_195C87D1 
X-CRM114-Status: GOOD (  21.15  )
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

On 08:43 Tue 06 Jan     , Alex Elder wrote:
> On 1/3/26 1:26 AM, Yixun Lan wrote:
> > Refactor the probe function of SpacemiT's clock, and extract a common ccu
> > file, so new clock driver added in the future can share the same code,
> > which would lower the burden of maintenance. Since this commit changes the
> > module name where the auxiliary device registered, the auxiliary device id
> > need to be adjusted. Idea of the patch comes from the review of K3 clock
> > driver, please refer to this disucssion[1] for more detail.
> 
> Are all of the hunks of moved code moved without change (I
> think so)?  If so I think it's worth mentioning that.  If
> not, you should explain whatever differs, and why.  (I would
yes, no literal changes with this patch except probe() refactored,
and the real effective change is the module name changed which
I mentioned already

> expect the only thing that would have to change is making
> spacemit_ccu_probe() public.)
to make spacemit_ccu_probe() public, we move SoC specific code
out of this function which should have no functionality change..

(I think the above commit message is ok, and would not plan to send
out another version if no serious comment incoming, unless you insist)

> 
> I made one minor comment below.  I didn't verify, but I
> assume this is all just moving the code around, and based
> on that:
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
[snip]...
> > diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
> > index 4412c4104dab..5f05b17f8452 100644
> > --- a/drivers/clk/spacemit/ccu_common.c
> > +++ b/drivers/clk/spacemit/ccu_common.c
> > @@ -1,6 +1,177 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   
> > +#include <linux/clk-provider.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/mfd/syscon.h>
> >   #include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +#include <soc/spacemit/ccu.h>
> > +
> > +#include "ccu_common.h"
> > +
> > +static DEFINE_IDA(auxiliary_ids);
> 
> I'd insert a space here to make the definition above stand out a
> bit more.
> 
do you mean a blank line?
(I could do this while applying this patch since it's quite trivial..)

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
