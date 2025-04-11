Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35EBC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 06:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rJMMG8IHo9PZyAPUXy2eqDbGXpGddIpVRaPuc3XOt/A=; b=nk8OrlbhuyNHxgaLwqWnch5bBL
	S6vzSL6ty1vSAkleWM8JJv8O52MyYRhFuEE3wxVGVW+smwg8gOVRxSNHgd2HdtTkNsZR+Tesbxwfw
	Umg6cJmso3LVUaRnstebl4TOv3o4D/CpgoaNeR1cYwrduloZhvD62ZkH/FV4sMhgQUeA/75+Z3XAK
	m+QpMYwAxdmfE9R+Nm2N4SiAFYlJy4w4A00I6zfCGbY/kUFX6L6+IX4koTXMYJND/Yu5aJGXcOefZ
	VvvycnZdJjM8BI/kW9pR+bhxqSaHsbwL1yZsY9MS9LlQV57HwyqYTHZcKf2mwLSpmr2AwLyaYX1EG
	KlCcthaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37YX-0000000Cfc1-0dpG;
	Fri, 11 Apr 2025 06:08:01 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u379K-0000000CZbg-0Hhz
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 05:41:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 8B4A51380211;
	Fri, 11 Apr 2025 01:41:56 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 11 Apr 2025 01:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744350116;
	 x=1744436516; bh=u/lIgIq2sZs+QysnD13sol+n3mWytya/qtsWIP2cQK0=; b=
	H4yCcFx46+xNBNbovJsA4EnGPX7VQi6FbyLloTokwffY6LCVXZ73b9aMGPNYmAOA
	mc276oNGc03cg0bF8wLWt9mkS79TB8y2VS9Db464jL14bVJ30244YGOxf0voh7t2
	briCCnx9OGSttXz8cH78kxAqZOEta3BYqeqH835Jp8DNCjD/DIwmOpHudEezECH2
	MhEokfwLh9+gI1GOgzrVZRe8gBMQvTBo6X3T0lRjFch/msgDMlnYseLz1PXmG8dl
	F48GC4S+PnmPWbYlLvzPdA9fRVs3M2rhCMvqdeEjU/MwY5e9yFOT8kTpSsHsDcXw
	1mvL1O753odZpYh3ZQFQ6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744350116; x=
	1744436516; bh=u/lIgIq2sZs+QysnD13sol+n3mWytya/qtsWIP2cQK0=; b=a
	jrc4d8CxTcJHNpEaby4xm8bBVOO6OA62CjMnhotFub8IuQqYhgU+znSj2p9P5lt5
	UL1T8ye1d1oPlejTfB88zXxoLqzQkIMcAEDYGqhObmRx9sX5HxFzBNXNw9er7uMo
	6TghFuVEuIpI5cV39bpwyKUgvVgChm3aG0I0gYBu6PCb+8f7EClI9GdT9/Kgh2RQ
	CITUD5/LS6wZH8gBRu/bK/fnwqXLikt2fB5Un8eIrHA57H7r2t5PhrtCkLn7E7pn
	f9HzGxdy92dtRNIE1n+ZqZK/kToGqzTgiUJY9bJ+26ipCuq/vGqHTefuZxjO6ZWa
	b4EZL5zwU+XZr07vGzuEQ==
X-ME-Sender: <xms:o6v4Z6cw5nJ9I835vZu4Yt_fCNkbznE4mwp31Jo-SCOLkSfHbH5FCg>
    <xme:o6v4Z0Pdoq93GCPXVZyobMmpsYf-8rVPjxdtXHHJw2_cDUSLZF2xDXgEJdEBqc7yT
    EQsGU9_bx90Mi3MtLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddutddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhm
    rdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpth
    htoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrlhgv
    giesghhhihhtihdrfhhrpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopehkihhrihhllhdrshhhuhhtvghmohhvsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrgh
