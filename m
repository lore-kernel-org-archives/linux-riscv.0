Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B101FECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URfJZbscjp88YNb2U/33kFazC080W6xl07jPoAPVDyE=; b=GhePUPI5jRnqK0
	2Cl5KYL1pvApgOiL+L98dFb8f3BBpg4OOqs2A6T0rf+3GfLVezW1awDFvOQH7tl49SJPLkvKOf5t4
	2I3Ic71R0jAQ7c7RpRwWyDM68hzB0ZQD5YGWSpmF2mRjFHzPSae0OB/0WkbIyMinCdTMIAtktP82/
	g+1gIqghhivkeP69I8gW5E9EbX7j0PS0wZ29T/TpfRW4oJobAz6acpbAemSMRi/F0A4xIaaTg/PQC
	ewGX6YryaAZ9vdT6ojl+KFMKVPT4/ulVgOZ9WLQg5KVbSQ/8nfazkmuRqE+vgv2Byme3hlpoaOIvL
	fKKFDZNhnYByRKYhtZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRacL-006SmZ-NT; Fri, 26 Aug 2022 14:47:29 +0000
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com ([46.30.210.183])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRacE-006SQ2-Ve
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 14:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=pzSEnzVb4PRuwPohD2SDHsa5KY0tRkBlHuhkY0oHs0w=;
	b=NCRe3O/xZCHJ8hDEpD57d6zrmZ/D/l0pxGva3S+GafoGTaEBI8V+8dRJcau2lXRHDYLk3R1tpxP1j
	 3KhToFhOZVyitlnJ0xRfBBHfLRdUC92ngLyYi8++VZngl+6FIPMMSswvmOKlwmrA48SEArDfjlrrZp
	 aLUYNtoPbfHie2QZuWN/5gmc96n89BeYnrY4HhmXJ0VYbMK/Nwimvglfg4ZslyKY8HJv9B0kGS+jUd
	 iAj6qBZTfiE8K/3fT3d5xnIszRsKWAcgiOTrubWRizGAPwPa3VkkroaVH+3Yp57Mf7SsdGZtyGg98g
	 yEaoCAI90mioch8sotzXt8Sz2DOGFiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=pzSEnzVb4PRuwPohD2SDHsa5KY0tRkBlHuhkY0oHs0w=;
	b=czLkABglyklPhRImctvsIg7tPPnc0HaIPVvkP1cQzOjoIxLxHBn86D/l7MTIWNazZ6K+XJ8mOPOkH
	 5qB81ZOBw==
X-HalOne-Cookie: f226e6ab43f82fd861952f49718ba8a608aa1fbd
X-HalOne-ID: f6029a30-254d-11ed-a920-d0431ea8a290
Received: from mailproxy3.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id f6029a30-254d-11ed-a920-d0431ea8a290;
	Fri, 26 Aug 2022 14:47:09 +0000 (UTC)
Date: Fri, 26 Aug 2022 16:47:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Michal Simek <monstr@monstr.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 5/6] sparc: use the asm-generic version of cpuinfo_op
Message-ID: <Ywjc67hcBwOkMtI/@ravnborg.org>
References: <20220821113512.2056409-1-mail@conchuod.ie>
 <20220821113512.2056409-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821113512.2056409-6-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_074724_443033_D6CA9593 
X-CRM114-Status: GOOD (  19.35  )
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

Hi Conor.

Thanks for this nice simplification, but I think you can make it even
better.

On Sun, Aug 21, 2022 at 12:35:12PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> There's little point in duplicating the declaration of cpuinfo_op now
> that there's a shared version of it, so drop it & include the generic
> header.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/sparc/include/asm/cpudata.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/cpudata.h b/arch/sparc/include/asm/cpudata.h
> index d213165ee713..af6ef3c028a9 100644
> --- a/arch/sparc/include/asm/cpudata.h
> +++ b/arch/sparc/include/asm/cpudata.h
> @@ -6,8 +6,7 @@
>  
>  #include <linux/threads.h>
>  #include <linux/percpu.h>
> -
> -extern const struct seq_operations cpuinfo_op;
> +#include <asm-generic/processor.h>

Since the header file did not need <asm-generic/processor.h> then it
should not need it now after deleting stuff.
The better fix is to add the missing include to arch/sparc/kernel/cpu.c,
where we have the user of it.

A header file should include what it needs, and no more.

I looked only at this patch, this comment may also be relevant for the
other patches.

	Sam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
