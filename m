Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B512C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kFAFA6kYErE8BuEFqzTZ2QT2fyQsP8RGnPMR4HusuM=; b=Nq3r6lZXZ0/WXC
	PVDBXuOaL5J7l9+ASVWfVJ02FLpcCyskG99SwIdZVe9bqkzInPV5OB6QRx4Y6UXpnjsL6S+M/uI25
	/+vQWY04Op0UaAnfFBD856zMzdyMjRogBd3WI33dVNYJXK5tJ9I3Bx6IuH9PQ87AS6ushKWcM9PCA
	RCyD0C4nct5wTawaGCdJ++zS0EvwcrpPhBSvSCXfClY1XRYTM47OiOtA/gl1Yhq6iZya0NGQMSzRM
	TBbwKtBy77YxtvdtG7H2Hac1ksDwnpCt8//XLX7ua3gDNfwtcBp23gNCSM87PW8tuOhL65IRb5vGu
	DxFDSC8B0Cg7FtPc1peA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4mb6-004UKL-2l;
	Thu, 01 Jun 2023 18:00:28 +0000
Received: from out-26.mta1.migadu.com ([95.215.58.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4mb3-004UIE-11
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 18:00:26 +0000
Date: Thu, 1 Jun 2023 14:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685642421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rikKWdy6FkJZ7TxOeuVv2no4Uvw2FbvFXrknlku2Lr0=;
	b=atiaOaKv+uGgVWrIBgEc7yMVho95zk+yXn7HmIb/JWzdFNNRD8GsFkaCojYLUmxdGEZj8D
	7Ioc6S8oiCxOeWCOlyVYprsSznLfrTEBk/hh6wsG3yyt6B+kTftpXgtdtqd4vLEbQHfUux
	KWvBLALHSXDpFUTZKzUX7J9eP0pgECQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"deller@gmx.de" <deller@gmx.de>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
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
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
Message-ID: <ZHjcr26YskTm+0EF@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
 <0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_110025_502213_7773A0A7 
X-CRM114-Status: GOOD (  13.56  )
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

On Thu, Jun 01, 2023 at 04:54:27PM +0000, Edgecombe, Rick P wrote:
> It is just a local flush, but I wonder how much text_poke()ing is too
> much. A lot of the are even inside loops. Can't it do the batch version
> at least?
> 
> The other thing, and maybe this is in paranoia category, but it's
> probably at least worth noting. Before the modules were not made
> executable until all of the code was finalized. Now they are made
> executable in an intermediate state and then patched later. It might
> weaken the CFI stuff, but also it just kind of seems a bit unbounded
> for dealing with executable code.

I believe bpf starts out by initializing new executable memory with
illegal opcodes, maybe we should steal that and make it standard.

> Preparing the modules in a separate RW mapping, and then text_poke()ing
> the whole thing in when you are done would resolve both of these.

text_poke() _does_ create a separate RW mapping.

The thing that sucks about text_poke() is that it always does a full TLB
flush, and AFAICT that's not remotely needed. What it really wants to be
doing is conceptually just

kmap_local()
mempcy()
kunmap_loca()
flush_icache();

...except that kmap_local() won't actually create a new mapping on
non-highmem architectures, so text_poke() open codes it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
