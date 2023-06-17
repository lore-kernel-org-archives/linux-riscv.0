Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C467EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7++Lx3e/GKsDzFPvhNyXyql5nZbDhMf/CbSHbq9odg=; b=FI83BgDROhNLUQ
	DvmMNipFZsNrNGcLWcHok2FRx68XPvWCspveFcdw0lvoP0znjQLBmJvEvOiDe1XLnFDV6b9HuFfeL
	zFgFJ6vn/eXubYaWI0ff4WPQG5TdPyCRsWjTFFD5hiDthH10O7Kt5kO2v/goTAaRbnkeCvQUHGBY1
	SCkVcd9Zv61d2yD9U9dUslQafoZLZyKT9fmBFqeBO3mrPVw6c1OmrkMX0QK72sxEABftfSnlUoq9T
	e3AlJJCSJfgt3DxP3Xm6iCjUs0eHdrG8MY0bgWsXh0BGceStWmiZrDelOzbRFQLq/GCUipZGFEi+C
	Se/bPsfK52j9OwQRxSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPgO-002uqc-1K;
	Sat, 17 Jun 2023 06:45:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPgK-002upD-31;
	Sat, 17 Jun 2023 06:45:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26EC260204;
	Sat, 17 Jun 2023 06:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC914C433C8;
	Sat, 17 Jun 2023 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686984307;
	bh=Uw5cw1TPn0rntsQJRbeXZU+V2i3I8bpFiME/qcflP08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0C/04zwp8Svpx/hprFTuDwIwHJCnHpNRmn2tDdvfcmYt4wp3n7OAxHp5Py33C+kd
	 4kMHu8FACuUr1jN3jGFObWQ4Pw9NFQKQAIyO/G6pFYoVPUe76lGyVXZO3TQemSokHm
	 VXxdoS02gSAauNcMun3iVu1Zubv2t9PebDcIDYD6cqQx8/HkOPh4X4/5bVg3dgu6dB
	 sBHr55LVzNEboL0DRdq7gLRwtJOv/T3RNn91O3Tsgsn70wRNMkVoUNRgpMFOdo78UU
	 n4UYOHCQfFtBs9Glr8+Avi1tBIrn2kszVYZ167A35xKrcwfLNkZs7DpMC2d48GQpfN
	 ByDutHlpcGnYg==
Date: Sat, 17 Jun 2023 09:44:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"deller@gmx.de" <deller@gmx.de>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"nadav.amit@gmail.com" <nadav.amit@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
	"puranjay12@gmail.com" <puranjay12@gmail.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"x86@kernel.org" <x86@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"will@kernel.org" <will@kernel.org>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"song@kernel.org" <song@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230617064421.GQ52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <90a64b6f040491da16af0694172a6cbdaba33669.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90a64b6f040491da16af0694172a6cbdaba33669.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_234509_076492_770BF990 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, Jun 16, 2023 at 04:55:53PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2023-06-16 at 11:50 +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > Data related to code allocations, such as module data section, need
> > to
> > comply with architecture constraints for its placement and its
> > allocation right now was done using execmem_text_alloc().
> > 
> > Create a dedicated API for allocating data related to code
> > allocations
> > and allow architectures to define address ranges for data
> > allocations.
> 
> Right now the cross-arch way to specify kernel memory permissions is
> encoded in the function names of all the set_memory_foo()'s. You can't
> just have unified prot names because some arch's have NX and some have
> X bits, etc. CPA wouldn't know if it needs to set or unset a bit if you
> pass in a PROT.

The idea is that allocator never uses CPA. It allocates with the
permissions defined by architecture at the first place and then the callers
might use CPA to change them. Ideally, that shouldn't be needed for
anything but ro_after_init, but we are far from there.

> But then you end up with a new function for *each* combination (i.e.
> set_memory_rox()). I wish CPA has flags like mmap() does, and I wonder
> if it makes sense here instead of execmem_data_alloc().

I don't think execmem should handle all the combinations. The code is
always allocated as ROX for architectures that support text poking and as
RWX for those that don't.

Maybe execmem_data_alloc() will need to able to handle RW and RO data
differently at some point, but that's the only variant I can think of, but
even then I don't expect CPA will be used by execmem. 

We also might move resetting the permissions to default from vmalloc to
execmem, but again, we are far from there.
 
> Maybe that is an overhaul for another day though...

CPA surely needs some love :)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
