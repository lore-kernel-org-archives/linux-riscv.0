Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2007C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 12:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wB2s8b/P2M1X/80MMxP5ncUrFVvOX2y01cyyC6oe77s=; b=CFdGCWJuMNH84u
	zOm6P1TTl44pJTz6HG+niNm+MpR4to5liwG9/7jaRZybq3/MNFQNMtQKJ3GhPSJjzWOB7DFnCZzEF
	zOl3coSLo3Hag3XC1ZVVWK/Aw9DBIcLVTqxxEScoyDtCWdC7fgnFqhjF2YXWxf2bexnQTlybOZ03K
	6dt1HhWt1iEeL7VNe97c/OCklKG/2hZHzIE0wB7CZFZzs7c5cmHisXBQDRFL4cGKanVr9pEoREiV6
	zl/1bMSTq3DWxEW6EUMj5eb0LuGmb4PlWX75JAqGOCH9YAltwP/ONgbPzZMoPMPVZLWA4DNWdcEHk
	EEeSyvuYLgpBdqFCUfpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOe3b-00ASfK-2J;
	Wed, 26 Jul 2023 12:55:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOe3X-00ASdu-2N
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 12:55:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5227799c224so761363a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690376151; x=1690980951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTBwp6rw//OMQeGQAvvPflpvaT6OHS4L7rF12yiJpCo=;
        b=lU908RsDIMwEGndFikTuty1yLFZQTquD/zDTdAG75YAka+aKhf2a3D6XrLGOgFEIz+
         hmIbMAGTgAeNoerHIVWzmDQrEkWFvogKbeUrwIMnbESEKJxeklMXr62VFlB0/TAIB6JF
         lr9nRFHzrih5TGYnyBdh90X15MipZJZ5208sYuz65oCobLCR6hE/x1hTXLKtyqBbH/Mx
         pc7pcFewPGagm3gt1kqQwOI7N15wE21zPlR9kSjDy5hyU8pYvLz8QBNP2A0t7SIIjYHx
         m+z2YjrikpVNQVTQnXVFAmxJq8jG5dEfmM08jkr+ZV7RolnXz6uoaHq74cjpoQru3r5A
         I62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690376151; x=1690980951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTBwp6rw//OMQeGQAvvPflpvaT6OHS4L7rF12yiJpCo=;
        b=SrzaFFRB9P36x4vdeLPnrrJmmw81ZSQK40h5kekqyGRhyZJsVu5G/ODI0WmU6IcNtZ
         HBZryMd+IUAmaFOV8l5v6x3cBPaWz08P+6s/mLB7SfI9nmCJ5/Uuo5f4OGQxTbSG6jgK
         1TWHc2Vx8fT03qMFlbHG2LHBt2JknOa4MU/jP2tPCei/rKM6vjrgyhlVgtq9Brxvm3YR
         XVYRgScst1GmdtaItZ3sGXw5RllFccnCLkHYeJyJ/lusLLXKPT5uneXnxh51HFW8m9vV
         JbmaJj0zCN/s73PXgUpjSPirJOyhpHDPgLB8eozNUU22SJCuPU5l0Lba1MGsrY+oaAjd
         Zysg==
X-Gm-Message-State: ABy/qLYWWoiZa1rfEkFdIy1tcVld+5Xj57iO1peP8HcWd6SPN+5SKWXO
	1nfliBSbFAToQdnsFMLNAh5P3g==
X-Google-Smtp-Source: APBJJlEKBWRe6YX8enH88Kb2yCIFd04V5T7HsH3sR29lP4Ybl6rmXi1BanU4d0ZYUnTXDMEAT1LadQ==
X-Received: by 2002:aa7:d80f:0:b0:51d:fa7c:c330 with SMTP id v15-20020aa7d80f000000b0051dfa7cc330mr1386181edq.26.1690376150417;
        Wed, 26 Jul 2023 05:55:50 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k11-20020aa7d8cb000000b005222c6fb512sm4081742eds.1.2023.07.26.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 05:55:49 -0700 (PDT)
Date: Wed, 26 Jul 2023 14:55:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, evan@rivosinc.com, jszhang@kernel.org, apatel@ventanamicro.com, 
	heiko@sntech.de
