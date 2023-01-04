Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71107C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYYs/ZHlkWXSRpIkBeucXdfWcGe/cd23LxQJhhF8L9o=; b=0rngpVJVH4Ac2f
	n7yKfNZXw/HlcPJjJVomhITTCyZqhDpE/vq+f2zKahxXpsPin5HgEx8K7jMJ3wA9au9SPAg3VplHy
	UDLEMu0oY2Ip8mXvtj0FdIM+lkW2t0yQ1Z/ABRZNnIvBAWUtY4DmVKJX3jWo4JKsR46pfs0QB33fA
	T4rUxtV9E0YwOVo6y6VxMSJ8jcAH9OzGBTXU4+ttynKvkAGz/TI1aEGEEKgiu0OVzrvHLWN46Ln48
	II1tx6j94t8P4Fbsi8pTIv2cak9YQhnAWLDbSfI9Vh4iDwVexSFss4quqSzvXgYNkkbzX/zAdJlQ8
	HyyiYB7/k6TOLV6rzGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6BJ-00AGz4-TI; Wed, 04 Jan 2023 15:59:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD69X-00AGcH-8p
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 15:58:08 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pD69R-0007mv-D8; Wed, 04 Jan 2023 16:58:01 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu
Subject: Re: [PATCH] RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
Date: Wed, 04 Jan 2023 16:58:00 +0100
Message-ID: <2035002.VLH7GnMWUR@diego>
In-Reply-To: <20230104140833.nbulmdsgcm5x7d47@orel>
References: <20230103214228.841297-1-heiko@sntech.de> <Y7V/NZdDf4TpPBh9@spud> <20230104140833.nbulmdsgcm5x7d47@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_075807_360602_2450AC36 
X-CRM114-Status: GOOD (  20.37  )
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

Hi again,

Am Mittwoch, 4. Januar 2023, 15:08:33 CET schrieb Andrew Jones:
> On Wed, Jan 04, 2023 at 01:29:25PM +0000, Conor Dooley wrote:
> > On Tue, Jan 03, 2023 at 10:42:28PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > > RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
> > 
> > Hey Heiko/Palmer,
> > 
> > Was a little hard to tell from Drew's mail if he was objecting to this
> > variant of the patch, but FWIW s/decup/dedup/ if this gets applied
> > as-is.
> 
> I wasn't completely objecting, but rather suggesting we still try to
> factor out what we can. However, after reading a bit more about macros
> I tried this
> 
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,   \
>                                 new_c_2, vendor_id_2, errata_id_2, enable_2
> -       ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
> +       ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
>         ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
> 
> which appears to work for my simple test. Does that work for you too,
> Heiko? If so, then I think I'd prefer we do that. Also, we may want to add
> quotes to all macro arguments which may contain spaces, even if things
> seem to work now, e.g. the \new_c_2 argument passed to ALT_NEW_CONTENT.

Yay ... adding quotes really seems to work - at least a GNU toolchain

I guess that may have been the reason to move new_c at the end and making
it vararg in ALT_NEW_CONTENT originally.

And in fact with added quotes the varargs argument wouldn't be necessary
anymore.

Just removing the varargs argument alone results in
	Error: too many positional arguments
erros, but wrapping the "\new_c*" in quotes lets it compile again.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
