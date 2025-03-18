Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE4C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygMXWA1CB0xUo/uoLELyxQvOPerQyoQgXOg/6OVGeGs=; b=X800g0a75DvC5c
	BJsFJ+3+KKBorwFVdG5GvirpZwiitmUjcvcQsNgVs33rEYmVkAKjeOYh1xg5eziIZqW3CFXbLgzFr
	6vZ3l6UnPrNRugqPZ0dqAZc6NLSuyWn/m5GYRlbWG7Jg2dIqCSvDA6D1GgJd3vdApJdWXqwIsKTd6
	zOecIPGWTozNvkdC4yORgbaOWv1QuFemU+XgIgksJfQDJCunCAc98UzOvZx/s/rQl36KAwvYNOBsJ
	CJ4fcUz2OoU390pYHeLT0ikyXiv+lGai/Zt7N1Wd8M6milpWFDu+RgP2SWwnQO/0xfe/WKbLvxbPr
	tTe/VIA8Fqj7SxeSUzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYZt-00000006JJf-1JpT;
	Tue, 18 Mar 2025 15:10:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYZq-00000006JIj-3Qb7
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 15:10:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-390effd3e85so4783829f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742310597; x=1742915397; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pi9+EclVOPrZYJ8BNIPSTKMUS248Uk1Nqe/ZKkcV2oE=;
        b=QFqfO2Bt0fr4NV0F5s8nF4AsUBT5OEXs1BMpsoV6BUtoBOrFXgRi+tP/JxK66szhis
         O2wmmntmwNUPtDt06siXHn3BPWfzihYEkjmkJaMRtP6wTpNuX4EkGM95cOFHSJiFNy3g
         HUdSSbkX8/8lVlfXw244SGKKUqyYJWLCWjGA6vOXcAx6JP5/lpRFVEb1d7f7LYitNqWN
         n+WzgWEMFPNtCDX9Dd7A025TDWAhaK50xDaPdiBXmn5wa8SkOGAicrO5gJlb4MUvyYrA
         LPemCHMT1FnMyjkGDzncxMK2NXaSJxVLRS200TZPWjUrVLE5LWOlImRaSVvJdzSzNK1S
         Cw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310597; x=1742915397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi9+EclVOPrZYJ8BNIPSTKMUS248Uk1Nqe/ZKkcV2oE=;
        b=Mk2OwR1FERggC6/cffbLwvEX5aYHc3j/RtDg1VeahNcVB9zREx30VnnavJEtUHy4yU
         K2IFeIhVxVDDfRYDRtj7ddxudVYvTsCyReIRO+inoXd+eNiU/ya/P/R2qsGeNxjU4Eu/
         gBkn9q1XHXgT6YZsuZ+4+HRAg4cx5woZpz1Bg4h1ciidAJdCpReObEEOyY9zZXXInTJ6
         lrucXMQ+DlnqRAgbwCpfxCYFr21k7Bk10veUyTKxveQH8p3Nf/FFywvVbK1vDLIJGePS
         tgpQDnILoLVhD7XkohggRDNC/AC2xLD1cuXnjFF8S64Cb6ANSxnRy5qF95PNZ5f1xSIq
         Eg8w==
X-Gm-Message-State: AOJu0YxQY9q3SSJCXqGmSYzEVszqeZqH9OUA5wetJat/HjYfFWfjqYtN
	qMJHU0k5fQqV4G746ZY5EDwHEcPaMbchO9MTYrfBzQMfxcvDodvcPJKuDDsm+t8=
X-Gm-Gg: ASbGncsqpglJdx5ZCRAMqMNCKI0g8UYQN2qpdx6MRneB9oMwjRVzaW1anIs54u547Dd
	wZ2VT/BzmvVRJjCHwwUGFkr+nXZCtleNH1USsewDrcbI5DVBN5fjbT9g5/TcSF+s7xxobm+aHDf
	ZJd3ZDJiqON9kPAlvVNREvke7KFDAprt5SZQvowfTLW8M/9WdUwGzuruIrK+lMH9r9Lyov1h604
	gEjy69uVGXrHBUj+5C3e0p8FuvNJn2MIeRbpD9rN/Og024yFwmXwSx3uVRWZORYsJnxxw8xSV7w
	Otv4irWin1sLmEJKOdiGC2A4HtB8LL4UFfa9DIvBIWM=
