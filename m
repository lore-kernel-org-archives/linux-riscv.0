Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4135DEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 18:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCoWOSkSopMprtyVpNbbuhA1ifUDtURlJxZxVy2dq4s=; b=3WZQKhWYfsJDfQ
	+8t7wux+hvcQ1WwTpqAr97JiMCDvRT92QjxqSJWzXoUecdqy/Zqr6qWnLGKscFx8fgdlQUW58NIKe
	DjugGdVszt5VdIkttLj4Q2WGaC9oohx3B+Tci8u7jir0c8cVjY2Tj5NXdNOUsi70B418iWJgtf8fu
	vposrFw9eWhk7ah5rh/LxnzsnfZi/ZP7xcik1jSObOtZkG+Xi/ZKK83HjHnVuPVVAbGRGin7MZpT4
	nk3b0jWl5JEX7T9IbvWB/5wjt3R+iJghDOgFYpUXC3DTwnob5PpntfLO5IAkJKKiQDWkK+zknWNZF
	u06Abu1Il75DYVGO0ktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcNm-0007tJ-0A;
	Mon, 14 Aug 2023 18:33:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcNi-0007sl-17
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 18:33:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26b56cc7896so625651a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 11:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692038013; x=1692642813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8iwZg12OLuhKmVur/3KwHW/8LJxcNDVt1vwEiERMGA=;
        b=bFFqbLkEpK7yIJMGtIvYU+M+BhgGIQ6EuxXiqxJXKdluI9eyiHNw6zWy58WyqWDYS7
         PNX3Ltz3Hv8rQyoWH1aYcEUjZVJSC6leddeGvziv/G5VPUH+Q4f8oQtHPAa1tXzbHyMw
         xaoKqVMs9yciwG/L14RqjSGjc5vmWl1o/+J2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692038013; x=1692642813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8iwZg12OLuhKmVur/3KwHW/8LJxcNDVt1vwEiERMGA=;
        b=NmRq4KYhyDHU2rUJrZKGEyiwFMynEy9FqYUeGzjNroYkXT025OCp7mDFogqg9sqV8N
         GrrzuimnRnaCZ7a/afta1fViACW6csC86E/k+3NiZ0bGusSe91yd7iTeWuwUUxwWYJe+
         S8og96RYoA0V0wbPca9xGFvveJu5eVO8Z/R6wB9wvK7CaYoyXbxBB4b+/vKglxmEIo6x
         THwt0Ekz3jkA9f8Zo3t9TktEtyxbo1bKoH/u1hFl8GeY4jfReKi7C3mCeFHFuoWkkEZ5
         sxdAUObcbWavWDD3qkLfzkz/t/BFxrR7cd27GLECcwIvIL1L65A/n2HPXjZpFDHAM4m3
         HBSQ==
X-Gm-Message-State: AOJu0YwGWrl76ejx95Bh58ae8ZkDXaJEv+SYFQ02Efgz9N1iRFmd7JZh
	k6xemgjbsHgGnlpi6WoOefMqJA==
X-Google-Smtp-Source: AGHT+IEklZccVL6cUi3mOUlAJqnCYsINOyo2Bwkp+4IkA+X5znYYwIyoEN7NI88uHvmjTxQq2W/Tqg==
X-Received: by 2002:a17:90a:cb06:b0:26b:2538:d717 with SMTP id z6-20020a17090acb0600b0026b2538d717mr6989311pjt.25.1692038012892;
        Mon, 14 Aug 2023 11:33:32 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b00262eccfa29fsm10161456pjt.33.2023.08.14.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 11:33:32 -0700 (PDT)
Date: Mon, 14 Aug 2023 11:33:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] riscv: SCS support
Message-ID: <202308141131.6B90A4205@keescook>
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814175928.GA1028706@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_113334_414258_1E5AF605 
X-CRM114-Status: GOOD (  33.18  )
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

On Mon, Aug 14, 2023 at 10:59:28AM -0700, Nathan Chancellor wrote:
> Hi Sami,
> 
> On Fri, Aug 11, 2023 at 11:35:57PM +0000, Sami Tolvanen wrote:
> > Hi folks,
> > 
> > This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
> > uses compiler instrumentation to store return addresses in a
> > separate shadow stack to protect them against accidental or
> > malicious overwrites. More information about SCS can be found
> > here:
> > 
> >   https://clang.llvm.org/docs/ShadowCallStack.html
> > 
> > Patch 1 is from Deepak, and it simplifies VMAP_STACK overflow
> > handling by adding support for accessing per-CPU variables
> > directly in assembly. The patch is included in this series to
> > make IRQ stack switching cleaner with SCS, and I've simply
> > rebased it. Patch 2 uses this functionality to clean up the stack
> > switching by moving duplicate code into a single function. On
> > RISC-V, the compiler uses the gp register for storing the current
> > shadow call stack pointer, which is incompatible with global
> > pointer relaxation. Patch 3 moves global pointer loading into a
> > macro that can be easily disabled with SCS. Patch 4 implements
> > SCS register loading and switching, and allows the feature to be
> > enabled, and patch 5 adds separate per-CPU IRQ shadow call stacks
> > when CONFIG_IRQ_STACKS is enabled.
> > 
> > Note that this series requires Clang 17. Earlier Clang versions
> > support SCS on RISC-V, but use the x18 register instead of gp,
> > which isn't ideal. gcc has SCS support for arm64, but I'm not
> > aware of plans to support RISC-V. Once the Zicfiss extension is
> > ratified, it's probably preferable to use hardware-backed shadow
> > stacks instead of SCS on hardware that supports the extension,
> > and we may want to consider implementing CONFIG_DYNAMIC_SCS to
> > patch between the implementation at runtime (similarly to the
> > arm64 implementation, which switches to SCS when hardware PAC
> > support isn't available).
> 
> I took this series for a spin on top of 6.5-rc6 with both LLVM 18 (built
> within the past couple of days) and LLVM 17.0.0-rc2 but it seems that
> the CFI_BACKWARDS LKDTM test does not pass with
> CONFIG_SHADOW_CALL_STACK=y.
> 
>   [   73.324652] lkdtm: Performing direct entry CFI_BACKWARD
>   [   73.324900] lkdtm: Attempting unchecked stack return address redirection ...
>   [   73.325178] lkdtm: Eek: return address mismatch! 0000000000000002 != ffffffff80614982
>   [   73.325478] lkdtm: FAIL: stack return address manipulation failed!
> 
> Does the test need to be adjusted or is there some other issue?

Does it pass without the series? I tried to write it to be
arch-agnostic, but I never tested it on RISC-V. It's very possible that
test needs adjusting for the architecture. Besides the label horrors,
the use of __builtin_frame_address may not work there either...

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
