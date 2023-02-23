Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26704C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OllpRs0mtCEU5QkaCmPio8YA+sYa9zITluiUthMj3I=; b=znRLBAoo+KWF3z
	kXBUQwghUCdGbu5uBlRJ13pznPRC/zdkUNFomMY7lojRxMPbH4EZAKDSAx3V/27/yaurC3/SJenva
	jYSA4Fj33B2x0xh+f0qWpj4JljikShC01i2RrtC0OH9Dk6mhwLZotOAaQ5ReOkuZ8rhf4kOX/31UR
	it9S5eV2ZnQl8FJkq9h4ppxxh0JElDqezHcxLsJnKlcL+UP0ujkgoeGOkmLyodLXjbhfV1aZwSUYv
	bkMsPSzykUw8PuecnEW//ZwyzcX8Vbpm+fa25pyZrC1xz53KmTTW/t25fVHoJfn8MrlhMTnlPrPLO
	G0gObOi4Zh1lIrJZgEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8UQ-00Fqnr-OM; Thu, 23 Feb 2023 10:06:14 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8UN-00Fqmq-7p
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 10:06:12 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 69D505C00F8;
	Thu, 23 Feb 2023 05:06:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 23 Feb 2023 05:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677146770; x=1677233170; bh=lqOjciWNUa
	TbPpSK8T8cQbiQqBz956A9nanEyGupbck=; b=ljw/thsfIRiehOYm8HAtskNISx
	kzERBwBxp1e1n1gj+Voqu5B6kbILBeXDeAYok9KkZcTEi+x1eZOZwETx4JW9CQad
	7rUh6qHhd3hIeNhKLU3PGnqA3jekEJc04GvDsrlsUHOaV/RaTEZietG4OgZQwEJd
	pByQPJS5kv05iNvniiiEnbSSwjkqF/PRwXDH4c2Amp23ajAnmrI/8PEIkGu4US2H
	/NjCs/GTEAd3vu7DKOktRWxfYMiilqMzKSqw+O6V7MfkUyV6VhU4eX9w+8EWBxnU
	xBfEXTtz5xGhFGXjvxBYx7S4NJpFZvZv3R5UJvoEpqDcTLfURZOAq6bvF15g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677146770; x=1677233170; bh=lqOjciWNUaTbPpSK8T8cQbiQqBz9
	56A9nanEyGupbck=; b=pmfFGQOYPCPVrNb7YXtteVcO/pXfx/iF8RMeyfvsgtNi
	T+8Vg1CWTnGIBeDpRuwbozW4We4OabRfaHh6ZOSAcvDGyItI68X9soMg91tkFfKs
	MxrtQizscSVJQtJe1i+HanJ/7gxgd9KN9p7GsR8WvJQhnYeav5SndvgvJdxjmrMK
	Sj99TCF2JSNmdSg/4nYpjdeqNMP5Wj0u+yVBBoMptey2ebN3R78/fihLW/pdQ4aV
	Nidu+J0wLwwjR/hCye59VUcUyPkhPmso+DXS0rrhsUTM0lFYo10NkYl/8uvrpfxO
	e/e+WEcWLaCIPc/eNiD1R2cGnAx+LOlPoLXYzNTt/Q==
X-ME-Sender: <xms:kTr3Y5APWDxGxO1x3t0YYzj8Ec9ZKZRDqcg5j69lmxnopFwtaC3Fiw>
    <xme:kTr3Y3gcMFC1Pc6gpNdzpDrv5Mcu5smfSRiUfpmh-G8J7fMxuZ_hGfI9FA232tJNx
    1IOtQ_fIcgNVPn3bxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:kTr3Y0lHEKTj2EQurzOdA-gyZyc0bcNO_prdbhdZN6zljBpXeX62ew>
    <xmx:kTr3YzxcKcWciGMpR_e3ASgEsdx8e8ORKk1zQPAQA16Vf4QpmikAQQ>
    <xmx:kTr3Y-TxDWfYrwAWmVga6OO1Fs4Vju5aRCLpyQ2SX8mz6O4YNVft9A>
    <xmx:kjr3Y3CoVDqB_eZoZe10LaR2aRZJqCyMgdQHbKgx_cyaVgI_H5dNoQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9D021B60086; Thu, 23 Feb 2023 05:06:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-172-g9a2dae1853-fm-20230213.001-g9a2dae18
Mime-Version: 1.0
Message-Id: <605fb2fd-bda2-4922-92bf-e3e416d54398@app.fastmail.com>
In-Reply-To: <20230221190858.3159617-3-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
 <20230221190858.3159617-3-evan@rivosinc.com>
Date: Thu, 23 Feb 2023 11:06:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Evan Green" <evan@rivosinc.com>, "Palmer Dabbelt" <palmer@rivosinc.com>
Subject: Re: [PATCH v3 2/7] RISC-V: Add a syscall for HW probing
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_020611_369769_8F18E459 
X-CRM114-Status: GOOD (  23.51  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, "Conor.Dooley" <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Vineet Gupta <vineetg@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 21, 2023, at 20:08, Evan Green wrote:
> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> system call that quite does this, so let's just provide an arch-specific
> one to probe for hardware capabilities.  This currently just provides
> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> the future.
>
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>

I'm still skeptical about the need for a custom syscall interface here.
I had not looked at the interface so far, but there are a few things
that stick out:

> +RISC-V Hardware Probing Interface
> +---------------------------------
> +
> +The RISC-V hardware probing interface is based around a single 
> syscall, which
> +is defined in <asm/hwprobe.h>::
> +
> +    struct riscv_hwprobe {
> +        __s64 key;
> +        __u64 value;
> +    };

The way this is defined, the kernel will always have to know
about the specific set of features, it can't just forward
unknown features to user space after probing them from an
architectured hardware interface or from DT.

If 'key' is just an enumerated value with a small number of
possible values, I don't see anything wrong with using elf
aux data. I understand it's hard to know how many keys
might be needed in the long run, from the way you define
the key/value pairs here, I would expect it to have a lot
of the same limitations that the aux data has, except for
a few bytes to be copied.

> +    long sys_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t 
> pair_count,
> +                           size_t cpu_count, cpu_set_t *cpus,
> +                           unsigned long flags);

The cpu set argument worries me more: there should never be a
need to optimize for broken hardware that has an asymmetric set
of features. Just let the kernel figure out the minimum set
of features that works across all CPUs and report that like we
do with HWCAP. If there is a SoC that is so broken that it has
important features on a subset of cores that some user might
actually want to rely on, then have them go through the slow
sysfs interface for probing the CPUs indidually, but don't make
the broken case easier at the expense of normal users that
run on working hardware.

> +asmlinkage long sys_riscv_hwprobe(uintptr_t, uintptr_t, uintptr_t, 
> uintptr_t,
> +				  uintptr_t, uintptr_t);

Why 'uintptr_t' rather than the correct type?

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
