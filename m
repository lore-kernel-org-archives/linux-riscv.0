Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE379C9EC8D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbBw2AHD6RrMkrc0NUT9Nv4WIz7gqANGlkwRzLeNYt0=; b=arczlDeezLGykX
	p0vJDHdAWpSigZS629WUPdmxSbrxc0CBckhWzOeJYolicKhF8CpnE/PlxsKOe+T/MtMDHTf3xrnUU
	KAY3BhO6JFo5TazZynJbBu7NfwYxGhQokfJVtVsAUUXREbgQ9SHbji076g9FuOBZ/BsbVfXd/7kL9
	7tb8U0dOBFVtJUgNVRG65AvjBP88HQaIYc5FrZ3vikhrKOBIPXwPYiNi+uySVrXVKI+Cw06hI52hH
	tP886aRytUZUqDjFdu7JNwhm7T3cNqjEJIsKMQmEKOR2e+nj27rdqxjpuQgZhlBu3NJyyfrtdFR20
	Qngk+OY3Pc5u3R9rdWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfI5q-00000005Q9K-394K;
	Mon, 12 Jan 2026 13:36:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfI5o-00000005Q8L-3Uxp
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 13:36:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so3025067f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224982; x=1768829782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=TsZan0AfKoP9fouLSi3y3hRgnc8Y/vjEK4Iv80aVF9RPIhxxmQr+gzZjiYCy3eLrts
         IM849ZfGK/VDK6TXpb78ZCx/zeDe9ohlzePK0upJWZ/GQclCwpKry3leoBj3omcOosE0
         94wOL/ZOXcVadBH3Ub4Nbxbl1p5236wvwOeSBeC4EhCKYL1qAXe01F22GSI4c5Dj5jfS
         4qmQvgcl2VL91vXrbDq9kFEr+UdUZqMUQxpxUAlBzRxnwXiuoyyhkOZ3rrZUCg41XCwA
         tgkF+t4UuKuUCTDvOGSSWsQrBRppZ+6cJZ3EQM13eYOXxj4ncsDgsfZpslfk5wrrhXGR
         78OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224982; x=1768829782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=f4Jije6i/LwhAOJVlOZBZhnFgEXZT7Hy1PpY/VD0s+4X23x7WcZFeSSSXZp1nmOvtu
         8DOLewRb7caFkVEdVDJadDeWGTmVg+hHcZLlSK0xIDfHeNWNPQ0bTI09c0bDRelT7RpZ
         3GcOIjN/YwPFCSnM/PVKwUugMp3DOz6NhINBGPMhwiFI2zFPg8T+KOsXb6JaMe/7vbz6
         a0ClkGnNXBQCFjwHkZpsm/tvTDVgGZeh6v67qbiFl9nUV0InpBMsqbR8hK0SGp3mQ9ri
         grMQ8jkWk2zQo9vNlXKXaa1TskTSN+oiESloelaiQg1MAG9R56YnxI1B7vuFPY87rfDb
         S1NA==
X-Forwarded-Encrypted: i=1; AJvYcCXCZ2gTKnxxdin9ZxH815PYNs7jht/+S48i7bGrSpq5S9b96Fgojdi+zSC3H+ecxP/Qcc6Q2HhZpkAnZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhUAmRUjTgCU75+zlBeI9z6wIfpasxPHzCoJadO8vcXffjUedp
	xBjBTky/K9I/ENhhVj/HnerSStYy8COOkToGTx4/yK7qmPN1vkHFxPCD
