Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30676C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 00:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObqsCcgIWPac+CziAWpWIxNqpm5YJout4KbqqsQS5ls=; b=jSmPb5axnWLUF2
	rEJlxOpEyz3XmU7w3+Sh7PkPrU3yEaVxxnk5ixSzUZIzLv+khOyaegYqNx+q/DBYQIdTqdt3EiUai
	rm/5BfgWS6kWni1dFW/mREucrg+ldRMQMf4qTploC/asBchtVaUNOoGqzl+XzskGaKOEGCCEU8wGB
	LJZoqPPCpD9ZuxoNg1P4Nm6bIgvA6Bf1zvrchuWVFRNXd+X7PhJUJN07fZDHCwVK6jm/5Wp5OMZQw
	+EaB0yd+1qIjhd1uUq1MLMfaWhZtp8yo3NwYB1l+7MVfqoraejMw5IOJOurmq3E2zZb35PejV5NV5
	DGLHINFzqt0vT0WqR6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okEBy-005HOb-9J; Mon, 17 Oct 2022 00:41:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okEBu-005HEu-Ft
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 00:41:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7E3D2B80CC3;
	Mon, 17 Oct 2022 00:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90075C433D6;
	Mon, 17 Oct 2022 00:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665967265;
	bh=FUOUlzt5BRDqsXFWN6sPJsKiLvmj3iudLIpob+Peo9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHaTopcfle+C0cDQbHIVhD1HZXN96LdC2zMl/WExOPuLpGQhgAaUz1xxNaVoimx+L
	 sDiqv+gNM/fNkBu6CYltMt640zCVmeXR0mil75LQOdwIlGPOlIrTyZLa3LQzJ37im1
	 JVlTyDLENjVmpAc49NdqZBGMUVYV319B9hwgsn+KEuPuESJgBUkk0mbGXrOeIHlOhu
	 dAIrG+vsiN9VTSjEl+EUZ0By53/0+D26AzpvL/1m7XpHJ+zGmWdE0PCnZ7QEwq+X3i
	 EHw2etxSN5Ebg6dDngLrccbHn8pKXdcI6/SqUOXErclb6bTqk4lOtCTSsMaOwGtdc5
	 P6DJ+YasqLPkg==
Date: Sun, 16 Oct 2022 17:41:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
Message-ID: <Y0yknpUJn5K2uhw1@dev-arch.thelio-3990X>
References: <20221014204210.383380-1-nathan@kernel.org>
 <20221016172815.f5a5f1f86af7ff1937a2e273@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221016172815.f5a5f1f86af7ff1937a2e273@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_174114_788359_8688C1EB 
X-CRM114-Status: GOOD (  17.65  )
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

On Sun, Oct 16, 2022 at 05:28:15PM -0700, Andrew Morton wrote:
> On Fri, 14 Oct 2022 13:42:11 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > When building with a RISC-V kernel with DWARF5 debug info using clang
> > and the GNU assembler, several instances of the following error appear:
> > 
> >   /tmp/vgettimeofday-48aa35.s:2963: Error: non-constant .uleb128 is not supported
> 
> hm, which kernels want this?
> 
> I could merge it for 6.1, which seems suitable.  If we want it
> backported into earlier kernels then a Fixes: would be nice, to prevent
> it from being ported back further than necessary.

Masahiro took this for 6.1 via the kbuild tree, it is now in mainline as
commit 0a6de78cff60 ("lib/Kconfig.debug: Add check for non-constant
.{s,u}leb128 support to DWARF5"). It does need to go to stable but it
needs a few prerequisite changes to cover all cases and I did not want
to try and describe those dependencies in the patch itself. I should be
able to handle the backports manually tomorrow.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
