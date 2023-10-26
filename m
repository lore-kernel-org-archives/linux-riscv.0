Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10201C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0haBWR6yugpZDtY/8gfarJBKcNt5FAobutDlo1he0tU=; b=zU0cJaKBgl4CvJ
	0tX3u4yDZYhye2BW+fjguwf0t3ptRhwCZI+muRdATwuTaa3FCYmhbmg/awlUgxQHf8O31qAVqN5py
	+4+7HqzlZkrcfKHL1xF70nIXNIhFgRVX7PrVDS4fIhrmFuBhMgUKBqZoi9t5+aFBCmNXP97wHuNz/
	AJutDmMdyswW5qOHmrzh5Gp4AujfXJPrX5dZCeFxjNAS1OxEazne8POJQqy+Mz2pkfrqxqCDMG6yd
	VVOvbTZnN1MKpGJLEbwQ1jGhNemeXZDNp5P3JjJQVW/+mLfyvW3UUKTu+0AY2Ur8ERMOzamSxY+zH
	M6qaVi0WBCL8WnvYWvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvvO-00DyWD-1a;
	Thu, 26 Oct 2023 08:41:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvvK-00DyU7-0w;
	Thu, 26 Oct 2023 08:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95C0260959;
	Thu, 26 Oct 2023 08:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6AFC433C8;
	Thu, 26 Oct 2023 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698309661;
	bh=CKweGyf2oPo/e/UZLG1WYH3zEQnVvPRR68BdbBl/TGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRC27PQC2plQ2QFtxeYNcapuTdKaVmbmEUR0m69y9zSqXieqEvU2U8HaibfItzWZF
	 yERD96v5VwCZUJZD6El6ZorfVxYGGBw2vENxYrzOh3JNxfzIcWV8Hyo/98RmvjYp1O
	 Ink1QwB6gOI9hZMPLodFMqMmfk4UUgDFD2PT2vR0MIfYSLtLLeyvF4ch6/DBDJ+K3Z
	 0bfW6e3KP7yJWPzCmJpvtwgF2RV+VsKMprb/vimV6IovW84by85aPvP9y1WYUJyow3
	 BUjvGbMWEhiJ9hRAr+vd5AhVyyu5+qGt0miVwVbaUWHgtUSofxp310DRt0OzuziAvf
	 CCAilLzZ675cA==
Date: Thu, 26 Oct 2023 11:40:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"deller@gmx.de" <deller@gmx.de>,
	"bjorn@kernel.org" <bjorn@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"nadav.amit@gmail.com" <nadav.amit@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
	"puranjay12@gmail.com" <puranjay12@gmail.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"x86@kernel.org" <x86@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
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
Subject: Re: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Message-ID: <20231026084039.GJ2824@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-4-rppt@kernel.org>
 <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
 <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
 <20231005052622.GD3303@kernel.org>
 <b26d0a201bf631831a956450ebbccc3c16521133.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b26d0a201bf631831a956450ebbccc3c16521133.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_014102_415602_60E73C7C 
X-CRM114-Status: GOOD (  34.81  )
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

Hi Rick,

Sorry for the delay, I was a bit preoccupied with $stuff.

On Thu, Oct 05, 2023 at 06:09:07PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2023-10-05 at 08:26 +0300, Mike Rapoport wrote:
> > On Wed, Oct 04, 2023 at 03:39:26PM +0000, Edgecombe, Rick P wrote:
> > > On Tue, 2023-10-03 at 17:29 -0700, Rick Edgecombe wrote:
> > > > It seems a bit weird to copy all of this. Is it trying to be
> > > > faster
> > > > or
> > > > something?
> > > > 
> > > > Couldn't it just check r->start in execmem_text/data_alloc() path
> > > > and
> > > > switch to EXECMEM_DEFAULT if needed then? The
> > > > execmem_range_is_data()
> > > > part that comes later could be added to the logic there too. So
> > > > this
> > > > seems like unnecessary complexity to me or I don't see the
> > > > reason.
> > > 
> > > I guess this is a bad idea because if you have the full size array
> > > sitting around anyway you might as well use it and reduce the
> > > exec_mem_alloc() logic.
> > 
> > That's was the idea, indeed. :)
> > 
> > > Just looking at it from the x86 side (and
> > > similar) though, where there is actually only one execmem_range and
> > > it
> > > building this whole array with identical data and it seems weird.
> > 
> > Right, most architectures have only one range, but to support all
> > variants
> > that we have, execmem has to maintain the whole array.
> 
> What about just having an index into a smaller set of ranges. The
> module area and the extra JIT area. So ->ranges can be size 3
> (statically allocated in the arch code) for three areas and then the
> index array can be size EXECMEM_TYPE_MAX. The default 0 value of the
> indexing array will point to the default area and any special areas can
> be set in the index point to the desired range.
> 
> Looking at how it would do for x86 and arm64, it looks maybe a bit
> better to me. A little bit less code and memory usage, and a bit easier
> to trace the configuration through to the final state (IMO). What do
> you think? Very rough, on top of this series, below.

I like your suggestion to only have definitions of actual ranges in arch
code and index array to redirect allocation requests to the right range.
I'll make the next version along the lines of your patch.

> As I was playing around with this, I was also wondering why it needs
> two copies of struct execmem_params: one returned from the arch code
> and one in exec mem. 

No actual reason, one copy is enough, thanks for catching this.

> And why the temporary arch copy is ro_after_init,
> but the final execmem.c copy is not ro_after_init?

I just missed it, thanks for pointing out.
 
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