Subject: Re: more /proc/cpuinfo & extension support related woes
Message-ID: <20230726-cab7c446f0a1f6de93e1e819@orel>
References: <20230725-friction-enlisted-7acb7c3c03bf@spud>
 <20230726-44005036239541a139fe7b2e@orel>
 <20230726-ransack-life-8b71c7c0542b@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726-ransack-life-8b71c7c0542b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_055555_777343_9BA9BEAD 
X-CRM114-Status: GOOD (  89.41  )
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

On Wed, Jul 26, 2023 at 11:41:05AM +0100, Conor Dooley wrote:
> On Wed, Jul 26, 2023 at 11:04:39AM +0200, Andrew Jones wrote:
> > On Tue, Jul 25, 2023 at 06:19:36PM +0100, Conor Dooley wrote:
> 
> > > (I've only CCed a few people here, mostly those who were involved in the
> > > riscv_has_extension_likely() stuff earlier this year)
> > > 
> > > I know using /proc/cpuinfo for extension detection is a bad idea, that's
> > > not the point of this. We can go on about how it is bad, but people are
> > > using it & we shouldn't knowingly lead them astray. For example, unlord
> > > reported on IRC yesterday that, having built a kernel using a released
> > > version of llvm, they were surprised to see illegal instruction
> > > exceptions given /proc/cpuinfo had a v in the ISA string entry.
> > > 
> > > For most extensions that we support in the kernel at the moment, the
> > > general flow is something along the lines of the DT etc gets parsed,
> > > and then we set a bit if the hart supports the extension. For some
> > > select extensions, that have additional properties in the DT, we perform
> > > a check for those before setting the bit. Extensions that the kernel
> > > does not understand get ignored as it does not know what to look for in
> > > the isa string representation.
> > > 
> > > As a result, the kernel populates a list of neither the extensions
> > > supported by the hart nor a list of the extensions supported by the
> > > running kernel. Instead, its something awkward in the middle - a list
> > > of extensions that a kernel built from this source code is aware of
> > > available on this platform.
> > > 
> > > For the case where the system, but not the kernel, supports vector, we
> > > do what looks like a weird dance*, where we set up vsize, but then mask
> > > off the hwcap bit:
> > > 
> > > 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> > > 		riscv_v_setup_vsize();
> > > 		/*
> > > 		 * ISA string in device tree might have 'v' flag, but
> > > 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
> > > 		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
> > > 		 */
> > > 		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > > 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> > > 	}
> > > 	* riscv_v_setup_vsize() w/o a return check should be a NOP when
> > > 	the config option is disabled.
> > > 
> > > Note that only the hwcap bit is masked, but not the corresponding
> > > extension support tracking bit in riscv_isa. I'd swear I recall talking
> > > to Andy about how this could be problematic w.r.t. false reporting of
> > > some variety, I'll have to go find it. It is (I think) the same for any
> > > of the other extensions parsed from DT that has a Kconfig option that
> > > must be set before userspace can use it, such as F & D.
> > > 
> > > Either way, this becomes problematic for /proc/cpuinfo, where we do:
> > > 	static void print_isa_ext(struct seq_file *f)
> > > 	{
> > > 		struct riscv_isa_ext_data *edata;
> > > 		int i = 0, arr_sz;
> > > 	
> > > 		arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
> > > 	
> > > 		/* No extension support available */
> > > 		if (arr_sz <= 0)
> > > 			return;
> > > 	
> > > 		for (i = 0; i <= arr_sz; i++) {
> > > 			edata = &isa_ext_arr[i];
> > > 			if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> > > 				continue;
> > > 			seq_printf(f, "_%s", edata->uprop);
> > > 		}
> > > 	}
> > > 
> > > The issue here is the call to __riscv_isa_extension_available() which,
> > > with a NULL first argument, will use the riscv_isa bitmask that contains,
> > > as described above, a list of extensions that a kernel built from this
> > > source code is aware of that are available on this platform.
> > > 
> > > This also impacts riscv_has_extension_[un]likely(), which operates on a
> > > similar premise. has_vector(), has_svnapot & has_fpu(), which are the
> > > users of riscv_has_extension_[un]likely() don't suffer here, because when
> > > their config option is unset, they resolve to `return -EOPNOTSUPP;` or
> > > similar.
> > > 
> > > Other users of __riscv_isa_extension_available() I have not evaluated
> > > yet, but there are quite a few, scattered in various places, including
> > > kvm & hwprobe.
> > > 
> > > I think we might've just overused this particular bit of information for
> > > various purposes & screwed ourselves a bit. There are a few main places
> > > this information is used:
> > > 
> > > 1 Figuring what exactly the hardware supports during boot. Evan has
> > >   added per-CPU tracking of this, although the kernel is limited here to
> > >   the subset that it knows AND further restricted by a call to
> > >   riscv_isa_extension_check(). This we don't actually use yet after
> > >   boot, but Evan has a user on the lists. This per-CPU tracking is then
> > >   used to create and LCD set of extensions that drives
> > >   __riscv_isa_extension_available().
> > > 
> > > 2 Telling userspace what extensions are supported. However, by what? The
> > >   running-kernel & hw combo? The hardware? I tried to read the hwprobe
> > >   doc and couldn't tell. /proc/cpuinfo, as I already said, is a
> > >   mixed-mess, but hwprobe should mean "this extension is supported by
> > >   the hardware (or firmware) and you can use this without a concern",
> > >   right? Evan's proposed per-CPU reporting here adds a third thing to
> > >   the mix, but is intended to (AFAIU) represent the set of
> > >   known-to-the-kernel extensions that each hart supports, regardless of
> > >   whether the kernel itself supports them.
> > > 
> > > 3 Setting dynamic code paths in the kernel. For example, if the hardware
> > >   supports Zbb, patch in the string manip routines. This is distinct
> > >   from telling userspace it can use the extension, since something like
> > >   Zbb can be used by userspace even if the kernel doesn't touch it.
> > > 
> > > 4 Telling in-kernel users what extensions they can use. This, I figure,
> > >   is more along the lines of my theorised meaning for hwprobe.
> > > 
> > > I think for case 3, we are mostly okay. Either this sort of code uses
> > > alternatives, that have an in-built config dependency, or the
> > > has_whatever() stuff that has an alternative implementation if the
> > > correct config option is not set.
> > > 
> > > For case 2, I think hwprobe is doing the right thing (for now) but
> > > /proc/cpuinfo needs to be changed.
> > > 
> > > Case 4 probably needs an audit to make sure that nothing is going
> > > awry. I'll go have a look through the users.
> > > 
> > > If other people think splitting this up a worthwhile endeavour, I'll
> > > go write some patches. I do FWIW. Or maybe I am overlooking something
> > > that makes this less of a problem than I think. LMK if so :)
> 
> > Here's a summary of my thoughts, which probably aren't adding anything new
> > to this
> > 
> >  - The kernel needs per-hart bitmaps expressing what extensions are
> >    supported for each given hart.
> 
> We sorta have this. The per-hart bitmap is a bitmap of extensions that
> have defines in hwcap.h (an understandable limitation) and for which
> riscv_isa_extension_check() passes.
> 
> >  - The kernel needs a bitmap expressing the LCD of extensions across all
> >    harts.
> 
> Again, we sorta have this. It's all of the per-hart bitmaps, bitwise
> ANDed.
> 
> >  (The two bitmaps are clearly expressing the intersection of what's
> >   supported by a hart and what the kernel is aware of, since the kernel
> >   must allocate the bits.)
> 
> Right. With the exception of the riscv_isa_extension_check(), that we
> currently apply to Zicbo{m,z}.
> 
> Getting ahead of myself a little, but I wonder if we should remove the
> riscv_isa_extension_check() stuff from from the code that sets the
> bitmaps & instead have it as a separate stage, which would align our
> bitmaps with what you suggest here.

