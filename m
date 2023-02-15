Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B09C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 21:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peTJMoiiy9MQsAcxfkxFbn08tkmCHHLOLF/+xtxWI0I=; b=eQmnaiPEtXQTHb
	5ds1n4/N18wEOBCBK/eeT/v+FTds0zr1Gwu+ZECDsoDzQmu9VgT1eiYU8KiKTkv33IAzm+RvSLzvp
	Xk8GWnzvnTxlH97PSdo2JLnQRPX3aalKikedARoZ1HG2KCrUcWdB0MKClt8PjWamOdmvEsrdPRt16
	1QCqXwWuYi1Xh/qar9LIJFtqFOAgUZ8F3m8yByQ3QKv+/g+ycEIVvxB9bY8bbizqeV5JQtwYlPZbI
	G0dcBXvqZpiwTuKs0ET+fOKPrPURuFQmfxEy+IiMgyvXgg68QMio4bj7Htju4IW3nKwGSfKWTPQ1Z
	P9buoQ2VLKkcqyCIPblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPCA-007VmX-D8; Wed, 15 Feb 2023 21:20:06 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSP7A-007T6n-AG
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 21:15:00 +0000
Received: by mail-lf1-x135.google.com with SMTP id y25so275677lfa.9
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 13:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f1gQtmlRBhpSJ40ajJoTyktY/WnEFbQ+Gi+issmQ3qU=;
        b=ZKZR82o1JYYe14j7LfX/wQTXfDrD3ih0AoR7f+3SDLTKATYgPzCMEAUnUkZzUA/+DX
         QWYoRJG/TGiaTqb34QpT1WfKCZ+eYENcPkPiWeQE7I4AmUrCHVzeMVU25cDCmexT5f4C
         1MOqUXvdkIhjDry1uM4ZR3ro2TI1L+F3IIiDJR8PIKsSF9ppE9FVhBsJmB7r0yuzvcc3
         7wyHq/J4YfGovrsD+GApWNFljd6GXYMtkfdw+saKP7bI7kOWawLukydV6eXrxa9xQfTZ
         9DxhRkVheK33LhW5CHDzJxkOzthCn81C82GL+SUnsDy0yK3zfDp+g0sBT9AJUI3y2cPN
         kVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1gQtmlRBhpSJ40ajJoTyktY/WnEFbQ+Gi+issmQ3qU=;
        b=5ojDamDtLYh9skBn7avEL4B2QsCwVRzrsd3/r8cT4EQeK88uYvrLjCB2PY7Ud/agZ7
         jZesvvQxwazBWlS48zSGRmGkPk890riSCrNQpS8y/9nHfsffTc+rN3mHFgaUBxlWXGpq
         9/GazbGY3E32M6ppl1t+1O21ZNwXnrQ9aKWX9kw6XrV/i4tgsXbi1ZUcHf40CtE711u6
         csrtXIEI5ALnuPO5gb/tCfk5ZpCJwHruTl0UY2OJvwYADXkNDGW1o8CzcbGP3whqYBmP
         XEx5/z56AWgd5y50lv6pA5mUU0m1BHoyNNVVC7aVBD1z9uKkBxaCLIIbOZAq8IjQSwEZ
         0dsA==
X-Gm-Message-State: AO0yUKVbrom7ZErFbZKneqaUl1wVQk8T9wmiK2gCtkNXiiJxpyff49VR
	HUD1ef9qtgK/t7pc0H/ZAWBGFl19n3h8M9r8UvamiQ==
X-Google-Smtp-Source: AK7set9HNLqLqmvl/qQOOm2AvS5tnhyFklJKHOM0CSXZu5uWUVPpDBcsV7m40liFRQynQZO4GW6u4p+S+8fNfafnfzs=
X-Received: by 2002:ac2:43b9:0:b0:4db:182b:2d74 with SMTP id
 t25-20020ac243b9000000b004db182b2d74mr1004018lfl.9.1676495693301; Wed, 15 Feb
 2023 13:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-3-evan@rivosinc.com>
 <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
In-Reply-To: <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 15 Feb 2023 13:14:17 -0800
Message-ID: <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_131456_437718_AF5ED01F 
X-CRM114-Status: GOOD (  22.66  )
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
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, "Conor.Dooley" <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Vineet Gupta <vineetg@rivosinc.com>, Dao Lu <daolu@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 15, 2023 at 1:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Feb 6, 2023, at 21:14, Evan Green wrote:
> > We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> > system call that quite does this, so let's just provide an arch-specific
> > one to probe for hardware capabilities.  This currently just provides
> > m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> > the future.
> >
> > Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
>
> I'm not sure I understand the problem with
> AT_HWCAP. While the bits in AT_HWCAP and AT_HWCAP2
> are limited, I don't see us running out of new
> AT_* words to use for additional bits. Presumably
> the kernel would already have to know about the
> name of each supported HW feature and could assign
> a unique bit number to them.

Palmer can probably speak to this with more authority, but my
understanding about the motivation for an approach like this goes
something like:
 * With the nature of RISC-V, we expect a lot of these types of bits
and bobs, many more than we've seen with the likes of x86 and ARM.
 * We also expect in some cases these values to be inconsistent across CPUs.
 * While we could copy all that data into the aux vector every time,
it starts to look like a lot of data, not all programs care about all
of it, and a lot of it is static, making all the copying wasteful.
 * Another option that would solve most of this would be to point to a
vDSO data area from the aux vector. This solves the copy complaints,
but makes that vDSO data ABI, and requires it all to be known up
front.
 * So, a syscall with a vDSO function in front of it seemed like a
good combination of speed and flexibility.

You're certainly right that HWCAPn would work for what we're exposing
today, so the question probably comes down to our relative predictions
of how this data will grow.

-Evan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
