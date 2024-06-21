Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41E6C2BB85
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wdi8ATeK6DQ77q0E7/yeFyR6ZAe+zi1SNz1eWgc/DU=; b=aEp+HTbZ0QkJye
	7JGJvYvyJRTYzBmFf62qKWHeto8AYP3dg9q/gmZvbtAx9/blprlUa7gTMezxwEeGKquUg0NwNRkDM
	8miMuNNs81C7AAMiOdJG9DZkpXDcU19IfxPs0FPjy4nCIpDrL6doE6JuP6rngiadiaFgNKMhOhBGN
	x5QqLrKFzLo2NgxkgsDS3hLVfhR0GIKAX1chbUPv4KUTB4p48vdJmaEIi44+aWRi5t8d1Xu8/3ctg
	mPYfkGOzdt7KWAgM7O+o+ZQYYkqkgYOoqWq+VzUzmoRrZ0oHO4kgpqLrO9j9PXyYXfdL0xWvYgitI
	zFJvFoNgzQ4vukMQZMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKhuB-0000000A5Nt-38zp;
	Fri, 21 Jun 2024 17:18:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKhu7-0000000A5NL-2QSo
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 17:18:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f480624d10so18498085ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718990307; x=1719595107; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORDV7dLJMiQHWovI48Ita0Rbr1EnXe1nxm2vxdqS/sw=;
        b=SVFb1Lff1objRp1I58pxZk2xHvOlqaO8tqb5z8er8VibHuJ0z52+zF4fcpBx7a5H/P
         c3mQazuy+HaDVvpR/93MmxBL7MKgtjuFiOmSoUdS3OCiwoYivuCW/16H6BfDwCPf4i7U
         zOwsORUN4MTGVfsSMGZl1lVk4xDP9RIGSYmDqHRQ/WT3xREfcvQC4wWgvsx5rAT8LFq7
         Mk5J0kOPioiOyUr0FKkcCge6TXRp9WPsF1SIZ3exEmdJAMWjPsrWnrHbG7FXpfIbrR6R
         N8zBFHdwZ0v68j2NwRTfoujP3xl+f5mHm3xwCpgf8xm+faOh8xuhr3wDTeJ75L20KYzH
         ZbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718990307; x=1719595107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORDV7dLJMiQHWovI48Ita0Rbr1EnXe1nxm2vxdqS/sw=;
        b=ofgYCY540bC1Dgp6QlcrszMOho/ErN4m1VyKU0RU7izKyVt/MVJaQobNPoXFnuzygg
         nrEuEyeOnoHiZv0pzYHnEAdG/6fsy/tsFZXhIBiFSXjuz28fWMrczq4eK7J1zywBkJtF
         hMT933JNhVMYY5QY44kM74ZRBdSbzLljAL5SJtzNGgvoPCMNXdvRvs6LauwhI2mJVHAB
         yJDkdbEYxQQexfKHMSJKHrjfM7EjsaU+3ynoGHRQIkAaHHe3DF5iqMv8nIeXXiXfDVGh
         roz2okJfYt982oatBG4+0S5F3RXSGqn53WoLD2iNtIO6ibgrig5BFVq5bqmX7AwmHKCp
         Ukaw==
X-Forwarded-Encrypted: i=1; AJvYcCXFkNt/dBoYmdyU3/EFdAWUOybKnf7hid9iweG9zjLDoQvbbzG/HbKgQ4eXBMouPMgKROzP3khqZFNQRtgcFceMkXQs/Dhk2s/9Dz9HfL+9
X-Gm-Message-State: AOJu0Ywyfn4xvR9f6LFMBcPPOURTfI9N4qhbo0BdtwS/OI0HOxYUDGRB
	N9M5EF9cXvDKL7bRl0+cweIrHfYtTMoJ63G8yVeLMuqsxZkC65dlwPOpD6q8ATQ=
X-Google-Smtp-Source: AGHT+IFhpdokOh+kKKtcr73LycfVRrBTht6rCs4M+ZRhBueKvK8qrFKcWT/wmy1ujZUYffpa8NRyaw==
X-Received: by 2002:a17:903:18d:b0:1f8:3b7b:d0e5 with SMTP id d9443c01a7336-1f9aa3a64a3mr103208695ad.7.1718990306643;
        Fri, 21 Jun 2024 10:18:26 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:e8dd:a296:71d5:2490])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb5e3d77sm16460675ad.222.2024.06.21.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 10:18:25 -0700 (PDT)
Date: Fri, 21 Jun 2024 10:18:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] RISC-V: Detect unaligned vector accesses
 supported.
Message-ID: <ZnW130PqW56CnZT8@ghost>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
 <ZnDmRK0ZtKzmWN5S@ghost>
 <ZnDsdzv4o/Xz9kWm@ghost>
 <e6f7a061-50f0-4a6a-a09b-468502703c20@rivosinc.com>
 <ZnSptpobfqjik3RM@ghost>
 <20240621-reveler-underfed-37600a9f16d5@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621-reveler-underfed-37600a9f16d5@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_101828_065167_ECF5E590 
