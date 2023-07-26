Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDE1C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Np16FrMQ8ju7ozXT0K9AvbD/QvNUhN9uu1JTuCsEPp4=; b=e8X10aYP6mgSL/
	e0Q4QogzIHs7CmV7QQ+J3S9lvy2HfnwJJlLMJZ+Ha9VHtHupJWep0mBln0/QotdRfwaqD6eXZs5se
	mG5adWvhWY/eopD9ymFnqDWrrglq+S4SG4rEol1f5w+pR9oHVIoHdq92j6TJPvW9klXZ4gHDKnflS
	H8stl/CWD1MP4jPFs9HbRzyjZPv2LB72GiOdTVBXW+EYEj7a2atJ/5XT02muNN3k8SunGacwpt8lW
	aBcvlp+mPdOIengy5VGcndlWBSMFoGrEnQrthG9kSpZZ8mn6G/50cpyIhBRlavIU1wMzyN0+7d0ws
	13IguVECMCqzOTbXytWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaRp-009fWn-3A;
	Wed, 26 Jul 2023 09:04:45 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaRn-009fVO-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 09:04:44 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so1088112566b.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690362281; x=1690967081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kEq4aEUADaijAvTr8bJGeeniH5R8mS0ErfRxDmNziSk=;
        b=jWH4kcyY91IRC2kXXNemkCb9YoZ+Yheem6srPiZSXy44ZwP/90tRK1HaXxxebbbgp1
         0vrSYKj33AXHhnj5XR3K2PsiBthbLAL1a5tqCWdDtkqrOnMfjWTZbJ+zkErOCMz/3/2M
         IPmBvRYv7VHC4U+emHnvJJsP7BaKPOJDqq2NlGipwCi3aK9FEHcQ73/+xy1Kj9fiAwXt
         W4dF5W/+xYvoso6iHQY+6N1JI93cs5p0QNhSo1zSADjTsMAexDKa5NkUTcedGcb1j651
         1enWnONq98rAFcXPD0tbzsm9CIh2T0Z0BoK12Y418uAPH4vgEHy9ym9vSiZ07JMInu4i
         SIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690362281; x=1690967081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEq4aEUADaijAvTr8bJGeeniH5R8mS0ErfRxDmNziSk=;
        b=VuQWY4AzzIUNyAVPwyEFvwBA9dYVz6vjRSJpuX/+xO5c1bf8vM7S/iWGNLctfJz3Up
         9aGljOTJax+jUUNekQutWGGtqFQVfVMBcmmUcQ4D/Xt1GrJUS19Rd2YUcmfLLgY2xjYq
         y88KyTvyuCs7lxVEw2A0GHDTVszYJ4pINdYlTuqM0bAog8CP+e5bfxC5LR5CzhMtN2ST
         lA6QsY3Zik2JPABokzlQTN9hH6vFfk/f3O57+rWZZ1STiEpwPK+EgywZZvx+YUsuug6S
         VO/IdJ8WnQDofTKtfUe22DdterGwX4pUwViDnY7Y0tEqEoMS8qKdIBAXG6pREyHpLOIt
         h4ew==
X-Gm-Message-State: ABy/qLZKzGq+7zcBcNCiVGaITiz9LVVYsCa4I/RCuWnbeHkegu2fb8rY
	PYrruFMKO27rvM+zL55t76jkxw==
X-Google-Smtp-Source: APBJJlGLJpuevUeDl8gIZM0HLuQ1wCBQBVgzfl5lUea946qwWAmH1sDp9EVHzAtaN4SkTL3UDS9IBA==
X-Received: by 2002:a17:907:7808:b0:994:56db:cb8d with SMTP id la8-20020a170907780800b0099456dbcb8dmr1135871ejc.14.1690362280835;
        Wed, 26 Jul 2023 02:04:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id jx16-20020a170906ca5000b00993664a9987sm9352542ejb.103.2023.07.26.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 02:04:40 -0700 (PDT)
Date: Wed, 26 Jul 2023 11:04:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, evan@rivosinc.com, 
	jszhang@kernel.org, apatel@ventanamicro.com, heiko@sntech.de
Subject: Re: more /proc/cpuinfo & extension support related woes
Message-ID: <20230726-44005036239541a139fe7b2e@orel>
References: <20230725-friction-enlisted-7acb7c3c03bf@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725-friction-enlisted-7acb7c3c03bf@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_020443_222217_710A79D1 
X-CRM114-Status: GOOD (  63.04  )
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

