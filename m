Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96457C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 05:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9FsmVLnfEGwMWqmA5PZmrrD3w0WiwC/p+QXLBZ72BI=; b=WIhvx8o+9mqMlE
	GYaPxqlWZXtVXu1D9Xw6u/lpAz9qohAfQbh7AgOsdqznXGt3Qa1OAu0iMJxWfkCVwPTYmWELzDfEP
	Dywvy0HdPr4oSxIfmCaXjsTeen0318zrULqfFHttSZ4StgvtVwvFjrMe6eW9Y/22yx33GqXEuo4s3
	bC6uuYIOzknajuRTWxwQGBAR0SJOu0IVeSsDR4cfoa84XfuILZPUUBon4x+AmLfMWIBdVP0NGq4g9
	hjwXp7ADDcfczUE7DHkrD546Mcl8jzMwVc0CzHKXFgMk2GCqQVH8UxZyQQuQNy14pnal+v7rNEU1U
	FZe1/R+ElGOQ1i+46rtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWsAl-00C2OS-Vl; Tue, 28 Feb 2023 05:05:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWsAj-00C2Ng-Et
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 05:05:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso5098983wmp.4
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 21:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/rUgYeuyp4a42zgvscb8Ayf+i4666OzYHVPuCh3+igs=;
        b=WKyQgStiyUSSLrOIZVBXxsvgUnH5p+qmORAJ0JkgpNJisWFdZRhsc0ATyM3Xs38HWm
         pmkpvP+OXPOb87WoqAmlU0zx3lO+44k90VTwLqgUKo9tQNXFAg5KJTwI32zIt1l0VtvP
         y9l+p9bZD+MjUfQQjJGe3XgyG+nJu+mIsw+Vt7JI1L+BtSiiAGj2qUpr+P9z6L5ky6co
         oHaEFh/9Bg99yUMxP5FpaypCv6WGNVQHLNYMPPQJmCKXr9MZg4hi0mh8Zw7wjuUQARKd
         5IkZWuEdeKUIdOwSLTXII1L7l92u/7jWhfjOirSWi4P6kNWkdHidFVBd7iDHftPeARmo
         mmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rUgYeuyp4a42zgvscb8Ayf+i4666OzYHVPuCh3+igs=;
        b=achvKeBozs7AG6LiHxnJoiTKgI+k00004FoY9g8KbAY9X3njlW0n+ZwhUGKdxALcCP
         pfnRgIdHlgKr7925EitDurG8wZsZRLZdYs74dSYNiuDXxxhX889wvVmtAp9at+OqTzbC
         2WT0M01X7uj+qAfVzz2bIbaiYPdB0KBCpRHKBjOCLnaLEF/rT+E5dmHic3QA9NCVHAzV
         3yphPOVyPi9V/8FZltvvAHu16/pAC7+CNmhpBoDvCG9Ki2gew712N4PQJEjw9Bs/4aJc
         zylqj20fbkR5Ihpuk1JRq+KvHM08tvf/Gtf/GjrzT6umpp3NO+DFsjd8xSRqbRde458s
         VY5Q==
X-Gm-Message-State: AO0yUKWo/GyT6nhTKCklR1o3xZA5TXyy8Nc1x7sRjZ3CaOJnQ4kYlyA0
	z7g2U3CSN3uHGwYRVH+0wsV5kw==
X-Google-Smtp-Source: AK7set/3CqhMiz3nslm7Dq0Ps2HgrKYEBhz1XT+MvxtIEesgrxicJ4Ac6LP6iwP8C3YGBw504146ig==
X-Received: by 2002:a05:600c:3595:b0:3ea:c101:72b with SMTP id p21-20020a05600c359500b003eac101072bmr947095wmq.17.1677560699034;
        Mon, 27 Feb 2023 21:04:59 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id v14-20020adfedce000000b002c7b229b1basm8715953wro.15.2023.02.27.21.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 21:04:58 -0800 (PST)
Date: Tue, 28 Feb 2023 06:04:57 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <20230228050457.zfbflfawctaccepv@orel>
References: <20230224090010.nmy6latszfkdqcft@orel>
 <9cfd485d1e0d46cdb1323bb6ea330f6e@EXMBX066.cuchost.com>
 <20230224095526.ctctpzw3p3csf6qj@orel>
 <24a6dbe6aa2043c7812bf7e258786e13@EXMBX066.cuchost.com>
 <20230224120715.wgqnqmkadsbqusus@orel>
 <180fda36f9974809b436c52e4b3eda58@EXMBX066.cuchost.com>
 <20230227075942.rgl4hqnwttwvoroe@orel>
 <178ca008701147828d2e62402ff4f78a@EXMBX066.cuchost.com>
 <20230227114435.eow57ax5zhysz3kv@orel>
 <a6c319dd867f4f1d97e9d950b9e7c636@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6c319dd867f4f1d97e9d950b9e7c636@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_210505_531433_719B5797 
X-CRM114-Status: GOOD (  33.30  )
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

On Tue, Feb 28, 2023 at 01:32:53AM +0000, JeeHeng Sia wrote:
> > > > > 	load image;
> > > > > loop:	Create pbe chain, return error if failed;
> > > >
> > > > This loop pseudocode is incomplete. It's
> > > >
> > > > loop:
> > > >         if (swsusp_page_is_forbidden(page) && swsusp_page_is_free(page))
> > > > 	   return page_address(page);
> > > > 	Create pbe chain, return error if failed;
> > > > 	...
> > > >
> > > > which I pointed out explicitly in my last reply. Also, as I asked in my
> > > > last reply (and have been asking four times now, albeit less explicitly
> > > > the first two times), how do we know at least one PBE will be linked?
> > > 1 PBE correspond to 1 page, you shouldn't expect only 1 page is saved.
> > 
> > I know PBEs correspond to pages. *Why* should I not expect only one page
> > is saved? Or, more importantly, why should I expect more than zero pages
> > are saved?
> > 
> > Convincing answers might be because we *always* put the restore code in
> > pages which get added to the PBE list or that the original page tables
> > *always* get put in pages which get added to the PBE list. It's not very
> > convincing to simply *assume* that at least one random page will always
> > meet the PBE list criteria.
> > 
> > > Hibernation core will do the calculation. If the PBEs (restore_pblist) linked successfully, the hibernated image will be restore else
> > normal boot will take place.
> > > > Or, even more specifically this time, where is the proof that for each
> > > > hibernation resume, there exists some page such that
> > > > !swsusp_page_is_forbidden(page) or !swsusp_page_is_free(page) is true?
> > > forbidden_pages and free_pages are not contributed to the restore_pblist (as you already aware from the code). Infact, the
> > forbidden_pages and free_pages are not save into the disk.
> > 
> > Exactly, so those pages are *not* going to contribute to the greater than
> > zero pages. What I've been asking for, from the beginning, is to know
> > which page(s) are known to *always* contribute to the list. Or, IOW, how
> > do you know the PBE list isn't empty, a.k.a restore_pblist isn't NULL?
> Well, this is keep going around in a circle, thought the answer is in the hibernation code. restore_pblist get the pointer from the PBE, and the PBE already checked for validity.

It keeps going around in circles because you keep avoiding my question by
pointing out trivial linked list code. I'm not worried about the linked
list code being correct. My concern is that you're using a linked list
with an assumption that it is not empty. My question has been all along,
how do you know it's not empty?

I'll change the way I ask this time. Please take a look at your PBE list
and let me know if there are PBEs on it that must be there on each
hibernation resume, e.g. the resume code page is there or whatever.

> Can I suggest you to submit a patch to the hibernation core?

Why? What's wrong with it?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
