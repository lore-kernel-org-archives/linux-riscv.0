Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF6DC54EBE
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 00:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aes83QKAWkmS9wsw9qdfzUxj+ekmxH0UVmcYyw4DrpU=; b=GS+JJYmL09WXri
	XKvusxvI+ifHEJpkIvAJ9YT82rk9e0BZWzYFqQHMUUKccz7+9Iquf/AViuXT7206Hw0xwnPE2F91e
	DgVvUV3niP8aO3dYi/XN9eJfzlGiNbzlqqL+7PNA0RTVlrtvwR5l2UHkPlacKxk9JAo1dCAysvB7z
	oveyBqFPvfy/u0XIH5PgTdjIfk2zvOltAT/48bMQDz08xNHwXTdV5VejMTeuHHqYeJHPV2Mx1U58K
	aIYVTEf5jkDJfuFPb0QsPRcdgI0w8FMaD5mVWOiNMtAO2k8D4wDMN+F1yQ2AUgcnJ5BCW/r2cj1iB
	UCN6GH3Q+dFhqa5CSXsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZeT-00COZ0-RO; Tue, 17 Jan 2023 00:16:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZeR-00COY7-Dk
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 00:16:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2AFB261188;
	Tue, 17 Jan 2023 00:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53CBC433EF;
	Tue, 17 Jan 2023 00:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673914585;
	bh=OXMWDCcJVwDt9rp3TywgtXSGAL1KqslNJKqv3vu4/Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozPSXBkCMhsxymsHd61YEknn6E7vw1GxUeXc4IsNlUCf3SwMuuQxIxRcr2vUav72G
	 U5TrRrLmhK7mu/DUNfK2ddgJxxacr/Q8YlGpTFvftojMEU87GW6nJxgLQJAm/lQei8
	 TjbfHbpT1Ynl+jZ+qzKHhll6NaokSIazPM/f29r84MsHB+cqC2IDzNiyrTLALWn9IB
	 zjCJI9wzRc1YJ+u/nFu182QGNho89BERTNOTy1f1fHoj4Gk4xrXNLyWdiv3/G3rGAe
	 P1Uw2T4Y53EGfKqJI370O9knNpbYkCcJ6VoTQ5I/Z7kLimyyNqljunsXh4+7LZt+Pk
	 bTKvvAUgMmKcg==
Date: Tue, 17 Jan 2023 08:06:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] riscv: lds: define RUNTIME_DISCARD_EXIT
Message-ID: <Y8XmbogsG+gLoOHj@xhacker>
References: <20230116154800.2396-1-jszhang@kernel.org>
 <20230116154800.2396-2-jszhang@kernel.org>
 <Y8V+mXWZfA62JYvJ@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8V+mXWZfA62JYvJ@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_161631_520585_2620C97A 
X-CRM114-Status: GOOD (  21.63  )
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

On Mon, Jan 16, 2023 at 04:43:05PM +0000, Conor Dooley wrote:
> On Mon, Jan 16, 2023 at 11:47:57PM +0800, Jisheng Zhang wrote:
> > riscv discards .exit.* sections at run-time but doesn't define
> > RUNTIME_DISCARD_EXIT. However, the .exit.* sections are still allocated
> > and kept even if the generic DISCARDS would discard the sections due
> > to missing RUNTIME_DISCARD_EXIT, because the DISCARD sits at the end of
> > the linker script. Add the missing RUNTIME_DISCARD_EXIT define so that
> > it still works if we move DISCARD up or even at the beginning of the
> > linker script.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  arch/riscv/kernel/vmlinux.lds.S | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index 4e6c88aa4d87..07c19f2a288c 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #define RO_EXCEPTION_TABLE_ALIGN	4
> > +#define RUNTIME_DISCARD_EXIT
> >  
> >  #ifdef CONFIG_XIP_KERNEL
> >  #include "vmlinux-xip.lds.S"
> 
> Since the diff is identical to:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230102124936.1363533-1-conor@kernel.org/

OOPS, I didn't notice you submitted the patch which did similar
about RUNTIME_DISCARD_EXIT, then I'd like to recall patch1. I
expected some review comments for remainning patch2\3\4, I will
send v2 which will both address possible review comments and
remove patch1

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Your commit message is better anyways.

If you like it, you can take it into your v2 patch;)

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
