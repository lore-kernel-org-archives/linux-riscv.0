Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B856BC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 23:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rneb2/qQTV9BXP7vydODL2DoQHz+KTkfVSnBMwfi2Y=; b=owiQts++Um+mz8
	iBRAFOTn94tO7MuHjNNn5uvRoGdm7W9P8KlmRjvfdV2vY+3ik/+GfYwGFbuXcRYzW7FmwbJfoNQaC
	ZAbCOa+xhOr6UbuQa/yt2Yy8tamLab7T3dZ7aWcpbgXQfB/7/viaXnKK61JDUljw6PWeWwd+K2YS5
	6tJUhgZGB4JJkUnpbB8ypuXsTarsXvoodw1yldbzpr/R9CXVIXv42l3iZ+tku0PYd6jcEGFYeHce9
	jnTbGJh87ZeFzLs0wDYjIMHIminlVYBwBM5Ik17KxRy6IR9bhIGdV/c57j1cFfW5rPOIUJAX+j16G
	/VuPAaAzxB20Ms7bzzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfoRe-00000004nZm-1r8N;
	Wed, 05 Feb 2025 23:04:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfoRb-00000004nYf-47Mv;
	Wed, 05 Feb 2025 23:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3453C5C57BF;
	Wed,  5 Feb 2025 23:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F617C4AF0B;
	Wed,  5 Feb 2025 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738796670;
	bh=S72eIFvgqEoxbQM8qfvjvrlejM+2TfjiaT1i5lkDoBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gxyO/DkIBHu33ghmCtkfFrFlUN3JY7dEJtRA4pQwuM07reGkxzbEhCZcgr4IMasDY
	 pWDkdJQ+6UOIgP2OEhJun7Fwn7KpWXACgdOtQGO1CZwId+4GYindFn+9vuM2cQ2Mu3
	 gfL/UtkDZsecXf6mijPtEpfQlDUu2e948Vzba6P7yWbyWXLOsd/ZDfN6AhNhWoHkhl
	 MiDI4bMd97k6Am9qe0I1naMjos9I0Qs8bqqABHo06hyAUdnS4yX9U7EVX45tMXgGks
	 cbdHqt7kn+WXlGr1y89W631siCs+AtscTCkMTFkhU5jbUVc8vOMSbaioAoWksoeGKU
	 WbSixxOzuVMaw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30219437e63so15250801fa.1;
        Wed, 05 Feb 2025 15:04:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKfGu4eka+nIlknpcVR+wSWUd2OsaeP7V7w10bdbpbTjVl4TBtCf2fL5esRPjEPrM545utpALrh9gHtiw=@lists.infradead.org, AJvYcCXFNwwgWM5DSZi0lQEtTzqxqU3XfEmLP/lbGAE7CSXgqB+CEynInJtL6qHPHQGGRo/OwDsLXJBUwtvrqvRX7i2J@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqan1Bw8m21n8ul7F9qGWYrtSwAGhV1Nz0m1Xy5+prUQmQPGbM
	eai5i3nUlkoB3Vbv7bVrnZZ7VfWGfqbOXq0yHyTvoYGVWRdPIcE4/dUlNSzSwUcDPMPJ7bVbtNr
	fzIiOLwehB8Tcy+Z+T+y+YG9g+k0=
X-Google-Smtp-Source: AGHT+IF89pjNvxORXTiz/KZ99MrP0x5RvRSNjKSsJcaqJGPWoeuT1g3SMmILZLP5X4y5h0x0Un2+f4WGgAowvASu1X4=
X-Received: by 2002:a2e:2c12:0:b0:302:41f6:2352 with SMTP id
 38308e7fff4ca-307da5ae80amr3376651fa.16.1738796668357; Wed, 05 Feb 2025
 15:04:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <fb30574a-d238-424c-a464-0f7a5707c46a@intel.com>
 <3dcf7631-d839-7235-10c7-30f80d7f796a@gentwo.org>
In-Reply-To: <3dcf7631-d839-7235-10c7-30f80d7f796a@gentwo.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 6 Feb 2025 00:04:17 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHktLC2F=suQoNF80-ZQ93-3pxWz20_L76_6morUGPaNQ@mail.gmail.com>
X-Gm-Features: AWEUYZnX90yX3IKaA52q5S_M7G8eGfUWUp3XkEiKOjpcZPLHNrjrrMHxTq0wSUs
Message-ID: <CAMj1kXHktLC2F=suQoNF80-ZQ93-3pxWz20_L76_6morUGPaNQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Dave Hansen <dave.hansen@intel.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, xin@zytor.com, 
	kirill.shutemov@linux.intel.com, palmer@dabbelt.com, tj@kernel.org, 
	andreyknvl@gmail.com, brgerst@gmail.com, dave.hansen@linux.intel.com, 
	jgross@suse.com, will@kernel.org, akpm@linux-foundation.org, arnd@arndb.de, 
	corbet@lwn.net, dvyukov@google.com, richard.weiyang@gmail.com, 
	ytcoode@gmail.com, tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
	jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, jannh@google.com, 
	bhe@redhat.com, vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, kees@kernel.org, kasan-dev@googlegroups.com, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_150432_107916_C8EC9822 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

On Wed, 5 Feb 2025 at 20:31, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
>
> MTE tagging is part of the processor standard for ARM64 and Linux will
> need to support the 16 byte tagging feature one way or another even if
> Intel does not like it. And AFAICT hardware tagging support is a critical
> security feature for the future.
>

Can you explain what you feel is lacking in the existing MTE support
in KAsan (enabled when selecting CONFIG_KASAN_HW_TAGS)?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
