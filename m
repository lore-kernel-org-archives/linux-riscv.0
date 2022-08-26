Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1ABECAAA6
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjxlF/XQGma1wUN5DtR2/AiRNNKYiH1gi43W7zW4zfQ=; b=CbICMGLvqvWtma
	KL54GMpdkMxjOQJ546MFqMLYohBuioJPfyNSGVPzp/0w8+18NRLfo3XBOHJ9gXQPIAoYHJ+X+r3c8
	alIRTsI4c6u7z+GGkuVILIq7Rw2KcyHxDv7Htfp+VbMwJYBmkqq7kO6m6+eiRniA8eYW894MLxGPE
	cAwEOSxfaWWPJlvum5cZ6zTn0oN7D3BbUEXdn5CuJoH54OLs9iyweosvwo0K9I7SqX8zgcCf7HUbv
	r+f54dxoK6eg8Inbz3JvicmTum1hEBY78pb6WYdjfsotcKPgLnpT+dDAi7GwGLbaeKBAQ8U1ykP+Y
	WsewJXmBW9WY3cZCbaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRdKn-009Gdy-MD; Fri, 26 Aug 2022 17:41:33 +0000
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com ([46.30.210.183])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRdKh-009GKw-B6
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 17:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=5eX+7pFMy/DNEfDigZ6pNrp5YJzwtCFfct4ucHBv7/Q=;
	b=YEFzIcBVkGAVR+IhfGTs5RHnLKs0Z2bDrwL/NOaHnQwC12VjTLKZDdxzaUtW5Q+xAMsPziduQfOn0
	 2jIg3FJBUn4DTDYfTPEKvl5/aGwsLofHc0eIMmdEcmBkf6YmWUfGZaUvR4Cm1aMeeQRpDzwc194yi0
	 y9EcnoBfw5oCllM0TOjAtMzPPNQbjvoGdQDhnjV69Z4KaNFrOgYNgmGVXRhm0CrVeqN7sAVw/8dEt7
	 JoErsfDHYNmSEHRUZ0MFo/B65TtRydKXhwbPexk99gt9+l5PlIELd90OnBwa0DeC08sZvRDBm4TM5g
	 0d53uCf3qMOHoyhVGka3FRvQH/jXcmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=5eX+7pFMy/DNEfDigZ6pNrp5YJzwtCFfct4ucHBv7/Q=;
	b=8U1A9E3ty0om1/X6z0TcJwJl59j9ZMAjBa/XjgG9RtLpW6ZDBfzjU6BEJv4VGJ5AS7fRXrPT/J03R
	 nXX1xCHCQ==
X-HalOne-Cookie: f32858e757181299f57d1acbda1c1fad1b331eb2
X-HalOne-ID: 4a1c93ad-2566-11ed-a920-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 4a1c93ad-2566-11ed-a920-d0431ea8a290;
	Fri, 26 Aug 2022 17:41:18 +0000 (UTC)
Date: Fri, 26 Aug 2022 19:41:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Conor.Dooley@microchip.com
Cc: mail@conchuod.ie, monstr@monstr.eu, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de, geert@linux-m68k.org, keescook@chromium.org,
	peterz@infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 5/6] sparc: use the asm-generic version of cpuinfo_op
Message-ID: <YwkFvFiTdCccdSV8@ravnborg.org>
References: <20220821113512.2056409-1-mail@conchuod.ie>
 <20220821113512.2056409-6-mail@conchuod.ie>
 <Ywjc67hcBwOkMtI/@ravnborg.org>
 <87c83d38-18bc-7dfc-be6f-d906ed713450@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87c83d38-18bc-7dfc-be6f-d906ed713450@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_104128_554125_4E3F8854 
X-CRM114-Status: GOOD (  29.12  )
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

On Fri, Aug 26, 2022 at 03:37:40PM +0000, Conor.Dooley@microchip.com wrote:
> On 26/08/2022 15:47, Sam Ravnborg wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi Conor.
> > 
> > Thanks for this nice simplification, but I think you can make it even
> > better.
> > 
> > On Sun, Aug 21, 2022 at 12:35:12PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> There's little point in duplicating the declaration of cpuinfo_op now
> >> that there's a shared version of it, so drop it & include the generic
> >> header.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  arch/sparc/include/asm/cpudata.h | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/arch/sparc/include/asm/cpudata.h b/arch/sparc/include/asm/cpudata.h
> >> index d213165ee713..af6ef3c028a9 100644
> >> --- a/arch/sparc/include/asm/cpudata.h
> >> +++ b/arch/sparc/include/asm/cpudata.h
> >> @@ -6,8 +6,7 @@
> >>
> >>  #include <linux/threads.h>
> >>  #include <linux/percpu.h>
> >> -
> >> -extern const struct seq_operations cpuinfo_op;
> >> +#include <asm-generic/processor.h>
> > 
> > Since the header file did not need <asm-generic/processor.h> then it
> > should not need it now after deleting stuff.
> > The better fix is to add the missing include to arch/sparc/kernel/cpu.c,
> > where we have the user of it.
> > 
> > A header file should include what it needs, and no more.
> > 
> > I looked only at this patch, this comment may also be relevant for the
> > other patches.
> 
> Hey Sam, thanks for your feedback.
> As per Geert's suggestion, submitted a v2:
> https://lore.kernel.org/linux-riscv/20220825205942.1713914-1-mail@conchuod.ie/T/#u
> 
> In v2, I included linux/processor.h instead of an asm-generic header.
> The diff for sparc became:
> 
> diff --git a/arch/sparc/include/asm/cpudata.h b/arch/sparc/include/asm/cpudata.h
> index d213165ee713..f7e690a7860b 100644
> --- a/arch/sparc/include/asm/cpudata.h
> +++ b/arch/sparc/include/asm/cpudata.h
> @@ -7,8 +7,6 @@
>  #include <linux/threads.h>
>  #include <linux/percpu.h>
>  
> -extern const struct seq_operations cpuinfo_op;
> -
>  #endif /* !(__ASSEMBLY__) */
>  
>  #if defined(__sparc__) && defined(__arch64__)
> diff --git a/arch/sparc/kernel/cpu.c b/arch/sparc/kernel/cpu.c
> index 79cd6ccfeac0..ffdc7a825b80 100644
> --- a/arch/sparc/kernel/cpu.c
> +++ b/arch/sparc/kernel/cpu.c
> @@ -12,6 +12,7 @@
>  #include <linux/smp.h>
>  #include <linux/threads.h>
>  #include <linux/pgtable.h>
> +#include <linux/processor.h>
>  
>  #include <asm/spitfire.h>
>  #include <asm/oplib.h>
> 
> Hopefully that is more appealing to you!
> Thanks,
> Conor.

Hi Conor - much better. Thanks.

	Sam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
