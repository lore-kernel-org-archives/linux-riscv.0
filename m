Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB22C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 22:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRaRbWOpWZt3T6KizRmfI6deA0v8DFlLMLdRGcTCL0c=; b=BKgACQNuqmFMjD
	gLbx0DYGCnx0ceMU/d+u7TuuzLRDLz1WPcIXVNx9U8jPkHKiTPdXXbR7JeqecJI2HV1MnOWTLCWPU
	808zmd9lR6467bc+IrdDY0hwznILKrJ27oq3Dx8iwWZv5cNEXvK/fMCvQFT0if7CDqFjQHq0CVQSG
	gs8HIXTT6+w+Xoy5c1Ldsq66Rknq6yTHGrs7j57UxtTfBiABfsuc2P9481cARSw+8ng8klr3ZK0Br
	QdNWxUHGBDzS6to8lMoabkrfKKx16KAlLr7fvAVrA4KIRp9QN+DHSqHMQZP/rmiyitRXAI+94nVxs
	sg9FkP08qF86sHergr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nelfa-002yji-64; Wed, 13 Apr 2022 22:41:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nelfO-002yga-2y; Wed, 13 Apr 2022 22:40:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5044261FAC;
 Wed, 13 Apr 2022 22:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48687C385A8;
 Wed, 13 Apr 2022 22:40:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gLfD4SyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649889643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sy2u2tLdcOJ2AL1/09I7fdj8Xfid/ZIpX9etCksgmJY=;
 b=gLfD4SyOBlaRMghjP8s6vE0YjHMjqX5JKfITB7+3KBvzoHrPKejA5P2Pn3WbWaXDkhAkj8
 qHkNkU8zylAK2HmZ6CCG+LHB/EchZwxg1qgjkkGzxD5tnJBVaSe+Pu9i8w0hg3OwaQbALZ
 YLM7ywdAvSxSfoE/qNnJGBvo/Dd0krU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d592374a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 13 Apr 2022 22:40:43 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id j2so6438714ybu.0;
 Wed, 13 Apr 2022 15:40:42 -0700 (PDT)
X-Gm-Message-State: AOAM530M6bbY2Il6iJZMeOVd0l/bNn/OM5aCQi9RpUpPWKpSAK/77RZU
 y43dWoazi8aecsPZDFDCHtIl/Deqc3Mw1ipjAAU=
X-Google-Smtp-Source: ABdhPJx9INm5zW7sTrV4774xD6IRq7PzslZw6I75g3UsN7iIIGechqL3/0SrrUeqYX9XZja0QUvWBULi93OT13Yuj6E=
X-Received: by 2002:a5b:6cf:0:b0:61e:1371:3cda with SMTP id
 r15-20020a5b06cf000000b0061e13713cdamr955062ybq.235.1649889630599; Wed, 13
 Apr 2022 15:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-4-Jason@zx2c4.com>
 <CAL_JsqJ86vZKZQO+9_Kva-EbZrRPMbcgDm+UvjJdnR=GL-qHSw@mail.gmail.com>
In-Reply-To: <CAL_JsqJ86vZKZQO+9_Kva-EbZrRPMbcgDm+UvjJdnR=GL-qHSw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Apr 2022 00:40:19 +0200
X-Gmail-Original-Message-ID: <CAHmME9qGzW1+dWLvObjQ4ofGcCU1tOwTB+qJTVs2ufEmAEhbrA@mail.gmail.com>
Message-ID: <CAHmME9qGzW1+dWLvObjQ4ofGcCU1tOwTB+qJTVs2ufEmAEhbrA@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] riscv: use fallback for random_get_entropy()
 instead of zero
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
X-CRM114-CacheID: sfid-20220413_154050_254994_46F8B3DE 
X-CRM114-Status: GOOD (  13.04  )
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

On Wed, Apr 13, 2022 at 4:40 PM Rob Herring <robh@kernel.org> wrote:
> Moving this check to get_cycles() implementation would eliminate the
> RiscV implementation of random_get_entropy() if you follow my other
> suggestion.

Not an option. random_get_entropy() != get_cycles(). Sometimes these
are different functions. Returning random_get_entropy_fallback() from
get_cycles(), for example, wouldn't make any sense.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
