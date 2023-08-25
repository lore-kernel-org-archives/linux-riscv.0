Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA19C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up+KvFMnSqALJcTDr1D/LKjDu7kgikoLEtzAf+Tx9iA=; b=xZ8MHPvfwxzkQb
	6u4TWCPF9qTsZU1sahtN+rCxDM1QPYjF0EwBUnk2qIhnsmS2YcVQCOz0auQ8TV7KeiAL6whLeYqGS
	u2PbLEx2DvNMOPawRzR6JbgL33cXUvX4MP2jcn8n7Br5ecaF4JPFGWIMvy7/iEQDI3PkavxWEKncA
	Xa0MOyVWHGkEAFe4B6T1qdjRRwbpF7Zy0nW467oUTT1ZfNgY1hPDpl+OcyklYER08qOJZfJ+IMw5E
	6sWsRDjf+acuXsmNup/6mdUvYvuYRGpcBgy+PgLGNvTP6kVXJDmzkWt9gAQlnnQEykEI5J/SFi01P
	aX+JvDbyEsH973DmSVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbd2-005sQ1-0v;
	Fri, 25 Aug 2023 18:33:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbcy-005sOf-2L
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 18:33:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68bed8de5b9so1018780b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692988426; x=1693593226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lUGjqed5vBEF61//Ts3J+LsbHjaPbzQsfTJT+JEbFA=;
        b=fs2vsxHkz2wP7TObW5d0DadYscN9gIp3iQDmbXDJFZ9TXLBpCjfEgbr249m+hpnt0H
         N8eHUiqtK7UcSX0JDYTqI1A6bnyDPDj8c4Ou7YGA0GVwgInqr0iTvOzvDiJxGlCaQxLN
         RIAxlHY6RydO0bYtLOKbnqDYX0Yp0fkHde1d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692988426; x=1693593226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lUGjqed5vBEF61//Ts3J+LsbHjaPbzQsfTJT+JEbFA=;
        b=CVmiFKao7637U+gHX6gW1dKtsPuYL8n1+ZBBwhQ5iirq7mLl9uWVIiOANWyQFCh317
         vmcaWWz18t4Kab6yARxa4XiiFA5xHduELO6jx1neSG9JwFThm5FNMRi+qyatAOrTtM9Q
         Kp8YbEFSAY+cVtSjXHTEfsa7CcJtx/xlfv+Rzp6NLHhAAPX1D3oE8R9XgVcGDDpRCFO/
         0V7bkKxqqohKeuo79GGM7mxIIcHyoyaa+wUCJ9/9odThpEsIyO86xvIRiXRasReHgfc/
         HNIfd4UgEkLweeSmsv/Q62VnDt1iI0+uT3h+R3XdK7Pv7owARhIcGh5pGoig7L6sFWc+
         Asbw==
X-Gm-Message-State: AOJu0YxHWY0YVeSoNZv9bv7oFBtxe2xUlQkzoPQyZErfla9Mvt1g11pO
	s4kW5qPvdy5oFqEvsWnWYzeuTw==
X-Google-Smtp-Source: AGHT+IGDxoqIqcJZyjYGVuOgm8M01AX2FlPXYmdv5h9gJHh0STQ7ADq/UhT1DHG724uSr8yjfQvnWw==
X-Received: by 2002:a05:6a00:23c6:b0:68a:406f:8a11 with SMTP id g6-20020a056a0023c600b0068a406f8a11mr18065379pfc.15.1692988425770;
        Fri, 25 Aug 2023 11:33:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7838e000000b0065980654baasm1891186pfm.130.2023.08.25.11.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:33:45 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:33:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251123.D87F05DC@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <87a5ufvefl.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5ufvefl.fsf@mail.lhotse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_113348_786968_455717AA 
X-CRM114-Status: GOOD (  29.01  )
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

