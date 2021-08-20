Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0B0C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:27:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEDB961241
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEDB961241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmaocl2bfCvLEoRkK7nIzxy53FFhTP+ZjXqit5g/HF0=; b=vO2zozTcBzLLcK
	6kROjLUdVYKmlAMBWiH9Vmss6L4kn4PmzxfoNz9xpGUEXwgOQdjNqFe9X1leNk9g+TE53KxUFPA4m
	SlDsRCyxp6RQ8QJaYZip0aS0YUBvti0X1aKNef4Lqape6vqgERm3zSXaUDT6XpzCfKsO9YgUSDmKZ
	qsqCWRhuj5I9AUShiBN+Re4WCTLgL5Iu1Ux+/HC91X2SndIrpXjlBpWzZ+60c2Yg7w8f/dbmeQA0B
	uK2bBaAfdDT7AL3iJ8j4qE8JGrOH9MU2qzaJBGv1+3LvYry6dsfpAxeMem/L8gAFZdcIlCatp0Kt7
	qFrlETNEWuzrjMfnk1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH9EY-00BqQH-Ar; Fri, 20 Aug 2021 18:27:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH9EW-00BqPT-Ng
 for linux-riscv@bombadil.infradead.org; Fri, 20 Aug 2021 18:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tdQqeccCak7gZvzJh0sTAGQqu+YU4rsLzWI4kGslWng=; b=ZJbBe6oXsxX7AoqefdSkvbjVKX
 P5f7bDtiCLrra3haNmrU9N9PCmgaNVQ5s/CNFqinUSqm4Qc/Jnk9gM9hVkQzYqGyZbqN8D70oNeeE
 Xvyrwn0m9SzLjkao8fmr7ydM/5Xhiks8Z6mqMbYL+0PnJGDerVm9q+bngGnHRsXlMwzv8Wm9u/RQN
 67qOSlYM5mos5r+CRhC630VaCVtW7wNULIkBGJDl+s+l0hkEUmzg6EzmIWL5VVWXP9t/mQJU/jihx
 RPpHOVJGWmqyuoxA/Wb2nbldQOg6ZTwjd9PxbLAjIs2N4FRTEhrAhohu3r3RVPRFZiDQTLy+wHi/A
 smy81+gg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mH9DC-006qfn-8u; Fri, 20 Aug 2021 18:26:17 +0000
Date: Fri, 20 Aug 2021 19:25:50 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 LukasBulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, linux-csky@vger.kernel.org
Subject: Re: What is the oldest perl version being used with the kernel ?
 update oldest supported to 5.14 ?
Message-ID: <YR/zrjiCwnzMMcmA@casper.infradead.org>
References: <37ec9a36a5f7c71a8e23ab45fd3b7f20efd5da24.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37ec9a36a5f7c71a8e23ab45fd3b7f20efd5da24.camel@perches.com>
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

On Fri, Aug 20, 2021 at 10:27:59AM -0700, Joe Perches wrote:
> Perl 5.8 is nearly 20 years old now.
> 
> https://en.wikipedia.org/wiki/Perl_5_version_history
> 
> checkpatch uses regexes that are incompatible with perl versions
> earlier than 5.10, but these uses are currently runtime checked
> and skipped if the perl version is too old.  This runtime checking
> skips several useful tests.
> 
> There is also some desire for tools like kernel-doc, checkpatch and
> get_maintainer to use a common library of regexes and functions:
> https://lore.kernel.org/lkml/YR2lexDd9N0sWxIW@casper.infradead.org/
> 
> It'd be useful to set the minimum perl version to something more modern.
> 
> I believe perl 5.14, now only a decade old, is a reasonable target.
> 
> Any objections or suggestions for a newer minimum version?

Not an objection per se, but some data points.

Oracle Linux 5 (released 2007, still under support) has perl 5.8.8
Oracle Linux 6 (released 2011) has perl 5.10.1
Oracle Linux 7 (released 2014) has perl 5.16.3
Oracle Linux 8 (released 2019) has perl 5.26.3

I don't know that we need to be able to build on a distro from 2007
or even from 2011.  I think it's reasonable to require updating to a
2014 distro in order to build a 2021 kernel.

For comparison, we currently require gcc-4.9 to build the kernel, and
4.9.0 was released in 2014.  So perl-5.16 wouldn't be an unreasonable
requirement, I believe.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
