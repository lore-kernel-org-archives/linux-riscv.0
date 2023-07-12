Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F2DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gY6VU/+uD4GWYy8EoEjBAHgEaeYnaJjFHB1DqSVhlvs=; b=gd6bn3Tdh2qmITLgTKQjIcTxzY
	Js7t4g0XaJVqW4f1pPS2WhhGLmMSxc3vAVws0CXalXkQG4dLoB+OMU1goHey7JvhdJ5iW4W1wFulD
	2pNWyEI6sn5UZFoN9+arDQ7PT+hWnTlIXIMxymk8seL3oj3Vnsoi2WXaK3F/898pqmR4TJUN8IH7a
	cMu6VmwQsxPx/yP7CYXL0o3wPQCBm7A0c359aXofOCUtW/YBHO7t4v6nKSoXn/5rH5o1EVXNnVFDs
	y563GSDDiGZ8lfWhdhIqrY4dTC36Dq6XvdhCKvT3xAU8KAm0RkqSDGj6A4IE9I6mKnc01D/0f/Xsy
	+H1cofSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdTQ-000j7x-32;
	Wed, 12 Jul 2023 17:17:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdTN-000j5y-2P
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:17:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b89cfb4571so54137005ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689182270; x=1691774270;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOHJpaV9spk7YU3hIifnloCwT9SLJrlcBANW/E2Q3EA=;
        b=JKCddv+X0yohSv0WaQoV2igoD1yDzNf5+4WAl0W6jPLlJdnmpoRBis+ASIPjmovKyL
         F3vuyir6zhJ2bt7ubODdVcFyC9rBNBiZgV6d0ly0Mxd+xg50M/woLzaNddOKxgAC/tQB
         fstvCG48KXzbxTfd8N/47zbqQzW/NLfx8iZahHpIiO9NdYkoxxVuXArcqaGdgdWgRiKa
         D6kUccQEHtcW5BJXPDekWzmF9Dab7ipOqKchyMCLar+JAu/4j1sw+XUlFmb7kRbPy0JP
         I+xD670PcInyiFQsGO4FRSBB7/wtRAxW8MpQXvnKwbZKftWRpqj23RUECZIUCrfGMj8P
         EHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689182270; x=1691774270;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOHJpaV9spk7YU3hIifnloCwT9SLJrlcBANW/E2Q3EA=;
        b=Ag19prIeUp10WsodfotiG6+wZuKNYf9epFYiy78C6JuAVLeIAGWGiiO+GI0VqTnZxr
         CoyWrVg27VAaoZ/sbGONNEysfyODf9a4kV64xLmSD/pPnNZTNfe4j8CqAZ90Lo+Bgvbs
         vdyMvt6r40Ue1YwMi7bCT46HES+GK2Cf9YAtsF1iubU2t7zVVGRVUxSt6tcqc7kQHDB1
         ntt763CV2ql0G4Z+93gxM3G3u3hphkgfD1Vb//tjYvgfBKXLAch7un5/jP65KnBy81Bd
         mCm398KyZPnmgEjKb17r+sBY4ZpemlSlPkzfeirN8QVkCv34d1s59EijlvsRZiarAhRM
         I4vA==
X-Gm-Message-State: ABy/qLbS2KffzWgLVrldlcM074bQrq1QakhHobHttNyaQurhNJif/hPP
	h1grHmgGgZ9VdogLqOL/CvC+89IC3q576UNBtEU=
X-Google-Smtp-Source: APBJJlGiz8G/GR/jsVJZ3aAv7VWFpyzw1iDJs0kN1K7GI2snJA4uqfJ6xwoXiQN5ljzafMlVchROkw==
X-Received: by 2002:a17:903:1111:b0:1b5:64a4:be8b with SMTP id n17-20020a170903111100b001b564a4be8bmr24218721plh.35.1689182269684;
        Wed, 12 Jul 2023 10:17:49 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id e15-20020a170902ed8f00b001b7fd27144dsm4243375plj.40.2023.07.12.10.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 10:17:49 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:17:49 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 10:17:02 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Don't trust V from the riscv,isa DT property
In-Reply-To: <20230712-legislate-dental-8488c6b9c0cf@wendy>
CC: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>,
  Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-821b3125-d05c-4a68-8952-1c54397451c3@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_101754_199236_9011CF43 
