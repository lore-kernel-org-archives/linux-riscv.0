Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2FEC7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 18:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjlXjvHI/atmmv79WDB5P3G5n3DOKIFX/2uJP46Van0=; b=nM+d3WqnnzC8nI
	QzKTvZAg28/muwNBeyorTv5nL3BiLbFommSMBbkulVEJssI9OwHRpXIWMJwYMATkc/saX74UpuFTN
	1hoSEHqvuMUbQQppJGMd/mDGzGrp9i5KRiYrcAU6znDIA+kf8FR+zQtNwxHKsGronI0wsah16tMEb
	af2eHWDMPsKuBDPOW1YAay6OLpQMnFqo7NaFxy8xrSzCE7hxJb4Dw6KAK8nYqFeV3/lSb3IL6Eu2E
	K65F+DYbjXcQkQu91SZDzlkq+7hVlXyQq3bs3QUgBodi2yNKzZ/sIurrM/kohhs4ZfU2OFgK2pR9+
	9E6KcurziPQJ1ZqvKkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5s4G-00Cf5n-1g;
	Sun, 04 Jun 2023 18:03:04 +0000
Received: from out-31.mta1.migadu.com ([2001:41d0:203:375::1f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5s4D-00Cf1B-1B
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 18:03:03 +0000
Date: Sun, 4 Jun 2023 14:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685901772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8eVzj7/BTcLqy7wFCwl6xnZsISP/KN6jro+z/mha3Xk=;
	b=PqQAVjJ04ndqRoRQANhzjXtWIXqTHWREPNCE9YGBCSItM5aGzg9r4emrFDvZxP/xuQ2bpU
	DTvQnUtepgxbciT5z6M6Z+EoNGC8g2gnKTdxk1x+F2TTQDaLu6DFNHuJfLzV07K3aFkiY5
	e/eoFzp+TyP07cOwDSzIUjGa6eo5mqQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Song Liu <song@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZHzRxE5V6YzGVsHy@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_110301_585610_9788CB0A 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri, Jun 02, 2023 at 11:20:58AM -0700, Song Liu wrote:
> IIUC, arm64 uses VMALLOC address space for BPF programs. The reason
> is each BPF program uses at least 64kB (one page) out of the 128MB
> address space. Puranjay Mohan (CC'ed) is working on enabling
> bpf_prog_pack for arm64. Once this work is done, multiple BPF programs
> will be able to share a page. Will this improvement remove the need to
> specify a different address range for BPF programs?

Can we please stop working on BPF specific sub page allocation and focus
on doing this in mm/? This never should have been in BPF in the first
place.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
