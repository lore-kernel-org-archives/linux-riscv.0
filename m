Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E3DC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 22:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RAZiBLq8CL+HeD1fr++R9yL1T7LVsJ8ewjLReiXJRbw=; b=uKlaihrJp+5inYKB1UP1EUtM8T
	6AUOqTT0nu4FbNYcLyUroKMIeQcMt6un9FZgOkeJenJeZ9yxu6naen7kz7WMrGg0YqfJyJUnS3WhF
	wVzA+a1nzr+q/nN0BWEwwehfgBVjAT/nwokai3wcecVmA8X93z+LtF0cnozhk/rbioOehuEHdX7mI
	RvucM8oPA+QW1F3d5MxDxcfe2Gb214wckIpSGFkCypTmSC1HvxspE4ajK4HXFPQ5yym3UOBtBuhFT
	LAOLq/jzPxyCw2tZ9NHXmXKe9GL4Kv6B4gjGK3iFHgeyek2q+uoPrk6NC5Sw5MKXScQ0+XPyD610j
	V3yAtfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfofD-0000000FR4m-39Zk;
	Thu, 29 Feb 2024 22:14:03 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfofA-0000000FR2a-0qHF
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 22:14:01 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c1a9b567edso610137b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 14:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709244838; x=1709849638; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=F0bbqczj3Keglw64JiNfdvO4M759XtAlzANrlsOPWOc=;
        b=UiU9yTfPWT8nNGbi5TCCEuQhWrmxSDLVUzKyn9ywgomuTu0ZvouwWKF41Jaq1/130F
         zTrIm39OCrSl349Jum/KCVCznh65eSefP85CE5r1ME/rDYlsPCRtLlckSui0VhqrasNW
         Q2cBtY/WX0MAAdeSebx72Q8+dV623wC8KPeY3yBgnUMnfpF6GAbQ2fLzD1bnAn+yxi9d
         kMlH/QwNFAFie8k4C/OcdvRtOUNKG1KvqGON0opXpXC+R+Rz7QD/j+4VwNV/Td6jhHRL
         v+tjQM1o42cEkNzzhyw5/FkqLjkfUhe2l+O+oOhDmvnR6d9npP7a+Bcgbdqvyxp0zVJO
         wdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709244838; x=1709849638;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0bbqczj3Keglw64JiNfdvO4M759XtAlzANrlsOPWOc=;
        b=uFKTtgwPllCRd9bAUxxzTwLpGUHXdJpq9icIvy24l8DeHo4QIy9C6I3LjQWlCRaZmC
         WwudEgwD3mNzxCFiE6zfxoS7So1UoTkCmKCthgLUVf6LjLLVMzxUbjQnzTEyMhNAxudl
         Uzg+5DHrKMS9xpSGDxFjcJvz225AFs0yYcj8lK5udlUpSdRxAmbWPRAROruA/LArKOYd
         LkkMqnVpplIFY7gClt5rfYcN6/Axa5EgG+yy2pTVISFGBBUfrOmnZvQdfG8A0eCUMxXG
         xn5WuH28zMMzUMVDf1vE/mtL7YjpqYp54ad2HjdwLuMcbg8F+M9Vs0oBcgMuNHGfRw7f
         dfSg==
X-Forwarded-Encrypted: i=1; AJvYcCXaxOFLjCN6Cm1UNZaCKuIYLAzeWZtqCHJBwGwdCM8T2ZZCBJWiksCRLY7hqHnN2Mu5R5Sg2zkU1RgeRyD31/h2SWMS4SDrfWIGghu6z3ER
X-Gm-Message-State: AOJu0Yz1x1wDx8nJ3eIxWEqxuJkT6bFpTZBoiMJjzTy3kjASdmqtsc2n
	YLDER3KJNF91weWNjkJd2MbzKCf0O3Y9pGOwInCB54ooYc37Dusiq70Dl6igQHE=
X-Google-Smtp-Source: AGHT+IHdJxypAmK3qvNYc2vGOAmkw9y2ZwPcLUGqtAKe2grsU0Su0E62P6Tt4LBvrgbMxt6+5DcYzg==
X-Received: by 2002:a05:6808:438f:b0:3c1:c2e6:b046 with SMTP id dz15-20020a056808438f00b003c1c2e6b046mr3051822oib.23.1709244837897;
        Thu, 29 Feb 2024 14:13:57 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a90b:ac37:af4a:feb9])
        by smtp.gmail.com with ESMTPSA id ei4-20020a056a0080c400b006e57e220ceasm1771460pfb.6.2024.02.29.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 14:13:57 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
 <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
 <87ttlzsyro.fsf@linaro.org>
 <c710a6b1-cf58-4e32-ada0-c0b256a62b2c@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 33/38] kselftest/arm64: Add a GCS test program built
 with the system libc
In-reply-to: <c710a6b1-cf58-4e32-ada0-c0b256a62b2c@sirena.org.uk>
Date: Thu, 29 Feb 2024 19:13:55 -0300
Message-ID: <878r329avw.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_141400_297952_A449E475 
X-CRM114-Status: GOOD (  20.96  )
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


Mark Brown <broonie@kernel.org> writes:

> [[PGP Signed Part:Undecided]]
> On Thu, Feb 22, 2024 at 11:24:59PM -0300, Thiago Jung Bauermann wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> > I believe based on prior discussions that you're running this using
>> > shrinkwrap - can you confirm exactly how please, including things like
>> > which firmware configuration you're using?  I'm using current git with
>> >
>> >   shrinkwrap run \
>> >         --rtvar KERNEL=arch/arm64/boot/Image \
>> >         --rtvar ROOTFS=${ROOTFS} \
>> >         --rtvar CMDLINE="${CMDLINE}" \
>> >         --overlay=arch/v9.4.yaml ns-edk2.yaml
>> >
>> > and a locally built yocto and everything seems perfectly happy.
>> 
>> Yes, this is how I'm running it:
>> 
>>   CMDLINE="Image dtb=fdt.dtb console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda2 ip=dhcp maxcpus=1"
>> 
>>   shrinkwrap run \
>>       --rtvar=KERNEL=Image-gcs-v8-v6.7-rc4-14743-ga551a7d7af93 \
>
> I guess that's bitrotted?

Ah, sorry. When I renamed the Image I messed up the kernel version in the
filename, but I did confirm via "uname -r" that I was running the
correct version: 6.8.0-rc2-ga551a7d7af93.

>> My rootfs is Ubuntu 22.04.3. In case it's useful, my kernel config is
>> here:
>
> ...
>
>> https://people.linaro.org/~thiago.bauermann/gcs/config-v6.8.0-rc2
>
> Thanks, it seems to be something in your config that's making a
> difference - I can see issues with that.  Hopefully that'll help me get
> to the bottom of this quickly.  I spent a bunch of time fighting with
> Ubuntu images to get them running but once I did they didn't seem to
> make much difference.

In that case, it's interesting that I still run into the problem with
the defconfig. One thing I failed to mention and perhaps is relevant
considering your result, is that I didn't copy the modules into the disk
image, so the FVP was running just with was built into the kernel.

That was actually the main reason for me to use a custom config:
I didn't want to have to deal with kernel modules, so I created a config
that didn't have any.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