X-CRM114-Status: GOOD (  54.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 12 Jul 2023 04:38:51 PDT (-0700), Conor Dooley wrote:
> Hey Palmer,
>
> On Tue, Jul 11, 2023 at 03:33:17PM -0700, Palmer Dabbelt wroteh:
>> The last merge window contained both V support and the deprecation of
>> the riscv,isa DT property, with the V implementation reading riscv,isa
>> to determine the presence of the V extension.  At the time that was the
>> only way to do it, but there's a lot of ambiguity around V in ISA
>> strings.
>>
>> Rather than trying to sort that out, let's just not introduce the
>> ambiguity in the first place and retroactively make the deprecation
>> apply to V.  This all happened in the same merge window anyway, so this
>> way we don't end up introducing a new ambiguous interface we need to
>> maintain compatibility with forever (despite it having been deprecated
>> in the same release).
>>
>> ACPI still trusts ISA strings, so we'll leave that alone.
>>
>> Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Thinking a little harder than I did last night, I think the diff should
> actually look something like the below, if this is the approach that is
> going to be taken:
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bdcf460ea53d..4b759cd2e3be 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -334,6 +334,26 @@ void __init riscv_fill_hwcap(void)
>  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>  		}
>
> +		/*
> +		 * "V" in ISA strings is a ambiguous in practice: it should
> +		 * mean just the standard V-1.0 but vendors aren't well
> +		 * behaved.  Only allow V in ISA strings that come from ACPI,
> +		 * as we've yet to build up enough history in ACPI land to stop
> +		 * trusting ISA strings.
> +		 *
> +		 * DT-based systems must provide the explicit V property, which
> +		 * is well defined.
> +		 */
> +		if (acpi_disabled) {
> +			if (of_property_match_string(node, "riscv,isa-extensions", "v") >= 0) {
> +				this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
> +				set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> +			} else {
> +				this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> +				clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> +			}
> +		}
> +
>  		/*
>  		 * All "okay" hart should have same isa. Set HWCAP based on
>  		 * common capabilities of every "okay" hart, in case they don't
>
>> This came up as part of some discussions about the T-Head vector
>> support.
>
> I guess what I brought up was the various T-Head devicetrees in the wild
> that contain things like "rv64imafdcv". The Sophgo sg204-whatever has
> that, and it has one of the "cleaner" downstream trees containing
> support for the T-Head vector stuff. Usually I would not care all that
> much about downstream trees, but it does mean that downstream U-Boots
> and OpenSBIs will likely use devicetrees that contain similar stuff & we
> do have to deal with being passed those.
>
>> I haven't actually tested this, but Conor and I were talking
>> about options and it was easier to just implement it than describe it.
>> It's kind of clunky to only parse that one property, but we're already
>> in a grey area WRT having the DT bindings that we don't parse so maybe
>> that's not so bad?
>
> It looks super clunky to be honest, but the alternatives are not all
> that pretty either. Either we could disable detection from DT entirely
> until v6.6 when you hopefully take my series handling the new
> properties, but that puts the vector stuff into an odd spot, where no
> system could actually use it. Or, we could send my series as fixes for
> v6.5, but I think that is very much on the edge of what could be
> considered a fix...
>
>> The other option would be to turn off V when we detect we're on a T-Head
>> system as part of the errata handling.  That's similar to what we do for
>> misaligned accesses, but that's a hack that we're getting rid of.  It'd
>> be less of a hack for V, but given that we've found T-Head systems
>> aliasing the arch/impl IDs already we might be digging ourselves a
>> bigger hole here.
>
> Right. Doing anything with the T-Head arch/impl IDs is really fragile,
> since we don't know if they'll continue to be zero in the future.
> I'd argue that it is less "dangerous" to disable mapping "v" -> vector
> when using riscv,isa on any T-Head systems w/ a zero archid/impid, than
> it is to turn on their v0.7.1 flavour under the same conditions, but
> that just amounts to a more niche version of what we have here.
> I still don't think that it is a good idea to do it in the errata
> handling code (at least how we have it structured now) since it could
> affect a cpu, like the c908, that does actually support the standard
> version of vector, if it still has impid/archid tied to zero.
>
> Disabling mapping "v" -> vector is a bit of a big hammer, since it hits
> behaving implementations too. I'd be inclined to limit the impact to
> just the known misbehaver & make the condition
>     if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID)
> or something along those lines.
> That way, it's only being disabled for T-Head systems that attempt to
> use "riscv,isa" to communicate support for vector, and T-Head systems
> that may pop up in the future that support the standard extension can
> use the new properties?

We were talking about this some in the patchwork meeting, I think the 
general conclusion is that there's really no good options.  It does seem 
reasonable to avoid penalizing vendors who follow the V spec, though, so 
unless anyone else has an opinion let's go with the "only ban V in ISA 
strings on T-Head machines" flavor.  Looks like T-Head will be shipping 
non-standard V for a while, so by that point the DT properties should be 
well established and we can just have them use those.

Do you want to re-spin the patch?  I can dig it out of the email if you 
want, but looks like you've got the diff already...

No rush on my end, just LMK -- it'll be too late for this week either 
way.

>
> Hope that makes sense,
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