X-Google-Smtp-Source: AGHT+IGR/8SFcCBDGiWMbZof8cTzlXY2ErSUJPc9XQCrBR5S4X8kUHjHc4wgiiNvzdvuRJwdCPzyPA==
X-Received: by 2002:a05:6000:1f8b:b0:391:1458:2233 with SMTP id ffacd0b85a97d-3971d235022mr18693931f8f.11.1742310589615;
        Tue, 18 Mar 2025 08:09:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm18119516f8f.44.2025.03.18.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:09:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:09:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-bf7e13879b2073c610d32bae@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
 <20250318-18b96818299ef211ef8ca620@orel>
 <d7a04d06-766b-4b43-8c42-2b681629c35d@ghiti.fr>
 <20250318-ec2a990d55378039a863b94b@orel>
 <44304bca-b30a-4c0b-b242-3a54ac021e40@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44304bca-b30a-4c0b-b242-3a54ac021e40@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_080958_856921_CAD58969 
X-CRM114-Status: GOOD (  56.14  )
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

On Tue, Mar 18, 2025 at 03:09:18PM +0100, Alexandre Ghiti wrote:
> On 18/03/2025 14:04, Andrew Jones wrote:
> > On Tue, Mar 18, 2025 at 01:58:10PM +0100, Alexandre Ghiti wrote:
> > > On 18/03/2025 13:45, Andrew Jones wrote:
> > > > On Tue, Mar 18, 2025 at 01:13:18PM +0100, Alexandre Ghiti wrote:
> > > > > On 18/03/2025 09:48, Andrew Jones wrote:
> > > > > > On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> > > > > > > Hi Drew,
> > > > > > > =

> > > > > > > On 04/03/2025 13:00, Andrew Jones wrote:
> > > > > > > > Allow skipping scalar and vector unaligned access speed tes=
ts. This
> > > > > > > > is useful for testing alternative code paths and to skip th=
e tests in
> > > > > > > > environments where they run too slowly. All CPUs must have =
the same
> > > > > > > > unaligned access speed.
> > > > > > > I'm not a big fan of the command line parameter, this is not =
where we should
> > > > > > > push uarch decisions because there could be many other in the=
 future, the
> > > > > > > best solution to me should be in DT/ACPI and since the DT fol=
ks, according
> > > > > > > to Palmer, shut down this solution, it remains using an exten=
sion.
> > > > > > > =

> > > > > > > I have been reading a bit about unaligned accesses. Zicclsm w=
as described as
> > > > > > > "Even though mandated, misaligned loads and stores might exec=
ute extremely
> > > > > > > slowly. Standard software distributions should assume their e=
xistence only
> > > > > > > for correctness, not for performance." in rva20/22 but *not* =
in rva23. So
> > > > > > > what about using this "hole" and consider that a platform tha=
t *advertises*
> > > > > > > Zicclsm means its unaligned accesses are fast? After internal=
 discussion, It
> > > > > > > actually does not make sense to advertise Zicclsm if the plat=
form accesses
> > > > > > > are slow right?
> > > > > > This topic pops up every so often, including in yesterday's ser=
ver
> > > > > > platform TG call. In that call, and, afaict, every other time i=
t has
> > > > > > popped up, the result is to reiterate that ISA extensions never=
 say
> > > > > > anything about performance. So, Zicclsm will never mean fast an=
d we
> > > > > > won't likely be able to add any extension that does.
> > > > > Ok, I should not say "fast". Usually, when an extension is advert=
ised by a
> > > > > platform, we don't question its speed (zicboz, zicbom...etc), we =
simply use
> > > > > it and it's up to the vendor to benchmark its implementation and =
act
> > > > > accordingly (i.e. do not set it in the isa string).
> > > > > =

> > > > > =

> > > > > > > arm64 for example considers that armv8 has fast unaligned acc=
esses and can
> > > > > > > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even=
 though some
