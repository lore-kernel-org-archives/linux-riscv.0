Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDDBC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:57:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F76E205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yqvlf+gg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="I/aup73m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F76E205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MNSKpisSawVh+z8z2O5rtVFEkEAJC+6ZK3wGGEimIA=; b=Yqvlf+ggoxqjRr
	FxDYwmX6gMysMRNfcdAvgIn8/MIocyJy35HIux6+7Ulw0qfAxlWoufBkgqOgfIhlZ7VR0ZHGkLBwy
	PUdzfc2J0kh6DtRQS4SKYRxXVz+sqY59tky8H51z9STrM/hjrtX3xC5xTqjuXRZhn5U3vGrFs/JHu
	2WAgh2q+EHM0WFeArlT8d848y2b2sYllBQvu2K5UoDBQyBfIUgdfK33NxeRzDYpflZQcIiyO9d9YI
	sRhTvLnyh9dor03/B8lA1znmTNusfl+oGHOwBCSMiNwmjeI3ItvVQLiy/8CQ4PpH3dqOnw+vwi9Sw
	DvaL7iigKLWOu3KH1sTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JY8-0004j6-6u; Mon, 25 Mar 2019 06:57:36 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8JY5-0004hw-G8
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 06:57:35 +0000
Received: from zn.tnic (p200300EC2F098000329C23FFFEA6A903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:8000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1ACB51EC02AE;
 Mon, 25 Mar 2019 07:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1553497050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=4wRxjA7GSTQW4GlR0c5nCg9HhQqSZHhaDWN+Jbcsa7s=;
 b=I/aup73msPi+FWxB7oML2Qx9P7iBMaosvxMqpm6cdnobj+OIp9mI1ZwM8gGJHtKDSb7xJg
 ja5gbNcQUreiosV217PhjkRY8ihpSQffDcbzkK+dEyh1h/dKG358xTDYTKLuk2Ept1j4o8
 JxoVT+ogg9OPkXUejOBZKT9yUK96LaY=
Date: Mon, 25 Mar 2019 07:57:37 +0100
From: Borislav Petkov <bp@alien8.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
Message-ID: <20190325065737.GD12016@zn.tnic>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_235733_692052_D4997BED 
X-CRM114-Status: GOOD (  10.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 05:23:27PM -0700, Paul Walmsley wrote:
> > +	if (!IS_ENABLED(CONFIG_EDAC_DEBUG))
> > +		return;
> 
> Can all of these debugfs functions be wrapped with an #if ... #endif such 
> that, if CONFIG_EDAC_DEBUG is not set, they will all be stripped out by 
> the preprocessor?

Why would you make the code more ugly with ifdeffery?

Do you have any serious code size constraints so that you absolutely
need to remove a couple of KBs?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
