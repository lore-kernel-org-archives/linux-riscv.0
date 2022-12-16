Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A21C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 19:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DITTdstheKbDQHNPCkX9y0dkTZtt4n7OVoYhbmPCobM=; b=eolsp7560KXh73bVBYQ7TrWH24
	fHNeQQBO3wABc9uQHj0dj5MFBsaiEsHmjvAJP65JK9+rHdlNLiqtHoxY7uUxuU3WnL4k5DAu5Xb47
	RM9ErNgOt80nQyEOSuB4LnwlRq5fOthf/ktEOH3lvKJTu8pmXyqSVrhwaEDETQSR5yYIuPbM388JD
	fE4qkSKicl9HY1/FiyFug1PxuqrnoodTlk9nFOyOGyrBnsVaYse7a1Q0CqQzrQY9w9oFuNfc/mhLH
	j/DNTcQv44DvjmeV8OyQ7qhoNE7f0ehUK8XWXIXj6bQjEW0IiQ2+xXIY8P9T0MREPJou7wUqHGqgR
	Lw9qrw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Gn7-000PYp-9p; Fri, 16 Dec 2022 19:54:45 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Gn2-000PRw-Uh
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 19:54:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id o12so3498598pjo.4
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1xCmJVdTDddB6iEaD3p69qrSp4IMZuGPG9N/vesLgI=;
        b=RU3tNp9nWwxxG94nS9cUQ99fFCChj6ARVeO7awtuN29D9SsAZy0Cm7KAF6Bv5SBnKY
         V2cfud87xNaOXRn3Ytt3sDlviAoW0S5JdNNDw5e6VXCH9UJrsWAkMy+WaJILZGkZ/zvM
         5rt9rY9ikVoVuxS6B0WYiJeRfP/9DU0ZxE/433gxIOGnV+BJSD3c6d+VgbGj/vE+r2DV
         u8Mos39vDNK4oGTUgoh3zeTmuPClwwOCo8FAToGVZkfeZo9W3Fee5mMqC4LjzdjTyt9M
         f2hRe2HpV6uxi/2FqhrT2b+NIODK1OR/p1sDz3MblgnJYNBF+H0brKoEHHmfFwLLZW3Q
         /eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1xCmJVdTDddB6iEaD3p69qrSp4IMZuGPG9N/vesLgI=;
        b=tQ+YGF3IBImh2sQzxlDpN+dWUtipLjt0s1GbZaWva8X8bByetkWN+Clfg+m4Kt0v22
         GXH30R6oyl+tb/Ju9ePGMATFj+ei/1V3HEE3UH23bWn98N+9whqo50Pf+PTlukUaYxtL
         JeRU2ckug42r61vTwzkqpgB7BaLrL+RQ5Sns6FC7KAdvoRGAm3gh/O3VLFcXqeFErEzB
         abwHUJUPhW1g60n2M7tbuO4H136QkFwfT2ZHp8s6MFSCQ+7V5Q+qarHiYuMi5Zy7T2Kr
         /M3SAHVI8rEADJV/jVw07CedDg/r6tyxpI0A0VM0Xi56nbiX/YWSgq02zY4NwhXClr0t
         4USA==
X-Gm-Message-State: ANoB5pm7O4LxFZW6e129ESrmQqNKlub6wASLFKM4gv/GMjWmH329pvln
	gogfqMYntKoVsjg0WaV/z3UBQA==
X-Google-Smtp-Source: AA0mqf6ec1BAdxIvtjxtWjAto85BO9bAbN8u9avMqyo2iJ721NQQ0Ak3YqqBXLmhwUJLHkCDC88tuQ==
X-Received: by 2002:a17:902:ec8a:b0:189:bda4:4a39 with SMTP id x10-20020a170902ec8a00b00189bda44a39mr44094322plg.49.1671220479835;
        Fri, 16 Dec 2022 11:54:39 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b00186b86ed450sm2002544plk.156.2022.12.16.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 11:54:39 -0800 (PST)
Date: Fri, 16 Dec 2022 11:54:39 -0800 (PST)
X-Google-Original-Date: Fri, 16 Dec 2022 11:54:21 PST (-0800)
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
In-Reply-To: <39636675da60fc6c54cc8bbab64ddbac@codethink.co.uk>
CC: abdulras@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben.dooks@codethink.co.uk, ndesaulniers@google.com, nathan@kernel.org
Message-ID: <mhng-d601613f-1c73-48e0-bb06-7f87acd60cfa@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_115441_246214_320B0588 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 16 Dec 2022 11:45:21 PST (-0800), ben.dooks@codethink.co.uk wrote:
>
>
> On 2022-12-16 18:50, Saleem Abdulrasool wrote:
>> The compiler is free to generate vectorized operations for zero'ing
>> memory.  The kernel does not use the vector unit on RISCV, similar to
>> architectures such as x86 where we use `-mno-mmx` et al to prevent the
>> implicit vectorization.  Perform a similar check for
>> `-mno-implicit-float` to avoid this on RISC-V targets.
>
> I'm not sure if we should be emitting either of the vector or floating
> point instrucitons in the kernel without explicitly marking the section
> of code which is using them such as specific accelerator blocks.

Yep, we can't let the compiler just blindly enable V or F/D.  V would 
very much break things as we have no support, but even when that's in 
we'll we at roughly the same spot as F/D are now where we need to handle 
the lazy save/restore bits.

This looks like an LLVM-only option, I see at least some handling here

https://github.com/llvm/llvm-project/blob/a72883b7612f5c00b592da85ed2f1fd81258cc08/clang/lib/Driver/ToolChains/Clang.cpp#L2098

but I don't really know LLVM enough to understand if there's some 
default for `-mimplicit-float` and I can't find anything in the docs.  
If it can be turned on by default and that results in F/D/V instructions 
then we'll need to explicitly turn it off, and that would need to be 
backported.

Maybe Nick or Nathan knows what's up here?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
