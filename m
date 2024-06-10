Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633B1C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 21:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gafo4af7kKcPM0dIlvyr97F7O+pV1voHiv+OGLJAZkw=; b=4zYAWjd6CjonDa7++XbkL/2379
	9ceQNj6wZwlipE2wuX1zEY2kq0ZKmrv/M5HCsm1gNxc5QxrBYOOdw1P8e1GEoUnarySeyO+PmN9a+
	V6xUwjTBjscLSxbiEob+jzlqCXfxHTAmAOncXQhNDbADYIGB+Yyzv6/hL9gv4MhNa4JsohCfb6v/M
	zpP06HSlEC2z07KrUCGv7rS8X536crsY/kTu1XbsDQITQrR+Zd4BlN9tWH7GVxlZPS3D+Bh6qBtdD
	Z+YFhf/NdwkRsTiJ/X4R8ow/kiD+blckOWde9lM9fxHCUz6G21NacDEIgMyTFpms+QVO1wty2ZINh
	GSX5DlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmEL-00000006UyZ-3Vg3;
	Mon, 10 Jun 2024 21:07:05 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmEH-00000006Uxn-2pCe
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 21:07:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-6ce533b643dso3745156a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718053617; x=1718658417; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kNEcLqnjSBSzmYInfsSoqzXQrLkZOIpu19v13Wpwyw=;
        b=VKUkFf3AfiN1y3nWa4JW8hzwHzlvw4R4BO6tnw+PAIVKeAgyUsD2FmqkYTTROFvp6f
         G5NthBkSSX7nH8pNwt83kqmIjDRBAMGAgVUgzyOidLtCesKC8j2e07OzQarBtRSi9u5j
         2s2lL0hY/EH/Ck/cw3c6Q7LRT6D3Nd+Yk3vtYVXkGVD7xcHFS7nr7Q4Hv7U2e7VoxEVG
         TK2osw7hkZUzY6ZNUgsZcbWNeC9KeueSC0iGrgI2p6fLMCIOz/jLZ9htw61JWRrVsyy9
         DAEY1DeTvjpbIg92B/tNX01y6dWKGZ2rvqav5lDBzkaqXGeCCZEbXfOCIE71G2eEM09B
         DHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718053617; x=1718658417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kNEcLqnjSBSzmYInfsSoqzXQrLkZOIpu19v13Wpwyw=;
        b=tsRqfBWtcIgGFMgJISyurPI3RMMFP9CuhfJ7TcndPr+P5sxdmD+LHG73epsVGlEKFQ
         ehPGDVfDvdS1Fj4468B1XAax8VluqK/wam+Uf4U+K2GKHJIRnjyosYSYwNwl1MLElVYJ
         45Y99MoFR06mpcWjulj7g/QSIV8PU/0NTHLvF7iAbGXRSF+zn1TFWNXs4RxBQ3OLEmv7
         DssceMX8mCkq9Gld6zVGucLWrNo9TMcnoZaAskeeCqpMcuRh/Mq9gt9Uy09u/2vUZEfZ
         iAwVXbLjVqOVjQAy6frjXVzZMDqK2uHn+ByCaL1dETDvo+4G+DdgfsVw9DURfmru+E+m
         hfTg==
X-Forwarded-Encrypted: i=1; AJvYcCWXDG+J9n6XGN9WaVn0Bu6C0HlUNuXYs7yPOGZobSrp/8nR109MvpOSYvzgShySqDP0X684aswnNWfAAfShw3YskPpzwa+jxW0mo5StFCE7
X-Gm-Message-State: AOJu0Yw5Ig/D391ZZR90KFjpjH6BhnmKb2pQLlk5HMONAf2zRJefuDIC
	43JB2iPlEzMpuNZssHI0QFuNab4kascLjzx5Dt6PzkdHJSEpaMxgBsqut84FdOM=
X-Google-Smtp-Source: AGHT+IG9/ui2Pdbq/gGpEHhO3Ddv6VFSpBlRz6d5Y0Sa0RbJWoDbM2M3qtgVqvq/pgFE/wY0HE4mJA==
X-Received: by 2002:a17:90a:d397:b0:2bd:ef6b:c33b with SMTP id 98e67ed59e1d1-2c2bc7b4c69mr11530609a91.0.1718053617512;
        Mon, 10 Jun 2024 14:06:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2d7814f45sm5746125a91.5.2024.06.10.14.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:06:57 -0700 (PDT)
