Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57131C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 20:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UBofFes6GA8W/1E0VQg+dwBaQYq5F80RxYsow3j3sZo=; b=e5C5KWpHdj4cOSS5UaVJ/TTKuk
	FGwddLkEI83ZKJEUuz+8lsgLdm/NZXbE7XgOasQpFNYU97XzSmyJ68lDmvCGjjRgfv0pcXvQFfxeR
	Xb5H7ammjhULRmjxBoZkjuf3kG7lmQekfIBhIHl5H2rLVx2T/rTbmnlonEJBdJHkEw4fZggkgHC65
	HR0r8Zby9XFiQGDMzlKj8Q8vdjJba5a4S4L/olfHEuJx+cmvaAa3uYGBDsjB3irZZGd8aJW7ZoJ8I
	nlI2Ot3Z1+A/IjAm9OnDJ1IjnVSQivUwDvHNNBa/AO0EgbZoYBV3zRd4RtquCu1zDwIwwt4Nh41Vm
	d3wsqr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEELK-00000000IUn-1yeo;
	Mon, 03 Jun 2024 20:31:46 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEELG-00000000ITO-2f7U
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 20:31:44 +0000
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D641B412C2
	for <linux-riscv@lists.infradead.org>; Mon,  3 Jun 2024 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1717446697;
	bh=ahV+EJLz1b7kXv8nPMYOtMyUKc6v5M9VH6zQprdv2v0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PdG1+DoZ4EzBGxVWEKmjZoBQnA7cmuY3DnHzTYD4Q5nzDzurF8IQeF7V2lBylPeau
	 O7gYxKzDEj1qOkYzKq0MBYr74LMXz9KUIZxgcQJfKDqrdtWbM90WVDK1L2TEV28d6N
	 jTPpfFf+Nweoy9CSEExdSIdWwuzYxlKmRhtAbU4GseGqMkQh5ytyTZWm5LW0A2uwyy
	 qKB2bf1njwVDopas+qKJtlTSqx85P0DC5th5vE1eDhNaySgeUSYm2QAEFRvz5lACKo
	 F251YbqLJ15riwNLIU+Fyu8niaCiLF6Tt3QHazdNxMzYD6PuACP2nzGNhiwBXtMHK+
	 o8ApRQTyVXUWQ==
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5b9cc90b70aso4473007eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 13:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717446696; x=1718051496;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahV+EJLz1b7kXv8nPMYOtMyUKc6v5M9VH6zQprdv2v0=;
        b=IYSFA1I5DDzXLel0EE5eTbP1f8OzhGqP0h3E3XmE0U9iqhjmgMssuy5LDUQVkZjl+a
         csW3OqTIWKjkWvcOOJ1rfCdMt9WBQ5ZxYVK5pI5Aiz7az7Hhiiby3i8ggjDwvRceFN/+
         5EoMCXqJx3aF9eM7uywqoIu1mNEFyFPt0N9oJVC0dM41HKrxcsmrL+FAgrfup/Kj+psG
         ZX/hmHz6aYf+O+gNNHApgc0qh4UjL9Tdk4yb3QkGvIR2UsHn70S2cs6t8OF5Vfh4eiaA
         Sgx/JDVwsAN4wb7/9mORr0Oz58FgO3lYyEIKCe2ogLeVWHIup6LMxcTFGhRzc2Y7/C7M
         C1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuKgNLvIdQNuESdaCO/Hyph7McGhY/Zmv9H8DSZ9rc8A6oK2ua4IM4E0OTuIwTyZRzV4QBNA/ZoTcE5jv01bhCJZrrbNnhl37TwRfCnaiD
X-Gm-Message-State: AOJu0YwTjqdRQvBcKroTcqFmZjmHkLafrTV/MHpvd0TGlPGSMSjOn7bO
	MNk50vkvsbLV5ZrmGJjeLwuk9zXiPIvLCnFOtOyCi1p8e3u2SUumdJOAx9+AJNkzdM5Thb35UeN
	+ZnBLhTwb4h10xRKAnNBy5yBzGssQ/TLX/FPxZ047bGYlayZt+07v7Mzya2+KLrp2Twe47/4yFM
	DVT5YfllIckTXJYisQ4Ebl0JJj+pYt0uHjDInVdW+ixeMUP2fijDXufbZZ
