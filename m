Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30440606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MccjkEXM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=0vp9tCl7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uSvyhKHen0ThadwMfLgbOz9NEHUEuP/cfL8sHP/UmWU=; b=MccjkEXMcvNIa9UVajlJ5CadJF
	7HwN028+sqD9eDZj5nrb1eThvt9UgoMuoDtQyymp6aPcm5djn2ySGAgf4+EwESfn+lKniYKIrwNca
	pUFPpS1KOffVM2zdEUCuCIwNUCMSXdCaDdLd9849UVdtqtKdPZILzMgYsyYpPbLPz6yiGwxfRAWWu
	UosfvNdeTuEWbBXvwiN9NYY/7UVhgDiClFrnh/pqxaK/Qo7PTxM9DFNJAzsyOSQ5mGlGYLzC9dhP1
	RILYa1+gMmwAhk1NmNvvUjxRZgf5V1esH1lNAUi3HBxByM0twfhw87RLdBsYpHcxMqWE32cpjcC/Z
	H963nmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJw3B-0000000EXtG-0RZF;
	Thu, 22 Oct 2026 16:53:57 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJw38-0000000EXsK-0AzV
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 16:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=MN3l1M08sCGITJaNtvFuaCEwDyESp6f/Fe3N4avbuGo=; b=0vp9tCl7c+otLaBYlnXL8J1OF5
	eL2Izybj6MFAyiOHuhixca8q8nzKlYq2EqjjtB5CEuDRRVYuBblQbwD5e1lywvECG7edmLSLcGBQU
	9caE0Ik3Sa/UTTqkCP4XtYhQiXk1eF3Mm0EeAqJFO0tns0ANjYGsZJh3Slz2PgXSNQOvW/DU1aWIV
	toG2cCH+5+bQ0Z4tkJRMJnf1qMwSFfHNW+6rftLyHc/HIqFtU5qSzaQttYOH1FTyryioHwerxcAw/
	QSpt+bsHkRCG4ygAgd9LFYkyeE7C4k9JgkiPqKWH2ardBBYIfzJt8c5T44LHo4ybOc0r+9R1QDzHm
	/63CNNzQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xJw2v-0000000EAHB-2ts7;
	Thu, 22 Oct 2026 18:53:41 +0200
Date: Thu, 22 Oct 2026 18:53:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andy Chiu <tchiu@tenstorrent.com>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <ato_lUcnuZV30Mtj@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
 <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
 <arSshYwcyHjC2dh3@aurel32.net>
 <arS-yYLK8Df5knSE@gmail.com>
 <arX7PwOnlz0N9rUc@aurel32.net>
 <arnt6EEacEm3YRIC@aurel32.net>
 <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db540b00-a017-4c82-9a6c-93e862dcde67@iscas.ac.cn>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_095354_106552_D9A9CA09 
X-CRM114-Status: GOOD (  29.29  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Some small update on that. Sorry it takes time, it's just the bug 
happens sporadically and I need a lot of testing to reach some 
conclusion (and when I can't reproduce the bug, I am still not sure it 
is not there).

On 2026-09-29 12:07, Vivian Wang wrote:
> On 9/28/26 12:32, Aurelien Jarno wrote:
> > Hi,
> >
> > On 2026-09-25 06:40, Aurelien Jarno wrote:
> >
> > [...]
> >
> > That said Han Gao pointed me to this patch:
> > https://lore.kernel.org/linux-riscv/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com/
> >
> > I have been testing it, and so far it seems to fix my issue with both 
> > CONFIG_RISCV_ISA_V_PREEMPTIVE enable and disabled. Or maybe it just 
> > hides the issue by changing the timing, as at this point, I haven't 
> > fully understood how the bug fixed by this patch can completely explain 
> > my observations.
> 
> I don't know how that would cause what you have observed either, but it
> does superficially appears to fix a real bug.
>
> > Unfortunately, I have been able to reproduce the issue, even with this 
> > patch applied. It just significantly reduces the frequency of the issue.
> >
> But this, I suppose, is still useful information that we just *might* be
> on the right track.
> 
> Can you perhaps try this hacked together patch below and see if it does
> anything? I just put guard(preempt)() or something around a bunch of
> places I could find that access regs->status. It should apply to 7.1 and
> 7.2 as is. (The coding style is deliberately horrible to minimize diff
> lines and discourage others from shipping it)
> 
> (This adds some more widely-scoped guards, and AFAICT /replaces/ the
> above linked patch from Guobin Zhang.)

Unfortunately that doesn't fix the problem. I am still able to reproduce 
it with this patch :(

I also have tried with a 7.3 kernel, and I am still able to reproduce 
the issue on both the K1 (the above usercopy issue or the not 
reproducible GCC ICE) and the K3 (only not reproducible GCC ICE). 

Disabling vector extension in the device tree fixes the issue in both 
cases. However the LLVM JIT doesn't care if it is enabled or not, it 
just matches by mvendorid / marchid / mimpid so you just get a SIGILL.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
