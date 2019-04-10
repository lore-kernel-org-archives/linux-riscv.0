Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7580AC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 07:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459C9217F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 07:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLfFpoQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 459C9217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fjkJNsAhxo/0az4SxoaS2/5oYFq6xJcvWoHulI9Qv8M=; b=iLfFpoQPHIE/ylK1DfqEJkIBq
	N//75OOO/UCmwVM0cPu62UibFXGXJa2+mATf6kGTY8qxs5cIgkpEuxvnbejpwYI7MnnQ1FhnbR0GS
	McvQUB28hIVizLimklOy3ISIPgX91xbXBntMX0tlK+QzYt7C0DOCKO4ma4GT0UWmZHzJKkkNU+igP
	r8WBeIZanOjqVsYIj3PB43/xHLc0pQteXrXQ2iLzUkrUZ9m54/+yrFfXFQwW/QeSHds6ATJ2gZ+Hw
	huZEV+pBL1NhiT2sVmuT2Ze8zXY9ShCc/GG5LeoL7BvDIhLV2nIbBnwZXWXxRDcr938/EXY1Wj2z9
	bg6N7fGig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE7jl-0002ey-AR; Wed, 10 Apr 2019 07:33:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE7jb-0002WE-LW; Wed, 10 Apr 2019 07:33:29 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BF3AAFF80C;
 Wed, 10 Apr 2019 07:33:21 +0000 (UTC)
Subject: Re: [PATCH v2 2/5] arm64, mm: Move generic mmap layout functions to mm
To: Christoph Hellwig <hch@infradead.org>
References: <20190404055128.24330-1-alex@ghiti.fr>
 <20190404055128.24330-3-alex@ghiti.fr> <20190410065908.GC2942@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <8d482fd0-b926-6d11-0554-a0f9001d19aa@ghiti.fr>
Date: Wed, 10 Apr 2019 09:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190410065908.GC2942@infradead.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_003327_856566_4AA28A5D 
X-CRM114-Status: GOOD (  18.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 04/10/2019 08:59 AM, Christoph Hellwig wrote:
> On Thu, Apr 04, 2019 at 01:51:25AM -0400, Alexandre Ghiti wrote:
>> - fix the case where stack randomization should not be taken into
>>    account.
> Hmm.  This sounds a bit vague.  It might be better if something
> considered a fix is split out to a separate patch with a good
> description.

Ok, I will move this fix in another patch.

>
>> +config ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>> +	bool
>> +	help
>> +	  This allows to use a set of generic functions to determine mmap base
>> +	  address by giving priority to top-down scheme only if the process
>> +	  is not in legacy mode (compat task, unlimited stack size or
>> +	  sysctl_legacy_va_layout).
> Given that this is an option that is just selected by other Kconfig
> options the help text won't ever be shown.  I'd just move it into a
> comment bove the definition.

Oh yes, it does not appear, thanks, I'll move it above the definition.

>
>> +#ifdef CONFIG_MMU
>> +#ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> I don't think we need the #ifdef CONFIG_MMU here,
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT should only be selected
> if the MMU is enabled to start with.

Ok, thanks.

>> +#ifdef CONFIG_ARCH_HAS_ELF_RANDOMIZE
>> +unsigned long arch_mmap_rnd(void)
> Now that a bunch of architectures use a version in common code
> the arch_ prefix is a bit mislead.  Probably not worth changing
> here, but some time in the future it could use a new name.

Ok I'll keep it in mind for later,

Thanks for your time,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