X-Gm-Gg: AY/fxX6qJTEl1SHpxCtYPBl+vlXI9/LzwqpQkK8H8O5bAAtycwQ7MXRSDFINm576MfN
	jCyval4fZT0R3cCATzFeZObGyA/tNDRAkPX0bIck1/hxVgEY0HFLo3Dw9Wv6jFy0Q3ZnJQXDZkF
	mwqzD9f4uVP4w/6g0wjzghzBk5K7FjP+vDzfysjpU1YAPAZqGPhWLoYjeXHN7gG9AQMyY8WNeZe
	GCx6VK5VN/+zyd6FZYg+bNvUGI4ebrxsk6J4b1FzVgk7QEBx245AU4xFJe77PJ2O71GnhhOhSOS
	KHa4VUWKZZmOskSH9XYKcuT3FVSqOV5IZDRPcL1pB6qLoJYLSKoVVBKCxHBjb1YcCBEmGxy2uSE
	IhqAZ7Kh1HTz0/57tJd43a1JKWnfLyb3r0Pu5oC15XKzav+zvIOGa0FS96zkunY5bqG65bOfD6W
	aG6VUuIDVqk2PbBfYUbeRN36zRAnlKNP+mUxqy3H0il4LCTPwR8tse
X-Google-Smtp-Source: AGHT+IGyxiv2XFt49Pj+G/FCKb6Do+/qO1fvIxMUjWKWGTcpTcAtASoZtqcJMaJZUWyMrmC4TwCROg==
X-Received: by 2002:a05:6000:40c9:b0:430:fafd:f1d2 with SMTP id ffacd0b85a97d-432c3628374mr22009793f8f.11.1768224982426;
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm41054434f8f.24.2026.01.12.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Date: Mon, 12 Jan 2026 13:36:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260112133620.2863e1d6@pumpkin>
In-Reply-To: <09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
	<20260107140533.2b3c46a1@pumpkin>
	<09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_053624_897026_B636D018 
X-CRM114-Status: GOOD (  33.85  )
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

On Mon, 12 Jan 2026 12:26:26 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 07/01/2026 14:05, David Laight wrote:
> > On Sun, 4 Jan 2026 23:01:36 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
...
> > I've trimmed the initialiser - it is very boring.
> > The code to create the initialiser is actually slightly smaller than it is.
> > Doable by hand provided you can do 128bit shift and xor without making
> > any mistakes.
> > 
> > I've just done a quick search through the kernel sources and haven't found
> > many uses of prandom_u32_state() outside of test code.
> > There is sched_rng() which uses a per-cpu rng to throw a 1024 sized die.
> > bpf also has a per-cpu one for 'unprivileged user space'.
> > net/sched/sch_netem.c seems to use one - mostly for packet loss generation.
> > 
> > Since the randomize_kstack code is now using a per-task rng (initialised
> > by clone?) that could be used instead of all the others provided they
> > are run when 'current' is valid.
> > 
> > But the existing prandom_u32_state() needs a big health warning that
> > four outputs leak the entire state.
> > That is fixable by changing the last line to:
> >         return state->s1 + state->s2 + state->s3 + state->s4;
> > That only affects the output value, the period is unchanged.  
> 
> Hi David,
> 
> This all seems interesting, but I'm not clear that it is a blocker for this
> series. As I keep saying, we only use 6 bits for offset randmization so it is
> trival to brute force, regardless of how easy it is to recover the prng state.
> 
> Perhaps we can decouple these 2 things and make them independent:
> 
>  - this series, which is motivated by speeding up syscalls on arm64; given 6
>    bits is not hard to brute force, spending a lot of cycles calculating those
>    bits is unjustified.
> 
>  - Your observation that that the current prng could be improved to make
>    recoving it's state harder.
> 
> What do you think?

They are separate.
I should have a 'mostly written' patch series for prandom_u32_state().

If you unconditionally add a per-task prng there are a few places that could
use it instead of a per-cpu one.
It could be 'perturbed' during task switch - eg by:
	s->s1 = (s->s1 ^ something) | 2;
(The 2 stops the new value being 0 or 1, losing 1 bit wont be significant.)

This one is much nearer 'ready' and has an obvious impact.

	David

> 
> Thanks,
> Ryan
> 
> 
> > 
> > 	David
> > 
> >   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