> > > > > > > uarchs are slow. Distros will very likely use rva23 as baseli=
ne so they will
> > > > > > > enable Zicclsm which would allow us to take advantage of this=
 too, without
> > > > > > > this, we lose a lot of perf improvement in the kernel, see
> > > > > > > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@ke=
rnel.org/.
> > > > > > > =

> > > > > > > Or we could have a new named feature for this, even though it=
's weird to
> > > > > > > have a named feature which would basically=A0 mean "Zicclsm i=
s fast". We don't
> > > > > > > have, for example, a named feature to say "Zicboz is fast" bu=
t given the
> > > > > > > vague wording in the profile spec, maybe we can ask for one i=
n that case?
> > > > > > > =

> > > > > > > Sorry for the late review and for triggering this debate...
> > > > > > No problem, let's try to pick the best option. I'll try listing=
 all the
> > > > > > options and there pros/cons.
> > > > > > =

> > > > > > 1. Leave as is, which is to always probe
> > > > > >       pro: Nothing to do
> > > > > >       con: Not ideal in all environments
> > > > > > =

> > > > > > 2. New DT/ACPI description
> > > > > >       pro: Describing whether or not misaligned accesses are im=
plemented in
> > > > > >            HW (which presumably means fast) is something that s=
hould be done
> > > > > > 	in HW descriptions
> > > > > >       con: We'll need to live with probing until we can get the=
 descriptions
> > > > > >            defined, which may be never if there's too much oppo=
sition
> > > > > > =

> > > > > > 3. Command line
> > > > > >       pro: Easy and serves its purpose, which is to skip probin=
g in the
> > > > > >            environments where probing is not desired
> > > > > >       con: Yet another command line option (which we may want t=
o deprecate
> > > > > >            someday)
> > > > > > =

> > > > > > 4. New ISA extension
> > > > > >       pro: Easy to add to HW descriptions
> > > > > >       con: Not likely to get it through ratification
> > > > > > =

> > > > > > 5. New SBI FWFT feature
> > > > > >       pro: Probably easier to get through ratification than an =
ISA extension
> > > > > >       con: Instead of probing, kernel would have to ask SBI -- =
would that
> > > > > >            even be faster? Will all the environments that want =
to skip
> > > > > > 	probing even have a complete SBI?
> > > > > > =

> > > > > > 6. ??
> > > > > So what about:
> > > > > =

> > > > > 7. New enum value describing the performance as "FORCED" or "HW" =
(or
> > > > > anything better)
> > > > >   =A0=A0=A0 pro: We only use the existing Zicclsm
> > > > >   =A0=A0=A0 con: It's not clear that the accesses are fast but it=
 basically says to
> > > > > SW "don't think too much, I'm telling you that you can use it", u=
p to us to
> > > > > describe this correctly for users to understand.
> > > > But Zicclsm doesn't mean misaligned accesses are in HW, it just mea=
ns
> > > > they're not going to explode.
> > > =

> > > They never explode since if they are not supported by the HW, we rely=
 on
> > > S-mode emulation already.
> > Exactly. Zicclsm is just a new name for that behavior. Profiles try to
> > name every behavior, even the ones we take for granted. Unfortunately,
> > like in the case of Zicclsm, we don't necessarily gain anything from
> > the new name. In this case, we don't gain a way to avoid probing.
> =

> =

> I understand your point but given the misaligned traps exist, I can't find
> another meaning to Zicclsm than "I'm telling you to use it". Zicclsm can't
> be used to describe an OS behaviour (ie the emulation of misaligned
> accesses).
> =

> I'm also insisting because we need a compile-time hint which allows us to
> enable HAVE_EFFICIENT_UNALIGNED_ACCESS in the kernel and Zicclsm is great
> since it is required in RVA23. if that's not Zicclsm, that must be another
> named feature/extension.
> =

> What do you suggest to make progress here?
>

I guess you mean besides listing five options and posting patches for two
of them :-)  We can't force semantics onto Zicclsm and I doubt we'll get
agreement to make another extension with the semantics we want. So (4)
is out. I agree with Clement that (5) isn't good. That leaves (2). I
guess we should start by trying to understand what issues there were/are
with it.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
