Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA62C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uxF9JphZ7Gq9BMu7/w6XSFSVQp7ZhAotnkzTrvY/2g=; b=e9vsxaP4lBlEcj
	IgdMCQUf2ypLSSUPxgUK8u/nTUkO9xQEgiYCPVWdg5+0z7ooWqfUW7Ru4orZFm7ur/92LIrHwuD6r
	noPcDLpAIBk5Zl5gFI28qLWJ9UK7DleOPxF/wqPai8Zf54LDHUntaVzp/gyBbXoq3nNeCO1VQMdTq
	lSWYWtF+or8X/rCSef78ulGST2YFvjQR6Ro0Kuhv/Sgm5KrjTshizDYpUXEhtPRCZutzD3ksixMZq
	vyWDJ5zrNUfhBdy/Jzp4ES/jpsJFJiobnpEa1aDmI1746ijpeirzU8hmHaU5ryw4V+j2KVTtB3hPm
	mJaDgmGDESdR9jHoOxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr0HW-00EtBw-Ot; Tue, 17 May 2022 16:42:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr0HT-00EtBB-RP
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 16:42:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77DF0B81AFA;
 Tue, 17 May 2022 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A2DC385B8;
 Tue, 17 May 2022 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652805761;
 bh=1IrxNJ1bp3kbA2oD6OHuufL2ZTrxl/ACrlKCvG7jTxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hQeQSS+V1lj64xDAGzkxKJCHnkihMRbBKk2KbalQc+XmCt4HPchv4lCVWrSfzd2Od
 5K9XN4lutNDsC40vvqk8mXq0gt+/ob0xmC3xmHOjP5iI7Kh/J2VY2WTe5UVmzEk3uH
 YDKCHwuDl7AEKV/0qhQOD4dXaCjUxV7iIGJlNg1kxu7e/RDsyVbHof/Vr2HYcw2FXG
 Vdmt22FdW9mQG5UDeUIpwIXE5D3u+PeV5Dt6Aie3aCTujOhLapO+j8pGhnxZKoPV4Q
 Izz8BTiWQmqm8/WksnkH830yWMBwQZe8w3ylhaGQ85eS+VAL26Dlw2J0L8CNHZCqtg
 EsTsYVHVsDQfg==
Date: Wed, 18 May 2022 00:33:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 2/4] riscv: introduce unified static key mechanism for
 CPU features
Message-ID: <YoPOcHvhWEqeEwzo@xhacker>
References: <20220508160749.984-1-jszhang@kernel.org>
 <20220508160749.984-3-jszhang@kernel.org>
 <CAK9=C2Xinc6Y9ue+3ZOvKOOgru7wvJNcEPLvO4aZGuQqETXi2w@mail.gmail.com>
 <YnkoKxaPbrTnZPQv@xhacker>
 <CAOnJCU+XR5mtqKBQLMj3JgsTPgvAQdO_jj2FWqcu7f9MezNCKA@mail.gmail.com>
 <YoCollqhS93NJZjL@xhacker>
 <CAAhSdy3_av5H-V_d5ynwgfeZYsCnCSd5pFSEKCzDSDBbD+pGLA@mail.gmail.com>
 <YoKIv2ATRdQfYbBf@xhacker>
 <CAK9=C2VJ-+bu20+QOfKrq6cEBE93Yi21U=zU9AKOSQi1GGHWiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2VJ-+bu20+QOfKrq6cEBE93Yi21U=zU9AKOSQi1GGHWiA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_094244_218114_A034941E 
X-CRM114-Status: GOOD (  16.11  )
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

On Tue, May 17, 2022 at 09:31:50AM +0530, Anup Patel wrote:
> On Mon, May 16, 2022 at 11:02 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
...
> > Currently, RISCV_ISA_EXT_MAX equals to 64 while the base ID is 26.
> > In those 26 base IDs, only F/D and V need static key, it means
> > we waste at least 24 static keys.
> 
> If you want to save space of unused static keys then there are other
> ways.
> 
> For example, you can create a small static key array which has
> many-to-one relation with the ISA extension numbers. For ISA extension

"any problem in computer science can be solved with another layer of
indirection" ;)
I see your points, thanks very much! But I think the array should
be a static inline function to make use of compiler optimization to
avoid the array references for performance. And the static key check
maybe used in modules, I want to export less vars.
I'm cooking the patches, will send out for review soon.

> which are always ON or always OFF, we can use fixed FALSE and
> TRUE keys. Something like below.
> 
> enum riscv_isa_ext_key {
>     RISCV_ISA_EXT_KEY_FALSE = 0,
>     RISCV_ISA_EXT_KEY_TRUE,
>     RISCV_ISA_EXT_KEY_FLOAD, /* For 'F' and 'D' */
>     RISCV_ISA_EXT_KEY_VECTOR, /* For all vector extensions */
>     RISCV_ISA_EXT_KEY_SVINVAL,
>     RISCV_ISA_EXT_KEY_SSCOFPMT,
>     RISCV_ISA_EXT_KEY_MAX,
> };
> 
> extern unsigned char __riscv_isa_ext_id2key[RISCV_ISA_EXT_ID_MAX];
> extern struct static_key_false __riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
> 
> static __always_inline bool __riscv_isa_extension_keycheck(unsigned int ext)
> {
>     if (RISCV_ISA_EXT_ID_MAX <= ext)
>         return false;
>     return static_branch_unlikely(&__riscv_isa_ext_keys[__riscv_isa_ext_id2key[ext]]);
> }
> #define riscv_isa_extension_keycheck(ext)    \
>     __riscv_isa_extension_keycheck(RISCV_ISA_EXT_##ext)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
