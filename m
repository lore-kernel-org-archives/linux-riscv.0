Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045AFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1lYSrwlu8QPnz5A2iGa9ko/wvgauwWRVNAJ6G2cLXk=; b=47v3ZTq0AvMvNv
	TK6sPA7RmRw37NDI615Ivby8xB0j178Zv9IA0PG2xpc9Qeno3wUhngoYSYpteaYlkS+GKKvqJM1jc
	7Di9eFiL47mC3MAZEO1413T6gIyc0D++3CAJN+45mFdSdwclV0lwKps/K7w/HetOS9rRCgNwQl/6Y
	O881GY5TmcTvJwh4j4TAr5VnufPtVF+OwOG8GzdX34N+CIiWrTCwI7UQfihkINWzTet9zUoGum3ZQ
	Iv88GXfgvWvYOcZIyimEfN2YQSIGwwyE/YSLe31qkNqVa9vLY8hwikej7DtTMscjv13Zlz9GXPm1b
	cPKVoOxYGeGltqg1UwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngt8C-005uSZ-0Z; Tue, 19 Apr 2022 19:03:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngt5Y-005t0c-7x; Tue, 19 Apr 2022 19:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D85E8B81866;
 Tue, 19 Apr 2022 19:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC8CC385AD;
 Tue, 19 Apr 2022 19:00:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VPxIfagV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650394828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8yac2TcoM0oB2N8o8RD8oOMSu6h8CMOQ/2gSGccCdo=;
 b=VPxIfagVX8jVXSQ2FJMbGH5bYX0Dgbp60w5dZ+EWZrKhmlk1trnXLmtjaZDzkG0N6SZWmD
 SqzuwKuF2a96BSk5omJHyx/UggkD1KgSukR30bgCsbchTnEVm2EbpiHRZIz+Ns52EjKYEJ
 VbyfuroTLWLnVjOallKTUkLNMqhorZc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ec1024e4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Apr 2022 19:00:28 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 i3-20020a056830010300b00605468119c3so6086238otp.11; 
 Tue, 19 Apr 2022 12:00:28 -0700 (PDT)
X-Gm-Message-State: AOAM532qRQGHBVEp5ArqAZuUO0MjHFA9DjyHsrP0TcItqhPu8LeJAW61
 3QXFS8HOK0DYCY+oxc/MzmW1+E1VPRnpvyzBtmc=
X-Google-Smtp-Source: ABdhPJwRc+bdyLezDAgNgTxENBqQkZz9Fe0qv2Ndkg8iOqE2wh+a0hjP/G2ABFOAPTKw6cDikwVfRb4lj/Ti4WdfWac=
X-Received: by 2002:a81:6a84:0:b0:2ec:c59:9d22 with SMTP id
 f126-20020a816a84000000b002ec0c599d22mr17880030ywc.499.1650394817507; Tue, 19
 Apr 2022 12:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-8-Jason@zx2c4.com>
 <Yl78gLLcSb3EHv0B@zn.tnic>
 <CAHmME9q03Je-ROzzHCgZC0vy1n=y8bsGBOAs8U_K_r3ebLNHbw@mail.gmail.com>
 <Yl8GhNjwPLNiUfSZ@zn.tnic>
In-Reply-To: <Yl8GhNjwPLNiUfSZ@zn.tnic>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Apr 2022 21:00:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9q1wD7EBQPBaR1mBu5ZN+fSpe8yPMWTd7H20+sYEzy8cw@mail.gmail.com>
Message-ID: <CAHmME9q1wD7EBQPBaR1mBu5ZN+fSpe8yPMWTd7H20+sYEzy8cw@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] x86: use fallback for random_get_entropy()
 instead of zero
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
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
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_120036_614831_09309255 
X-CRM114-Status: GOOD (  18.19  )
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

Hi Borislav,

On Tue, Apr 19, 2022 at 8:59 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Apr 19, 2022 at 08:38:41PM +0200, Jason A. Donenfeld wrote:
> > I think I prefer doing (a), and leaving (b) for another time when you
> > or another x86 maintainer can do so. But I'll do whichever you say.
> > Which would you like?
>
> We are switching all feature checks to cpu_feature_enabled() so you
> might as well do the new preferred way of checking when adding a
> new function and so that we have one less place to touch. Which is
> appreciated. :)

Okay, no problem. I'll make the change there and get_cycles() for v+1
of the patchset.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
