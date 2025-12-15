Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE37D5B871
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1ffjTj2WlrPNteCY4NNBn5Z4S2MU5ytBhJFHGWTsgo=; b=Sk9B9HKlfk6MWN
	q+Kyhj/1b3AQtvcEV+t71SMEAfKv2Y1NB9KYLSrCaIwOa1RAN+urhPv3NtI8dgi4GUaqqgoNT/yg0
	hnXsQBPkoKI+iK1l9wN/AoSoXnWDtWyCE+0R5HqL79sbQIOb7KwRB6Tm2mS0bQMM5iXL+FvKYV79C
	EIUZyxhggkWOdL9Yn3UIABsi+uq0XTxQv7b/chwbZBD3QUqU967Xgbmb+GLDahBko2TR6JAZ5AToW
	RGqFU+52qCRKQ/bZR1ThLfPVqhVlDcYdE1oY1d+ytDuKP+RVHwh3WqPP1dRqivquD0Mq1OBHu/mLb
	10F39QMA21eXXrlssCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGuF-00000004Lcp-0CIr;
	Mon, 15 Dec 2025 22:19:03 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGuC-00000004LcP-26CV
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 22:19:01 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6229B341036;
	Mon, 15 Dec 2025 22:18:57 +0000 (UTC)
Date: Tue, 16 Dec 2025 06:18:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Brian Masney <bmasney@redhat.com>, Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <20251215221853-GYB1903981@gentoo.org>
References: <20251214232938.668293-1-inochiama@gmail.com>
 <EE6920993009E270+aT94cmKTM0tHn8Ly@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EE6920993009E270+aT94cmKTM0tHn8Ly@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_141900_585464_E92AF700 
X-CRM114-Status: GOOD (  10.56  )
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

Hi Troy,

On 10:54 Mon 15 Dec     , Troy Mitchell wrote:
> On Mon, Dec 15, 2025 at 07:29:37AM +0800, Inochi Amaoto wrote:
> > For build spacemit common clock driver as a module, the build
> > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > build will fail.
> > 
> > Add these missing hints, so the driver can be built as a module.
> > 
> > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Thanks.
> 
> Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

I think it's more proper to use reviewed-by here, for acked-by, it's
up to subsystem maintainer or original patch author for signifying
explict agreement or acceptance of patch inclusion..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