On Tue, Jul 25, 2023 at 06:19:36PM +0100, Conor Dooley wrote:
> Hey,
> 
> (I've only CCed a few people here, mostly those who were involved in the
> riscv_has_extension_likely() stuff earlier this year)
> 
> I know using /proc/cpuinfo for extension detection is a bad idea, that's
> not the point of this. We can go on about how it is bad, but people are
> using it & we shouldn't knowingly lead them astray. For example, unlord
> reported on IRC yesterday that, having built a kernel using a released
> version of llvm, they were surprised to see illegal instruction
> exceptions given /proc/cpuinfo had a v in the ISA string entry.
> 
> For most extensions that we support in the kernel at the moment, the
> general flow is something along the lines of the DT etc gets parsed,
> and then we set a bit if the hart supports the extension. For some
> select extensions, that have additional properties in the DT, we perform
> a check for those before setting the bit. Extensions that the kernel
> does not understand get ignored as it does not know what to look for in
> the isa string representation.
> 
> As a result, the kernel populates a list of neither the extensions
> supported by the hart nor a list of the extensions supported by the
> running kernel. Instead, its something awkward in the middle - a list
> of extensions that a kernel built from this source code is aware of
> available on this platform.
> 
> For the case where the system, but not the kernel, supports vector, we
> do what looks like a weird dance*, where we set up vsize, but then mask
> off the hwcap bit:
> 
> 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> 		riscv_v_setup_vsize();
> 		/*
> 		 * ISA string in device tree might have 'v' flag, but
> 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
> 		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
> 		 */
> 		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> 	}
> 	* riscv_v_setup_vsize() w/o a return check should be a NOP when
> 	the config option is disabled.
> 
> Note that only the hwcap bit is masked, but not the corresponding
> extension support tracking bit in riscv_isa. I'd swear I recall talking
> to Andy about how this could be problematic w.r.t. false reporting of
> some variety, I'll have to go find it. It is (I think) the same for any
> of the other extensions parsed from DT that has a Kconfig option that
> must be set before userspace can use it, such as F & D.
> 
> Either way, this becomes problematic for /proc/cpuinfo, where we do:
> 	static void print_isa_ext(struct seq_file *f)
> 	{
> 		struct riscv_isa_ext_data *edata;
> 		int i = 0, arr_sz;
> 	
> 		arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
> 	
> 		/* No extension support available */
> 		if (arr_sz <= 0)
> 			return;
> 	
> 		for (i = 0; i <= arr_sz; i++) {
> 			edata = &isa_ext_arr[i];
> 			if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> 				continue;
> 			seq_printf(f, "_%s", edata->uprop);
> 		}
> 	}
> 
> The issue here is the call to __riscv_isa_extension_available() which,
> with a NULL first argument, will use the riscv_isa bitmask that contains,
> as described above, a list of extensions that a kernel built from this
> source code is aware of that are available on this platform.
> 
> This also impacts riscv_has_extension_[un]likely(), which operates on a
> similar premise. has_vector(), has_svnapot & has_fpu(), which are the
> users of riscv_has_extension_[un]likely() don't suffer here, because when
> their config option is unset, they resolve to `return -EOPNOTSUPP;` or
> similar.
> 
> Other users of __riscv_isa_extension_available() I have not evaluated
> yet, but there are quite a few, scattered in various places, including
> kvm & hwprobe.
> 
> I think we might've just overused this particular bit of information for
> various purposes & screwed ourselves a bit. There are a few main places
> this information is used:
> 
> 1 Figuring what exactly the hardware supports during boot. Evan has
>   added per-CPU tracking of this, although the kernel is limited here to
>   the subset that it knows AND further restricted by a call to
>   riscv_isa_extension_check(). This we don't actually use yet after
>   boot, but Evan has a user on the lists. This per-CPU tracking is then
>   used to create and LCD set of extensions that drives
>   __riscv_isa_extension_available().
> 
> 2 Telling userspace what extensions are supported. However, by what? The
>   running-kernel & hw combo? The hardware? I tried to read the hwprobe
>   doc and couldn't tell. /proc/cpuinfo, as I already said, is a
>   mixed-mess, but hwprobe should mean "this extension is supported by
>   the hardware (or firmware) and you can use this without a concern",
>   right? Evan's proposed per-CPU reporting here adds a third thing to
>   the mix, but is intended to (AFAIU) represent the set of
>   known-to-the-kernel extensions that each hart supports, regardless of
>   whether the kernel itself supports them.
> 
> 3 Setting dynamic code paths in the kernel. For example, if the hardware
>   supports Zbb, patch in the string manip routines. This is distinct
>   from telling userspace it can use the extension, since something like
>   Zbb can be used by userspace even if the kernel doesn't touch it.
> 
> 4 Telling in-kernel users what extensions they can use. This, I figure,
>   is more along the lines of my theorised meaning for hwprobe.
> 
> I think for case 3, we are mostly okay. Either this sort of code uses
> alternatives, that have an in-built config dependency, or the
> has_whatever() stuff that has an alternative implementation if the
> correct config option is not set.
> 
> For case 2, I think hwprobe is doing the right thing (for now) but
> /proc/cpuinfo needs to be changed.
> 
> Case 4 probably needs an audit to make sure that nothing is going
> awry. I'll go have a look through the users.
> 
> If other people think splitting this up a worthwhile endeavour, I'll
> go write some patches. I do FWIW. Or maybe I am overlooking something
> that makes this less of a problem than I think. LMK if so :)
> 
> Thanks,
> Conor.

Hi Conor,

Here's a summary of my thoughts, which probably aren't adding anything new
to this

 - The kernel needs per-hart bitmaps expressing what extensions are
   supported for each given hart.

 - The kernel needs a bitmap expressing the LCD of extensions across all
   harts.

 (The two bitmaps are clearly expressing the intersection of what's
  supported by a hart and what the kernel is aware of, since the kernel
  must allocate the bits.)

 - Extensions in DT/ACPI that the kernel is unaware of get ignored by
   the kernel and not exposed to userspace (if the extensions are for
   U-mode and U-mode has another way of determining their presence to
   use them, then good for U-mode)

 - The kernel will combine information from one of the two bitmaps listed
   above with other information, such as config information, to decide
   when / if an extension should be used by the kernel and/or exposed to
   userspace (it'd be good to have a consistent API for these types of
   checks which combine extension presence with other information)

 - The kernel will expose sanitized extension information to userspace.
   S-mode only extensions do not need to be exposed and extensions that
   require kernel support should only be exposed when the kernel is
   willing and able to support them. Additional properties of extensions,
   such as block sizes, also need to be exposed (exposure is done through
   hwprobe)

I think we have most/all the above already, but the audits you've
volunteered to do would be welcome, along with maybe documenting
it all somewhere. Then, after that, all that's left is the "what to
do with /proc/cpuinfo and hwcap?" question. Can we simply freeze
what extensions are exposed through them and mark them as deprecated?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
