Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhUN00YKU7GYLc253vHIn7esJwtXfQ5dmguGHLdVvIE=; b=aYSIinT1CspEt+
	q+C9yUfIijk1WszewSPY+4RPt0CN55gw5YNmczrwNereVr+9uBWAgRgAFuoSVOnDGhxYJJIg3qMbH
	Dn7DptTziU0/oEQdU/S5UjJzUe8NXmOG3XkD2ooQOxRJq2tvkxoLFk1JSZVnLN+IV8xcQVtpPquaa
	W5YxJR/2EPtw16H/lTQ+071TrBxaw7PsDI3OSlCbTfwDHFVHXFuGqmpWHvDhGrtUiMTNS+eh1Lua2
	mAgLlTlQ5tBhLM6mqoLP1Um33r1DFKrxBk7msJRNPLaToKduCZHdt51FZ5OIUL9VQ6QLpPq8GlXbS
	besGz2vWO4EGs/Io1oxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4Te-00Et0v-0S; Mon, 09 May 2022 14:35:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4TV-00Esz6-Ms
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:35:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A825B816D6;
 Mon,  9 May 2022 14:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AC8C385AF;
 Mon,  9 May 2022 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652106899;
 bh=vfDKNwLVPbOGrvBsC/bFHFyH9ByxjZk7Ny2bY3inWbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQMwhwbUUnAYDeU++/wgIqkeNZBLHJbf4vMQP3gzxkpB844FBoWNBm7/rABZXhYbb
 y80q28vwC0lHQsVKNbnuRokPCXjavY1s3HiZRWGfLa9iqs17PEVV4J8svIomw/wlm+
 Sq0ef9UE3VvBex/8y+iXuEkyOlM7ebQRcemtcw9krX5jZV11zF8a5T0S/dM2RyAgK4
 0ruHLnRwU5TYL7hKuRvGeQkBQmaHSFj+4rNF+RNQh45T4GAOuD8nnKrelvJXHdrLuU
 MuntnYMOO70yE1B9QhQTsn75W0OfuIC4nsU461yplhBtOmr4MZ64PkiY4oxbrvFiVD
 Jd10kMiGCcfZA==
Date: Mon, 9 May 2022 22:26:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 0/4] unified way to use static key and optimize
 pgtable_l4_enabled
Message-ID: <YnkkjC065kCTtHBC@xhacker>
References: <20220508160749.984-1-jszhang@kernel.org>
 <CAAhSdy1qri5L9pVcZO8areB=TXMSJBg2+cTNMZGQ3g+3Qhxmfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1qri5L9pVcZO8areB=TXMSJBg2+cTNMZGQ3g+3Qhxmfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_073501_975737_401AC15F 
X-CRM114-Status: GOOD (  19.55  )
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

On Mon, May 09, 2022 at 10:07:16AM +0530, Anup Patel wrote:
> On Sun, May 8, 2022 at 9:46 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Currently, riscv has several features which may not be supported on all
> > riscv platforms, for example, FPU, SV48, SV57 and so on. To support
> > unified kernel Image style, we need to check whether the feature is
> > suportted or not. If the check sits at hot code path, then performance
> > will be impacted a lot. static key can be used to solve the issue. In
> > the past, FPU support has been converted to use static key mechanism.
> > I believe we will have similar cases in the future. For example, the
> > SV48 support can take advantage of static key[1].
> >
> > patch1 is a simple W=1 warning fix.
> > patch2 introduces an unified mechanism to use static key for riscv cpu
> > features.
> > patch3 converts has_cpu() to use the mechanism.
> > patch4 uses the mechanism to optimize pgtable_l4|[l5]_enabled.
> >
> > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> 
> Overall, using a script to generate CPU capabilities seems a bit
> over-engineered to me. We already have RISC-V ISA extension

Not all riscv features are *ISA* extensions. For example, SV48 and SV57
are not ISA extensions. IIRC, I asked this question before, here are
Atish's comments:

https://lore.kernel.org/linux-riscv/CAHBxVyF65jC_wvxcD6bueqpCY8-Kbahu1yxsSoBmO1s15dGkSQ@mail.gmail.com/

> parsing infrastructure which can be easily extended to support
> static key arrays.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
