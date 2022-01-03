Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F8CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jan 2022 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jziuow9j+u4yKWpMgvmjUls/78KA3a2i824N/kYNKOY=; b=C6WsOS+P7JxhWD
	HfjaA2LdaAIkXEv1PhSXjYIxuF/fK1A2vIfZXtrG/E40c1pCZ9aYB+lVkPui/vpvFztqYJLRKRcsF
	I7n0T80AtT0ukK0BOlN557xx3BgWLzvkDoIh3SVqBYj7QLYnJmQMo/r/LUK8NR9RsvcNmp0ejjDOh
	RitBJLfMfgXibwER5B9emP+TzMCwXdbodlT4TA3UwkrfVqFsnX8kzaWTbvfvwhEh+YHON9moVKYEX
	+tpXx2tW0H1NFIXb5kl4kYHv9mFjIH19RmKPd/NT7Yva2Z3G/IJvBfr+xyACUF0cyL6jMe6JIF94j
	yO9MwfxqfVULZgeiWbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Pza-009RVU-AU; Mon, 03 Jan 2022 16:15:26 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PzW-009RUG-Md
 for linux-riscv@lists.infradead.org; Mon, 03 Jan 2022 16:15:24 +0000
Received: (qmail 1188656 invoked by uid 1000); 3 Jan 2022 11:15:16 -0500
Date: Mon, 3 Jan 2022 11:15:16 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [RFC 31/32] usb: handle HAS_IOPORT dependencies
Message-ID: <YdMhFKOdBsDvFStt@rowland.harvard.edu>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-32-schnelle@linux.ibm.com>
 <YcojyRhALdm40gfk@rowland.harvard.edu>
 <8bda347ea30b60f1edb55693ff7509e7f7b1f979.camel@linux.ibm.com>
 <Yc86mvCUe2mHCa57@rowland.harvard.edu>
 <5a271c9e80ee394ecb41297e66d687e035a823ce.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a271c9e80ee394ecb41297e66d687e035a823ce.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_081522_933604_41EB6459 
X-CRM114-Status: GOOD (  28.35  )
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

On Mon, Jan 03, 2022 at 12:35:45PM +0100, Niklas Schnelle wrote:
> On Fri, 2021-12-31 at 12:15 -0500, Alan Stern wrote:
> > On Fri, Dec 31, 2021 at 12:06:24PM +0100, Niklas Schnelle wrote:
> > > On Mon, 2021-12-27 at 15:36 -0500, Alan Stern wrote:
> > > > On Mon, Dec 27, 2021 at 05:43:16PM +0100, Niklas Schnelle wrote:

> > > > > diff --git a/drivers/usb/host/uhci-hcd.h b/drivers/usb/host/uhci-hcd.h
> > > > > index 8ae5ccd26753..8e30116b6fd2 100644
> > > > > --- a/drivers/usb/host/uhci-hcd.h
> > > > > +++ b/drivers/usb/host/uhci-hcd.h
> > > > > @@ -586,12 +586,14 @@ static inline int uhci_aspeed_reg(unsigned int reg)
> > > > >  
> > > > >  static inline u32 uhci_readl(const struct uhci_hcd *uhci, int reg)
> > > > >  {
> > > > > +#ifdef CONFIG_HAS_IOPORT
> > > > >  	if (uhci_has_pci_registers(uhci))
> > > > >  		return inl(uhci->io_addr + reg);
> > > > > -	else if (uhci_is_aspeed(uhci))
> > > > > +#endif
> > > > 
> > > > Instead of making all these changes (here and in the hunks below), you
> > > > can simply modify the definition of uhci_has_pci_registers() so that it
> > > > always gives 0 when CONFIG_HAS_IOPORT is N.
> > > > 
> > > > Alan Stern
> > > 
> > > I don't think that works, for example in the hunk you quoted returning
> > > 0 from uhci_has_pci_registers() only skips over the inl() at run-time.
> > > We're aiming to have inl() undeclared if HAS_IOPORT is unset though.
> > 
> > I see.  Do you think the following would be acceptable?  Add:
> > 
> > #ifdef CONFIG_HAS_IOPORT
> > #define UHCI_IN(x)	x
> > #define UHCI_OUT(x)	x
> > #else
> > #define UHCI_IN(x)	0
> > #define UHCI_OUT(x)
> > #endif
> > 
> > and then replace for example inl(uhci->io_addr + reg) with 
> > UHCI_IN(inl(uhci->io_addr + reg)).
> 
> In principle that looks like a valid approach. Not sure this is better
> than explicit ifdefs though.

The general preference in the kernel is to avoid sprinkling #ifdef's 
throughout function definitions, and instead encapsulate their effects 
with macros or inline functions -- like this.

>  With this approach one could add
> UHCI_IN()/UHCI_OUT() calls which end up as nops without realizing it as
> it would disable any compile time warning for using them without
> guarding against CONFIG_HAS_IOPORT being undefined.

To help prevent that, we can add

#undef UHCI_IN
#undef UHCI_OUT

at the end of this section.

> > The definition of uhci_has_pci_registers() should be updated in any 
> > case; there's no reason for it to do a runtime check of uhci->io_addr 
> > when HAS_IOPORT is disabled.
> 
> Agree. Interestingly same as with the "if
> (IS_ENABLED(CONFIG_HAS_IOPORT))" it seems having
> uhci_has_pci_registers() compile-time defined to 0 (I added a
> defined(CONFIG_HAS_IOPORT) to it) makes the compiler ignore the missing
> inl() decleration already. But I'm not sure if we should rely on that.

I definitely would not rely on it.

Alan Stern

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
