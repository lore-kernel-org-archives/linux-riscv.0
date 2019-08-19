Return-Path: <SRS0=iyEb=WP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9238AC3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2019 06:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6473E2184E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2019 06:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nTmnURKc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="epVl8hyD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6473E2184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3teSfBXPxHPZyz3RuwrcIh/49uRW/rj5gPkM/hepvs=; b=nTmnURKcSCkq3J
	tA3lX9M28xyjpr+re0i1S6NZK9zzb0QTMGcN4ObCh6TV7yVNq3N+tRq8qAAaivmOtzl6wXxvrPzNM
	GS/w+UnijD7HkB5810xnjdCoNm4bg1arC9dbp40V7gHYqFFJd0NkvwTXhGA68ceUqG1j7H6cJks9C
	eGiH+5FdGd6Autt8vqAh+9NBwhQx6mSfDs5BZ5Gst7e623wKY7vHrNi9Xj7pAI9Jq9JzMC51nNFxo
	KRE6WdZZVIyCTv+L19CcFqnqfErVa/9HiOH4T+Y0tAPfKHnR2AF5MCUy58BQXGknjvsJD942vfhUk
	loPHUqJIJ/fK3AygjXAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzaqF-0002bV-Fi; Mon, 19 Aug 2019 06:08:31 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzaqC-0002an-KL
 for linux-riscv@lists.infradead.org; Mon, 19 Aug 2019 06:08:30 +0000
Received: from zn.tnic (p200300EC2F04B700DD16340F367BA899.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f04:b700:dd16:340f:367b:a899])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 29AD51EC072D;
 Mon, 19 Aug 2019 08:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1566194899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=MMEqOH0+FlQ5k6rfnVWw/505PbR2ZwBwzOxGbP7W7ug=;
 b=epVl8hyDU59xc4Vq6q6F/+cx8Go92rnrjQ5u5H6XsilcL67UIn3Mpusa9gD8IOP00CHMkl
 JlBHKrSVaclPsjc3i74rRQ7oIXOxv4RnR1GKhqoI9RX9ihYpZ5f899I34U97GJbGlgeein
 vjULeVApAUFfp4aeZq5HE9wG9EoWaho=
Date: Mon, 19 Aug 2019 08:09:04 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: move sifive_l2_cache.c to drivers/soc
Message-ID: <20190819060904.GA4841@zn.tnic>
References: <20190818082935.14869-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190818082935.14869-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_230828_821255_E9C9E90C 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 18, 2019 at 10:29:35AM +0200, Christoph Hellwig wrote:
> The sifive_l2_cache.c is in no way related to RISC-V architecture
> memory management.  It is a little stub driver working around the fact
> that the EDAC maintainers prefer their drivers to be structured in a
> certain way

That changed recently so I guess we can do the per-IP block driver after
all, if people would still prefer it.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
