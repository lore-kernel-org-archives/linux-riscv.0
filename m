Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBE6C54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GUz1wBamHXoJ9Xtb1BL01WN3/AAqIuOqPWXF5+CoYTQ=; b=MvsCKzh+BdtnaM5QO/7L1kxaEY
	f9Z79lprJWFsZzY9tszIJs8AGjmmrlkyJ5HuwBdYk5YxpnSwnwEeZ70b80fyyh3tiIuM53zF5whNp
	v0zJVlwAO0HstdHkRwwj94vkzMUHKYKVdkU/wXJtOSPQvKQ+d48b9ByY6wCMLWCTLPOPjTzOpsbhK
	Oy/geb3F46Nzt80Pg/ewunDOV2wBGWxQt6gHVagU2XSFQcfnCzPJSuoB8ON3t7YT9MU6pFP6OHmkj
	aMp/S7QuNMphxR1wYwVhSwNsSzudamD4ZP9oHDGvdhnO6qU7jyu9xkWHAb+iXzVOgLNK4zxZqMoId
	TA2/KyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riaNV-00000009KAR-1L84;
	Fri, 08 Mar 2024 13:35:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riaNR-00000009K9V-3R14
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 13:35:11 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6D61F4112B
	for <linux-riscv@lists.infradead.org>; Fri,  8 Mar 2024 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1709904906;
	bh=KfFTaYyXhA0LmPtbUGAWhlL1dAhtAs2GiC0vdA6Ii4k=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Ci5TbygRVz9bqLMCHO6UanZTU+MYD3PswDmMZ6+2OYZUs3d/P+AwXdMZTjw1+jiT3
	 ufSeSn7gAaEFPZw8+UJ1wNNTTtjQ2BR+k5/gI51OXkFZOmq9+J42AdzbcPvJgIcGpU
	 c5gV2nqpl+Qp/u/iUvuA2/NkpqEg+lkPG50X3BtUNFvR5zD8thkH97hfXqqRtI9DS2
	 zIE+kv1okDkAJytZR80q7kMXF+SC8QN7M3l+DZQ4tso3IuQQvyqzOFkQ8bpmZSjG2v
	 x8ytvCdkQNd034YGJuyhTqfOB4UlplYM6xNoRvVy9DMR6ofkSiUofD6jd9RvW7Ca5f
	 bRn1M5cZsvkvQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42eea8e559fso6602551cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 05:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709904904; x=1710509704;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfFTaYyXhA0LmPtbUGAWhlL1dAhtAs2GiC0vdA6Ii4k=;
        b=BAj+22pTvhrVFrf9SAYGWLqPwC66c8S4bZFROO7/MKdYag2FVGfwPEd/zz/hX6m2Ca
         JTfOk5jUZp6khvHgyhbIecn564dHdi05lHkeFjc5ps335/xeqifdhVICYVvm+U6JLQsJ
         GR2Ik2DzQ2UDfL4/YfsgePZMx6HGqsZw6Kp2F+j2ODjGPSbSMZFZ+/IBZfP+/7nwgWgG
         EQl2ikf1/+sPvIQhbKQC/OYbpvRTycnO9E8URSUku0UCpFlwoBGqROwukqLjw8LNbfEj
         QjYn2+OcD7f6B22OhaeOBnLuDjiRPJB2urIiZBZICAoMNVLxUoIMT03IpPqjfJIQ5KRh
         +l+A==
X-Forwarded-Encrypted: i=1; AJvYcCX93p7NRIIgjpkk3WE1rA6JME1xNZv4R8p+wYUWfY30LyF4Zhuy76OHgKaIy3LGYIjv6jy/5VaebMEEUZfWM4FjkKRcaqzeYyoZLcMTmmF2
X-Gm-Message-State: AOJu0YxHYes7wlzhvg4rtroSCDWGUnf4ioVEbi7cJ5nYM/I1OMwpAsgN
	Y3jKqC88e/MqylHNPpoqLTmrj3diFGGfRbaQTIiVrRMqefFpjIgvqmp2ak4miBiCthL+V+uZKyF
	Nj83AO/AH3vE/vlU7++NYqd64WsC900/vM8sT5TkNr6kT12U0tFlpZlEAki8xOVUHvQ+hhODAMO
	PYzNXyKsTL1xNLMN/EnTKehSR8asWBzonUDetUHwCsrCyXUWByHCBic6iW
X-Received: by 2002:ac8:5792:0:b0:42e:d641:b17c with SMTP id v18-20020ac85792000000b0042ed641b17cmr12663734qta.62.1709904903816;
        Fri, 08 Mar 2024 05:35:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFWPweaTc5T39BhG+37jBadbuOfJ1uLHa+LrhI0fCpfgsFaZBrzlrJv3P3sJsRMiH/4i9DBQ2T5AYcKlGfOrs=
X-Received: by 2002:ac8:5792:0:b0:42e:d641:b17c with SMTP id
 v18-20020ac85792000000b0042ed641b17cmr12663713qta.62.1709904903530; Fri, 08
 Mar 2024 05:35:03 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Mar 2024 05:35:03 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240308-docile-pretense-b44c3a84d8b2@wendy>
