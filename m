Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C42CC35FE4
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4t0/x1aVDcSa9Llu1BbmbDyEo98GP3ztPr09Nkmzi4=; b=tZHtIBmxgDkNiJ
	z2Nj33ppzm+jOJ38uDUWGb5Dj/VxGYHsXKkV4jOF2ccYAZAaIMiSM2z0BfskYV2ilyLv0pS7weK8u
	1GNBA0y6MNXEdHuOanotXVz4VmFqo3wDmqSTbxfv1n21IWmyXRYCePLUGTQ/Kl5CRnKt0TeQnrrzm
	sG8Z6yP4bqw9is8DGrRvDhB86TYwa1f7hQFDIwjlWhLWFyKS5EWqRTgcPcvNTmQfdIA8m8mfWuBM+
	6Byy9NYbJHbNCh7W0vMkSQ71qSahpOT4sDYQXSHXgG8dfRrPnjbz9l9cny62pJ9t/p1yL+MCoaDR2
	NMtn5XnoB7A+L/EpoJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sppfO-00000002ACs-1hc8;
	Sun, 15 Sep 2024 13:51:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sppfJ-00000002AA9-2zUg;
	Sun, 15 Sep 2024 13:51:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45A6A5C54F3;
	Sun, 15 Sep 2024 13:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666C4C4CEC3;
	Sun, 15 Sep 2024 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726408306;
	bh=q7WJquAI08+CAD5lP6bdNehob9Dq1wPKxQPjeFRtiiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRkIar9RFkBNG39Lg4VF36+C0l1NwYSaEE09Z1SxGxc6M4S+jx9O3QiS3XE0iEOXa
	 dugg4+gux8cHvhMy415EwhG2oqeI29OZXErerIPWPPLxGdjDxioHvmSB5SFgMR8cmZ
	 GF890/YHKLL0YWKx3z2y3nIavnufDvUSXph8DwoVC1aciO37Nuj9Dl/4U3xgMBW1Vr
	 QqbWqbJwbZ+B8JLq+POjgebhgVzaYSVrG+oX+aypioA+ScnFYEAUCNxQIIMCRKMIR8
	 1d75vfMvgyrvMLYGrv0O59GREHzSdXP1f5IYJf2XBPq1KtNNCfQ4hdGzn/h6TRc0iB
	 7g69hrbWPmj5g==
Date: Sun, 15 Sep 2024 16:48:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zublq4tR0q7lvicK@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
 <20240909064730.3290724-8-rppt@kernel.org>
 <CAMj1kXG_Z=7B_eDAk3vhtDjfcnka3AoSKNzvFQDzpvYY2EyVfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXG_Z=7B_eDAk3vhtDjfcnka3AoSKNzvFQDzpvYY2EyVfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_065149_882615_A71D1545 
X-CRM114-Status: GOOD (  16.54  )
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

Hi Ard,

On Fri, Sep 13, 2024 at 05:00:42PM +0200, Ard Biesheuvel wrote:
> Hi Mike,
> 
> On Mon, 9 Sept 2024 at 08:51, Mike Rapoport <rppt@kernel.org> wrote:

...

> > +static void execmem_fill_trapping_insns(void *ptr, size_t size, bool writable)
> > +{
> > +       if (execmem_info->fill_trapping_insns)
> > +               execmem_info->fill_trapping_insns(ptr, size, writable);
> > +       else
> > +               memset(ptr, 0, size);
> 
> Does this really have to be a function pointer with a runtime check?
> 
> This could just be a __weak definition, with the arch providing an
> override if the memset() is not appropriate.

I prefer to keep this a method in execmem_info rather that have a __weak
definition that architectures can override.

This is not on the hot path, so I don't think a runtime check here would
matter. Still, I can fill in a default with memset at init time.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
