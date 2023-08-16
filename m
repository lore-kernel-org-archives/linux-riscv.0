Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32DAC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BxvoL+aTWy8LwSFF441K+V75vO6T6jmn4SVXDqiqiE=; b=q4JGk83FbcI3EX
	6HTnDsXKOz1D1UFbd8KhkYvnaHSbmqdRIvhRX0xlq6pnmqIlW2WcrKHbNdFmgt/FhqJOugYX0ZUj7
	jpgaNQ86qjkvUjutJmvJbIfWOWQX/4fz8ZRYfgLgHXKxDgc/ah/XAtsf/O6lOPmkB38QpBmjO/NBq
	L3H0BHiOG739pfgJFUA2G8XXMgrAqsBaxoT/Rp3Q/8LOHe1KDMx/dVnhTXV4cIGQI/kVzQAJrGjvx
	CP0UjJq7ZWY9ydbJcWECoSB2GWZZhuUpzZPqT9yeIrH6qA8EvND335dqED39+BqQUYm1FNbfD2eia
	0S2+H15CWSLTiQ3BSlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJbQ-004dLZ-37;
	Wed, 16 Aug 2023 16:42:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJbO-004dL3-2N
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 16:42:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 334F366D0D;
	Wed, 16 Aug 2023 16:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AF1C433C8;
	Wed, 16 Aug 2023 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692204153;
	bh=58unTFnXGEq3UBUCeC2OOQ34OOD9B4fl4PEKWgwKnBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDsJ4PybcVzKHecuX6kYS/XWs0yKGqmYNteF7T/NL+/93pWCmql4uxXQ2pI2rJfdX
	 6UQNv1XFXDcjCsKQCGrW35qSAi5xhYyztHRTVmCFcQ1Q/3NKP63VtpfOI6xSH3Ad6F
	 bb4jahKCpOvIkedMgSEexaTY+Q3IzpKOEpN6zP0Uq+XwLzbBZMMN5PzIp942eFd6Zk
	 wf/FVi8RSJ89Lbo0yfnZpDeNAEgXi8QYhdepy6rfIUWdmH1+nDo43oytuI1hs80oLP
	 cAR1Ki1DXuTfQVjBUPLRvef12BfIQSkcHQKPwsovgQa0NvhWdpVT4z5YhkeT3pfcNZ
	 uCEPjn0OiZSxQ==
Date: Wed, 16 Aug 2023 09:42:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] riscv: SCS support
Message-ID: <20230816164231.GA1653714@dev-arch.thelio-3990X>
References: <20230815203442.1608773-8-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230815203442.1608773-8-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_094234_856529_6DB7728B 
X-CRM114-Status: GOOD (  23.70  )
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

Hi Sami,

On Tue, Aug 15, 2023 at 08:34:43PM +0000, Sami Tolvanen wrote:
> Hi folks,
> 
> This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
> uses compiler instrumentation to store return addresses in a
> separate shadow stack to protect them against accidental or
> malicious overwrites. More information about SCS can be found
> here:
> 
>   https://clang.llvm.org/docs/ShadowCallStack.html
> 
> Patch 1 is from Deepak, and it simplifies VMAP_STACK overflow
> handling by adding support for accessing per-CPU variables
> directly in assembly. The patch is included in this series to
> make IRQ stack switching cleaner with SCS, and I've simply
> rebased it. Patch 2 uses this functionality to clean up the stack
> switching by moving duplicate code into a single function. On
> RISC-V, the compiler uses the gp register for storing the current
> shadow call stack pointer, which is incompatible with global
> pointer relaxation. Patch 3 moves global pointer loading into a
> macro that can be easily disabled with SCS. Patch 4 implements
> SCS register loading and switching, and allows the feature to be
> enabled, and patch 5 adds separate per-CPU IRQ shadow call stacks
> when CONFIG_IRQ_STACKS is enabled. Patch 6 fixes the backward-
> edge CFI test in lkdtm for RISC-V.
> 
> Note that this series requires Clang 17. Earlier Clang versions
> support SCS on RISC-V, but use the x18 register instead of gp,
> which isn't ideal. gcc has SCS support for arm64, but I'm not
> aware of plans to support RISC-V. Once the Zicfiss extension is
> ratified, it's probably preferable to use hardware-backed shadow
> stacks instead of SCS on hardware that supports the extension,
> and we may want to consider implementing CONFIG_DYNAMIC_SCS to
> patch between the implementation at runtime (similarly to the
> arm64 implementation, which switches to SCS when hardware PAC
> support isn't available).

I took this series for a spin in QEMU with both LLVM 18.0.0 and
17.0.0-rc2 and the LKDTM test now passes with CONFIG_SHADOW_CALL_STACK=y
(and fails with LLVM 16.0.0, as CONFIG_SHADOW_CALL_STACK is not
selectable there).

Tested-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
