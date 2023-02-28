Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9730EC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cy2tku8ijLU5F6HRKSgzEuZyoG7KBkaYI9xu4uUCsU4=; b=362GWW7hN5ZkiA
	E5DUlIozkzckKpvqHraNI0o7M9a2O31PBmZPpK7cDcmMjDHSHC+ljehIGcBOdCZ+NSrsdixHIAe8i
	+7MmXwgYYOfY4GmxSFFnxXtNy7b+8IM0KBn1zBKvnWTmK1ERP2BOBO6MqDN1EUIyE4fbrsOiJOtm0
	iAxqXAfqGksuOSmy1UEar2SSOH7zEwMlTbHo08QIf4z4srBdRkxyjr/SG+044pV2N2Y7usyOBP+oU
	JwCDu3PV/g58mtG20mr73F60ctkXEkRhM9rvg/0wDfhJ5A1YFNRvzp0HwrL6ZZcaBR/XrrHti7kNs
	Bksol7FdgzYxlwI094Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuQi-00CFdQ-BK; Tue, 28 Feb 2023 07:29:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuQf-00CFcn-Eo
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 07:29:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id k37so5760375wms.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 23:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7o3/v5H3v/D2/l1qgkCvqgReJV0ZPBMSP6fxlnoI9s=;
        b=ijLEMaw6uNP5MP/hEYRfSHuPAMCIoKJi13BQ5koGqKRHBR/yfmVxxfL/BTun69y2Mq
         eKJx9dW5X8zgWCYYkoDdflXHzh/ft77T7FWiiEbTzdEmGPjqPxuqmFWs8hV4xGwqVOTJ
         Jm2Lb7i3oKDRn60RhPAmvtcuF4uU+ilgXK9ypICxBz3h760glyoHgz0r0Pwre59oLG7Z
         WtUZX/Kaw2LrXxXJ4jQGXG4gSeTirhkITSOy9RlSe1BIYLrjSaunpz2jvsmQt+qfX8m9
         CwtqwImHcU/nZ4oMgCkdqlfY5nO1IBRdNuZOI0qra4/wmIV3Wm2B/wQopESCCOnkzsqe
         gwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7o3/v5H3v/D2/l1qgkCvqgReJV0ZPBMSP6fxlnoI9s=;
        b=gfoX3xEAMbPGiy3R+QVvE1W5L9bO1ouVaCplJFhB8bkbxtGhukZyj79FosVoSN2JMj
         C8AHQ9Q/XSXEXGC7MLsL6nAtxgd/yHGpF/B+V3CENZxo2OT8Vq351DMFIE/65m4glNPa
         7s1A72c315qnoQgNr2ykznrg0XzCs1zHmTmFCjbYb5RxNlSeEVzYJLkiYv7aPEnSoe1f
         9n6ZAmxcAVz3z1H8mws8jWVsLzc3hgdoFkc+Grw60wAbtai8wa/x0tVncGocQmJ2FtNc
         /ebj5KGlGKeA8mwoNVvO4pDfdg/EOW8mcYzEdb3uDSBiu6dnKgjNMusmCQ4H91OxdbNq
         fFTQ==
X-Gm-Message-State: AO0yUKXEV0jDBRnP3tdxu0AUMKONI+v0vG0L2Dvxt0Ghjf7pHvuRxLrE
	kmD2YZh9t+0EaNf7kygdKupY1Q==
X-Google-Smtp-Source: AK7set/Lj0yHPkWGgCYSg+qsCDNd9A6kfzcS4yOFlehXutT54z3ExEriS9tZ3uoP3b3HnmYJ0UgSNg==
X-Received: by 2002:a05:600c:1708:b0:3eb:2de9:8aed with SMTP id c8-20020a05600c170800b003eb2de98aedmr1153707wmn.41.1677569377652;
        Mon, 27 Feb 2023 23:29:37 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003ea57808179sm14681425wmh.38.2023.02.27.23.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 23:29:37 -0800 (PST)
