Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACD6C369D9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgOzZc+NpmhX3+ENZV0V1ebVUuXs7xnKkMDL/FWARwo=; b=QDgwW7QfZo4oR+
	FhBlzp0pKwiWit4WdZPOC5neFW2gAMXC0xrQbzpvjQIxyDtbWv/1AooJ9TK2S8Mz7uQ2ovEcNRU18
	INE+k0lzp+fsehT7UlHUWUzdVxpxk/hbtKq9aHaBe1Vmq8OatwTklS+Vp9aSkgmMPPZBd39UGKsCT
	zeF6TKDThKJd4SX8N5PcvcDDp3o99wA/GBE3/GmbBqzYyuGqQHdvK7WIQggycy7W+/l398RDYRJyN
	DYZWsZlUuyPXoLLbNYTdjxHRMn9gI5817jzGWlUho6m6aq5UsIhm6oBC66DS1ZU5C7XyhOXmWoTt0
	QPygNbzxiwQbEiZr4n2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAI3Z-0000000EKXb-3t1N;
	Thu, 01 May 2025 00:45:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAI2f-0000000EKTB-3rLI
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 00:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 824EFA4A9A8;
	Thu,  1 May 2025 00:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B197C4CEE7;
	Thu,  1 May 2025 00:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746060282;
	bh=Ab7M7H7nRmNFNWh96Fia/8+mn2FgmJJgEuGJ617QAdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhv+D+ZN0Iljf1UblLJSGJqBr54u37Uo1lwFXZoyEMKxzEpCkG7wm7Zv+VEkJ27ms
	 orJ9BxGfG6BBP0eLm6K5VRxwu1vRfCyZbIY+drVnCL8BGge46Be2bBwQ3b8lqBN1Ah
	 hUPY8mB4xiDJAv4rmkejYqKm2M0NW0noL26jB4+nv8ltIBKfur0PJxFRLgTuaK0/kl
	 qEWknnjo1noEg34CDZvJzmItSL1iqRYCL/J5ONAmpf+De1WfpXaGHIBuf5BSqGyEzw
	 H/uC//BoPmZCuQNWSJd6U8UZkmNSYKF6KCL2tuM7oHECVC/zUmyKaM0gJHnizJXSuY
	 Q3Sh4ncb6FGKQ==
Date: Wed, 30 Apr 2025 17:44:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: naresh.kamboju@linaro.org, anders.roxell@linaro.org,
	aou@eecs.berkeley.edu, arnd@arndb.de, dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev,
	masahiroy@kernel.org, namcao@linutronix.de, palmer@dabbelt.com,
	regressions@lists.linux.dev
Subject: Re: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic
 relocations are not supported
Message-ID: <20250501004434.GA3762678@ax162>
References: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
 <20250430154845.795993-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250430154845.795993-1-ojeda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_174446_022649_FD16DB3B 
X-CRM114-Status: GOOD (  11.17  )
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

On Wed, Apr 30, 2025 at 05:48:45PM +0200, Miguel Ojeda wrote:
> On Wed, 23 Apr 2025 20:15:45 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > build errors with clang
> > ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
> > '__vdso_getrandom' failed: symbol not defined
> > llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
> > such file or directory
> 
> I have also been seeing this too in my Rust-enabled builds for a few
> days at least.

I forgot to follow up here and say that I sent a patch for this, it just
needs to be applied by the RISC-V folks.

https://lore.kernel.org/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org/

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
