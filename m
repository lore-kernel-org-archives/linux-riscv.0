Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC44C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufwgiFPS+FZ1vt/aMAw0y/9Bt9vqW9+i8tYNE/42Fjs=; b=CbMBqcZ+ZK6ibD
	FXVNkDhbAxl43WUhrPwHXnlqkmhjs1SpA9rLctffLhP5Dx75VJPUu/fsQCpq5G6G5RqzlbJngguSN
	Pzx+RusstYLZXzY7CfwvGYNR8e8gkGdvVDTCMkDD7Yfz+xQHrYnWHiV1som6UZzIOrwVl+F3daxcF
	eWrvfeI5EeI2VTR2OBDNZLYkcVYFHVxgshb9zGIGy8tUcpMJIVL3fENpvVDALXHzhHPxUbO2Noj0I
	Q507bWD+HZ+DxxIWzs7iTudezCU6KfL0Hy7qXa2uXM3kTvp9NHjugvv5jUaxPiIyPCAWTgYNQGvfD
	QdmfZKcbZ45k1hSciwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZge-0000000CpTw-2O4q;
	Tue, 19 Mar 2024 13:39:28 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZgb-0000000CpSh-161L
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 13:39:26 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso7183363a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710855563; x=1711460363; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zAsS/uNen1I904a04qYYT/TYDmbVxX/Uth0W4MlTuw=;
        b=OrF0lkz1fOEPVKzHE8lonFuAZTgf9d/SWNHmINPRp318+g7yNJZ9avlCKRcyYVPXQy
         I4Mv4EYvBJZPvyjPr+N62VA8vYc0DaiJK+10qU+3r3T87nSCBdASYn+4/z+9qKvqWkOR
         7kvhxVverdJ61OhXac/fJ/qexgIkzVnC7xDJRL4l7bOdvVXaCPhemNsWcbiuZuuEsHeA
         V0TO/sRAvHYR+C6BPPwFTWkQtTpdYQnrv11qieJt86rZBcN+0ljYb83fH2E2bKVsCrfC
         RftRDF7r8NHKPh22zTbM6cw7AzICrJZCIfX4E7l9O2AM16SOhiybxpAPONVerWPXCLAJ
         zn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710855563; x=1711460363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zAsS/uNen1I904a04qYYT/TYDmbVxX/Uth0W4MlTuw=;
        b=COmdqarlfOPewC5wLJPLPGcaHkXAXhaeNW4FStVgeGRuOuiUdc3BoS7QuxzaUndH08
         pirn58pKmxzo2DQQqYUhB0Pb36a6Q/pl57Tsr0Bcn8/FYivGTk3zfRQ11fLryt4/X/rE
         QgvF/gnmByQiuhzLSFkiiJDAqZeO1O5QVPUnVkxuoAjfblMfP0jen59QuSCEvgbCMRmI
         n47zEUj6Uj+JAq6JTCb51Xu3UFpbCsMqa4VgQBLqvgOQYLJYgRyDjFZMYVXPCP/elhVt
         FzVMbUBAixXcPk+yNdUS/wwSheP7Qh2sCsGaxAK3QB3TwbYfjCVRsw9+0fS/XG8nOJU6
         fYWg==
X-Forwarded-Encrypted: i=1; AJvYcCVrxf3zAkWCiYK+7TjvlbvR4y8uKawjZY5E9ijmUi7fUleCpRPXE9RUKesM8Pl1WWDLW+0P42oy96Rv+IdbRWYmiTMvaaPaw8tDUwLx3y1G
X-Gm-Message-State: AOJu0YwozhHW+zQuANTTSUV2iTk1AIUuP4eD1fiaW61DgOIqOckksLMh
	j+Ury/jzx9FHdem/iY2aFPrAcHkTvqu75YAlCZm+1nKGWrjt6684vQDwd/GQr90=
X-Google-Smtp-Source: AGHT+IHVRMJgWhA6FUGYuB3YQ2YkT+vT6+CMMifWJKwecbxw4bHQrbgtLR+eeZnyMUCHzJq6zdMjMg==
X-Received: by 2002:a05:6402:5516:b0:568:1248:9f49 with SMTP id fi22-20020a056402551600b0056812489f49mr11014066edb.18.1710855562942;
        Tue, 19 Mar 2024 06:39:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id er27-20020a056402449b00b00568d2518105sm2756561edb.12.2024.03.19.06.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:39:22 -0700 (PDT)
