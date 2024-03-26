Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE7C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n27GakGTOMmHI0jelQFqdVJasaM1gqQR8oZDsiP4PcM=; b=B5bk4ARDc2xlRG
	Fb56wD9XBTYmVAnAwrOJS+S97ImBbot8bUetwOaW0yUtgpSIug+VpLeycFhlfHR46CsJvkjURe2gL
	ERnPaT9DvYrKz7ykUeiZ9P5ImgOnk81wiUBtpLUPDsZl3cwBX6LV2p+kaBwChtQrwSiX+p+IO8xr1
	eRt7GXxN5mmM7xQDaO+Nfwxfoo8KYwf3sHZTem8bBYV8yZ07Uv8xVfP4jnssY0kfLHYGmRngWRZ6D
	D68YIMaU21UFwMpNZh/68YlNy3i1viF+wprEyd65pr21zQZYpgNlKmGW12OwrKTCnciFk5S0DzQJ0
	1gJ4grm0SA/JT70R7eWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9ol-00000005VnI-0sz2;
	Tue, 26 Mar 2024 16:38:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9oS-00000005Vgz-3Zo2
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 16:38:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E6452F4;
	Tue, 26 Mar 2024 09:38:45 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.35.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A34C3F694;
	Tue, 26 Mar 2024 09:38:10 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:38:07 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-trace-kernel@vger.kernel.org,
	Calvin Owens <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Message-ID: <ZgL5779MIS61GpV6@FVFF77S0Q05N.cambridge.arm.com>
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
 <ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
 <20240327002403.62649aee45508b7a16caedba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327002403.62649aee45508b7a16caedba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_093824_701024_87E074D8 
X-CRM114-Status: GOOD (  25.55  )
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

On Wed, Mar 27, 2024 at 12:24:03AM +0900, Masami Hiramatsu wrote:
> On Tue, 26 Mar 2024 14:46:10 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > On Mon, Mar 25, 2024 at 11:56:32AM +0900, Masami Hiramatsu wrote:
> > > I think, we'd better to introduce `alloc_execmem()`,
> > > CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first
> > > 
> > >   config HAVE_ALLOC_EXECMEM
> > > 	bool
> > > 
> > >   config ALLOC_EXECMEM
> > > 	bool "Executable trampline memory allocation"
> > > 	depends on MODULES || HAVE_ALLOC_EXECMEM
> > > 
> > > And define fallback macro to module_alloc() like this.
> > > 
> > > #ifndef CONFIG_HAVE_ALLOC_EXECMEM
> > > #define alloc_execmem(size, gfp)	module_alloc(size)
> > > #endif
> > 
> > Please can we *not* do this? I think this is abstracting at the wrong level (as
> > I mentioned on the prior execmem proposals).
> > 
> > Different exectuable allocations can have different requirements. For example,
> > on arm64 modules need to be within 2G of the kernel image, but the kprobes XOL
> > areas can be anywhere in the kernel VA space.
> > 
> > Forcing those behind the same interface makes things *harder* for architectures
> > and/or makes the common code more complicated (if that ends up having to track
> > all those different requirements). From my PoV it'd be much better to have
> > separate kprobes_alloc_*() functions for kprobes which an architecture can then
> > choose to implement using a common library if it wants to.
> > 
> > I took a look at doing that using the core ifdeffery fixups from Jarkko's v6,
> > and it looks pretty clean to me (and works in testing on arm64):
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=kprobes/without-modules
> > 
> > Could we please start with that approach, with kprobe-specific alloc/free code
> > provided by the architecture?
> 
> OK, as far as I can read the code, this method also works and neat! 
> (and minimum intrusion). I actually found that exposing CONFIG_ALLOC_EXECMEM
> to user does not help, it should be an internal change. So hiding this change
> from user is better choice. Then there is no reason to introduce the new
> alloc_execmem, but just expand kprobe_alloc_insn_page() is reasonable.
> 
> Mark, can you send this series here, so that others can review/test it?

I've written up a cover letter and sent that out:
  
  https://lore.kernel.org/lkml/20240326163624.3253157-1-mark.rutland@arm.com/

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
