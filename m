Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1457FC54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 10:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvMOhbgp+1fFz+DezFv1kaLcZ5cl+By1PkWjVLVKkLk=; b=W+Gt9CaBGBskZC
	d1agL7xjQFEwKBRUfOUDZmy3mzq4lx5fXHOYngZwGQDkelCvfzaYKy/a5wVropek4LRHhpkTI2i9J
	YXfQr11+6zj0+CjLicZ6m4CshW0JB1XOcpq0Y/4u3FbzSgBURQbvpUwJnFLoh1Y52p/XAST4k8ECN
	pck427FNPZnrk3gW/3ZG4hUZVISZrrXDYcUIt1JJEBN27BvImY7kUB27VA2tp7h6gBLLXTAqTD0/0
	Yt6QaXq/WjlwUe9DZzUJ2OjBlqSQ8dq6InmCj874npC5XBk+cpplxI0S8Ol9C3/JVdkW0BvPOSkjS
	z8cUtyrnFdClPq9wy7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFC9W-006PnZ-OC; Tue, 10 Jan 2023 10:46:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFC9U-006Pmx-3C
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 10:46:45 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pFC9R-0003U3-CL; Tue, 10 Jan 2023 11:46:41 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, jszhang@kernel.org
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different str* implementations
Date: Tue, 10 Jan 2023 11:46:40 +0100
Message-ID: <1994655.QkHrqEjB74@diego>
In-Reply-To: <20230110093936.nzc3nkrkqkkzxkaq@orel>
References: <20230109181755.2383085-1-heiko@sntech.de> <20230109181755.2383085-5-heiko@sntech.de> <20230110093936.nzc3nkrkqkkzxkaq@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_024644_166553_0368C150 
X-CRM114-Status: GOOD (  22.73  )
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

Hi Andrew,

Am Dienstag, 10. Januar 2023, 10:39:36 CET schrieb Andrew Jones:
> On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Depending on supported extensions on specific RISC-V cores,
> > optimized str* functions might make sense.
> > 
> > This adds basic infrastructure to allow patching the function calls
> > via alternatives later on.
> > 
> > The Linux kernel provides standard implementations for string functions
> > but when architectures want to extend them, they need to provide their
> > own.
> 
> And the compiler provides builtins. In the previous series it appeared
> to be a bad idea to compile the kernel with the compiler's builtins
> disabled. How will the optimized string functions which will be based
> on this patch be selected?

yep, the consensus seemingly was that the compiler knows best when
to use builtins for some cases (which is probably correct), hence the move
away from the inline bases.

So I guess the first decision is the compiler's wether to use a builtin or
the kernel string function (same as for mem*) .

In my tests, I did see both getting used - so it's definitly not lost work :-) .

After that when landing in these here, we want to select the best variant
for the host-system the kernel runs on.

I.e. this one as baseline or for example using zbb as an "alternative".

As for the "more" variants, I currently have more patches on top, that
then use an ALTERNATIVE_2

ALTERNATIVE_2("nop",
      "j variant_zbb_unaligned", 0, CPUFEATURE_ZBB | CPUFEATURE_FAST_UNALIGNED, 0, CONFIG_RISCV_ISA_ZBB,
      "j variant_zbb", 0, CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED, CONFIG_RISCV_ISA_ZBB)

with the "errata_id" being used as a bitfield to use extension combinations.
And a "not"-field, so I can do a has-zbb + has-not-fast-unaligned


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
