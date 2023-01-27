Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19358C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVdVaLYPCcdRpLFVYRcFqjpebMlgQhWJVHdb3n5JUkw=; b=1dw5P1TWcegltU
	DYwDmnEtDC6TApd0TYTvM3Bps5o11WoScsQJQEZ6P8rOfRrTSqcdjW3BFOb53biKTFRois3NdBSPF
	MlnMGt8YxKdTER5Bf+plmU67xCFh2fI+NF9nx2Zb6HQRDyr9Hg8hvb7rDJetZsZUW2SWOLfawrwsu
	UKqUXvo5kh9WRq4hT/pwcz7/FD3ogZSOohoztEJo/Ver6sxCVlFt5Gyp9PXijJhLRDMx0ZZ+JdCZe
	rN+12F4yj2Dl4Sdt/3H21UTzLEQMZzKdt7fS/dQ/zegPKRefxXWRu7aQjmMxyznvan6ZxYNi2rNC6
	XAJTp+3+rjHv6yk2gVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPH3-00FC6M-DA; Fri, 27 Jan 2023 14:00:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPGx-00FC1f-L0
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 14:00:09 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pLPGq-0001kV-Io; Fri, 27 Jan 2023 15:00:00 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, abrestic@rivosinc.com,
 Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] RISC-V: Fix do_notify_resume / do_work_pending prototype
Date: Fri, 27 Jan 2023 14:59:59 +0100
Message-ID: <3463308.V25eIC5XRa@diego>
In-Reply-To: <Y8gTBJsB22LSzZFy@spud>
References: <20230118142252.337103-1-heiko@sntech.de> <Y8gTBJsB22LSzZFy@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_060007_745725_5A148988 
X-CRM114-Status: GOOD (  20.30  )
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

Am Mittwoch, 18. Januar 2023, 16:40:52 CET schrieb Conor Dooley:
> On Wed, Jan 18, 2023 at 03:22:52PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Commit b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to
> > userspace slow-path") renamed the do_notify_resume function to
> > do_work_pending but did not change the prototype in signal.h
> > Do that now, as the original function does not exist anymore.
> > 
> > Fixes: b0f4c74eadbf ("RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path")
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/include/asm/signal.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/signal.h b/arch/riscv/include/asm/signal.h
> > index 532c29ef0376..956ae0a01bad 100644
> > --- a/arch/riscv/include/asm/signal.h
> > +++ b/arch/riscv/include/asm/signal.h
> > @@ -7,6 +7,6 @@
> >  #include <uapi/asm/ptrace.h>
> >  
> >  asmlinkage __visible
> > -void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
> > +void do_work_pending(struct pt_regs *regs, unsigned long thread_info_flags);
> 
> Is that an auto-builder blind spot as it gets jumped to from asm?

Yeah, the prototype is seemingly more for show in that case, as I guess
from asm we only look for the symbol itself but nothing will check the
syntax of the parameters.


@Palmer: any thoughts?


Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
