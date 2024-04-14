Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7517C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SMd2/5G9FemcSsYir8P4+N5Y479ND5v14JjyEI8I38=; b=3EUrrjmIfDflVC
	Fr5xQescO8dRX8N8S+0JrVsJ/P4A7ssBD3nhe9o0HbohTaKqAFjjfJBJJ0zkT8hOqj4LLMuiqkkVY
	PE/aWH0M9nDuVftyc98qQ4bCPEygYmmBG+uf/29Lj8dkTVo4mRgAdt/phqwqVgewhgnmsBwBKms2e
	ssDnHMcB9NpKcnYp+j9cZC3rSxDC414+FYF6RiK+lROa77aiwY1lIi90jeHlIP9FecSjv14SzAjfy
	UO5XLaLUf8Yv+KHCy5L7g6dFzQmfdGVwVl/7Ne9bw/0DYreNiFk00CxpwPErqyDQfZWtnW7MC7CJ4
	PaWoOhLkSHFjkFFPk7bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvuQB-00000004ue2-0ZOw;
	Sun, 14 Apr 2024 07:37:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvuQ7-00000004ubC-0Dax;
	Sun, 14 Apr 2024 07:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1A65CE0660;
	Sun, 14 Apr 2024 07:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE94C072AA;
	Sun, 14 Apr 2024 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713080215;
	bh=BR4ur7se43kPXCUVLf6Y0OP7MVR1Rv+aJKN+ghbILUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmbOtwx+uhP9H/utYH9BcUL2xj/Ka1KVJK6b6TlmVmh5wUN7RShrmZqV3fElednNr
	 PLo23bk1pmangeGEqKrrJDDbzSUKdOzPxLiI6z2Iv0Oqmq0sxdrHrCLrAzh28co+BJ
	 bbmel8ioD6s7h8xAsEjrBLYjbfLdAea51klVDqMWT34WOMNgeL1cFP32fZOxdlRVJd
	 dArt+DeqqoJkVwora/vo+eApqnXKwkDrxmR4m2ImVxkqhTucJm4Z8bchhp91LsvSAl
	 CS1YOGLHOkOTp2BnI7lfvt/mhQnS3DMYKllAZRqZvCg/EMbqu21/uaEQilGMpGUDUw
	 GnSi9UsVWFWxg==
Date: Sun, 14 Apr 2024 10:35:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [RFC PATCH 5/7] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <ZhuHT3dnFTDVUpHL@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-6-rppt@kernel.org>
 <Zhj58NVS/iQnPeIq@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zhj58NVS/iQnPeIq@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_003659_281311_787D9E3C 
X-CRM114-Status: GOOD (  12.18  )
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

On Fri, Apr 12, 2024 at 11:08:00AM +0200, Ingo Molnar wrote:
> 
> * Mike Rapoport <rppt@kernel.org> wrote:
> 
> >  	for (s = start; s < end; s++) {
> >  		void *addr = (void *)s + *s;
> > +		void *wr_addr = addr + module_writable_offset(mod, addr);
> 
> So instead of repeating this pattern in a dozen of places, why not use a 
> simpler method:
> 
> 		void *wr_addr = module_writable_address(mod, addr);
> 
> or so, since we have to pass 'addr' to the module code anyway.

Agree.
 
> The text patching code is pretty complex already.
> 
> Thanks,
> 
> 	Ingo

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
