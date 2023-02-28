Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B9BC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 07:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABVO4pYlc9czszJRRfRfj9r70yfOVX6PSA/eHwf39nQ=; b=IDvt0nl3jQrkc7
	MCuRijG0RhRoiXX9Qgh/ZiGTqz7Jh3OFo2oFU+eZ14AyQaotAOPYobvaeZoDD3BgWH2Tnz46xKWUy
	iDMYxpx7Zz/Te2UYZ5W1szAk5OcA5KWtCdKJLWd6aVj2mIXHXMYYlHoY1/PKaqe2DWyTNDAraQ64D
	8ZsyWXUem7u6gnf6fyk52l0oK0DRZowEDOMBFX1J+1FJ95pDgoiODggzDBRg8Qja8QNyy3e52lA9S
	FuXwnBdVFHc9qd1HwCufGb++YWD1uF/kE9BRcts7glIioZUSBLmOgX1ilXatzZlJ/RCy1C3GUmoA0
	eimFAARBwLa0z3DNNGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuYO-00CHXM-Gt; Tue, 28 Feb 2023 07:37:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuYL-00CHVv-NS
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 07:37:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so8805639wmb.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 23:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AQ7vpVmH2svpxStx0c+Rdq7n5k/ARjaIr92QsU/5uUc=;
        b=QWTHNrausIxVp8/ehT15syafvequ22Wpd53r6wRKrNBwnAmRI+wi8q4PcugZlhPHMt
         c8CAWebyQyNARnZ4/geUTZsv5TVF3OrIYbBw7URoVlb+sDelBOx3kYRJ2+t0q+cCxNoZ
         x0N8aEpTLm5RBjBY4lCEzTntj9pB+yf66gWttI6sQDZPFTRxB/J7IfcNme3oYQ5NMzv+
         htPloJSZUyFYMVZOAvGmKJxlu/Xel8FLnzdwuGm1LKOJy3dLVNw1lPfUdnVMo4v7WZ5L
         sfBQpBolR3Kg2NjMRn3qGgGEux1PcVfd7sjP4sAwpmbQefqJSXcpIe53bNy8daqW4h3B
         7VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ7vpVmH2svpxStx0c+Rdq7n5k/ARjaIr92QsU/5uUc=;
        b=aanMZex71XUoQnPg0ieF4ho/zwn8HFIyHBDSRj08LlfuMNvDnzIUrwEx+VKcGNtgyT
         GjQKCx0jg4+hLo24jbqu9M5c/xEOlL6knN3BZ5TyRWjg6O0UJM4WChpfQTqJ9pBopwL4
         UedlOvTdh6zyAh03KLsNb84dj1MEFyjN8nlpQjoinlOy1G53YIIwzzaeRmkjIQrCVqRy
         FQcsuV01+XeyQVH49vGTy2nuUmJifpjwaup0MFfk/FoDG+3dz0X1FLqsbULCISrRr39T
         pIJYEw1EYm9d6+JOWdzcy6Y1A61HwN0b4xMP12Apz3jitqprmnE259l71+ncOzmxfHOJ
         hGlA==
X-Gm-Message-State: AO0yUKX9BOf6qED52q2Wla9KcAiMNn6Je3z0XCG++m6Sa75SJkQpJH/0
	4DX+7OXHP33g0O/3fvKvhq2m1Q==
X-Google-Smtp-Source: AK7set+e33yEECDct6qvnW53UUqgcWZBrgj0LPbQ1yvkRyEvAYETNKX+NYpCBqGtSavtmE4nMrYb9g==
X-Received: by 2002:a05:600c:4da4:b0:3eb:3843:9f31 with SMTP id v36-20020a05600c4da400b003eb38439f31mr1343843wmp.10.1677569851530;
        Mon, 27 Feb 2023 23:37:31 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s10-20020a1cf20a000000b003dfe5190376sm11315809wmc.35.2023.02.27.23.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 23:37:31 -0800 (PST)
