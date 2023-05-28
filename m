Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441B0C7EE2C
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOYbg+CsaWSRwQikrbptXZZ5vmxLngyqwJyfgMnARSk=; b=iQrrX/syqWH16s
	UOkkV+XRAFIkG33YK8hGXKfGJ7+zj3bbUhX9Cb99P20+azZ4380X+aCcFVkNUiw3CR5EcFA1uztFM
	r1swBTJuQ3TssTDsIYQThoBZ3NiKyAnkr73mh7j42ZHheSoF2Be1uGNDiEF5TRgLo6mJvSRTd1jbQ
	LODQroBmzDBeRkv19mRH9CCJg168tf+IzReDq+5Gpx68AIhVu8IHXOBSSH1rYo4zP3l5r4rdPwN03
	rspYrw6vKzSkZbL4Uq+gjAhWRfKeV6jGrY9J2sgREAu8KjbvhlkriUF/kVsLlxoOObFI1h+2lcZEO
	8TF2J+ebdn7iV/pQ+u0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3BzA-007CnU-2I;
	Sun, 28 May 2023 08:42:44 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Bz7-007Cmy-35
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 08:42:43 +0000
Date: Sun, 28 May 2023 10:42:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685263359; bh=EGbU+HDeb2zPClqYYHwVtF+Aw91kwDU3hoGetLVCJZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFHry4Zgb4fzUMCkqYKBkHBNM0AdSkyUS1A4NvdIfB+O0V0fmjzw94o3MDLD5WA7+
	 /dsarczgGGsix8TBAo/ufggHA67Pw+w4LwjPEld0NYsRW1L2+s6bbW+WV2VmMVuEtT
	 d4dy2G3mhFSjldk3XD8T5Un/a8aMP1HS+ZEtBNBw=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Message-ID: <210e5ed9-be89-4e48-9c1e-3eb5b0dd288a@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <20230528075955.GE1956@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528075955.GE1956@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_014242_170464_58968550 
X-CRM114-Status: GOOD (  18.79  )
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

On 2023-05-28 09:59:55+0200, Willy Tarreau wrote:
> On Thu, May 25, 2023 at 01:33:14AM +0800, Zhangjin Wu wrote:
> > Thanks very mush for your kindly review, discuss and suggestion, now we
> > get full rv32 support ;-)
> > 
> > In the first series [1], we have fixed up the compile errors about
> > _start and __NR_llseek for rv32, but left compile errors about tons of
> > time32 syscalls (removed after kernel commit d4c08b9776b3 ("riscv: Use
> > latest system call ABI")) and the missing fstat in nolibc-test.c [2],
> > now we have fixed up all of them.
> 
> (...)
> 
> I have read the comments that others made on the series and overall
> agree. I've seen that you intend to prepare a v2. I think we must
> first decide how to better deal with emulated syscalls as I said in
> an earlier message. Probably that we should just add a specific test
> case for EFAULT in nolibc-test since it's the only one (I think) that
> risks to trigger crashes with emulated syscalls. We could also imagine
> dealing with the signal ourselves but I'm not that keen on going to
> implement signal() & longjmp() for now :-/
> 
> Regardless, in order to clean the things up and relieve you from the
> non-rv32 stuff, I've just reverted the two patches that your series
> reverts (1 & 2), and added the EOVERFLOW one (3). I'm pushing this to
> branch 20230528-nolibc-rv32+stkp5.

If you are fine with pushing more stuff to this branch, picking up 
the fix for the duplicated test gettimeofday_bad2 (7) would be nice, too.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
