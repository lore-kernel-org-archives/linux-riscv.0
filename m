Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C72C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 18:25:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1A7611EE
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 18:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1A7611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9dNTTgd1NeoYJF0dEeNgRjsmp/m5T2fzIaLlNF9yJ84=; b=M9P4Y0KmHOPzidXx8op5OlwMa
	w3pVzjgJCLECSnUbbLOpJh6UkpGbi3AS3VQyGBIwm4KXF1l3bKBlDSRoP3jq0gdwARO+mYm+7OZRo
	FycfEWZfWbyVcqi+kUTan2tFCt9JHMZ10KetMWNF8BxvAZ2h9QtYC4176AZAhXvZY6P7rpSCb9IGw
	9vRRnopfnlHglOkIV2KA/yt9FjQ61bVAlu855ST+bL7KYPMcDaSoJydYDpYjKvmHc1xLcZVVK1Zgl
	n7FM0+wYlLNlgwtq6xt7OTzzDGIC/HmGqAM0SfyXGVEzkMETD8ZuCoJ8EoEqDChpmGIr+0C3HmSqo
	t7dhEPCZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYYa3-00AQzJ-GB; Mon, 19 Apr 2021 18:25:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYYZr-00AQxW-3T; Mon, 19 Apr 2021 18:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mpTWNqA+rdIcKr1spko4TVA9gXEjxs0ymjuB4L7YQjI=; b=fcFNJltY15R4JZKlkW4378zAhm
 xGV5ciDl0xPKYUUtv5NO9+I60MHcwR79W0stMEewkqRax+MCpH6ssPsap33s3n5350+BjUBJgIx6N
 kZWq8AJx/8dRytHyqsvGTeAUtbxC6E6N5V06D9mJlSYMqQkL6YU4y94GAj1fHhsF8Dku38nuZisz8
 AfXrcOhbdfR5OsPueSAcl1GZ6RrMSUMvTlBhV/4VZxOSENkaomcyriWaK3XQHzVOq80ZYRMdrUnFr
 3VF9P+P0kTdgPiivCpEwxjlMs5z/izWwzKFpyzJfZSVSudteG2q8cjKMSCUk7KXMV/NHpfkhyXjV1
 dkJYXFRw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYYZo-00BaVa-I2; Mon, 19 Apr 2021 18:24:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E6B9611EE;
 Mon, 19 Apr 2021 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618856690;
 bh=YxOWGUrr9Arsoda9fsVSCB7Wv4rVHn47U+RWA4JnEik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eqgm4LWDn1T4KMIdCqYE+gjNg+SANj+00vJAZ20BOHkbCOUFadrvAoCiSfOO0vRry
 cRCtQoRNQsNXz5MFoOsMVaaP5Gd9/+08n7XDGr80HYzIgK9xevo+a/Sm9FXoJXZjTk
 HaSQiBdLsidEyOo5u5kxW/yk+MUsmi2kU2J8JYlAQ+COKbIhejTh20dmKGVs5wB+PQ
 r8kxDIacMWEYzyfTRPMIDb6vu58wBn7mPmvUnoXAazvSjaTq6lhypXTWnItI4BvjoA
 TnqdMG0PIIF9yA1redNzhKMCU4jKQXwnIlYMZ9uunZfCkBYwZUzqLYKrPmPwfNOjpf
 8Nh3U2mR23q7w==
Date: Mon, 19 Apr 2021 21:24:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] secretmem: optimize page_is_secretmem()
Message-ID: <YH3K3sBFbNFOxTV+@kernel.org>
References: <20210419084218.7466-1-rppt@kernel.org>
 <20210419112302.GX2531743@casper.infradead.org>
 <YH1v4XVzfXC1dYND@kernel.org>
 <20210419122156.GZ2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419122156.GZ2531743@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_112452_675797_2E7AA103 
X-CRM114-Status: GOOD (  20.89  )
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

On Mon, Apr 19, 2021 at 01:21:56PM +0100, Matthew Wilcox wrote:
> On Mon, Apr 19, 2021 at 02:56:17PM +0300, Mike Rapoport wrote:
> 
> > > With that fixed, you'll have a head page that you can use for testing,
> > > which means you don't need to test PageCompound() (because you know the
> > > page isn't PageTail), you can just test PageHead().
> > 
> > I can't say I follow you here. page_is_secretmem() is intended to be a
> > generic test, so I don't see how it will get PageHead() if it is called
> > from other places.
> 
> static inline bool head_is_secretmem(struct page *head)
> {
> 	if (PageHead(head))
> 		return false;
> 	...
> }
> 
> static inline bool page_is_secretmem(struct page *page)
> {
> 	if (PageTail(page))
> 		return false;
> 	return head_is_secretmem(page);
> }
> 
> (yes, calling it head is a misnomer, because it's not necessarily a head,
> it might be a base page, but until we have a name for pages which might
> be a head page or a base page, it'll have to do ...)

To me this looks less clean and readable and in the end we have an extra
check for PG_Head if that won't get optimized away.

Does not seem to me there would be a measurable difference, but if this is
important for future conversion to folio I don't mind using
{head,page}_is_secretmem.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
