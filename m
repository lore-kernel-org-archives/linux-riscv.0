Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3991C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 22:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NdA3tFGw/KrKcXYosgmtGQsnCM/zqt/oElFg3cuHz8=; b=AclMbWrDxFCbLo
	TXSGVMITAEyy5pg56/Af5NtBLgIvkeG0sgvxR7ouxN98JOmlDqQWnO32hku19nbsDrUve1bTX594W
	jZyArm+1qYrbA17ZoIhuXen32Pl1jlhnBieIFLVMPnBaeUbmP0GWWZJOTxPdoOJQ7LugY9JziQqIr
	+s0bvSidV1E+VhZWOyPWVbkAzP+YvN8TyVHRL3nPN67hmFfRLgEUK8n4Q7UcS5yKobq1Y8DDble5Q
	+YpzgCYgdnIT5RM1m6kamcQjgaVYgdD5YzwcDToygH1ML+oIQzONX3aMu48hs12hqJkN3IL/7mJwP
	O1262y6H9hX4IdyzhL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nele9-002yA3-BU; Wed, 13 Apr 2022 22:39:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neldv-002y5H-Ed; Wed, 13 Apr 2022 22:39:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E58A2CE2160;
 Wed, 13 Apr 2022 22:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F21C385A6;
 Wed, 13 Apr 2022 22:39:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="A4OcutCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649889552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EXr0AZpcPcnbl6qsjtJM2/w/Togs9os9zG2LD36s86Y=;
 b=A4OcutCARta+p7eWzod5lNhQSi3kXd6bvC6QeMGVDMJimFl3Lu/EMO8YPSjU+3TUj0Rqwe
 bjwyNKtCHUoJeSjJurLNnAa62rLGxSGmfzrE2Zmb5b+aig4ebINo5LNqGMtRWZoFwz0VZr
 pZDjE0jmwQyM1/6zIg+jAinjD2gFeXU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9e43385
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 13 Apr 2022 22:39:12 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id a14so1106012uan.9;
 Wed, 13 Apr 2022 15:39:12 -0700 (PDT)
X-Gm-Message-State: AOAM533zMT1L12zU98UuNBSVPK+KtDoekJ4sKvtZnhQXGdemaWfyIdJh
 2MNHbRWRExER66lMoGfNAfZB6VFmsAJ4nqQKGcs=
X-Google-Smtp-Source: ABdhPJxXSf7GaLqdLU3LGxvJFMW4JvQbew20C3o4QQN4FpKqfaroqjsmiNxIHcc1vWzN4Jl4A9L3Loy9Cv7VCY2OIqY=
X-Received: by 2002:a81:6a84:0:b0:2ec:c59:9d22 with SMTP id
 f126-20020a816a84000000b002ec0c599d22mr1034376ywc.499.1649889540445; Wed, 13
 Apr 2022 15:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-2-Jason@zx2c4.com>
 <CAL_JsqJYq5Oe_zBbcwYNMpfpqGLGCyaSfGqOrPjZ_Pj=nF73mA@mail.gmail.com>
In-Reply-To: <CAL_JsqJYq5Oe_zBbcwYNMpfpqGLGCyaSfGqOrPjZ_Pj=nF73mA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Apr 2022 00:38:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9pn++c0qHzq39YWyXogcKRbn2XK=yA3kFqch0wH7qPcAg@mail.gmail.com>
Message-ID: <CAHmME9pn++c0qHzq39YWyXogcKRbn2XK=yA3kFqch0wH7qPcAg@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] timekeeping: add raw clock fallback for
 random_get_entropy()
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_153919_874169_14D74581 
X-CRM114-Status: GOOD (  17.00  )
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

Hi Rob,

On Wed, Apr 13, 2022 at 4:32 PM Rob Herring <robh@kernel.org> wrote:
> 'does not have a usable get_cycles(), ...' as clearly some arches have
> get_cycles() and yet still need a fallback.
>
> Why not handle the 'if get_cycles() returns 0 do the fallback' within
> a weak random_get_entropy() function? Then more arches don't need any
> random_get_entropy() implementation.

No, this doesn't really work. Actually, most archs don't need a
random_get_entropy() function, because it exists in asm-generic doing
the thing we want. So that's taken care of. But weak functions as you
suggested would be quite suboptimal, because on, e.g. x86, what we
have now gets inlined into a single rdtsc instruction. Also, the
relation between get_cycles() and random_get_entropy() doesn't always
hold; some archs may not have a working get_cycles() function but do
have a path for a random_get_entropy(). Etc, etc. So I'm pretty sure
that this commit is really the most simple and optimal thing to do. I
really don't want to go the weak functions route.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
