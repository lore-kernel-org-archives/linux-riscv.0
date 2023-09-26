Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0062E7D0C5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 06:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVxfvWU1vG+P9mne1C4ARbSlxz/+jGcXvXy0/lWPLgw=; b=iYFPEC3e0N345p
	mW1cLhIOy1vWQuGa/jhIO+Z8Ne4/z69PWxkSMx+9YpWnDkWUNmU+TEHXOpLbXehbxjG9Qz4Z9lEQq
	TRxvX0o880nLLL3ox0Rdr2A7aQgzuNExKG9vEhldOyQBDv+XkfkQexKPJZkMYLyFQQoogB5NWx9O2
	BdfQpVg/ivUCtTEIKGBy7W9Erqc2rQNAhdFb4qQHi4BtjgkaS0bjAyApOjuTOxyin/DGVsufGsUEf
	lOFZypcSb/7ujv4rITsa+P+ONwBK7ffFqI9Nf01TZR2QAqnOJzhErHkJxSd8yRdCHugd6IUHYFpbB
	ncj0JsrcLs1SyOFtojXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql18T-00FfnN-13;
	Tue, 26 Sep 2023 06:01:29 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql18Q-00Ffmx-0U
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 06:01:27 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7298832009A9;
	Tue, 26 Sep 2023 02:01:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 26 Sep 2023 02:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695708084; x=1695794484; bh=w/
	4ipUt4YaYJVMn90dIRLMV9blP8uDxHBm7ZB3nucyE=; b=S02BKYOI6Rh5Iumm/y
	Iubc3e3DDnrQMuYwumMWaqDk/+s0aZVKTRWF/5pRHhLF3zjsWN/nH1Tck9WcOQ+B
	XQN7n+Ni6oeu8pW5Itv4Hw3PKhsGjuAlLlvqe/SqdRqK1kbv1wnUHd3Qr3hsHKQW
	gH/hN9kW9NKIKhoLlFpBODiiS/mu0NA8rYhuuC/4FwXktdjdOdDgEE/pFyZH7l6s
	Ec9N4yzST+CS13M6pfhwdOun751FShA2sobg/q2JFx9pITQjlfdOAnzceRIUS7m6
	SoJCjDtVwss+b1i6xRyOhE4ofbtObhBFLIbg+hsWnzCXUSMhVBEPolG53QH7d2lR
	0Gzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695708084; x=1695794484; bh=w/4ipUt4YaYJV
	Mn90dIRLMV9blP8uDxHBm7ZB3nucyE=; b=kZ2VJNxITGz5/swa9vulf6xSIyV+6
	Xc/eVnsJjNXSR2pwgMYABr0E7P+HpQN+pVb80NX4lFSKvD4Or6y9Lz0ts36lDt1Y
	ZE5D60TVKkgyCmkLkmzB5WBQ4BdEl+ZEievW+zJi2/2Srnd2GM+aMijO7vB4Wx2Y
	KVExowlqj2wnIZHjFbzLRj2hBTs0xrnJPhSieZVWpjVU3EDG2ezPSGKons4BvpgB
	98rBprrLuYb3PUo7IhLAFd7uaNwpQXst28sySTMg6hv9oVdjz8b0tPnqjZ8HnWGk
	mHQrkv9LgwPFgiEYtkXMhHhz/pyeYYxjGVR9obj+Drwt1lxgBH9Erkn8Q==
X-ME-Sender: <xms:s3MSZfRA4S6VZNEKTVtbfIthvJOuhe66GTAcahugSYVAAb7kOS47uQ>
    <xme:s3MSZQz8KRc5scIw-3RZHLgiVkGs2Xn4Ee9YUBelHR9a7K1L7OcW5cNXMVCDwztYW
    81N-lIQ-gTtwJ-BxCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:s3MSZU1xw0_yZN340Dg_WoIYhEKBL1_XF3S2n7RZAkx2MGFFYQXkNg>
    <xmx:s3MSZfDX4QsOSyKtre_kCi5kz3VUkYwUj7cTAuEzzf8nLk7W6hXOqw>
    <xmx:s3MSZYhVrmSJGmIduNkqhcGbOvr02avWQvkfgv6JEVXE9fxqhrRg2Q>
    <xmx:tHMSZbPU3L2STJGA2xUZrEWAFbsIvUebNFGh1PiyxqJit-CFsZI3ug>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5E4D0B60089; Tue, 26 Sep 2023 02:01:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <e160b4df-92ce-4b9c-96ba-200f259c8216@app.fastmail.com>
In-Reply-To: <aad452c57bce2ab7983e723d78bd2cc7b6f533c1.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
 <aad452c57bce2ab7983e723d78bd2cc7b6f533c1.1695679700.git.falcon@tinylab.org>
Date: Tue, 26 Sep 2023 08:01:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, paulburton@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Willy Tarreau" <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Tim Bird" <tim.bird@sony.com>
Subject: Re: [PATCH v1 7/7] DCE/DSE: riscv: trim syscall tables
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_230126_217789_8A22822C 
X-CRM114-Status: GOOD (  15.15  )
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

On Tue, Sep 26, 2023, at 00:43, Zhangjin Wu wrote:
> When the maximum nr of the used syscalls is smaller than __NR_syscalls
> (original syscalls total). It is able to update __NR_syscalls to
> (maximum nr + 1) and further trim the '>= (maximum nr + 1)' part of the
> syscall tables:
>
> For example:
>
>     sys_call_table [143] = {
> 	[0 ... 143 - 1] = sys_ni_syscall,
>         [64] = sys_write,
>         [93] = sys_exit,
>         [142] = sys_reboot,
>     }
>
> The >= 143 part of the syscall tables can be trimmed.
>
> At the same time, the syscall >= 143 from user space must be ignored
> from do_trap_ecall_u() of traps.c.
>
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  arch/riscv/include/asm/unistd.h               |  2 ++
>  arch/riscv/kernel/Makefile                    |  2 ++
>  arch/riscv/kernel/syscalls/Makefile           | 22 +++++++++++++++++++
>  .../kernel/syscalls/compat_syscall_table.c    |  4 ++--
>  arch/riscv/kernel/syscalls/syscall_table.c    |  4 ++--
>  5 files changed, 30 insertions(+), 4 deletions(-)

This bit feels like you are overoptimizing for a corner case:
there is not much to be gained in terms of memory savings, but
you add complexity in an area that I feel should be made common
between architectures.

I hope to get back to working on consolidating both the
syscall.tbl input files and the build infrastructure for them
across architectures, and you make that harder here, so I'd
prefer you to drop this part, at least until the code is
shared across all architectures.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