X-ME-Proxy: <xmx:o6v4Z7i_RiYTvdPh5P_GA6Nc-L5RAvy1mklYjA8hlRAz_BoYC8TRQA>
    <xmx:o6v4Z39d4m6ioLxH_V1Ij00ZvWdU1gcRkV7fdW6FhFh4hLsMaCjPKA>
    <xmx:o6v4Z2utuSVyC8Qzu2SBjFaj0RTuO6h4CX5BylMq7mpC_TekykxFKQ>
    <xmx:o6v4Z-GUZwvChgmYUtjAoohEJYF7TGmEg_3m4JrI2S36LG7rojbsEg>
    <xmx:pKv4Z0OgV3ihPjKEN67-k2xz8gZBwn373gRilAZeXQq-1w0wvR0Wp8YS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EAF8B2220073; Fri, 11 Apr 2025 01:41:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T39ebf2d19aff607f
Date: Fri, 11 Apr 2025 07:41:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Liu Runrun" <liurunrun@uniontech.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Ingo Molnar" <mingo@kernel.org>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, WangYuli <wangyuli@uniontech.com>,
 zhanjun@uniontech.com, niecheng1@uniontech.com
Message-Id: <b2424c71-d076-4880-86cd-ccf74995f080@app.fastmail.com>
In-Reply-To: <20250411023408.185150-1-liurunrun@uniontech.com>
References: <20250411023408.185150-1-liurunrun@uniontech.com>
Subject: Re: [PATCH] RISC-V: Fix PCI I/O port addressing for MMU-less configurations
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_224158_445472_915ED17D 
X-CRM114-Status: GOOD (  21.98  )
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

On Fri, Apr 11, 2025, at 04:34, Liu Runrun wrote:
> This patch addresses the PCI I/O port address handling in RISC-V's
> port-mapped I/O emulation routines when the MMU is not enabled.
> The changes ensure that:

Do you have a system that requires this? I sent a patch the other
day to make PCI 'depends on MMU', based on how nothing today
uses it. Having a NOMMU system with PCI wounds rather silly,
so I hope we don't ever get that.

> 1. For non-MMU systems, the PCI I/O port addresses are properly
>    calculated in marcos inX and outX when PCI_IOBASE is not
>    defined, this avoids the null pointer calculating warning
>    from the compiler.

This is the wrong way around: the warning tells you that you
have failed to configure PCI_IOBASE for the particular hardware,
and that you actually get a NULL pointer dereference.

The solution is not to shut up the warning but making it
not a NULL pointer dereference!

Part of the issue is that historically the asm-generic/io.h
header includes an incorrect fallback of PCI_IOBASE when
the architecture does not provide the correct one. I think only
sparc still relies on that, so that fallback definition should
be moved into arch/sparc/include/asm/io_{32,64}.h instead.

> 2. In asm-generic/io.h, function ioport_map(), casting PCI_IOPORT
>    to type "long" firstly makes it could compute with variable addr
>    directly, which avoids the null pointer calculating warning when
>    PCI_IOPORT is a null pointer in some case.

I don't understand that sentence, please rephrase.

> The original implementation used `PCI_IOBASE + (addr)` for MMU-enabled
> systems, but failed to handle non-MMU cases correctly. This change adds
> conditional compilation guards (#ifdef CONFIG_MMU) to differentiate
> between MMU and non-MMU environments, providing consistent behavior
> for both scenarios.

This also looks wrong: what you are distinguishing here is systems
with (potentially) I/O port support and those that never have I/O
port support.

> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index a0e51840b9db..d5181bb02c98 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -101,9 +101,15 @@ __io_reads_ins(reads, u32, l, __io_br(), 
> __io_ar(addr))
>  __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
>  __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
>  __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
> +#ifdef CONFIG_MMU
>  #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, 
> count)
>  #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, 
> count)
>  #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, 
> count)

I see that these are defined unconditionally here, which is probably
the real mistake. What I think we need instead is to enclose
them in "#ifdef CONFIG_HAS_IOPORT" with no "#else" block, and
ensure that HAS_IOPORT is only set when building for targets that
have a sensible definition of PCI_IOBASE and IO_SPACE_LIMIT.

The same approach is used in asm-generic/io.h, we just haven't
done it for all architectures yet, since it's not entirely
clear which ones can support ISA bridges and legacy PCI devices
with port I/O.

Ideally we'd go through the individual PCI host driver
implementations and only enable HAS_IOPORT for those that
are can handle the I/O space window correctly, but leave
it out if none of them are selected.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
