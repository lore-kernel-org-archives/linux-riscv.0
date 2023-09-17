Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDC6CD37B3
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVcJxlGoy6sL7DlSDIP166VxOaFYly+CqRur5PfAjOA=; b=LvjsxW/xlqMQHm
	nvstI5Kb98HyQpg73p1Oj4fb3zVgk4iVOem93tajPDc4xsr2qm547WpdMUfejZmIn+GEHDFQSg6hL
	JM2RBJ+EhRn1lYLnsIeuOvQU7L9gdLnX98c9uE74KBhMksWP7hzx8FoErcZMQ36b1bNPEmVNq0Tza
	Ja3O/oeiTgkPKaKmEvL10QF1b/VYeIlBbNFqpqBQbaeIF6/VyqGznltrK8xlgz+h9T0omc0B22zYA
	+TAu/hT3i5yw6rKfgFUBxsB2Q3OG+trAfTI+xz9uPUR5DltfVDUQpXSd3vRUOrDALJ2cEGcj1q5qR
	XP3fHu6eK4zRluUurmbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtMy-00Dkvp-1K;
	Sun, 17 Sep 2023 15:07:32 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtMw-00Dkv2-05
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 15:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694963241;
	bh=7/Orlex/DcvUIrTiTjE7jsedSBarqpG1A2LXaMcy8Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYuutu8oStQ8LzGOg0Z6E4Zq1iuoPXBte3vGMm7tU5ca2WwdeLLkEDX5YWTddKPD9
	 HQ+fIvAsLr4WZ1Ov23zLu3BJs0gjM8xDZk+lHOvJYXl90vkx4fjwDs2wBt/2i8nfTa
	 dDFx8MmxNfGpHZGHwZPrLptXsFTRR2ulS56I+E2A=
Date: Sun, 17 Sep 2023 17:07:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
Message-ID: <1ef57a1e-89d3-4eb6-be12-3045a31f99e4@t-8ch.de>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-2-e50df410da11@weissschuh.net>
 <20230917025851.GE9646@1wt.eu>
 <2bd688b7-5f1b-44ca-a41b-6e90dc3e8557@t-8ch.de>
 <20230917094827.GA11081@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917094827.GA11081@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_080730_219228_706C4D8D 
X-CRM114-Status: GOOD (  13.13  )
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

On 2023-09-17 11:48:27+0200, Willy Tarreau wrote:
> [..]
> > Maybe the macro-equivalent of this?
> > 
> > static inline int __nolibc_enosys(...)
> > {
> > 	return -ENOSYS;
> > }
> > 
> > The only-vararg function unfortunately needs C23 so we can't use it.
> >
> > It's clear to the users that this is about ENOSYS and we don't need a
> > bunch of new macros similar.
> 
> I like it, I didn't think about varargs, it's an excellent idea! Let's
> just do simpler, start with a first arg "syscall_num" that we may later
> reuse for debugging, and just mark this one unused:
> 
>   static inline int __nolibc_enosys(int syscall_num, ...)
>   {
> 	(void)syscall_num;
>   	return -ENOSYS;
>   }

But which syscall_num to use, as the point of __nolibc_enosys() would be
that no syscall number is available and the defines are missing.

For debugging we could add a string argument, though.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
