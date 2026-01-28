Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69DD46BEE
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 18:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaU6ldxnxv0HdauWa+CvmGAugSQonCOWZnngCu/I4kw=; b=qnwUTM47DfHU7E
	IThJMOJQ1DG+RjR7za4rjQLMDzZ0HBu7fEO+JMEOWQwkHXgN/tOQKYz43WgaFnTqIHoigxK4nl7UO
	Nm7VStCoJ5wlQHhBFz2mJ/ShCg/hUKYW1CuJXZtQImcs0l3Lxf1UgWFPjrFWlQEgx54utFJSjEa4t
	wxhk9KemmOPxwdAaRgb/elFFTN0lpP6iLg3zJg6tRpcMBpi/72+G8iopylkRoXiTYZsL54F/FBfWG
	GIWojDGCbx50CXQ+htngCwi06VG/HtiY3P6m2EVTqUORZmB4unJVtgOufwlS384IuEGe+hZbWBKbE
	3kARKuYYpzvnGL8OWbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlALc-0000000GcgS-2VNf;
	Wed, 28 Jan 2026 18:33:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlALZ-0000000Gcfi-014f
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 18:32:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4359108fd24so115583f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769625174; x=1770229974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfg6UdscjkpEoTOhSlRT2LAj46aYr5XBfZJkEddMCkI=;
        b=goJPWIojQglFciBmSOJRNxUafZpMQ8ZsES47xNHDaDv5qhCa8hJRtRAKmU2TPQUUjt
         VT+55UvVE8D3LODEnQYOvQdk8ysUZ6KyVWlR5ACQmXh9qBMiqr5NMLKfiFYNB4xBslbt
         hOfxl3cjJf9WNOwfmm9UFJ/QVrpnopLK3BAQlNj33Q+mSaO5wLZh43bc9ZPIiNClNZYJ
         FgLsKQSRFRzjPAmBnCbnTtIsmuQuhqp6oBA5Q9iIYZai0um5eqbHG6A3mtn3BOKe2gFa
         t3ucW1Y5Z0eIEtX4aP6pAqZAgBvNF7Ve4rf+cvwLmmHOoWqeca4Y77YKJ3V+EIIGu5D1
         NxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769625174; x=1770229974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kfg6UdscjkpEoTOhSlRT2LAj46aYr5XBfZJkEddMCkI=;
        b=SPnnbflCKbNESsUtMWgsYmOZsl/i6wFJbZ+7Ls9tUBCJ+0KPGrM7/UxOqo5KEZD5R9
         5zi0U1HxMEez/4b95fbmHn0akiS+xX2fWdsZvoM843Dmb2p/BGAAkpsUM1ZSTfvCuYfO
         4MKJCsFivrfxxDKt1yHUWnL0cu3gqunuGPtobzbpgbf0QthD3x1NH4Q+YNfbfSQyh5Fy
         LUUvWHZsEXQtO7NAACmv7JmR/ueyVSitehbvIyL9BOCsr7ETZNM0uLyzJ+AYwkhSmn1O
         NceqNAqHSWvUMPQFZ4sB2LMJgeDSV2dTgJ9k4DZ2bL5CsVH2P7yukdNRPK2s2814Zprz
         9v+w==
X-Forwarded-Encrypted: i=1; AJvYcCXkPlsj9thanMrBy7h+/e0BsFvD0uDMrbiPYAR853naJFd34vgtlpSNAFAijESWvfXTDbgsGsrdM9dgWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyATTj20V9W95JbxVV4qaNrchXs6QgLAqVNFjGyjcVlel9Y2kdS
	dnnMLII/XIoVzc+hWMCNIhHwTSh0qHDZWh09g4xnEHNQ8DGhHpYSmcT0
