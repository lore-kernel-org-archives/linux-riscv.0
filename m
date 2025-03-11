Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B05BC28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 23:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAk3x40cEoUk54UkNf4EP5JxvDq2JoRioGZ75hUNw3Q=; b=h77Jzj6q6wVQdr
	F0qk3LugSweW2JCucX9/mcPGrOEaPFG9jAcrRta9XSqtFPC3y/lJeV3zI+CIvCH/5LhgLVRsjJPcH
	Z9LLBB2qmqORUOoBsLWyjvY/Q/YM4+fpBnzWzkExl+N4MQ8oVxmEic+E5zwFy1YEgZGz4IhPvzdAW
	bhTRa/EaUARhUDGBlpPCHsc4s6gtsWv6TaE5/HKUtOIkHrWbRTcsonkLPpBQd+47deHgI98cAAW+X
	HPziXem9X9yC4+XOKYPyFI3QcH8OoComn4uGIAmn6hXYUBFECeSJCfmY1pJZexcsDRyC6BT3gP6d/
	jymeM+/absLaiLJ/xfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8tO-00000007AoR-46cD;
	Tue, 11 Mar 2025 23:20:10 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8tM-00000007AnR-0bNU
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 23:20:09 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c542ffec37so352196885a.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 16:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741735207; x=1742340007; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ltUKs2z+U/8X7yl9Lmft9ZWcQtUbw/3Yn0qxN80Kc8=;
        b=OrJtLj9YM7+bJJou0UDZtY92fERZ+5jeXSClqxFF4d7ySQ7/TJdQ+pqM3qd+8J7CvQ
         IKmUf4qaVa9XeRfrOeyMVtZUhi91o6TIsAur1VzXmADd5qDVx1P6dXN6gOVagIfftuQl
         M/cwB9en9UOX7sqaToRSV7m7hF43D6/VAfKdc2M7gjDRbNjLyL0nnfz6i/fOsk4x3eDP
         VMXHYuCV9/piO2VXxOKtQAsjGFJIGfBQ+gC0HO7FmvAuKdSUnDYoqu+9YCOpnxY1gT6c
         Hcu74fhh1ukjz1/FmXAoOMP5YNaOnWQ8RW5n0Lz0Coi4NOElnMmsC6n8pJMEiwkS4OPL
         Drjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741735207; x=1742340007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ltUKs2z+U/8X7yl9Lmft9ZWcQtUbw/3Yn0qxN80Kc8=;
        b=BILVQcxemIwq5dYzXVgDLeWP94QDdmYhYo1oWp4wR0Za1nrfVSMVspCqtq20a7yBv5
         5pP0MzEIetiQ2mQuNOBvKmVe8RCktgrQzeDVZCMPvtvGnfBPdFZet2uXvUSLsyuTV1ez
         Hh2xpQoWrElS1Z6RtjKoi4/O/ijFn/9XjjadqJBZrPz13yAVt3GDM7o83pLm4v74cxXZ
         tLpfJD35+nlhRsj1Mm1e7bN5QI9LERDClLriFoT0DpyooEFkGyJkhkHFlUnY8kz1zBH4
         jGfvFEna6Vdi+tSgrEGjd7GozIXcyXKVIrRaKe5+ymoh+MdTRoElNdt+53yUYBnpgHGy
         nGEg==
X-Forwarded-Encrypted: i=1; AJvYcCVT1ClCWYY8mHeIURXA0nPXLSaOwvxhRXgYl4T76S7PezRFhP1rFm32swm1027QnLENxwXuoUiFZxWjVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+wINXVm2nPrgNPicdVPUpghhqk6eMEsKWxaSHSnGb2m6lm2Gw
	wY+6aerxBUxq/z038GS4X7LQ0l2KOL/50xVok2CT/JPtYY03yEBj