Date: Tue, 28 Feb 2023 08:37:25 +0100
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
Message-ID: <20230228073725.m5t6rkcbgbi3g26z@orel>
References: <20230224120715.wgqnqmkadsbqusus@orel>
 <180fda36f9974809b436c52e4b3eda58@EXMBX066.cuchost.com>
 <20230227075942.rgl4hqnwttwvoroe@orel>
 <178ca008701147828d2e62402ff4f78a@EXMBX066.cuchost.com>
 <20230227114435.eow57ax5zhysz3kv@orel>
 <a6c319dd867f4f1d97e9d950b9e7c636@EXMBX066.cuchost.com>
 <20230228050457.zfbflfawctaccepv@orel>
 <803ac603023c4eeda4a0b8e414cce6f1@EXMBX066.cuchost.com>
 <20230228071845.k6s6bcnesdsnw3jl@orel>
 <abd16b950ca744b081fc9f545977b8fa@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abd16b950ca744b081fc9f545977b8fa@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_233737_791108_9054351A 
X-CRM114-Status: GOOD (  57.85  )
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

On Tue, Feb 28, 2023 at 07:29:40AM +0000, JeeHeng Sia wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Tuesday, 28 February, 2023 3:19 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> > 
> > On Tue, Feb 28, 2023 at 05:33:32AM +0000, JeeHeng Sia wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Jones <ajones@ventanamicro.com>
> > > > Sent: Tuesday, 28 February, 2023 1:05 PM
> > > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > > > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > > > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> > > > Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> > > >
> > > > On Tue, Feb 28, 2023 at 01:32:53AM +0000, JeeHeng Sia wrote:
> > > > > > > > > 	load image;
> > > > > > > > > loop:	Create pbe chain, return error if failed;
> > > > > > > >
> > > > > > > > This loop pseudocode is incomplete. It's
> > > > > > > >
> > > > > > > > loop:
> > > > > > > >         if (swsusp_page_is_forbidden(page) && swsusp_page_is_free(page))
> > > > > > > > 	   return page_address(page);
> > > > > > > > 	Create pbe chain, return error if failed;
> > > > > > > > 	...
> > > > > > > >
> > > > > > > > which I pointed out explicitly in my last reply. Also, as I asked in my
> > > > > > > > last reply (and have been asking four times now, albeit less explicitly
> > > > > > > > the first two times), how do we know at least one PBE will be linked?
> > > > > > > 1 PBE correspond to 1 page, you shouldn't expect only 1 page is saved.
> > > > > >
> > > > > > I know PBEs correspond to pages. *Why* should I not expect only one page
> > > > > > is saved? Or, more importantly, why should I expect more than zero pages
> > > > > > are saved?
> > > > > >
> > > > > > Convincing answers might be because we *always* put the restore code in
> > > > > > pages which get added to the PBE list or that the original page tables
> > > > > > *always* get put in pages which get added to the PBE list. It's not very
> > > > > > convincing to simply *assume* that at least one random page will always
> > > > > > meet the PBE list criteria.
> > > > > >
> > > > > > > Hibernation core will do the calculation. If the PBEs (restore_pblist) linked successfully, the hibernated image will be restore
> > else
> > > > > > normal boot will take place.
> > > > > > > > Or, even more specifically this time, where is the proof that for each
> > > > > > > > hibernation resume, there exists some page such that
> > > > > > > > !swsusp_page_is_forbidden(page) or !swsusp_page_is_free(page) is true?
> > > > > > > forbidden_pages and free_pages are not contributed to the restore_pblist (as you already aware from the code). Infact, the
> > > > > > forbidden_pages and free_pages are not save into the disk.
> > > > > >
> > > > > > Exactly, so those pages are *not* going to contribute to the greater than
> > > > > > zero pages. What I've been asking for, from the beginning, is to know
> > > > > > which page(s) are known to *always* contribute to the list. Or, IOW, how
> > > > > > do you know the PBE list isn't empty, a.k.a restore_pblist isn't NULL?
> > > > > Well, this is keep going around in a circle, thought the answer is in the hibernation code. restore_pblist get the pointer from the
> > PBE,
> > > > and the PBE already checked for validity.
> > > >
> > > > It keeps going around in circles because you keep avoiding my question by
> > > > pointing out trivial linked list code. I'm not worried about the linked
> > > > list code being correct. My concern is that you're using a linked list
> > > > with an assumption that it is not empty. My question has been all along,
> > > > how do you know it's not empty?
> > > >
> > > > I'll change the way I ask this time. Please take a look at your PBE list
> > > > and let me know if there are PBEs on it that must be there on each
> > > > hibernation resume, e.g. the resume code page is there or whatever.
> > > >
> > > > > Can I suggest you to submit a patch to the hibernation core?
> > > >
> > > > Why? What's wrong with it?
> > > Kindly let me draw 2 scenarios for you. Option 1 is to add the restore_pblist checking to the hibernation core and option 2 is to add
> > restore_pblist checking to the arch solution
> > > Although I really don't think it is needed. But if you really wanted to add the checking, I would suggest to go with option 1. again, I
> > really think that it is not needed!
> > 
> > This entire email thread is because you've first coded, and now stated,
> > that you don't think the PBE list will ever be empty. And now, below, I
> > see you're proposing to return an error when the PBE list is empty, why?
> > If there's nothing in the PBE list, then there's nothing to do for it.
> > Why is that an error condition?
> > 
> > Please explain to me why you think the PBE list *must* not be empty
> > (which is what I've been asking for over and over). OIOW, are there
> > any pages you have in mind which the resume kernel always uses and
> > are also always going to end up in the suspend image? I don't know,
> > but I assume clean, file-backed pages do not get added to the suspend
> > image, which would rule out most kernel code pages. Also, many pages
> > written during boot (which is where the resume kernel is at resume time)
> > were no longer resident at hibernate time, so they won't be in the
> > suspend image either. While it's quite likely I'm missing something
> > obvious, I'd rather be told what that is than to assume the PBE list
> > will never be empty. Which is why I keep asking about it...
> The answer already in the Linux kernel hibernation core, do you need me to write a white paper to explain in detail or you need a conference call? 

I'm not sure why you don't just write a paragraph or two here in this
email thread explaining what "the answer" is. Anyway, feel free to
invite me to a call if you think it'd be easier to hash out that way.

Thanks,
drew

> > 
> > Thanks,
> > drew
> > 
> > >
> > > 	//Option 1
> > > 	//Pseudocode to illustrate the image loading
> > > 	initialize restore_pblist to null;
> > > 	initialize safe_pages_list to null;
> > > 	Allocate safe page list, return error if failed;
> > > 	load image;
> > > loop:	Create pbe chain, return error if failed;
> > > 	assign orig_addr and safe_page to pbe;
> > > 	link pbe to restore_pblist;
> > > 	/* Add checking here */
> > > 	return error if restore_pblist equal to null;
> > > 	return pbe to handle->buffer;
> > > 	check handle->buffer;
> > > 	goto loop if no error else return with error;
> > >
> > > 	//option 2
> > > 	//Pseudocode to illustrate the image loading
> > > 	initialize restore_pblist to null;
> > > 	initialize safe_pages_list to null;
> > > 	Allocate safe page list, return error if failed;
> > > 	load image;
> > > loop:	Create pbe chain, return error if failed;
> > > 	assign orig_addr and safe_page to pbe;
> > > 	link pbe to restore_pblist;
> > > 	return pbe to handle->buffer;
> > > 	check handle->buffer;
> > > 	goto loop if no error else return with error;
> > > 	everything works correctly, continue the rest of the operation
> > > 	invoke swsusp_arch_resume
> > >
> > > 	//@swsusp_arch_resume()
> > > loop2: return error if restore_pblist is null
> > > 	increment restore_pblist and goto loop2
> > > 	create temp_pg_table
> > > 	continue the rest of the resume operation
> > > >
> > > > Thanks,
> > > > drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
