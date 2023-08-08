Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A5FC001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALyrXrP9LAPb4lPznUhW+j5sIMgF1edCkmDP+NrvpXQ=; b=UqyI9nLvFkJA/q
	q9SIcKOphdaA/UQhhiY3ALXdD4EV+den0mWi/O4+lA7XEpfiyI8ZqgPHlbBISYdGJGV/TrNCLI+9Q
	D8GmDbWoT4dOKMM/V+nkE8cjDzEpHS0M7dA0++2a2IlD5OddZdxSq6gRjLrIgJYA+tixT4cjzAJO8
	s4eyXFJmtyixF0KJYE4xkJpf3Mah55ACU8apcyhOT5w7WoDNc/FC8MZ0pTe/csIWkFl0OPT+jsgvu
	/nv5we10Ef+GiaJKTiVFk5SnH+mNCJHDyAtj5OFd6qVVuh57bmUEf4OjyesU5X1ln8u2qdTuCUhnm
	fbT8GAEHlIUwWq6OlVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMvX-002fdj-2o;
	Tue, 08 Aug 2023 13:39:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMvT-002fcd-2x;
	Tue, 08 Aug 2023 13:39:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C6C662231;
	Tue,  8 Aug 2023 13:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B716DC433C8;
	Tue,  8 Aug 2023 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691501946;
	bh=RnXjxseYsnFe6Wnck1M4XbqKJfcYUVsYZpbGiHCNKCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOsRv8DPnz3szlVVqAIekC0oAa1YWjq756EOBKQHNrWkdjOHTpZrdXFvoiy0dPstL
	 zHVpr1V7MDywHBGGU4vstj24/ddQ2YUijhLOHhv21OptJRcyHiqH4PCaeITgRuOsQP
	 xhcNw4WURUix63jdw9L0KUAaoaYuVRg6y2L3/+0DCRQV91VgQjhNmhSn7gmTUld4CN
	 PukbIQT3kIDYfuJo8nq7Ezq5aseMpKv9N4/sMDanxbzcf38L9HyofcxB5+sD0FXxB4
	 LdhMsPJhZIcf39N6w/S5fgwPEA8bYg9AZCO455XBxu4iag2rRXSA1EHP7TfDTdQEgX
	 lr0A4nNsxMLIQ==
Date: Tue, 8 Aug 2023 14:38:58 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/36] arm64/gcs: Provide support for GCS in userspace
Message-ID: <20230808133857.GC2369@willie-the-truck>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230801141319.GC26253@willie-the-truck>
 <09b7a94d-cc88-4372-85de-52db26bc2daf@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09b7a94d-cc88-4372-85de-52db26bc2daf@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_063908_039118_027B88DE 
X-CRM114-Status: GOOD (  22.54  )
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

On Tue, Aug 01, 2023 at 04:09:58PM +0100, Mark Brown wrote:
> On Tue, Aug 01, 2023 at 03:13:20PM +0100, Will Deacon wrote:
> > On Mon, Jul 31, 2023 at 02:43:09PM +0100, Mark Brown wrote:
> 
> > > The arm64 Guarded Control Stack (GCS) feature provides support for
> > > hardware protected stacks of return addresses, intended to provide
> > > hardening against return oriented programming (ROP) attacks and to make
> > > it easier to gather call stacks for applications such as profiling.
> 
> > Why is this better than Clang's software shadow stack implementation? It
> > would be nice to see some justification behind adding all this, rather
> > than it being an architectural tick-box exercise.
> 
> Mainly that it's hardware enforced (as the quoted paragraph says).  This
> makes it harder to attack, and hopefully it's also a bit faster (how
> measurable that might be will be an open question, but even NOPs in
> function entry/exit tend to get noticed).

I dunno, "hardware enforced" can also mean worse security nowadays ;)

But seriously, I think the question is more about what this brings us
*on top of* SCS, since for the forseeable future folks that care about
this stuff (like Android) will be using SCS. GCS on its own doesn't make
sense to me, given the recompilation effort to remove SCS and the lack
of hardware, so then you have to look at what it brings in addition to
GCS and balance that against the performance cost.

Given that, is anybody planning to ship a distribution with this enabled?
If not, why are we bothering? If so, how much of that distribution has
been brought up and how does the "dynamic linker or other startup code"
decide what to do?

After the mess we had with BTI and mprotect(), I'm hesitant to merge
features like this without knowing that the ABI can stand real code.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