X-Gm-Gg: AZuq6aL33UtobToY+BP8i2sPXMRxr9wf4R05Ylh+7yG0wRnef5mwad2EoMS/6I/Y5p2
	WLKureSZQ5jPogu5yZ74Dqkp4MWr2aa6UfEIE4mLAt/dXvaXee2G+Q7ZJon6RaCb+f7UzA4IUwk
	ogxZbRgmHxontcJbxTKvZmd4pu76OHP1AA8tldbmxUg4MyfHbiZURSLi9aio07tNBULJat981Cj
	BxECG+AZw0kLEPm2Oxudp/YF7zKgzIeBiX4mkVLoY6j+AqNxxKPDBzuV9z0kk10bCeXd5i43rUq
	bJxd9LzpSPOn8BVpAHBsbqw1RUFqKCBOqIaux+IrW6ny90fTEmodbtg47xhNYoNvkuSyyEGndo8
	BPlLLgash+81QrdVNHcwn2g+7DpXUym6K+rNW/xULWdNjyyXfC9L2IL/GoJWWxw2Ey08CBOJ0Kr
	beF8Cd3LM0CK3oaqHL9nXlsArBIEXv7qC3X+pyR02VcwYVZElbnoPe
X-Received: by 2002:a05:6000:3113:b0:435:9241:37c2 with SMTP id ffacd0b85a97d-435dd01e23fmr8152542f8f.9.1769625174058;
        Wed, 28 Jan 2026 10:32:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm9165906f8f.26.2026.01.28.10.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:32:53 -0800 (PST)
Date: Wed, 28 Jan 2026 18:32:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 2/3] prandom: Add __always_inline version of
 prandom_u32_state()
Message-ID: <20260128183251.7177c345@pumpkin>
In-Reply-To: <670c2b78-02e2-4617-80d9-3c896077f02a@arm.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20260119130122.1283821-3-ryan.roberts@arm.com>
	<aXpArjZ1QQowshnA@zx2c4.com>
	<670c2b78-02e2-4617-80d9-3c896077f02a@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_103257_083267_3E12ABD6 
X-CRM114-Status: GOOD (  30.96  )
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

On Wed, 28 Jan 2026 17:33:19 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 28/01/2026 17:00, Jason A. Donenfeld wrote:
> > On Mon, Jan 19, 2026 at 01:01:09PM +0000, Ryan Roberts wrote:  
> >> We will shortly use prandom_u32_state() to implement kstack offset
> >> randomization and some arches need to call it from non-instrumentable
> >> context. So let's implement prandom_u32_state() as an out-of-line
> >> wrapper around a new __always_inline prandom_u32_state_inline(). kstack
> >> offset randomization will use this new version.
> >>
> >> Acked-by: Mark Rutland <mark.rutland@arm.com>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> ---
> >>  include/linux/prandom.h | 20 ++++++++++++++++++++
> >>  lib/random32.c          |  8 +-------
> >>  2 files changed, 21 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
> >> index ff7dcc3fa105..801188680a29 100644
> >> --- a/include/linux/prandom.h
> >> +++ b/include/linux/prandom.h
> >> @@ -17,6 +17,26 @@ struct rnd_state {
> >>  	__u32 s1, s2, s3, s4;
> >>  };
> >>  
> >> +/**
> >> + * prandom_u32_state_inline - seeded pseudo-random number generator.
> >> + * @state: pointer to state structure holding seeded state.
> >> + *
> >> + * This is used for pseudo-randomness with no outside seeding.
> >> + * For more random results, use get_random_u32().
> >> + * For use only where the out-of-line version, prandom_u32_state(), cannot be
> >> + * used (e.g. noinstr code).

If you are going to respin:
		(e.g. noinst or performance critical code).

	David

> >> + */
> >> +static __always_inline u32 prandom_u32_state_inline(struct rnd_state *state)  
> > 
> > This is pretty bikesheddy and I'm not really entirely convinced that my
> > intuition is correct here, but I thought I should at least ask. Do you
> > think this would be better called __prandom_u32_state(), where the "__"
> > is kind of a, "don't use this directly unless you know what you're doing
> > because it's sort of internal"? It seems like either we make this inline
> > for everybody, or if there's a good reason for having most users use the
> > non-inline version, then we should be careful that new users don't use
> > the inline version. I was thinking the __ would help with that.  
> 
> I'm certainly happy to do that, if that's your preference. I have to respin this
> anyway, given the noinstr issue.
> 
> > 
> > Jason  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