X-CRM114-Status: GOOD (  74.05  )
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

On Fri, Jun 21, 2024 at 11:06:31AM +0100, Conor Dooley wrote:
> On Thu, Jun 20, 2024 at 03:14:14PM -0700, Charlie Jenkins wrote:
> > On Thu, Jun 20, 2024 at 05:31:28PM -0400, Jesse Taube wrote:
> > > 
> > > 
> > > On 6/17/24 22:09, Charlie Jenkins wrote:
> > > > On Mon, Jun 17, 2024 at 06:43:32PM -0700, Charlie Jenkins wrote:
> > > > > On Thu, Jun 13, 2024 at 03:16:13PM -0400, Jesse Taube wrote:
> > > > > > Run a unaligned vector access to test if the system supports
> > > > > > vector unaligned access. Add the result to a new key in hwprobe.
> > > > > > This is useful for usermode to know if vector misaligned accesses are
> > > > > > supported and if they are faster or slower than equivalent byte accesses.
> > > > > > 
> > > > > > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> > > > > > ---
> > > > > > V1 -> V2:
> > > > > >   - Add Kconfig options
> > > > > >   - Add insn_is_vector
> > > > > >   - Add handle_vector_misaligned_load
> > > > > >   - Fix build
> > > > > >   - Seperate vector from scalar misaligned access
> > > > > >   - This patch was almost completely rewritten
> > > > > > ---
> > > > > >   arch/riscv/Kconfig                         |  41 +++++++
> > > > > >   arch/riscv/include/asm/cpufeature.h        |   7 +-
> > > > > >   arch/riscv/include/asm/entry-common.h      |  11 --
> > > > > >   arch/riscv/include/asm/hwprobe.h           |   2 +-
> > > > > >   arch/riscv/include/asm/vector.h            |   1 +
> > > > > >   arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
> > > > > >   arch/riscv/kernel/Makefile                 |   4 +-
> > > > > >   arch/riscv/kernel/sys_hwprobe.c            |  41 +++++++
> > > > > >   arch/riscv/kernel/traps_misaligned.c       | 119 ++++++++++++++++++++-
> > > > > >   arch/riscv/kernel/unaligned_access_speed.c |   9 +-
> > > > > >   arch/riscv/kernel/vector.c                 |   2 +-
> > > > > >   11 files changed, 221 insertions(+), 21 deletions(-)
> > > > > > 
> > > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > > index b94176e25be1..f12df0ca6c18 100644
> > > > > > --- a/arch/riscv/Kconfig
> > > > > > +++ b/arch/riscv/Kconfig
> > > > > > @@ -723,6 +723,12 @@ config RISCV_MISALIGNED
> > > > > >   	help
> > > > > >   	  Embed support for emulating misaligned loads and stores.
> > > > > > +config RISCV_VECTOR_MISALIGNED
> > > > > > +	bool
> > > > > > +	depends on RISCV_ISA_V
> > > > > > +	help
> > > > > > +	  Enable detecting support for vector misaligned loads and stores.
> > > > > > +
> > > > > >   choice
> > > > > >   	prompt "Unaligned Accesses Support"
> > > > > >   	default RISCV_PROBE_UNALIGNED_ACCESS
> > > > > > @@ -774,6 +780,41 @@ config RISCV_EFFICIENT_UNALIGNED_ACCESS
> > > > > >   endchoice
> > > > > > +choice
> > > > > > +	prompt "Vector unaligned Accesses Support"
> > > > > > +	depends on RISCV_ISA_V
> > > > > > +	default RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> > > > > > +	help
> > > > > > +	  This determines the level of support for vector unaligned accesses. This
> > > > > > +	  information is used by the kernel to perform optimizations.
> 
> I haven't actually checked the patchset, but is it actually used by the
> kernel to perform optimisations?

No ;)

Right now this patch is just providing the information to userspace
through hwprobe and doesn't optimize anything in the kernel.

