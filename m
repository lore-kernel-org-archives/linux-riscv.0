Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E986C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZJYjHRsuoCwl6DLhqtNwuxZh1vVEriv1eEbAJzZiafw=; b=cL3SEfEgLf90bZS09bZF7wrjOH
	QPI9sRdNuQ8Jc0/N8G2Sdhl5HVfoZDkiQjxaMxPm7/G6c/P6WpxWFlSg9Uvg29G+ajSo4SEmGv7Lk
	CGiWEgP47nyTAC57ekj+3WVds4pjxRhab5gaYMiO7xHrmmBX8PugB6Srltg8WOcGUBTsyE82TLXPz
	fhepS4ArzWtB40+QWBdJPfLhQi4VS0eIZKmO0JsYaHABTR04SYCSzZpaBig00Sp3XRC/qY1Fpwo0O
	UGug5oBbBLgL5l0HbBGez0Tlx3f3n770wihJB3yu349MW4IIiXBWIzXmnsP9ovXPobsN28+M7hxV6
	57rqporA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvC69-0000000Bfxd-2dmD;
	Thu, 20 Mar 2025 09:21:57 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvC66-0000000Bfwm-3clz
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 09:21:56 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 5FF471382D7C;
	Thu, 20 Mar 2025 05:21:53 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Thu, 20 Mar 2025 05:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742462513;
	 x=1742548913; bh=bQtSbsAebIiFW2nPgYN3fEu05hmxSDGpViPkOh0koQY=; b=
	UZUcr4fx0KomfbUqK39EysoFlxL9GhmhTZMPcCYxOz4b/G6z/eM3ebkeTdXToCbK
	5SiGo+qH5s/HQZw+d4PGWXNQuEeHnhN7M7+JSpLpmdQ4YqvhEh4YwqkXzGKmFqpF
	sjFEB1m8CUAtFPKEwaHyEFUtSl4UCUPog+l+T4PZUhB4s5DAfREqpk7Oyyq74bRE
	Xu83hvKcooGVjp2MoPzr0S5lcAzaYbRq1sa7Aao6p+Whp1lUiHyoXy61YoDF6TJH
	1VLUcW4tCnSyTmTWgffkJC4cZQYhbtL11PEl6RPanqD/6pR3485/FWpgLuWc5FhD
	aMLyteTXwpqUEHvYqN3Dsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742462513; x=1742548913; bh=b
	QtSbsAebIiFW2nPgYN3fEu05hmxSDGpViPkOh0koQY=; b=jLPI9mzxH/l3E0zsf
	SzC9PLwK8Ff7q42HgpNcoebmCDgABrfYWmVYYgLcoNzAk9vzRJCnXUY8yGQf9l6/
	lMNbgexOaWdfgwzfEOvj0Ts6iInMyDIWEgfJZYEFdSHu+kWj/VEDy28pgl02te9u
	JFyiOic06liT4waRmKRaLd4LT6YT4LNy2cEJou4firkiz7NPfiZwQGVxWbGh++e9
	Cl1zsl9L/putUkRmO7MR2I0t1vO/L7NBwzxDTNxBZv+khkFeGBWVb1JXX3Ibzn14
	XBBofO/z0orgipB1c1coFL0e+w90+oK14xPH2OxXbV4a5Byt22VRrQMeaOMyDMzk
	VCvRQ==
X-ME-Sender: <xms:Lt7bZ8pWqXjAQ6u7qBzAZuT0FRf-IKSNeJpeJYlgmXyiPqsms9wDFg>
    <xme:Lt7bZyqMQfpTjS15apx_W1On5aBJvFYOrpUsN4FjzMBOqO_v_nyE5yaUkzUtU1SkI
    g8S-JACu45bn1b9mJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhkeeltdfffefhgffhteetheeuhffgteeghfdt
    ueefudeuleetgfehtdejieffhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedv
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnshhhuhhmrghnrdhkhhgrnh
    guuhgrlhesrghrmhdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghs
    segrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtoh
    hmpdhrtghpthhtohepvhhinhgtvghniihordhfrhgrshgtihhnohesrghrmhdrtghomhdp
    rhgtphhtthhopegtuhhihihunhhhuhhisegshihtvggurghntggvrdgtohhmpdhrtghpth
    htoheplhhugihurdhkvghrnhgvlhessgihthgvuggrnhgtvgdrtghomhdprhgtphhtthho
    pehsthhurghrthdrmhgvnhgvfhihsegtohgurghsihhprdgtohhmpdhrtghpthhtoheptg
    hhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehp
    rghlmhgvrhesuggrsggsvghlthdrtghomh
X-ME-Proxy: <xmx:Lt7bZxPC7gt6magmAguzg9AaQpy15VbQT7DAikwuuVy00CL9frpODg>
    <xmx:Lt7bZz4gbT_UC3NYCu_FnAfGC6KGYSFj93BoAlDuEPCzMyMXguwKFw>
    <xmx:Lt7bZ74y2sX7ZoHXB_-nyGLbPsYukcxteYVAyynniwTubpHATHw9og>
    <xmx:Lt7bZzjrjFNl3O27frSyV2o8kCHLfLT-UhkPHyF4Gd7PfxRxyqLA4w>
    <xmx:Md7bZ8T8nxjacSeX6SLbQC8QitXN-rHGe1jXSiFmXzkSPnWKCN671kNX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 65F342220072; Thu, 20 Mar 2025 05:21:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T4d23c9949082f1fa
Date: Thu, 20 Mar 2025 10:21:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ingo Molnar" <mingo@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nam Cao" <namcao@linutronix.de>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Stuart Menefy" <stuart.menefy@codasip.com>,
 "Xu Lu" <luxu.kernel@bytedance.com>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Dawei Li" <dawei.li@shingroup.cn>, "Mike Rapoport" <rppt@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <9256ca10-323d-41b4-b935-5281f925d50c@app.fastmail.com>
In-Reply-To: <20250320084428.51151-1-cuiyunhui@bytedance.com>
References: <20250320084428.51151-1-cuiyunhui@bytedance.com>
Subject: Re: [PATCH] riscv: introduce the ioremap_prot() function
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_022155_364294_91F65B75 
X-CRM114-Status: GOOD (  15.58  )
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

On Thu, Mar 20, 2025, at 09:44, Yunhui Cui wrote:
> It's advisable to avoid mapping memory with the non-cache attribute.
> This is because issues may arise when the same physical address is
> mapped as both cacheable and non-cacheable simultaneously, such as
> in the case of hardware prefetching.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Makes sense to me. Ideally we'd have the check in generic_ioremap_prot(),
but I believe this would break on (at least) x86 because of
legacy callers of ioremap() on memory.

> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index a0e51840b9db..736c5557bd06 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -133,6 +133,8 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>  #define outsq(addr, buffer, count) __outsq(PCI_IOBASE + (addr), buffer, count)
>  #endif
> 
> +#define ioremap_prot ioremap_prot
> +
>  #include <asm-generic/io.h>
> 
>  #ifdef CONFIG_MMU

This feels slightly wrong to me, the "#define foo foo" method
is normally used to override a declaration or inline function with
another one, but this one only overrides the implementation, not
the declaration.

I see the same is done on arc, arm64, parisc, powerpc, s390,
sh and xtensa, so we can keep this one as well, but it would be
nice to change all of these to a less surprising approach.

Maybe we should just remove these macros from asm/io.h and
the trivial wrapper from mm/ioremap.c, and instead change the
other architectures that have GENERIC_IOREMAP to use

#define ioremap_prot generic_ioremap_prot

It seems this would be only csky, hexagon, (some) loongarch
and openrisc.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