X-Gm-Gg: ASbGncsmNIGPjLl6F/OJfCiQlb3b+MVx+ftS5Wy5U1epwNI4GU3IuqaHaPW29wWOJA3
	dtk6CGGlDyar9gWx9QJJTnGryQfKnmmeQXdNEGcB6FHpomxnAfnwIyUfElXDaI8EcDqF/ztBkya
	/jNzjn0cWgHE3KSPMeGYaWQPkFcy87vIppUgt1/CAVs936mNkvaBiMjNEEIN43RAN0vOdA9/gz1
	/nYc1jQxmbEt7n/HGF3NtOozapPnzEbm8hHF+8zVML6XjevHYVuXTMZ39zV5GE6PJgr4tARA5Tc
	X8UI0sT+WqQt/ECURaIo4gKq/R7KXMs=
X-Google-Smtp-Source: AGHT+IH7UN0PdGtcChDtRvCDEtQ0UBi/lcVWEMqGsKQk9Vlcs4MLHBtcnIhzM5G75NTX4ZQt5BCqVA==
X-Received: by 2002:a05:620a:439a:b0:7c5:4673:a224 with SMTP id af79cd13be357-7c55e9692a5mr843742285a.50.1741735206802;
        Tue, 11 Mar 2025 16:20:06 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c55d56bc42sm232107485a.7.2025.03.11.16.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:20:05 -0700 (PDT)
Date: Wed, 12 Mar 2025 07:19:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/3] riscv: Add bfloat16 instruction support
Message-ID: <j7b4c7hxq25nn4aerqs5zjc3aabiifbizxde5vycxp4zvlc2sw@5d7j6ka4o7jx>
References: <20250213003849.147358-1-inochiama@gmail.com>
 <d6t25jmcf57sqpjqwykhdf3ju6v3wwpyaiumll4x6bjfhcohl5@oikmnpusjn6u>
 <e72db46d-53b2-47f6-814f-9653d783e745@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e72db46d-53b2-47f6-814f-9653d783e745@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_162008_183672_B98A3933 
X-CRM114-Status: GOOD (  19.58  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 11, 2025 at 02:20:21PM +0100, Alexandre Ghiti wrote:
> Hi Inochi,
> =

> On 11/03/2025 13:34, Inochi Amaoto wrote:
> > On Thu, Feb 13, 2025 at 08:38:44AM +0800, Inochi Amaoto wrote:
> > > Add description for the BFloat16 precision Floating-Point ISA extensi=
on,
> > > (Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
> > > ("Added Chapter title to BF16") of the riscv-isa-manual.
> > > =

> > > Changed from v3:
> > > 1. rebase for v6.14-rc1
> > > 2. patch2: add validate for zfbfmin, zvfbfmin, zvfbfwma
> > > 3. patch2: apply Cl=E9ment's tag
> > > =

> > > Changed from v2:
> > > 1. rebase for v6.13-rc1
> > > =

> > > Changed from v1:
> > > 1. patch3: add missing code in sys_hwprobe.c
> > > =

> > > Inochi Amaoto (3):
> > >    dt-bindings: riscv: add bfloat16 ISA extension description
> > >    riscv: add ISA extension parsing for bfloat16 ISA extension
> > >    riscv: hwprobe: export bfloat16 ISA extension
> > > =

> > >   Documentation/arch/riscv/hwprobe.rst          | 12 +++++
> > >   .../devicetree/bindings/riscv/extensions.yaml | 45 ++++++++++++++++=
+++
> > >   arch/riscv/include/asm/hwcap.h                |  3 ++
> > >   arch/riscv/include/uapi/asm/hwprobe.h         |  3 ++
> > >   arch/riscv/kernel/cpufeature.c                | 35 +++++++++++++++
> > >   arch/riscv/kernel/sys_hwprobe.c               |  3 ++
> > >   6 files changed, 101 insertions(+)
> > > =

> > > --
> > > 2.48.1
> > > =

> > I wonder whether this patch could get merged? So I can
> > submit the SG2044 board dts without this as dependency.
> =

> =

> It is on my list for for-next so it *should* be merged in 6.15.
> =

> Thanks,
> =

> Alex
> =


Thanks, I will wait for it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