On Fri, Aug 25, 2023 at 04:11:58PM +1000, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > Doing a "make help" would show only hard-coded Kconfig targets and
> > depended on the archhelp target to include ".config" targets. There was
> > nothing showing global kernel/configs/ targets. Solve this by walking
> > the wildcard list and include them in the output, using the first comment
> > line as the help text.
> >
> > Update all Kconfig fragments to include help text and adjust archhelp
> > targets to avoid redundancy.
> >
> > Adds the following section to "help" target output:
> >
> > Configuration fragment targets (for enabling various Kconfig items):
> >   debug.config         - Debugging for CI systems and finding regressions
> >   kvm_guest.config     - Bootable as a KVM guest
> >   nopm.config          - Disable Power Management
> >   rust.config          - Enable Rust
> >   tiny-base.config     - Minimal options for tiny systems
> >   tiny.config          - Smallest possible kernel image
> >   x86_debug.config     - Debugging options for tip tree testing
> >   xen.config           - Bootable as a Xen guest
> >   tiny.config          - x86-specific options for a small kernel image
> >   xen.config           - x86-specific options for a Xen virtualization guest
> 
> I think we need a way to opt some files out.
> 
> It's a bit ugly on powerpc because there are so many fragments:
> 
> Configuration fragment targets (for enabling various Kconfig items):
>   debug.config         - Debugging for CI systems and finding regressions
>   kvm_guest.config     - Bootable as a KVM guest
>   nopm.config          - Disable Power Management
>   rust.config          - Enable Rust
>   tiny-base.config     - Minimal options for tiny systems
>   tiny.config          - Smallest possible kernel image
>   x86_debug.config     - Debugging options for tip tree testing
>   xen.config           - Bootable as a Xen guest
>   32-bit.config        - Build a 32-bit image
>   64-bit.config        - Build a 64-bit image
>   85xx-32bit.config    - Build a 32-bit 85xx image
>   85xx-64bit.config    - Build a 64-bit 85xx image
>   85xx-hw.config       - Base hardware support for 86xx
>   85xx-smp.config      - Enable SMP on 85xx
>   86xx-hw.config       - Base hardware support for 86xx
>   86xx-smp.config      - Enable SMP on 86xx
>   altivec.config       - Enable Altivec support
>   be.config            - Enable Big Endian mode
>   book3s_32.config     - Base support for Book3s
>   corenet_base.config  - Base support for corenet
>   debug.config         - Enable PowerPC specific debug options
>   disable-werror.config - Disable -Werror
>   dpaa.config          - Base suppot for DPPA
>   fsl-emb-nonhw.config - Non-hardware options common to 85xx and corenet
>   guest.config         - PowerPC specific virtualization guest options
>   kvm_guest.config     - Bootable as a KVM guest
>   le.config            - Enable Little Endian mode
>   mpc85xx_base.config  - Base mpc85xxx support
>   mpc86xx_base.config  - Base mpc85xxx support
>   ppc64le.config       - Enable ppc64le mode
>   security.config      - Common security options for PowerPC builds
> 
> And some of those are not intended for use with "make foo.config",
> they're used internally for generating our "normal" defconfigs and they
> don't necessarily work on their own.
> 
> Also I'd like to add more fragments in future, to the point where nearly
> all our configs are generated by them.
> 
> Can we have some way to differentiate fragments that are intended to be
> used with "make foo.config" vs just being used internally to generate
> other configs.
> 
> The obvious thing would be to use a different suffix, eg. "foo.fragment"
> for internal use fragments. That would require changing
> merge_into_defconfig and merge_into_defconfig_override to not assume the
> .config suffix, and update the users in arm, arm64 and powerpc.
> 
> The other option would be to ignore .config files starting with eg. "_".
> 
> +       @$(foreach c, $(filter-out $(call configfiles,_*.config),$(call configfiles,*.config)), \
> +               printf "  %-20s - %s\\n" \
> +                       $(shell basename $(c)) \
> +                       "$(subst # ,,$(shell grep -m1 '^# ' $(c)))";)
> 
> Not sure which is preferable.

Yeah, I wasn't too happy about some of these results. There seems to be
three cases a fragment:

- user-visible make target
- used internally
- arch-specific settings for a user-visible make target (redundant)

Only the first should be visible. The trouble is that some user-visible
targets are arch-specific.

I think I like your idea of having both .config and .fragment... I'll
give that a try and see how it looks.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
