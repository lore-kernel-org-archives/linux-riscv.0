Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE06E7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaKbWHb8LQI6OSmxAu/U4z8Yh4H1EfTBxBFD7wbAzCI=; b=oLGsIsw/7aDOy8
	c91/wcEFTgVlsJSv8h91pkP1EE8dG11c7D0lz6XGcMU1tRyNOi0A+aSxyTpDuybnj4BPeooEEhgHA
	OveCqoshtUMPKv3clOOywM9FYZlmqyUcCbONyeF3ASxif8R/zNVgscY+uSSx/SFp3YKistzUkE4Ck
	lqCJ3ZMlYsg5OTQ2ynrVB3EiWW7s+N2BgDbrqVTQ79V0N2TojG5ZC/Eyrly26+5WjHG79CTpVjCJB
	eZtB1u5WFBBtj5DOy2UHEDxh30BrFncHwO+xGtZHKPICYJhn+Gy0ZOQbHcGC1RNtw4LOjIlklTVsu
	cSyPOuEw0xh7f8+8+0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJU4-000000055aF-0kKa;
	Mon, 13 Jan 2025 12:23:56 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJSp-000000055MD-1Zes;
	Mon, 13 Jan 2025 12:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736770959; x=1768306959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=stEywmXG1laYnRzODs69aFGDvg28c4l68K3KGTA7Rvo=;
  b=HA+mCuXd8hMVXP+Q4cZCSucY3jNVy16d0KPgdZjb5driasJMBNtHfX4z
   5LCbtX1wXKxwGP3jgwvtLX0/07mYVxPRZHZ5/IYdIMTRWUzk0A7yJnojq
   J2HIx+OnMlIrlVSGb2VXJJT8TZndJrbYE1Rs0nYtiKCn0AJ3tDwQcr1/s
   Bx2GXjjeZ9chp+lOjrk/TzT3XiDaz2FJ4WOjb8nrWdRQ1loN4UDa4QqXh
   8KX5Dox6gyBfq33J4sC0LXEKNZdqBnZjPlvlKtyHuquozjQObbloRYzw1
   1BnYYJgReMmN/rAg820O/E5QFZ/1ky62yXt2VwFEpAUejEA5sZ+5wPLBX
   g==;
X-CSE-ConnectionGUID: UV6Uenb4TdOcqHJ1kgJFTw==
X-CSE-MsgGUID: iTJLLCR/TXOLqRy7c3q91g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47695718"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="47695718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 04:22:38 -0800
X-CSE-ConnectionGUID: ogta3rT+TIGgYDeY4fP/6w==
X-CSE-MsgGUID: l0qv6h4BSKS//whYdBgmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127720416"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2025 04:22:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 0E7E039C; Mon, 13 Jan 2025 14:22:29 +0200 (EET)
Date: Mon, 13 Jan 2025 14:22:29 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by defaultk
Message-ID: <frry56jwxk6cpesuk4u5mcnkaxq3c4xqhdi52irdvabwtn5smt@t2tudprmocs4>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
 <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
 <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
 <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
 <ejh2llcaxahkgz3k2ji3b35dfdss3bfgztyhsfgtu6adejasr7@ajehr7ac3bp3>
 <20250113103238.GCZ4TrxlX-VbHLkoNo@fat_crate.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113103238.GCZ4TrxlX-VbHLkoNo@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_042239_423683_35771CDE 
X-CRM114-Status: GOOD (  13.52  )
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

On Mon, Jan 13, 2025 at 11:32:38AM +0100, Borislav Petkov wrote:
> On Mon, Jan 13, 2025 at 12:03:22PM +0200, Kirill A. Shutemov wrote:
> > Borislav,
> > 
> > Is there anything I need to do to get this patchset merged?
> 
> Your updated commit message here:
> 
> https://lore.kernel.org/r/bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o
> 
> Reads better, yes.
> 
> > This change fixes the crash on kexec in TDX guests if CONFIG_EISA is
> > enabled.
> 
> s/This change fixes/Fix/
> 
> In imperative tone pls.

Okay.

> And that sentence begs the question: does this need to go to stable?

Right.

It is hard to pin down Fixes commit as the bug is inherited from initial
encrypted/decrypted handling implementation, but it is not useful to
backport it all the way.

I'll add

Cc: stable@vger.kernel.org # 6.11+

6.11 is where kexec handling for TDX was introduced.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