> 
> > > > > > It is also
> > > > > > +	  exposed to user space via the hwprobe syscall. The hardware will be
> > > > > > +	  probed at boot by default.
> > > > > > +
> > > > > > +config RISCV_DETECT_VECTOR_UNALIGNED_ACCESS
> > > > > 
> > > > > This is not used anywhere, what is the reason for including it?
> > > 
> > > This is so that we can check if they are supported or not, but not check the
> > > speed of them. Similar to RISCV_EMULATED_UNALIGNED_ACCESS.
> > 
> > What do you mean? It isn't used anywhere so this "check if they are
> > supported or not" is not guarded by this config.
> > 
> > > 
> > > > > 
> > > > > > +	bool "Detect support for vector unaligned accesses"
> > > > > > +	select RISCV_VECTOR_MISALIGNED
> > > > > > +	help
> > > > > > +	  During boot, the kernel will detect if the system supports vector
> > > > > > +	  unaligned accesses.
> > > > > > +
> > > > > > +config RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> > > > > > +	bool "Probe speed of vector unaligned accesses"
> > > > > > +	select RISCV_VECTOR_MISALIGNED
> > > > > > +	help
> > > > > > +	  During boot, the kernel will run a series of tests to determine the
> > > > > > +	  speed of vector unaligned accesses if they are supported. This probing
> > > > > > +	  will dynamically determine the speed of vector unaligned accesses on
> > > > > > +	  the underlying system if they are supported.
> > > > > > +
> > > > > > +config CONFIG_RISCV_UNALIGNED_ACCESS_UNSUPPORTED
> > > > > 
> > > > > This should not be prefixed with CONFIG and does not include VECTOR in
> > > > > the name.
> > > 
> > > Huh thought it would warn fixed though
> > 
> > What do you mean by "warn fixed"?
> > 
> > > 
> > > > I assume you meant to put
> > > > > "RISCV_VEC_UNALIGNED_ACCESS_UNSUPPORTED" here?
> > > 
> > > This is to leave a faster path like SLOW or FAST to say that unaligned
> > > access arent suported.
> > 
> > I am not sure what you are responding to. This comment seems to be
> > responding to my correction of
> > CONFIG_RISCV_UNALIGNED_ACCESS_UNSUPPORTED->RISCV_VEC_UNALIGNED_ACCESS_UNSUPPORTED
> > so I don't see how that ties into SLOW/FAST.
> > 
> > > 
> > > > > 
> > > > > This was also intentionally left out on the scalar side [1]. The
> > > > > implication here is that having this config will cause people to compile
> > > > > kernels without unaligned access support which really shouldn't be
> > > > > something we are explicitly supporting.
> > > > > 
> > > > > If somebody does want to support hardware that does not handle vector
> > > > > unaligned accesses, the solution should be to add emulation support to
> > > > > the kernel.
> > > 
> > > Yes but we dont have emulation support yet so I do think its a good idea.
> > 
> > I am hesitant because it is very likely that somebody will add support
> > for unaligned vector emulation. When there is emulation support, this
> > config option should not exist to be consistent with scalar. However if
> > we add this option in now, we must expect a user to enable this config,
> > and then 
> 
> I dunno, I think there could be value in having the option here. For
> scalar, we couldn't have an option that would break the uABI, so the
> unsupported option wasn't okay. That's not a constraint that we have for
> vector.
> 
> For vector, if you have a system that doesn't support misaligned access,
> you probably don't want to emulate the accesses either, since that's
> likely remove any performance gains you get from using vector in the
> first place, so I can see benefit in the option.

We have the RISCV_MISALIGNED option that disables the scalar emulation,
but doesn't break the UABI because it's not saying that misaligned
scalar is not supported, but just that the kernel doesn't emulate.
Having an UNSUPPORTED option explicitly breaks the UABI which doesn't
seem like something that the kernel should support. If we are okay with
having options that break the UABI then this is fine, but I was under
the impression that we did our best to avoid that.

There definitely is value in having an option like this for hardware
that never wants to run misaligned code, but since we decided with the
scalar accesses that we should not break the UABI I think vector should
do the same.

> Enabling the probing is going to end up with same outcome for userspace
> as having this option on such a system, so it comes down to whether you
> want to allow people to skip the probing if they know their system has
> this problem.
> 
> > we will have to get rid of it later. Users are not always happy
> > when config options are removed.
> 
> I dunno, I don't think that adding emulation requires that we remove
> this unsupported option.

I am probably being too paranoid about this but I am hesistant to cause
vector and scalar misaligned access implemenations to diverge. It is
inconsistent to allow an unsupported option for vector but not for
scalar when both support emulation. The probing is very fast as it just
checks if a misaligned access causes a trap and then sets the access
speed to unsupported if it does trap.

> 
> Additionally, what are we doing in the kernel if we detect that
> misaligned stuff isn't supported? Are we going to mandate that kernel
> code is aligned only, disable in-kernel vector or some other mechanism
> to make sure that things like crypto code don't have/introduce code
> that'll not run on these systems?

UNSUPPORTED will still be set by the quick probe so it would be possible
for the kernel/userspace to avoid running misaligned vector when it's
unsupported. Any kernel methods would probably want to always run
aligned vector unless misaligned support was determined to be FAST
anyway, I am doubtful that code will have different optimizations for
FAST, SLOW, and UNSUPPORTED but it is possible. 

I would prefer consistency between scalar and vector misaligned support,
but this is not a deal breaker for this patch. I am not convinced it is
the best choice, but I am okay with leaving this option in the kernel.

- Charlie

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
