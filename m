Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABE9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 20:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nr04Ng5hTiZHIQJuitsL0wYzSLzjsOO32YzjyFaxxhA=; b=q5sNfpEn/ja8nu
	R8fUnlcPdERtnN2qokjelXiO0+lr/Apsa1Y8yICVmrFkAdfPiQxs1Xf75anPERdQTFXQJjUQLNk1O
	ys6n5ClZ0/JjnEeND3rCFf39PV6Kzvq4jG8OD6RK4tmgfP5lebwtkeqcGUEmjAoFmaFYu7GLdmDPB
	h+szMvwQJrSAXVHaqEmB5fDihHyHBhDz2dtZtmL80ulrNDBMoq5QoNsE2UIpmPGbpsKTVDm5Dg10F
	bphfR2eTKr3Yh4jAOBZAi4SmYYmbcjXVfyoBw9qI+rA7GsP4PUAymiglVyv8exeSBLYd7rRJiwrVG
	Mskjr8pwp+DQk6+QdNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf6Hs-007Ecc-Ef; Thu, 14 Apr 2022 20:41:56 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf6Hg-007EZ6-Sb; Thu, 14 Apr 2022 20:41:46 +0000
Received: by mail-oi1-f181.google.com with SMTP id b188so6630578oia.13;
 Thu, 14 Apr 2022 13:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kQ16bevC74v8j9hP5RJfq+tF3CIcALFbt9dd1uaIG9E=;
 b=MpV78W6o464us4l0BUMz5MsH+yDykrTHNSmFdb0dOGeANy6D0T18LtQx2fboG1q/d8
 6UtzZ4htnCrHk4ylWzuwpDSCskj7LhWMgU7Fydx9wdR3q2aSIByAfoeqixkQU+RB14pV
 DvRtDpvsZHMCQBPXvoW0feSLyAgc2TvBepsA2oInz5N6LaQc/5MJZ1hK8P9ozBPwvkVX
 RyIW1CiOGJG5EeCrjHlrsbWKie9hZ76Wc00+V5K6miJKcauWb+uyCnfPxbD4OvWNNO5K
 kTwHnLAr/KW1DYGHSW3JFf6Kg+JJbUxPr1cSEniH+hQGiTZyUAawNY4P3mGuan6FlSF+
 Z45g==
X-Gm-Message-State: AOAM530MeRC9qG/6EteeOl1xZ0I5w9n55FQUnt12qKSnq1Uf2gjVTUwq
 h4JQsHkokKT+UBiTgWDAUQ==
X-Google-Smtp-Source: ABdhPJwC/Cf4MTxpznrthxydqEHpaVveVGXAK2ei0no2VM/vDG7BZn3PRSgiAWYQ1YAehWtlLvX6JQ==
X-Received: by 2002:a05:6808:1a1c:b0:2fa:6c17:5c07 with SMTP id
 bk28-20020a0568081a1c00b002fa6c175c07mr210417oib.80.1649968900860; 
 Thu, 14 Apr 2022 13:41:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 lw19-20020a0568708e1300b000e2f7602666sm1038088oab.15.2022.04.14.13.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 13:41:40 -0700 (PDT)
Received: (nullmailer pid 2666253 invoked by uid 1000);
 Thu, 14 Apr 2022 20:41:38 -0000
Date: Thu, 14 Apr 2022 15:41:38 -0500
From: Rob Herring <robh@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Subject: Re: [PATCH v4 01/11] timekeeping: add raw clock fallback for
 random_get_entropy()
Message-ID: <YliHAl0XpQ57FSGy@robh.at.kernel.org>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-2-Jason@zx2c4.com>
 <CAL_JsqJYq5Oe_zBbcwYNMpfpqGLGCyaSfGqOrPjZ_Pj=nF73mA@mail.gmail.com>
 <CAHmME9pn++c0qHzq39YWyXogcKRbn2XK=yA3kFqch0wH7qPcAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9pn++c0qHzq39YWyXogcKRbn2XK=yA3kFqch0wH7qPcAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_134144_959871_C649B197 
X-CRM114-Status: GOOD (  21.13  )
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

On Thu, Apr 14, 2022 at 12:38:49AM +0200, Jason A. Donenfeld wrote:
> Hi Rob,
> 
> On Wed, Apr 13, 2022 at 4:32 PM Rob Herring <robh@kernel.org> wrote:
> > 'does not have a usable get_cycles(), ...' as clearly some arches have
> > get_cycles() and yet still need a fallback.
> >
> > Why not handle the 'if get_cycles() returns 0 do the fallback' within
> > a weak random_get_entropy() function? Then more arches don't need any
> > random_get_entropy() implementation.
> 
> No, this doesn't really work. Actually, most archs don't need a
> random_get_entropy() function, because it exists in asm-generic doing
> the thing we want. So that's taken care of. But weak functions as you
> suggested would be quite suboptimal, because on, e.g. x86, what we
> have now gets inlined into a single rdtsc instruction. Also, the
> relation between get_cycles() and random_get_entropy() doesn't always
> hold; some archs may not have a working get_cycles() function but do
> have a path for a random_get_entropy(). Etc, etc. So I'm pretty sure
> that this commit is really the most simple and optimal thing to do. I
> really don't want to go the weak functions route.

Is random_get_entropy() a hot path?


It doesn't have to be a weak function, but look at it this way. We have 
the following possibilities for what random_get_entropy() does:

- get_cycles()
- get_cycles() but returns 0 sometimes
- returns 0
- something else

You're handling the 3rd case.

For the 2nd case, that's riscv, arm, nios2, and x86. That's not a lot, 
but is 2 or 3 of the most widely used architectures. Is it really too 
much to ask to support the 2nd case in the generic code/header?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