Date: Tue, 19 Mar 2024 14:39:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Atish Patra <atishp@rivosinc.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Qingfang Deng <dqfext@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <20240319-3e72d732cbf2fcf1cb81f968@orel>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240315-73aa13079ef83a4559869084@orel>
 <2de56d8b-bc78-428b-9c09-4729b269fa41@rivosinc.com>
 <20240318-such-animal-bf33de12dc3a@spud>
 <4bdaaff1-13ec-48c2-b165-6a8255784aef@rivosinc.com>
 <20240319-worry-video-66589b3ed8ae@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240319-worry-video-66589b3ed8ae@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_063925_336067_01F57EB5 
X-CRM114-Status: GOOD (  40.41  )
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

On Tue, Mar 19, 2024 at 09:06:34AM +0000, Conor Dooley wrote:
> On Mon, Mar 18, 2024 at 05:48:13PM -0700, Atish Patra wrote:
> > On 3/18/24 16:48, Conor Dooley wrote:
> > > On Mon, Mar 18, 2024 at 03:46:54PM -0700, Atish Patra wrote:
> 
> > > > For 2.b, either we can start defining pseudo extensions or adding
> > > > vendor/arch/impid checks.
> > > > 
> > > > @Conor: You seems to prefer the earlier approach instead of adding the
> > > > checks. Care to elaborate why do you think that's a better method compared
> > > > to a simple check ?
> > > 
> > > Because I don't think that describing these as "errata" in the first
> > > place is even accurate. This is not a case of a vendor claiming they
> > > have Sscofpmf support but the implementation is flawed. As far as I
> > > understand, this is a vendor creating a useful feature prior to the
> > > creation of a standard extension.
> > > A bit of a test for this could be "If the standard extension never
> > > existed, would this be considered a new feature or an implementation
> > > issue". I think this is pretty clearly in the former camp.
> > > 
> > 
> > So we have 3 cases.
> > 
> > 1. Pseudo extension: An vendor extension designed and/or implemented before
> > the standard RVI extension was ratified but do not violate any standard
> > encoding space.

The vendor should name these extensions themselves.

> > 
> > 2. Erratas: An genuine bug/design issue in the expected behavior from a
> > standard RVI extension (including violating standard encoding space)

More on this below, but I think vendors should name these too.

> > 
> > 3. Vendor extension: A new or a variant of standard RVI extension which is
> > different enough from standard extension.
> > 
> > IMO, the line between #2 and #1 may get blurry as we going forward because
> > of the sheer number of small extensions RVI is comping up with (which is a
> > problem as well).

The line between #1 and #2 is blurry because the only difference is the
original intentions. The end result is that a vendor has implemented
something that resembles a standard extension, but is not the same as the
standard extension.

> 
> Aye, I think some of that is verging on ridiculous.
> 
> > Just to clarify: I am not too worried about this particular case as we know
> > that T-head's implementation predates the Sscofpmf extension.
> > But once we define a standard mechanism for this kind of situation, vendor
> > may start to abuse it.
> 
> How do you envisage it being abused by a vendor?
> Pre-dating the standard extension does make this one fairly clear-cut,
> but are you worried about people coming along and claiming to implement
> XConorSscofpmf instead of Sscofpmf rather than suffer the "shame" of a
> broken implementation?

Other than the concern of the ballooning bitmap, I'd prefer this approach.
If a vendor has implemented some extension which happens to be "almost
Sscofpmf", then whether it was implemented before the Sscofpmf spec
existed, or after, isn't really important. What's important is that it's
only "almost Sscofpmf" and not _exactly_ Sscofpmf, which means it should
not use the Sscofpmf extension name. Since vendors are allowed to create
their own XVendor names, then that shouldn't be a problem. Indeed, the
abuse concern seems to be in the opposite direction, that vendors will
try to pass off almost-standard extensions as standard extensions by
trying to get workarounds into Linux. Maybe Linux policy should be to
simply reject workarounds to extensions, requiring vendors to create new
names instead.

> All this stuff is going to be pretty case-by-case (to begin with at
> least) so I'm not too worried about that sort of abuse.

Case-by-case is reasonable, since it's probably too strict to always
require new names. We can consider each proposed workaround as they
come, but it's a slippery slope once workarounds are accepted.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
