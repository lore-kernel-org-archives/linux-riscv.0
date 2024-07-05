Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EE4C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 11:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DdY6BpM58T+57wtEaJgRotLrxcgCx521eHGzwHQtF4=; b=aymZ7PBoINooMN
	xC6+suIX+luD4K9HAOHM2+sAmX2k0PEk+IO0e0j6UpbpvXMbw7b3xxXJEuv2ZkMKwpdrm7Qcjgl6e
	tWDr0mYp7O5OmcrxyR7Se9IPwqeVesEfKBEDnbBetugpBaNzPR1xq8w3Tle0hWH8hhtYRMEXmmV5v
	P3AlfnySgiPjH5cCkxTMMAf2KlJpqq6QFLFX6W1gO4UuS4FFXu+xxTjzBSzwxOy4gRTtfeo+B2Cld
	1OY0F3eXBahokycfeYFbTXpJQPDMvET/P+GYkmnPQYa2R0kf8Tw+j9AQNJdntHu0vY1QsDGhwI41l
	ZI+qyBdHZNCf4+EofUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPh3w-0000000Fn7X-17Tq;
	Fri, 05 Jul 2024 11:25:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPh3t-0000000Fn6x-12qZ
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 11:25:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADB2362BC0;
	Fri,  5 Jul 2024 11:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5916AC116B1;
	Fri,  5 Jul 2024 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720178708;
	bh=zL5UUf2rkWrONcbOjBn83uC70xqxiAQyDDUJsHOHsDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JajDcWBbQaWDymEAoQxk7KNr7A7ds2MRAtRX3kPJl8DLJHNsXwiR9ddtSy+HXRW30
	 FKhK+vaaJcJZy9w9DCwXTr9brYqFR+YMlmjrMwxt8g5JfLDmg/FhSbCVabLkszvj2i
	 4t85IXZkCbNvuosNctIDV9RSmkXEtPI0Qi3WutCEdGlKm75psFaYna/8I7qDqH4Yjx
	 YOpW9faSUmPnTvss4WT/gbKbbG8i+fZm5NJTVAMzeVrl2Mgw/+UZrLylwUKrmTWUx8
	 DCrYY12yfv4dS30Tbv4W360xxwabRn9ohKXHIpEoF7sD3fJJkwqLweBNdYBDtoYr/d
	 e6hNklBJlSRPQ==
Date: Fri, 5 Jul 2024 12:25:03 +0100
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
Message-ID: <20240705112502.GC9231@willie-the-truck>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
 <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
 <CAHk-=wiv=9zGSwsu+=tKNgDg8oBUJn_25OEy_0wqO+rvz7p8wg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wiv=9zGSwsu+=tKNgDg8oBUJn_25OEy_0wqO+rvz7p8wg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_042509_355534_1B4621B0 
X-CRM114-Status: GOOD (  17.62  )
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

On Sun, Jun 30, 2024 at 09:59:36AM -0700, Linus Torvalds wrote:
> On Tue, 25 Jun 2024 at 11:12, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But yes, it would be lovely if we did things as "implement the
> > low-level accessor functions and we'll wrap them for the generic case"
> > rather than have every architecture have to do the wrapping..
> 
> Btw, to do that _well_, we need to expand on the user access functions
> a bit more.

[...]

> Will/Catalin - would that
> 
>         src = masked_user_access_begin(src);
> 
> work on arm64? The code does do something like that with
> __uaccess_mask_ptr() already, but at least currently it doesn't do the
> "avoid conditional entirely", the masking is just in _addition_ to the
> access_ok().

I think we'd need to go back to our old __uaccess_mask_ptr()
implementation, where kernel addresses end up being forced to NULL. In
other words, revert 2305b809be93 ("arm64: uaccess: simplify
uaccess_mask_ptr()"). If we then want to drop the access_ok() entirely,
we'd probably want to use an address that lives between the two TTBRs
(i.e. in the "guard region" you mentioned above), just in case somebody
has fscked around with /proc/sys/vm/mmap_min_addr.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