You touch on this later, but tracking "non-filtered" extensions may not be
useful. riscv_isa_extension_check() drops the tracking of extensions which
have incomplete descriptions. Zicbom with no or a bad block size described
is really no Zicbom at all, for example.

> 
> >  - Extensions in DT/ACPI that the kernel is unaware of get ignored by
> >    the kernel and not exposed to userspace (if the extensions are for
> >    U-mode and U-mode has another way of determining their presence to
> >    use them, then good for U-mode)
> 
> Sure.
> 
> >  - The kernel will combine information from one of the two bitmaps listed
> >    above with other information, such as config information, to decide
> >    when / if an extension should be used by the kernel and/or exposed to
> >    userspace 
> 
> Right. This bit (or rather two bits, since I view the kernel and
> userspace bits here separately) is where we are falling short. I think
> hwprobe's limited users do the right thing, but we're not doing this for
> /proc/cpuinfo. For the in-kernel users, grepping shows some suspicious
> looking things, but how many are problematic I do not yet know. As an
> example, does
> static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> {
> 	u64 henvcfg = 0;
> 
> 	if (riscv_isa_extension_available(isa, SVPBMT))
> 		henvcfg |= ENVCFG_PBMTE;
> 
> work correctly if the SVPBMT Kconfig option is disabled?
> From a quick check, `isa` here is set from the host ISA
> 	/* Setup ISA features available to VCPU */
> 	for (i = 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
> 		host_isa = kvm_isa_ext_arr[i];
> 		if (__riscv_isa_extension_available(NULL, host_isa) &&
> 		    kvm_riscv_vcpu_isa_enable_allowed(i))
> 			set_bit(host_isa, vcpu->arch.isa);
> 	}
> so if the check passes for the host ISA, it'll pass for the guest ISA
> too, so henvcfg will end up with the PBMTE bit set. I just haven't yet
> checked what the outcome of this will be, but I figure not good?

As long as KVM doesn't depend on the rest of the kernel having the
extension enabled in order to support the guest's use of it, then the
extension can be safely exposed to the guest kernel, even when the
host kernel has opted to avoid its use. Indeed, even if the host
kernel was compiled without the support of the extension as a
workaround for errata, exposing the extension to the guest isn't
horrible, as the guest kernel may want to experiment with the broken
extension or choose to workaround those errata in another way.

> 
> > (it'd be good to have a consistent API for these types of
> >    checks which combine extension presence with other information)
> 
> I figure the best option might just be to make the
> __riscv_isa_extension_available() into this to avoid disruption? The
> vast majority of users of that function want to know whether or not it
> is safe to use the extension on that hart, not whether the hart itself
> supports it. In fact, outside of Evan's per-hart stuff in /proc/cpuinfo,
> do we have any users that would even want an API that checks the
> "unfiltered" versions? I'll have to check the users to answer that I
> think.
> 
> >  - The kernel will expose sanitized extension information to userspace.
> >    S-mode only extensions do not need to be exposed and extensions that
> >    require kernel support should only be exposed when the kernel is
> >    willing and able to support them. Additional properties of extensions,
> >    such as block sizes, also need to be exposed (exposure is done through
> >    hwprobe)
> 
> It gets extra messy too when the prctl etc get involved. What do you
> report in /proc/cpuinfo's isa field when RISCV_ISA_V_DEFAULT_ENABLE is
> set to disabled? It would have to respect the sysctl, right?
> Ditto the prctl, which will interact "nicely" with things like Google's
> cpu_feature library that parses /proc/cpuinfo.
> 	https://github.com/google/cpu_features

Sigh...

> 
> > I think we have most/all the above already, but the audits you've
> > volunteered to do would be welcome, along with maybe documenting
> > it all somewhere. Then, after that, all that's left is the "what to
> > do with /proc/cpuinfo and hwcap?" question.
> 
> > Can we simply freeze
> > what extensions are exposed through them and mark them as deprecated?
> 
> hwcap is already limited to the single-letter stuff, and is already
> disabling things like F, D & V if the config options are not set.
> 
> But for /proc/cpuinfo, that is sorta where I was wondering if we should
> go, but hwprobe isn't a replacement for "casual" checking of what
> is/isn't supported, so it may be premature. Certainly, leaving people
> without an easy way to check by eye what extensions are present seems
> overly painful.

I guess it depends on the purpose of the easy check. Is it to see
what's supported+enabled by the kernel? Or what's supported by the
platform, but may or may not be useable? Or just what's usable for
U-mode? Maybe we need a sysfs extension listing where each extension
node has subnodes providing their current status (enabled, disabled,
etc.). Then lscpu could be taught how to use that information to
output different listings depending on the user's needs.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