X-Received: by 2002:a05:6358:e49b:b0:192:2717:4ed4 with SMTP id e5c5f4694b2df-19b48d606f7mr1494300755d.19.1717446696522;
        Mon, 03 Jun 2024 13:31:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNOqELb+TNrrcp0k/w7K34E/nZ0eKhmkZ1wR5a0BvRi2qcNm8V+dmkcOht1G0ZNEE2zOCO/z+ZLZWTjCb1Ndg=
X-Received: by 2002:a05:6358:e49b:b0:192:2717:4ed4 with SMTP id
 e5c5f4694b2df-19b48d606f7mr1494298355d.19.1717446696068; Mon, 03 Jun 2024
 13:31:36 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Jun 2024 15:31:35 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <0eb3b03d-f817-4f6d-8a29-abf87c3632f6@canonical.com>
References: <20240603150759.9643-1-matthias.bgg@kernel.org>
 <CAJM55Z82+_RL1Z+DCW+_xgE7ZMmiWdPekCt6qtREPXg1jB+68g@mail.gmail.com> <0eb3b03d-f817-4f6d-8a29-abf87c3632f6@canonical.com>
Mime-Version: 1.0
Date: Mon, 3 Jun 2024 15:31:35 -0500
Message-ID: <CAJM55Z8pntz8=aHhad4LW5cH4BLTCw5vfJPYRpYmTjtuuqiZtw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: Update flash partition layout
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, duwe@suse.de, 
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	linux-riscv@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	matthias.bgg@kernel.org, kernel@esmil.dk, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_133143_018773_04EEFA07 
X-CRM114-Status: GOOD (  18.67  )
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

Heinrich Schuchardt wrote:
> On 6/3/24 18:10, Emil Renner Berthing wrote:
> > matthias.bgg@ wrote:
> >> From: Matthias Brugger <matthias.bgg@gmail.com>
> >>
> >> Up to now, the describe flash partition layout has some gaps.
> >> Use the whole flash chip by getting rid of the gaps.
> >>
> >> Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> >
> > Hi Matthias,
> >
> > Thanks for the patch.
> >
> >>
> >> ---
> >>
> >>   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 7 ++-----
> >>   1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> index 8ff6ea64f0489..37b4c294ffcc5 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >> @@ -321,16 +321,13 @@ partitions {
> >>   			#size-cells = <1>;
> >>
> >>   			spl@0 {
> >> -				reg = <0x0 0x80000>;
> >> +				reg = <0x0 0xf0000>;
> >
> > ..this is definitely fine, but..
> >
> >>   			};
> >>   			uboot-env@f0000 {
> >>   				reg = <0xf0000 0x10000>;
> >>   			};
> >>   			uboot@100000 {
> >> -				reg = <0x100000 0x400000>;
> >> -			};
> >> -			reserved-data@600000 {
> >> -				reg = <0x600000 0xa00000>;
> >> +				reg = <0x100000 0xf00000>;
> >
> > Do we know that all of the VF2 1.2A, VF2 1.3B and Milk-V Mars boards have at
> > least 15kB SPI flash chips? In other words were there a reason this previously
> > ended at 10kB?
> >
> > Also it looks like my Mars board and VF2 1.3B both report discovering a
> > "gd25lq128d" chip of 16kB, so why stop at 15kB?
>
> Hello Emil,
>
> 0xf00000 (15 MiB) is the value of the size-cell. gd25lq128d has 128 Mbit
> (=16 MiB).
>
> Cf. the examples in
> Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
>
> The prior partition scheme had a partition 'reserved-data' also ending
> at 16 MiB. We don't change the expected size with the current patch.

Oh, you're right. I totally misread that, sorry. You can add my

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
