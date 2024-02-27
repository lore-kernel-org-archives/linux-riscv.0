Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A55C54E41
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MzalakFrITBBpgetQ3I5bLq21AFJh0oCZe8764MwG+w=; b=kZvXAyGX1wacSdyrWTG4qTnC2O
	A9BNKKftgioeYcgTbHKB6HIHfqrfweDVXlvtuUe+2P5wbv1VY1DeYHy7p+nxflA7zJURuPMzWRxYL
	MDxtKtnbmrNORWotkCOf7xB7WVToSG2Fz6P/XRoW1/dnaeu0gbUKq2tkhevHEOYfV6Arx/zvoEqD4
	svHbXRVYbiMjRq7zPdcrX8FyxZemRWpVjpGtzK6YziFFRHXuhH8iy/TGtPwLwMtOnNmGB/tmElNLR
	JE5UKEOaTxOuaral107g3gumQJoOBB4UOIYLNPgcO0JIhFahOQbuVOcGm4+nM2bPm8ZFF0W+ybyw7
	P8kIlcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2p2-00000006Z0t-3sPx;
	Tue, 27 Feb 2024 19:09:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2oz-00000006YzU-3a2i
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 19:08:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6de3141f041so3015141b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 11:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709060937; x=1709665737; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aDa40DJKClW8mXYqnyP7bggV377JTuxgqEkMOwvAuyk=;
        b=lEnp6ixnjYIs2gXvONN47Xo4LlK78+048w3TObR1YNVcS4lOLeAmyBylur0cGFKDv4
         u9Iz4WBo8M9LHZ6JeeEX0g5M2ihzGsuvdVGKbMgxPE6GwlvohdxCCKePJFOzATsitudB
         3TzVr50IEm6Xsb7emF6kHoWlaXlnhLN7sX4OyRjPZn3qq4UyNq1u957NxakVSnTmELh7
         YyQY5HypL0NDwJY6E6SmVAXD4vPHQQO8GQr8Zb2N4iwbaH/azUwJBO6BEhdMZP8SZ5ZQ
         5s7VfLh1clhr7g74q5LI6PWEt/+zvaYoylmE9MjyzPkzIShIcVXmNrP+beoxsf8ASF7l
         Z3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709060937; x=1709665737;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDa40DJKClW8mXYqnyP7bggV377JTuxgqEkMOwvAuyk=;
        b=LNqix6uiVJiLUc4RPF5LKowFc3lApg2gunxOCWaURZCYqE90kgCMYEiauQZb7d/scZ
         mn88dk7HXH4/AHK8d+9ebwcKb6FkblmDqPflLEdxjEOCX2leVnTHMeMX30WeeWjEglvp
         w31Lk3Nw8TZ263nEXjMnmXw4+ZesPWBQ47W32rCdI6ZI4HFpeRG8vdnMfqKpYZIBVfYl
         MoD5vlGo8qXDdBG4q298gzM9pYWND1yp6XqH2I7x4Y793PDZ3QjViRdDEm7JAP33d+yj
         rfMF5J9JSjP7Gx8337DLWoybr6+M1eTGIsAEsz4sSw2xbTCi0wP1kF7/Smy6cmpc0G7t
         t3hA==
X-Forwarded-Encrypted: i=1; AJvYcCXKkNZ+EPe7lbbqYbrQvLrXd1+sqTnhoStGmkTEGTJB00/LKSO7fzssVyouza8Il5k2AeNQ1LkGJak+1fY+0XEyhJuEut3EWklXyx2DT5Z9
X-Gm-Message-State: AOJu0Yy9vXaEsB4awlkhIh8o6WMS8W7+t/njQ7xd99IbHC7LJTUUyudy
	1VkMp0JD6adi6WVyc4iQjsFfvQjZbRHJZNQJiTvdgbwQAba/S+pEbkibB7S7fIU=
X-Google-Smtp-Source: AGHT+IGtXhFFwEJ+AgMWI6EdwH6IahppDs+nYPC080WdpMAQ57X/AOuTkrytFfwmna6ljKJ3aYPMfQ==
X-Received: by 2002:a62:aa0c:0:b0:6e5:54a6:5a9c with SMTP id e12-20020a62aa0c000000b006e554a65a9cmr1287142pff.17.1709060936644;
        Tue, 27 Feb 2024 11:08:56 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:d617:f08f:e330:49c1])
        by smtp.gmail.com with ESMTPSA id u3-20020a62d443000000b006e24991dd5bsm6713883pfl.98.2024.02.27.11.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 11:08:56 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
 <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
 <87ttlzsyro.fsf@linaro.org>
 <4adb0c7e-34a1-4c50-b011-6e31ef8813a7@sirena.org.uk>
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
In-reply-to: <4adb0c7e-34a1-4c50-b011-6e31ef8813a7@sirena.org.uk>
Date: Tue, 27 Feb 2024 16:08:53 -0300
Message-ID: <87plwh912y.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_110857_907619_EE560B4D 
X-CRM114-Status: UNSURE (   8.76  )
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


Mark Brown <broonie@kernel.org> writes:

> [[PGP Signed Part:Undecided]]
> On Thu, Feb 22, 2024 at 11:24:59PM -0300, Thiago Jung Bauermann wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> My rootfs is Ubuntu 22.04.3. In case it's useful, my kernel config is
>> here:
>
>> https://people.linaro.org/~thiago.bauermann/gcs/config-v6.8.0-rc2
>
> Does using defconfig make a difference for you?

No, I still get the same result with the defconfig.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
