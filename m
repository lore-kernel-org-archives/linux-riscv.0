Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA49C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/FnuL9LCqI4/DatAjkWJx95w1o5F6Zm+dK8vB8DvpA=; b=PXFRR80Uh9SjBG
	4fHUUp5tDtFNCuckmKSH1u5fB8eUAsw6DGoO9I6Nu4uymtxZDaBcXzjRpEH740yjIdeJ2gJ1YNxlN
	CZ+NzVpkI+QaaGszvSeW3+OgY3lRPcnPsLBdvl1Oqhemw4gFXO8/VCAfLKcn3uQf6R26NzFecTWGS
	Z0evFEQYctItlZiZKPc+5papsMIV70SvWOTNQGp04W0F8/GK7bk0md7dGaefiQpytUEVHOvnN1wit
	wUTrHzRY2+d8Tl78oCbGgyf44JH5fZVRkR2PqqIvPpnfkul1YAImyAvOxChU1jjUYDf6WjbOl1whj
	9iqx1Zaihj0f0kD6tYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl7Q-00000004PiE-2J51;
	Wed, 05 Feb 2025 19:31:28 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl7O-00000004Phi-1H3n;
	Wed, 05 Feb 2025 19:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738781950;
	bh=SYRJ92XRnRT/x5NskeDXbjb8HVyYz50Z7VSg1zqM4Ew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mzVxLSJNHQzpfsGg8asMfAllni44astZAk7UVDtj61QZhKUA3VzWiQKg025jlDtuO
	 IQQGXZJGyg0hvGfUeE62Iykg9RLT5BzCQoIJZUS7GMDyP3L9aN8Xw3DfgQ68ImYJGf
	 g1vnGP2zayjZxjDqcFnzDr9YcNKprDLECJW554HM=
Received: by gentwo.org (Postfix, from userid 1003)
	id E015240285; Wed,  5 Feb 2025 10:59:10 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id DDBFA401E1;
	Wed,  5 Feb 2025 10:59:10 -0800 (PST)
Date: Wed, 5 Feb 2025 10:59:10 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Dave Hansen <dave.hansen@intel.com>
cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, 
    xin@zytor.com, kirill.shutemov@linux.intel.com, palmer@dabbelt.com, 
    tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, ardb@kernel.org, 
    dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
    akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, 
    dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com, 
    tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
    jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, 
    jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com, 
    rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com, 
    catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org, 
    ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de, 
    kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com, 
    julian.stecklina@cyberus-technology.de, peterz@infradead.org, 
    kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode
 for x86
In-Reply-To: <fb30574a-d238-424c-a464-0f7a5707c46a@intel.com>
Message-ID: <3dcf7631-d839-7235-10c7-30f80d7f796a@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <fb30574a-d238-424c-a464-0f7a5707c46a@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_113126_375929_5F758BA7 
X-CRM114-Status: GOOD (  13.39  )
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

On Tue, 4 Feb 2025, Dave Hansen wrote:

> > Could we get support for that? This would allow us to enable tag checking
> > in production systems without performance penalty and no memory overhead.
>
> At least on the Intel side, there's no trajectory for doing something
> like the MTE architecture for memory tagging. The DRAM "ECC" area is in
> very high demand and if anything things are moving away from using ECC
> "bits" for anything other than actual ECC. Even the MKTME+integrity
> (used for TDX) metadata is probably going to find a new home at some point.
>
> This shouldn't be a surprise to anyone on cc here. If it is, you should
> probably be reaching out to Intel over your normal channels.

Intel was a competitor for our company and AFAICT has issues all over
the place with performance given its conservative stands on technology. But
we do not test against Intel anymore. Can someone from AMD say something?

MTE tagging is part of the processor standard for ARM64 and Linux will
need to support the 16 byte tagging feature one way or another even if
Intel does not like it. And AFAICT hardware tagging support is a critical
security feature for the future.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
