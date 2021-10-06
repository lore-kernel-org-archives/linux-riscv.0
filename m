Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40CAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 21:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B731610CC
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 21:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B731610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ackjeh+j/acUjaDSsq0XRHb4Zsp7+9hMmOlTTa37qIE=; b=DVVUvBjn95xMpy
	41phHTt+jKpioZ/D2RRlmoOxRn3VMV2IrqU+aU8llZ3LOBw7RrDw61gD8/wZsUQpmhE5YAASMSmKT
	0nMn+T3LovQq3RymJKI8Obq+ee8wBA85DCgXEFK/5qOXCF+RpCVN1YZtnrTWbOanDs88MOp+CjjGL
	iVvneqx8yK3TKvjNagTxyu/qDJzZd9CWgMYWm63gDepBxYps39nGwL+ypTa3WZc7ol43ozjhIzjK8
	1M0j8P2mFZIk3toBKDkVCl6noEio4RAZjBan4lnL/xxML6SYQ1EaTB8llx364RE36kLTAq75fP/VN
	CLDzFYBq6h9CXA/WDsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYEPm-00FbEY-UN; Wed, 06 Oct 2021 21:25:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYEPZ-00FbC1-4H; Wed, 06 Oct 2021 21:25:14 +0000
Received: by mail-pg1-x535.google.com with SMTP id q201so3605956pgq.12;
 Wed, 06 Oct 2021 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e64UMCL2WVnOr2UI7AUcgF8cpI0jeUTyJjvzOQZ8YrE=;
 b=UBSXKYjm15FEKybh0KfefqRjd/fVs22AWYzwe2iCJvmOHscvoAutQW2HwE99YHZeWu
 vEtNDuMS9d78IGfnBrQ47YiMpXMPPhe6dbQyF9hg/uSAQDApFpiVmZ7RCXYk//sWXr1Q
 0LSfp/P7/3d3pFfamzEH93p+y9SKpm/qjQxtZn4fAQUwleau5VdUB+9jn7Ku+OYnfnmC
 SnnK3Phc97T0RV6YdV7B/6OMV0qq1QjiJmwn6G9SBEM6VpE4qBOh3ESLF6KJAuPLSvNB
 EipYZeSbBljiqKzHr1N+foOdNe3WDWrdfrXbmYefd7v8ToBI7aLskwiFwDPpPQdD6I/S
 LWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e64UMCL2WVnOr2UI7AUcgF8cpI0jeUTyJjvzOQZ8YrE=;
 b=C1MTXENPYxD+AnHa9k8tIKsCPFFhIfJV0SNfTiquo8UgT5XJfWYqRm/gsm/8jeDLyp
 ZxmQ+FxC2M6sTfmiJ2qExt5E87VBtvL1KSScjDlaGK7E9siA3wkoq8XnrjiC9dcL/ZFK
 AtpEcA2K29pGi2Ae6auad76VFzVSoI057/onQeNoR6IDGcY3yrMN4Q+iit55BumzhGfr
 FdKI38X8K0q5mK8TsPw9yEyQQTdtoJgY/2+q0ymdo7JoKgvDvEuSIGAli+NPtQCzVR6K
 H3C6paVjkCQKv0k6DAHgZ4o6MAxZYA1kA5Npe13Um9WvEZcM25fRbpnanFz4E9t93LSG
 YB9A==
X-Gm-Message-State: AOAM53279AW03gAeLP2FwEjqcJmiirzfIGuER9HyS0wIwVs0SafRzluW
 WsPa6njh208mzfRqp4XvhUU=
X-Google-Smtp-Source: ABdhPJyKapemGEMJ+oiRHHIk+xiUwqOqgxkK1126yB2yYflqm+sLMNs5knM5JE9Oh1WDASGMBmxR4Q==
X-Received: by 2002:aa7:92d0:0:b0:44c:ab24:cce7 with SMTP id
 k16-20020aa792d0000000b0044cab24cce7mr370069pfa.6.1633555512314; 
 Wed, 06 Oct 2021 14:25:12 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id i9sm18264104pfd.32.2021.10.06.14.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 14:25:11 -0700 (PDT)
Date: Thu, 7 Oct 2021 06:25:09 +0900
From: Stafford Horne <shorne@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, X86 ML <x86@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Openrisc <openrisc@lists.librecores.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 SH-Linux <linux-sh@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <YV4UNQg3QROuTfQ/@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_142513_201005_015B344F 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, Oct 06, 2021 at 04:08:38PM -0500, Rob Herring wrote:
> On Wed, Oct 6, 2021 at 3:44 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > On Wed, Oct 06, 2021 at 11:43:26AM -0500, Rob Herring wrote:
> > > Replace open coded parsing of CPU nodes' 'reg' property with
> > > of_get_cpu_hwid().
> > >
> > > Cc: Jonas Bonn <jonas@southpole.se>
> > > Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> > > Cc: Stafford Horne <shorne@gmail.com>
> > > Cc: openrisc@lists.librecores.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  arch/openrisc/kernel/smp.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> > > index 415e209732a3..7d5a4f303a5a 100644
> > > --- a/arch/openrisc/kernel/smp.c
> > > +++ b/arch/openrisc/kernel/smp.c
> > > @@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
> > >       u32 cpu_id;
> > >
> > >       for_each_of_cpu_node(cpu) {
> > > -             if (of_property_read_u32(cpu, "reg", &cpu_id)) {
> > > -                     pr_warn("%s missing reg property", cpu->full_name);
> > > -                     continue;
> > > -             }
> > > -
> > > +             cpu_id = of_get_cpu_hwid(cpu);
> 
> Oops, that should be: of_get_cpu_hwid(cpu, 0);

OK. I checked all other patches in the series, it seems OpenRISC was the only
one missing that.  Sorry I missed it initially.

> I thought I double checked all those...
> 
> > You have defined of_get_cpu_hwid to return u64, will this create compiler
> > warnings when since we are storing a u64 into a u32?
> 
> I'm counting on the caller to know the max size for their platform.

OK.

> >
> > It seems only if we make with W=3.
> >
> > I thought we usually warned on this.  Oh well, for the openrisc bits.
> 
> That's only on ptr truncation I think.

Right, that makes sense.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
