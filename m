Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8867CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpzbGO9cnf685FZGMLDkuxfsMhb29uof23GpicrmQoU=; b=Q5Tl43sdE4BWZo
	7CsZ7lCR8oW8lPzBPD0DNPpRUM+ovVEboLinD90qYEz9047BhCddMPAWSEUjwfp9Xg7mgdlLwFERE
	d5I6ZavC85arRiUaoyuesMXPmGEnusdD/Rj05sM7tLbFaTfX0ai7hp6lHfUYsDvtMwDeQ8qUv6F58
	OaoaA5ZNKFh9OfsajtZQ1VZFA0zcP5RLypwjKyMutZ/p854AJW3WVWSnrBX37MTFeTj7Zh7unR7oa
	3kikGEbYlQHzVVfLBqp8d5MfhoS949BX0nDT3Dw44Vq+uAQq6AcTUk6kA8NARnxhqXoLuS9amHTo6
	b2/LCpEfwocxiLZjRf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWWG-004kDA-HD; Thu, 06 Oct 2022 19:26:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWW5-004k7k-FQ
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 19:26:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF7B761A9C;
	Thu,  6 Oct 2022 19:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B339AC433C1;
	Thu,  6 Oct 2022 19:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665084404;
	bh=Ze3I/5esWpCEOEhK1Qh92ZSOv7pAgSZX/7cbTz82Lrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncs/uOEcoopXr+q94SNKTMw6CgTwwSeOqfwGl6tAo0V9iRqJ6/2RPliC0m8R+WHnI
	 nfIhWyc8mWbb8DT2Lc3fXs36kwDUas/SLZjyYeXmQNJ6iSz5E9QYX8a0OSztDV4GYe
	 GqVmDMLfmdLKL8EUeZHF8pT2JRU7y6tM5R2PvjG1gpI8v/V0aSH+o/vav9ssztkyzC
	 kBGSLIcIBxveMFUSs33yFkYLK+ZnKJIpdSmdZCFEPsW7c74rQ9OCaioU848V39Gsjc
	 jUe5d38Kd/RMAlIQfh+XN5t7YcWAo3iMgEg55TFZdeFch6CkB6fBrwKNkLLKqdS4qd
	 QMMgp6viS/BTg==
Date: Thu, 6 Oct 2022 20:26:39 +0100
From: Conor Dooley <conor@kernel.org>
To: PH7PR14MB559464DBDD310E755F5B21E8CEDC9@ph7pr14mb5594.namprd14.prod.outlook.com
Cc: coelacanthus@outlook.com, c141028@gmail.com, dramforever@live.com,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	xc-tan@outlook.com
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Message-ID: <Yz8r71PjHlpLy+kR@spud>
References: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
 <77c9a7c1-b930-b8f7-7b38-b317ea5e929e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77c9a7c1-b930-b8f7-7b38-b317ea5e929e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_122645_582071_5040875F 
X-CRM114-Status: GOOD (  17.76  )
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

Hey Eva,

On Thu, Oct 06, 2022 at 10:20:02PM +0300, Eva Kotova wrote:
> On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
> > As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
> > but not read is "Reserved for future use.". For now, they are not valid.
> > In the current code, -wx is marked as invalid, but -w- is not marked
> > as invalid.
> 
> This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only
> protective page:
> 
> #
> # There is insufficient memory for the Java Runtime Environment to continue.
> # Native memory allocation (mmap) failed to map 4096 bytes for failed to
> allocate memory for PaX check.
> # An error report file with more information is saved as:
> # /root/hs_err_pid107.log
> 
> I bisected to this commit since on Linux 5.19+ java no longer works.
> Perhaps some fallback should be implemented, to prevent userspace breakage.
> It is currently documented, that at least on i386 PROT_WRITE mappings imply
> PROT_READ (See man mmap(2) NOTES), this would be a good place to start.

Do these patches solve your problem by any chance?
https://lore.kernel.org/linux-riscv/20220915193702.2201018-1-abrestic@rivosinc.com/

I don't know the "area" at all, so it's a shot in the dark, but these
both have Fixes: tags for the patch that you are blaming.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
