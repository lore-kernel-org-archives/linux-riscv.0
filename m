Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A58CA1007
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 00:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wmg2ZWnIv6s10w2h8OSFRwrVANpRHBx4R4jmK6Gzu3Q=; b=T1dS1dn72Ps5NP
	5KRMMuFrHvN7L+13rkYiBPjX2TBkRli6qGGczZKTb5eopbUF39CZRdEgfTBouzMOt0YrcdgUkDIpK
	oLv485+vbMfsUsSg0BYZK5Hkc9YaaAWdUMlBSdu9yyMYWOavivfE/lrSBHQGFrMxayYzufca4+eAp
	3Aug3X6LrO6uFhoztG5c8PCf8pXz5hK/t3IFdtm4iiDEGI5XHHLFiH9Y/IJHfrzFYJSryBqfc9LDy
	hGvM0FKBJ92672QPejBdBEN01T+ozDiDgaqaF8dC4YfLWbIdU/0LvL5WQv0HXh2Ou1Di3fhGL+m/+
	+lksAPeOt9oyveBdmnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbfG-00000002uSo-41CM;
	Wed, 03 Sep 2025 00:47:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbcF-00000002pHA-0VTo
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 00:44:48 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7009422C2E;
	Wed,  3 Sep 2025 02:44:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tin-IeOjfvhF; Wed,  3 Sep 2025 02:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756860284; bh=4Q4jmlqtVkdofhfxPNeavNd3XW/TzX0LexA49k5UNd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BBF2+QYn9rM9g4zL2ykVvXd9eo/5cigkNzYW3wl1pxUCDk3/SxXnpOkjbSAtyNklx
	 RBICKIMH8l1QLb9aswytIQwDfGqeI44qsV8OrA1xhGHl49LhHFkse/jU6mHQrgNbUw
	 FL2wKts8nX/kqAIvt4qd/u3Nd8PtnUzKDu0CAq/JoxySWq/NvRzS1eyNP8FaTjQydd
	 uOJ1ux4BzxF/k4OKzhYh0yA6FrIcTS1C4l6B2tssJ6iSoW/DQ2gQq897HIhxf3g0Fx
	 MGM3g4yToe0+Xq6vCoFO/e/+sAVI6kQMMrTkN1qMJk+tpO3svR2ZQ2jvcQ8w+BwZSj
	 FjUO2SNUBFTTQ==
Date: Wed, 3 Sep 2025 00:44:25 +0000
From: Yao Zi <ziyao@disroot.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, fustini@kernel.org,
	gaohan@iscas.ac.cn, rabenda.cn@gmail.com,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, guoren@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	m.wilczynski@samsung.com, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, wefu@redhat.com
Subject: Re: [PATCH 3/4] reset: th1520: Support reset controllers in more
 subsystems
Message-ID: <aLePaQSMLgiGsbf_@pie>
References: <20250901042320.22865-4-ziyao@disroot.org>
 <AM7P189MB100965809B3DE48A90A15415E306A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM7P189MB100965809B3DE48A90A15415E306A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_174447_316410_F157B7F7 
X-CRM114-Status: GOOD (  13.76  )
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

On Tue, Sep 02, 2025 at 04:15:08PM +0200, Maud Spierings wrote:
> Hi Yao,
> 
> > Introduce reset controllers for AP, MISC, VI, VP and DSP subsystems and
> > add their reset signal mappings.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> 
> /* snip */
> 
> >  static const struct of_device_id th1520_reset_match[] = {
> > +	{ .compatible = "thead,th1520-reset-ap", .data = &th1520_ap_reset_data },
> > +	{ .compatible = "thead,th1520-reset-misc", .data = &th1520_misc_reset_data },
> > +	{ .compatible = "thead,th1520-reset-vi", .data = &th1520_vi_reset_data },
> >  	{ .compatible = "thead,th1520-reset", .data = &th1520_reset_data },
> > +	{ .compatible = "thead,th1520-reset-vp", .data = &th1520_vp_reset_data },
> > +	{ .compatible = "thead,th1520-reset-dsp", .data = &th1520_dsp_reset_data },
> 
> I believe these should be alphabetically sorted on compatible name.

This is sorted according to the order they appear in the TRM, but yeah
sorting them alphabetically makes more sense. I'll do this in v2.

Thanks,
Yao Zi

> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, th1520_reset_match);
> > -- 
> > 2.50.1
> 
> Kind regards,
> Maud
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