Date: Mon, 10 Jun 2024 14:06:50 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <Zmdq6kszPBxAvLdD@debug.ba.rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy>
 <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_140701_813801_E29FEFC8 
X-CRM114-Status: GOOD (  25.55  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 10, 2024 at 11:16:42AM +0200, Cl=E9ment L=E9ger wrote:
>
>
>On 10/06/2024 11:02, Conor Dooley wrote:
>> On Mon, Jun 10, 2024 at 10:33:34AM +0200, Cl=E9ment L=E9ger wrote:
>>>
>>>
>>> On 07/06/2024 20:51, Deepak Gupta wrote:
>>>> On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
>>>>> On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
>>>>>> Hi Conor,
>>>>>>
>>>>>> On 31/05/2024 19:31, Conor Dooley wrote:
>>>>>>> On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
>>>>>>>> Dectect the Zkr extension and use it to seed the kernel base
>>>>>> address.
>>>>>>>>
>>>>>>>> Detection of the extension can not be done in the typical
>>>>>> fashion, as
>>>>>>>> this is very early in the boot process. Instead, add a trap handler
>>>>>>>> and run it to see if the extension is present.
>>>>>>> You can't rely on the lack of a trap meaning that Zkr is present
>>>>>> unless
>>>>>>> you know that the platform implements Ssstrict. The CSR with that
>>>>>> number
>>>>>>> could do anything if not Ssstrict compliant, so this approach gets a
>>>>>>> nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
>>>>>>> it, so you're stuck with getting that information from firmware.
>>>>>>
>>>>>>
>>>>>> FYI, this patch is my idea, so I'm the one to blame here :)
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> For DT systems, you can actually parse the DT in the pi, we do it
>>>>>> to get
>>>>>>> the kaslr seed if present, so you can actually check for Zkr. With
>>>>>> ACPI
>>>>>>> I have no idea how you can get that information, I amn't an ACPI-is=
t.
>>>>>>
>>>>>>
>>>>>> I took a look at how to access ACPI tables this early when
>>>>>> implementing the
>>>>>> Zabha/Zacas patches, but it seems not possible.
>>>>>>
>>>>>> But I'll look into this more, this is not the first time we need the
>>>>>> extensions list very early and since we have no way to detect the
>>>>>> presence
>>>>>> of an extension at runtime, something needs to be done.
>>>>>
>>>>> Aye, having remembered that reading CSR_SEED could have side-effects =
on a
>>>>> system with non-conforming extensions, it'd be good to see if we can
>>>>> actually do this via detection on ACPI - especially for some other
>>>>> extensions that we may need to turn on very early (I forget which one=
s we
>>>>> talked about this before for). I didn't arm64 do anything with ACPI in
>>>>> the
>>>>> pi code, is the code arch/x86/boot/compressed run at an equivilent-ish
>>>>> point
>>>>> in boot?
>>>>
>>>> cc: +Clement and Atish
>>>>
>>>> I don't know all the details but on first glance it seems like instead
>>>> of ACPI,
>>>> may be FWFT is a better place for discovery ?
>>>> https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/106479=
571
>>>
>>> IMHO, doing discovery in FWFT is not the goal of this extension. I think
>>> the "real" solution would be to wait for the unified discovery task
>>> group to come up with something for that (which is their goal I think) =
[1]

Yeah I understand the conundrum here.

>>
>> I'm curious to see how that works out. The proposal documents an m-mode
>> csr, so we'd have to smuggle the information to s-mode somehow...
>
>Ahem, yeah, I spoke a bit too fast. Looked at the proposal and the
>mconfigptr CSR will be accessible by M-mode only so I guess we will have
>to find another way...

That's not the only problem. Even if you get mconfigptr access, parsing the=
 format
is another thing that has to be done. This is early in boot. Although its s=
trictly (pun
intended) not a firmware feature extension, I think it's much easier to ask=
 underlying
firmware if platform is `Sstrict`. or may be expose something like below

`ENABLE_SSTRICT`.
Platforms which support `Sstrict` can return success for this while platfor=
ms which don't
have `Sstrict` can return error code (not supported or not implemented).
This way its not feature discovery.

It seems like arm64 parses fdt and it reads certain CSRs too
(`arch/arm64/kernel/pi/kaslr_early.c`). Although it doesn't look like it ha=
s to do any
discovery for them.

>
>>
>>> Link: https://github.com/riscv/configuration-structure [1]
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
