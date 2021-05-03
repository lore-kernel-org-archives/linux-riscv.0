Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9725C433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 12:31:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA27561001
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 12:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA27561001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aWWf3dTPN/C9qbi/UvjtIwO2WEuiqRzzKEYXpVIkzR4=; b=FLLK+Iy64ipfOl25bPrAPAXCz
	+G0SDUP66DDZI1FgiWmHHzouNCFh2LCuMFN1oAZH9WZJf4sup+Es4CKZEB7zkr6BAhjWLEfhBbiTz
	YZHN62OgsZBWRXMlzS/mGNCIIS0IrP5TCR15uQxuBdDOdN2PDFLdzfTIBKWj7W3deqoVP8ZwS5L5R
	e27yWiPU5jNV2DBnl5BnjySpbSJSih7YIRj+DbEec0njtM//8UEllecikwixrdXb9JilGECE3AnlJ
	2D9i8ggHVKT1hipxROhjFe8R9FTcBxRnrPw401KNC7Jr2uETK2VBKMDQ7YXY97ZC74oVJg9IZun9s
	TervjOi/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldXjb-00DrYs-Sx; Mon, 03 May 2021 12:31:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldXiF-00DrRE-He; Mon, 03 May 2021 12:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JpPokS6TxqFqGt0w7z5Rh6fqphoICGx/m9MkctLQ3Gg=; b=Vx5PgLZGXNLYbeZo2nfZsYx+RZ
 YqqF3sscjupPcit8VfnsImKFq+SyRxCWHHii2Hd/dg+Q4QpEIXywonxjaAicJ4rpZJwi4UHYzODb2
 TvlrIsZAWDJDd2NlyiX10d0xxVUcMK8Tuit9HotPlWCSf61jlOZQR6kTb3PL/HlTPziW7CBqjfymZ
 qD/EYszB+9fIADC4eEYYCsrSSGj/sJ7oPSxQH5DYOfA43pba9oRf3hgwG4Wf500/QmJFvrNtFqVEq
 ykgZfWfH6XVMjz5gQm00z3XyI72eWhSj2qkaFBr4yYxoYWb+CfPReywIytWu65alOi+CgoI22y4+3
 lSyH3rEQ==;
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldXiC-0033US-P3; Mon, 03 May 2021 12:30:10 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52E8DAD22;
 Mon,  3 May 2021 12:30:04 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id C7B22DA733; Mon,  3 May 2021 14:27:36 +0200 (CEST)
Date: Mon, 3 May 2021 14:27:36 +0200
From: David Sterba <dsterba@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210503122736.GG7604@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20210501151538.145449-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_053009_146996_BE633BB3 
X-CRM114-Status: GOOD (  15.26  )
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 02, 2021 at 12:15:38AM +0900, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> GCC 5.1.
> 
> When we discussed last time, we agreed to raise the minimum GCC version
> to 5.1 globally. [1]

There are still a lot of comment references to old gcc releases with
workarounds or bugfixes, a quick serarch:

$ git grep -in 'gcc.*[234]\.x'
arch/alpha/include/asm/string.h:30:/* For gcc 3.x, we cannot have the inline function named "memset" because
arch/arc/include/asm/checksum.h:9: *  -gcc 4.4.x broke networking. Alias analysis needed to be primed.
arch/arm/Makefile:127:# Need -Uarm for gcc < 3.x
arch/ia64/lib/memcpy_mck.S:535: * Due to lack of local tag support in gcc 2.x assembler, it is not clear which
arch/mips/include/asm/page.h:210: * also affect MIPS so we keep this one until GCC 3.x has been retired
arch/x86/include/asm/page.h:53: * remove this Voodoo magic stuff. (i.e. once gcc3.x is deprecated)
arch/x86/kvm/x86.c:5569:         * This union makes it completely explicit to gcc-3.x
arch/x86/mm/pgtable.c:302:      if (PREALLOCATED_PMDS == 0) /* Work around gcc-3.4.x bug */
drivers/net/ethernet/renesas/sh_eth.c:51: * that warning from W=1 builds. GCC has supported this option since 4.2.X, but
lib/xz/xz_dec_lzma2.c:494: * of the code generated by GCC 3.x decreases 10-15 %. (GCC 4.3 doesn't care,
lib/xz/xz_dec_lzma2.c:495: * and it generates 10-20 % faster code than GCC 3.x from this file anyway.)
net/core/skbuff.c:32: * The functions in this file will not compile correctly with gcc 2.4.x

This misses version-specific quirks, but the following returns 216
results and not all are problematic (eg. just referring to gcc for some
historical reason) so I'm not pasting it here.

$ git grep -in 'gcc.*[234]\.[0-9]'
...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