Date: Tue, 28 Feb 2023 08:29:36 +0100
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
Message-ID: <20230228072936.22ahmg6ggqk4v5wh@orel>
References: <20230224095526.ctctpzw3p3csf6qj@orel>
 <24a6dbe6aa2043c7812bf7e258786e13@EXMBX066.cuchost.com>
 <20230224120715.wgqnqmkadsbqusus@orel>
 <180fda36f9974809b436c52e4b3eda58@EXMBX066.cuchost.com>
 <20230227075942.rgl4hqnwttwvoroe@orel>
 <178ca008701147828d2e62402ff4f78a@EXMBX066.cuchost.com>
 <20230227114435.eow57ax5zhysz3kv@orel>
 <a6c319dd867f4f1d97e9d950b9e7c636@EXMBX066.cuchost.com>
 <20230228050457.zfbflfawctaccepv@orel>
 <ffd2e7849b764043bef606d9b8019506@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffd2e7849b764043bef606d9b8019506@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_232941_524097_0318166D 
X-CRM114-Status: GOOD (  48.40  )
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

On Tue, Feb 28, 2023 at 06:33:59AM +0000, JeeHeng Sia wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Tuesday, 28 February, 2023 1:05 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> > 
> > On Tue, Feb 28, 2023 at 01:32:53AM +0000, JeeHeng Sia wrote:
> > > > > > > 	load image;
> > > > > > > loop:	Create pbe chain, return error if failed;
> > > > > >
> > > > > > This loop pseudocode is incomplete. It's
> > > > > >
> > > > > > loop:
> > > > > >         if (swsusp_page_is_forbidden(page) && swsusp_page_is_free(page))
> > > > > > 	   return page_address(page);
> > > > > > 	Create pbe chain, return error if failed;
> > > > > > 	...
> > > > > >
> > > > > > which I pointed out explicitly in my last reply. Also, as I asked in my
> > > > > > last reply (and have been asking four times now, albeit less explicitly
> > > > > > the first two times), how do we know at least one PBE will be linked?
> > > > > 1 PBE correspond to 1 page, you shouldn't expect only 1 page is saved.
> > > >
> > > > I know PBEs correspond to pages. *Why* should I not expect only one page
> > > > is saved? Or, more importantly, why should I expect more than zero pages
> > > > are saved?
> > > >
> > > > Convincing answers might be because we *always* put the restore code in
> > > > pages which get added to the PBE list or that the original page tables
> > > > *always* get put in pages which get added to the PBE list. It's not very
> > > > convincing to simply *assume* that at least one random page will always
> > > > meet the PBE list criteria.
> > > >
> > > > > Hibernation core will do the calculation. If the PBEs (restore_pblist) linked successfully, the hibernated image will be restore else
> > > > normal boot will take place.
> > > > > > Or, even more specifically this time, where is the proof that for each
> > > > > > hibernation resume, there exists some page such that
> > > > > > !swsusp_page_is_forbidden(page) or !swsusp_page_is_free(page) is true?
> > > > > forbidden_pages and free_pages are not contributed to the restore_pblist (as you already aware from the code). Infact, the
> > > > forbidden_pages and free_pages are not save into the disk.
> > > >
> > > > Exactly, so those pages are *not* going to contribute to the greater than
> > > > zero pages. What I've been asking for, from the beginning, is to know
> > > > which page(s) are known to *always* contribute to the list. Or, IOW, how
> > > > do you know the PBE list isn't empty, a.k.a restore_pblist isn't NULL?
> > > Well, this is keep going around in a circle, thought the answer is in the hibernation code. restore_pblist get the pointer from the PBE,
> > and the PBE already checked for validity.
> > 
> > It keeps going around in circles because you keep avoiding my question by
> > pointing out trivial linked list code. I'm not worried about the linked
> > list code being correct. My concern is that you're using a linked list
> > with an assumption that it is not empty. My question has been all along,
> > how do you know it's not empty?
> > 
> > I'll change the way I ask this time. Please take a look at your PBE list
> > and let me know if there are PBEs on it that must be there on each
> > hibernation resume, e.g. the resume code page is there or whatever.
> Just to add on, it is not "my" PBE list but the list is from the hibernation core. As already draw out the scenarios for you, checking should be done at the initialization phase. 

Your PBE list is your instance of the PBE list when you resume your
hibernation test. I'm simply asking you to dump the PBE list while
you resume a hibernation, and then tell me what's there.

Please stop thinking about the trivial details of the code, like which
file a variable is in, and start thinking about how the code is being
used. A PBE list is a concept, your PBE list is an instance of that
concept, the code, which is the least interesting part, is just an
implementation of that concept. First, I want to understand the concept,
then we can worry about the code.

drew

> > 
> > > Can I suggest you to submit a patch to the hibernation core?
> > 
> > Why? What's wrong with it?
> > 
> > Thanks,
> > drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
