Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBCBC3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+LvoKbeSsedo8reNgh5qtTsCyb1NUJ975NAw00/aSQs=; b=B0UIlJRDgWBqDHAOzrftxN8Cra
	hcP4XJ18buaWqkUWo1mbE06yGrLyG/2l32U88h1Vtf8sdpxdaewP6xMI8dYk/PPn9J+CKbChwAE0N
	svGfMzt9M5MGJn2jemtsyxXWRlxf9EMPoc4p9hDW2SCT1rrIpCKltBffzRZrKMZqmExV2dV823mZY
	rOpmqJMQGWXS/U9eVRqd/BVXQ+ePzi44+W8XBQykUgpjxRVS0oHgJwXEB0Spt5uYrIfbO7TSh/awZ
	RHHYWWYR/Mf74/OS09gBNr5QwpzntuFovvkL0yqwv1cifALu8IEn2OY1OWZg88abeJL+3Sr5G5b69
	UHGxdSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Ma-00000001Sgu-3hcp;
	Thu, 08 May 2025 17:48:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5MW-00000001SgF-21ZX
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 17:48:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22e16234307so15315525ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 10:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746726527; x=1747331327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYqLmfWWYnfjqyKiU4qtxry5bO8L2HemS6Lj3IB5Ozo=;
        b=V6HkS5W5IqP3X1aQL71NfKXja6yHttUa5YxKmZ9o8FPxGN2pW3URD/60nE597JDaM3
         fUDCnOwkzxBgFLFBxu6PQPBS087pR974sRcj+wQxsFs86ybW15YODjuhS6aeCtsXAfbZ
         zZ2UctNaWinIZEQMf5+8vVBrSccloFdafBAfvZdUnIJ0HM1rJA8rjJmgFIDyJSk497Gc
         K3FFMpkOjNrPhN5SVU3mh4o9JcBh99pi5qy9GrydO35d737GzB+hzZrP/8ZGIWB3wwnS
         yGrdSF0E1L0cN9tR0dCH86LZ+iUqWWqaKcvlvYCq2xWD9CODdjNnDkyIM62m7h3IqC+p
         sW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726527; x=1747331327;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYqLmfWWYnfjqyKiU4qtxry5bO8L2HemS6Lj3IB5Ozo=;
        b=ONJNCLO1hQfYjZ0U7lCBuPb/UKp1KLQWOmSMc+G/x2tbsktwKOQiAFKv8WAPe/qoXS
         aNU2ifZRvE6e4fHHEu9ff6rqCQURmGrc626x0AVtaD6LErfQq1Dic0mJvtgHReENCDfT
         MvfGQaVUwepVCTfxWhbdz5Sq4pzDEmJ2LDtAWiGIxi3eUPQMfnzdKltHebwpmszCmtI2
         3EEsG7iFRWKKUQPhsy2PkfQFQOpNg4HOOM6ivoNOzzsrU/8b98ynKrglRx/WcYHzPVqs
         Kk5orS87y9SSim2T9gx670rxlnbZSNzJoWx3qG82iDp7VHYOmQy1Q9bDzeFAOSgIx/Px
         oBEw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Da5qEvngZjDJO+T5zkWIk8GuuqTv8z95LABrHJB6Sj42bugg0w/1BvtknUJ2xODBMa0kx9rBRT9UTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKEInlkfAjhZv5Y653rsAUxEZqo0wbmdCcUiTbrEYH5n20AvQQ
	trSH0iWD7UoVQXHNNEITA6auLQGs2D7rZ40tmR52SDLsTKGBuNUBNvKF+rva/zm62QfRDvD/KAs
	e
X-Gm-Gg: ASbGnctRkzy1hBuUiIAfrEG5tfUVYWSck+21uzPlDGGvz65pISDc/LBGwgwipoJzq/s
	IE5vB+r8f1Rv+wdlwTpb44yrZSkOOy1sNDf0Qf3BBtfgSjVBlwCQit4yz+tLn8R+S+dDlG7WFl3
	ISBIdt0M/k7Eu11tXEAHv2/mOy5sDG6Cmn47Ds6HodOJLd7S/H9ZcoEA7F0855Rd/DHrKV/7pOs
	YFdDeF6E1JbVAxrMJuOHUEvmRhm5ShH54jkwler4KO+x26qsIf6tm9UG6Hp/YbTfQ7YuQ7JpFp+
	4wR/TH3OqJhlIGpEbkzWeneQhiVoRnEw9Jw2eZUkrTXf
