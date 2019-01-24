Return-Path: <SRS0=k7m6=QA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A666C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 02:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9741217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 02:00:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pUNbRUbX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lCyVnoKI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9741217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=F6KYbvp0eowv90bhoMps07nbQ574nUIpP55x2gkKJo8=; b=pUNbRUbXbqBwTR/MtnO0bAxzI
	saEr4XNr7LWBm4y60rnciWOCNfAAl3n6IMX0VBqwEQrr+gEF2Z4DZ57AmR5GrCPRqLxWAOhSmvpgS
	Uu+8M+RhR5bEfl059YgZ2oHknyv1M+Wx7wX18tl6ZQEIh476BFBvVVcVDJxR3NVeGL9zNmrYAJ7cW
	9xEYuYvZ4rR171OGtb/LDlg0RSG9+CugupB10j8cpW7RgiOuD/ZHZE6JTUOhj/EAsFAuaorUNleLF
	EmgIQqqqON69fMXH4HzNvfKOBsNXWCbhEiCnx/TWgCR9zPaE4AvBxpP19rID21tEFZVCqnyyXq0ME
	G5q50/yqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmUJu-0007wi-JW; Thu, 24 Jan 2019 02:00:42 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmUJs-0007vv-5f
 for linux-riscv@lists.infradead.org; Thu, 24 Jan 2019 02:00:41 +0000
Received: by mail-pf1-x444.google.com with SMTP id c73so2137107pfe.13
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 18:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YBIIZ8XOcYpaFmWKBLCH70Y4SkewX00OSYFAAy95m8A=;
 b=lCyVnoKIkk13kXnT5OyBWlkSBrMkjmiKfZb1cw8X7hf/TaVeMiXGHG2vGBHbjUY0vl
 3Dzm18NzkKFFaSB8vx31/DYYZGug1K1gZsuggbRZnysemxJcO8q6ty9NWUduAM1tXhuw
 +pRzYFA8K9IisgQCQ5gfHIAtHEbYbMcY5RrXiCEBrastikdjo/phXweL+VSMip1xVEju
 7bUNeaNkwY7C9tbWIu2jOmmir9+9xaAVyWUoUISUow5fJ2gacNQHvqpe84LTEsR8K8D6
 7rM2vxHhpRWQ//2oCAG4+IYAQws+HLByct+pQ6rGiBA0MnVJCFZvTxG8NDXR6hZC5Hwo
 stFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YBIIZ8XOcYpaFmWKBLCH70Y4SkewX00OSYFAAy95m8A=;
 b=IeySnTsP3j2XBTIX4JpEQbXoIKQgj/gPFN7fC1xhaILjoA1T77XivDzG/O8Ln0SLGP
 KRC+Q4l9RMtoZxBk4UxvebTllv1wh2DIOAjHhM7UIWNg2oljILd1IpbAeEMZuaAP7Gpt
 lCYOVaMdcxhMTDdkMD+ZKhJSQ6sM5qFK8oZueuBN0rSmu0sXuldkZtgTD6i/iocoo+Zr
 nsnT0c7XU40qUSluIRM3EFuWukw1tHXbcar2Ejm4NyXzglNCAMviqlqBiEnX713Cy4I8
 bDtIPQA2zH+AW2lbXc64QCJSwyW5FKH5flvbMwtgx6/UBZRy8ZiLKfeGNe4K865q6LBg
 bcqA==
X-Gm-Message-State: AJcUukcBU4XvwTCyfF7AQUhxYryiexifvAahPywmo/iPHyDrW6FNysZh
 5iQ47QuI/RwCWn8/JT2spzAy5A==
X-Google-Smtp-Source: ALg8bN5pgBtXEUSLj8HFEq6LKlFYqjruRT616qmbOBJP+tc2RuQaPabbDF8zenhzJ/HlBucBhGxPHw==
X-Received: by 2002:a62:2b8b:: with SMTP id r133mr4477658pfr.246.1548295236700; 
 Wed, 23 Jan 2019 18:00:36 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f20sm24636364pfn.177.2019.01.23.18.00.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 18:00:35 -0800 (PST)
Date: Wed, 23 Jan 2019 18:00:35 -0800 (PST)
X-Google-Original-Date: Wed, 23 Jan 2019 17:51:28 PST (-0800)
Subject: Re: [PATCH] riscv: fixup max_low_pfn with PFN_DOWN.
In-Reply-To: <20190116010738.GA4817@guoren-Inspiron-7460>
From: Palmer Dabbelt <palmer@sifive.com>
To: guoren@kernel.org
Message-ID: <mhng-7c486840-63d3-4645-84ff-8c89660fc552@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_180040_241923_49F432F8 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, mao_han@c-sky.com,
 Christoph Hellwig <hch@infradead.org>, ren_guo@c-sky.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 17:07:38 PST (-0800), guoren@kernel.org wrote:
> Hi Christoph,
>
> I use PFN_DOWN() every where as possible and seems it's a habit
> problem. So let risc-v maintainer to choose "PFN_DOW()" or
> ">> PAGE_SHIFT".
>
> Also the same with "end_of_DRAM & max_low_pfn".

PFN_DOWN makes sense to me, as that's what we're trying to do here (round a 
physical address down to page frame number).  Am a I misunderstanding 
something?

>
> Best Regards
>  Guo Ren
>
> On Tue, Jan 15, 2019 at 08:12:54AM -0800, Christoph Hellwig wrote:
>> On Wed, Jan 16, 2019 at 12:10:00AM +0800, Guo Ren wrote:
>> > > >  	set_max_mapnr(PFN_DOWN(mem_size));
>> > > > -	max_low_pfn = memblock_end_of_DRAM();
>> > > > +	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
>> > >
>> > > I know it is used just above, but can we please just switch this
>> > > code to use >> PAGE_SHIFT instead of PFN_DOWN, which just horribly
>> > > obsfucates what is going on?
>> > ???
>> > #define PFN_DOWN(x)	((x) >> PAGE_SHIFT)
>> >
>> > phys_addr_t __init_memblock memblock_end_of_DRAM(void)
>> > {
>> > 	int idx = memblock.memory.cnt - 1;
>> >
>> > 	return (memblock.memory.regions[idx].base + memblock.memory.regions[idx].size);
>> > }
>> >
>> > What's the problem? PFN_DOWN() couldn't be used with function call?
>>
>> PFN_DOWN gives you the correct result.  But I think it actually
>> drastically reduces readability over just opencoding it.
>>
>> > My patch just want to point out that max_low_pfn is PFN not size. In fact
>> > there is no error for running without my patch :P
>>
>> No, I think your patch is correct.  I just wonder if we could make
>> the code easier to read.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