References: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
 <20240307-disable_misaligned_probe_config-v8-4-55d696cb398b@rivosinc.com>
 <CAJM55Z9SYA=QMg0Wg-e0Q8nOTP6qSKkc+kxHMGOmmmWrEcVf7w@mail.gmail.com> <20240308-docile-pretense-b44c3a84d8b2@wendy>
Mime-Version: 1.0
Date: Fri, 8 Mar 2024 05:35:03 -0800
Message-ID: <CAJM55Z8EX5D0HZ1xKTkaQEL1RF46DrBynUoTSMP5q8kmDGY_=w@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] riscv: Set unaligned access speed at compile time
To: Conor Dooley <conor.dooley@microchip.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, 
	Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_053510_291043_CC4B646B 
X-CRM114-Status: GOOD (  38.92  )
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

Conor Dooley wrote:
> On Fri, Mar 08, 2024 at 01:52:24AM -0800, Emil Renner Berthing wrote:
> > Charlie Jenkins wrote:
>
> > >  config RISCV_MISALIGNED
> > > -	bool "Support misaligned load/store traps for kernel and userspace"
> > > +	bool
> > >  	select SYSCTL_ARCH_UNALIGN_ALLOW
> > > -	default y
> > >  	help
> > > -	  Say Y here if you want the kernel to embed support for misaligned
> > > -	  load/store for both kernel and userspace. When disable, misaligned
> > > -	  accesses will generate SIGBUS in userspace and panic in kernel.
> > > +	  Embed support for misaligned load/store for both kernel and userspace.
> > > +	  When disabled, misaligned accesses will generate SIGBUS in userspace
> > > +	  and panic in the kernel.
> >
> > Hmm.. this is *may* generate SIGBUS in userspace and panic the kernel. The CPU
> > could support unaligned access natively or there might be a handler in M-mode,
> > right?
>
> Correct. The last sentence could become "When disabled, and there is no
> support in hardware or firmware, unsigned accesses will...". That said,
> this option is no longer user visible, so we could really simplify the
> hell out of this option to just mention that it controls building the
> in-kernel emulator.
>
> > > +choice
> > > +	prompt "Unaligned Accesses Support"
> > > +	default RISCV_PROBE_UNALIGNED_ACCESS
> > > +	help
> > > +	  This determines the level of support for unaligned accesses. This
> > > +	  information is used by the kernel to perform optimizations. It is also
> > > +	  exposed to user space via the hwprobe syscall. The hardware will be
> > > +	  probed at boot by default.
> > > +
> > > +config RISCV_PROBE_UNALIGNED_ACCESS
> > > +	bool "Probe for hardware unaligned access support"
> > > +	select RISCV_MISALIGNED
> > > +	help
> > > +	  During boot, the kernel will run a series of tests to determine the
> > > +	  speed of unaligned accesses. This probing will dynamically determine
> > > +	  the speed of unaligned accesses on the underlying system. If unaligned
> > > +	  memory accesses trap into the kernel as they are not supported by the
> > > +	  system, the kernel will emulate the unaligned accesses to preserve the
> > > +	  UABI.
> > > +
> > > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > > +	bool "Emulate unaligned access where system support is missing"
> > > +	select RISCV_MISALIGNED
> > > +	help
> > > +	  If unaligned memory accesses trap into the kernel as they are not
> > > +	  supported by the system, the kernel will emulate the unaligned
> > > +	  accesses to preserve the UABI. When the underlying system does support
> > > +	  unaligned accesses, the unaligned accesses are assumed to be slow.
> >
> > It's still not quite clear to me when you'd want to choose this over probing
> > above. Assuming the probe measures correctly this can only result in a kernel
> > that behaves the same or slower than with the option above, right?
>
> Aye, mostly the same - some people don't want the boot-time overhead
> of actually running the profiling code, so this option is for them.
> Maybe that's not such a big deal anymore with the improvements to do it
> in parallel, but given how bad performance on some of the systems is
> when firmware does the emulation, it is definitely still noticeable.
> I know we definitely have customers that care about their boot time very
> strongly, so I can imagine they'd be turning this off.

Ah, that makes sense. So maybe a help text more along the lines of "Disable
probing and optimizations for CPUs with fast unaligned memory access" would be
a better description of this choice?

> > > +
> > > +config RISCV_SLOW_UNALIGNED_ACCESS
> > > +	bool "Assume the system supports slow unaligned memory accesses"
> > > +	depends on NONPORTABLE
> > > +	help
> > > +	  Assume that the system supports slow unaligned memory accesses. The
> > > +	  kernel and userspace programs may not be able to run at all on systems
> > > +	  that do not support unaligned memory accesses.
> >
> > Again you're just explicitly saying no to the optimizations the kernel might do
> > if it detects fast unaligned access, only here you'll also crash if they're not
> > handled by the CPU or M-mode. Why would you want that?
> >
> > I'm probably missing something, but the only reason I can think of is if you
> > want build a really small kernel and save the few bytes for the handler and
> > probing code.
>
> Aye, just to allow you to disable the in-kernel emulator. That's
> currently a choice that is presented to people, so this option preserves
> that. IMO this is by far the least useful option and is locked behind
> NONPORTABLE anyway. Maybe we could delete it, and if someone really wants
> it, it would not be all that much of a hassle to add back in the future?

Yeah, if noone really needs this less config options is better, but I don't
feel strongly about this option either way.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
