Return-Path: <SRS0=/9Zu=F4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B240C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 06:39:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B3E22283
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 06:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4B3E22283
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WaQ072bfypXW/1PfNpbPH3FBkJEv43vnKY3L4BApsxk=; b=m/vgXBBDGGDxlwP4pEwxeCnSk
	qLA7AjQc1eKNnXMVA4hW+QGYvxlY3BB4tcHrLeP9yQaCfEgrUTnmNQTURQj31SXtqTFrclFUtB81g
	CQW1VdOb3LpIDom4RmCKRQA9YjXjiSxI6Hjf0skgoMMLyiacgLL15hAPGG2H77jf/JO6lUkbJCkYq
	xVHMP1Y3Ljn4xIZ51smtodSfOV/nLCEBabblPP8dcHptZioUo3S/nXm9mT3a8q0W9q3uzR1LbyUNI
	uA4CMYMdJc9N/0DnXxiqf5IDaqGJ5qvRBIC3mjicu9LGf616mf8X+r+dBkd+PX9QMwQlTFZTqUU9C
	5wcIONshQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksKHm-0003JF-Oj; Thu, 24 Dec 2020 06:39:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksKHl-0003IG-7h
 for linux-riscv@merlin.infradead.org; Thu, 24 Dec 2020 06:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B/IQ3X2M01QsNOxiIDL+MVpeOjEZ7iQ32/mv634iU5s=; b=PBG31iHytKn/dtcZ01sTlXO/pL
 I1VBxfHk7Rk3gYwhUliPsOPl9xW5/+vzHCWcm8zQ277kToCSlhhdSjQSpJ/INnfTR19JpwQLuVck+
 tza4V74f1QxXhoGxc3c6fjxRP1ybMyi/HAHNofjyHibnkdivrKwRN1XSXiAffUFGiQeKh0rKQ2Mqj
 CrdCyUwLV3vMtZWwt0hl3L3CeomdbfwqMXCHibYATBMEhbtIoDnA1EyzL1AMNKdWnihx3aT2IaP5f
 6G1BCiLMD1qe6zaDJCqFwZFfVSwhIjPKiWPc53MBVm+mZesJjcwRXyHQSiSYyY9FrjXYqE91XFZwV
 vDAGvjAA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1ksKHi-0000mS-5t; Thu, 24 Dec 2020 06:39:38 +0000
Date: Thu, 24 Dec 2020 06:39:38 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] clocksource: clint: Avoid remove __iomem in
 get_cycles_hi()
Message-ID: <20201224063938.GA2758@infradead.org>
References: <20201223082330.GA24581@infradead.org>
 <mhng-b2cf0325-66e1-4e3c-bfbb-b393963fbb3f@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-b2cf0325-66e1-4e3c-bfbb-b393963fbb3f@palmerdabbelt-glaptop>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: lkp@intel.com, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 kernel-team@android.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 06:59:34PM -0800, Palmer Dabbelt wrote:
> Aren't we OK with lines longer than 80 characters now?  Or was that some other
> project?  checkpatch doesn't complain, which I guess is why I didn't notice, so
> hopefully that means I'm not crazy (though I guess the commit message and title
> don't provide the best argument there... ;)).

They are allowed as an exception, not the norm.  Take a look at the
coding style document.  And checkpath has for a while not been doing the
right thing unfortunately.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