X-Google-Smtp-Source: AGHT+IH82nPRzsrk8rYddBvn02C0V4vxqNATQ/FAfbV0gyTYbn992YmIneFZFLQQNKd12/Qa8kEAyA==
X-Received: by 2002:a17:903:8cc:b0:223:517a:d4ed with SMTP id d9443c01a7336-22fc938ca63mr1882425ad.15.1746726527509;
        Thu, 08 May 2025 10:48:47 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7547838sm2322225ad.18.2025.05.08.10.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:48:46 -0700 (PDT)
Date: Thu, 08 May 2025 10:48:46 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:48:45 PDT (-0700)
Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
In-Reply-To: <Z8rMKZoDYmpNosSj@atctrx.andestech.com>
CC: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alex@ghiti.fr,
  tim609@andestech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben717@andestech.com
Message-ID: <mhng-d0a8012c-c5c9-4309-ac08-bcb1dab85b26@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_104848_517201_3417890A 
X-CRM114-Status: GOOD (  28.36  )
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

On Fri, 07 Mar 2025 02:36:25 PST (-0800), ben717@andestech.com wrote:
> On Thu, Mar 06, 2025 at 04:40:49PM +0000, Conor Dooley wrote:
>> [EXTERNAL MAIL]
>
>> Date: Thu, 6 Mar 2025 16:40:49 +0000
>> From: Conor Dooley <conor@kernel.org>
>> To: Ben Zong-You Xie <ben717@andestech.com>
>> Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
>>  paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>>  alex@ghiti.fr
>> Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
>>
>> On Wed, Mar 05, 2025 at 11:05:26AM +0800, Ben Zong-You Xie wrote:
>> > The first SoC in the Andes series is QiLai. It includes a high-performance
>> > quad-core RISC-V AX45MP cluster and one NX27V vector processor.
>>
>> I'd expect a config option like this to come with the user, which in
>> this case is the dts etc for a board using the QiLai SoC or drivers for
>> the SoC. Without dts or drivers, there's no reason to ever enable this,
>> so where are those patches?
>>
>> Cheers,
>> Conor.
>>
>
> Hi Conor,
>
> We are still preparing those patches for upstream, and we will add them
> in the next patch series.

This is still "Needs Ack" in patchwork, so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Though like Conor says, we need the rest of the code to do anything 
here, so that's really just a way to get it out of my queue ;)

>
> Thanks,
> Ben
>
>> >
>> > For further information, refer to [1].
>> >
>> > [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/
>> >
>> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
>> > ---
>> >  arch/riscv/Kconfig.errata | 2 +-
>> >  arch/riscv/Kconfig.socs   | 9 +++++++++
>> >  2 files changed, 10 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
>> > index e318119d570d..be76883704a6 100644
>> > --- a/arch/riscv/Kconfig.errata
>> > +++ b/arch/riscv/Kconfig.errata
>> > @@ -12,7 +12,7 @@ config ERRATA_ANDES
>> >
>> >  config ERRATA_ANDES_CMO
>> >  	bool "Apply Andes cache management errata"
>> > -	depends on ERRATA_ANDES && ARCH_R9A07G043
>> > +	depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
>> >  	select RISCV_DMA_NONCOHERENT
>> >  	default y
>> >  	help
>> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> > index 1916cf7ba450..b89b6e0d1bc9 100644
>> > --- a/arch/riscv/Kconfig.socs
>> > +++ b/arch/riscv/Kconfig.socs
>> > @@ -1,5 +1,14 @@
>> >  menu "SoC selection"
>> >
>> > +config ARCH_ANDES
>> > +	bool "Andes SoCs"
>> > +	depends on MMU && !XIP_KERNEL
>> > +	select ERRATA_ANDES
>> > +	select ERRATA_ANDES_CMO
>> > +	select AX45MP_L2_CACHE
>> > +	help
>> > +	  This enables support for Andes SoC platform hardware.
>> > +
>> >  config ARCH_MICROCHIP_POLARFIRE
>> >  	def_bool ARCH_MICROCHIP
>> >
>> > --
>> > 2.34.1
>> >
>> >
>> > _______________________________________________
>> > linux-riscv mailing list
>> > linux-riscv@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
