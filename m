Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA8BC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfpWwL0aBWwrtgb9RdJJMm1S16eiSpVu1OJWWoSP9vg=; b=Z+2sGugMeFpOC8
	0wRPllbvB4eZUS3nMatfsSGMZyWpZ8XzHbpX6H2dCK8eavma+XPz1AiuTodxVYVKcnb9siL4Os6+S
	Ro4uRO4hLisHiF5DfGlJe2PrTL3yHXr8SaE4FoNzEl8SSrhk90CC6qqr7k5wRWQC8rCvpmS48qSSs
	ekfiY566uMxDfbiUyLIBGGWq/+uS4C0TiItr8GT9iELYCOvHbyPLczHsrG9BLeXo1rRAdpuj9qZ6Q
	DbfLuaYtaC0O6LbTvMqzMQ8+ucQR2dfiDhdl2yJ7zxAD+9J0ltI+49AsdN258Ssv1kTC+5CEl4aDI
	DwAR0+mImKMwTrYwHrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWiP-00000005yvh-42IR;
	Tue, 18 Mar 2025 13:10:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWci-00000005y1K-0wIf
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 13:04:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaecf50578eso1033039566b.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742303086; x=1742907886; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=osstQuHAzfklsJKcyQ5YgpgmW1p4IsbG4RMShF7oP3k=;
        b=ZM1aGr1UWTW40hd2vAdk3S/c4v2EgppThWt1BOVBiBGnL2NIM86rm3c932sVj4suzB
         NRUjZ8haQNesPj+2JERlVtdiDtKMEA6pbWS9iULQZq9lngATu2oaquPFP8srBThLlzZ7
         M1qi5a4GwrdcT6RMw1DnpPXnCmt7EcM84SgRzNoFAdcOjgvlzA3fUDvEbDkXprrj5M5F
         rschDZmHP8H1v2IWdSP6ef60Cdi1LSUsWVJ1eTnHHsfIjv+nOVXqnVIF9qFK+jb866tb
         1pjUHf4CDZwA+B8w47iAOj6QmYHXtFrumZx/VQAscPaIfJCKNIunyIW7D7jbMZG/BQE8
         grUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303086; x=1742907886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osstQuHAzfklsJKcyQ5YgpgmW1p4IsbG4RMShF7oP3k=;
        b=otDZv/me9sfCg7rchxnbwGrIICUOuT5wZtwajaot7sUlj3uHojdczJ/PYkIWxTR3o1
         Jv/gcBNgzo0UYYs0Lx6PEdGO7tcKW0E9RxTpzqBO6/aqTgRdChLuNseaVhFjAEC3Vxks
         mVHWCFs457ctXLk64gBGu+Kfe6gUPUppe445OI/zdumt0fRAT57AV+zMs6ZlDr6KApzK
         8dJ7wJ9cBD74gQ+ZU60XlZioQ21ZB7Gq5TTxnf7lftWPKvXxAzHGX+ZnSQxCaA3cgmtI
         WR5bdSq4RUffdrCVUof+O0OtZWlIAOUPiBCzxhZBR3Zt2U3zGpi8g/QjSNz+6uw1FujI
         VpPg==
X-Gm-Message-State: AOJu0Yywc/7oLukpmZI3TraFNIrOFsjdjHXa+IoXvNUmEyNkTK2bwfsj
	dvs6yepcYiKYbl7sYrBn56kDu20P1Dca4PSBK93igh0JD48i21WWapXjPN+pNYg=
X-Gm-Gg: ASbGncvSd0PlQodc3J4/IjfajvP5UK15vMvZXi8zckEXNBnHveoAUaIzIqNZJNn3+LN
	eMJx7F8kiZxcCc9cw62zRsKkqfN+7ZVWehZCBUZl1F2JGyYkQysYLbgWPql+/1MUJqvQO/EGXlI
	g9e2P9ZYpqU8Q2Wv94Gt0oFQgni6U/r8QdE/maTmiuYpo/vAOKM2wefiZNKg537aNVVfSHIWSV1
	pgM4Oreby3BduDy6UFApq1anCXmnpw+AhukSXiAr7c/e43jsmlbROHbsZtyzBAeF4lwc9EPSq66
	s86RlrVUZANVNZGQl8kASsqSZGPO8S2lWvjhjQIkpI4=
X-Google-Smtp-Source: AGHT+IGdh0WRUnaOS+0hMkCHSlVoqZUJ8K6VEh0bppD6ycHe2aggMOvABEGmZbqWM3TEqHXTbMgvOw==
X-Received: by 2002:a17:907:9814:b0:ac2:9d15:2ec0 with SMTP id a640c23a62f3a-ac38d444fa1mr418237966b.27.1742303072628;
        Tue, 18 Mar 2025 06:04:32 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a47ccbsm840478566b.130.2025.03.18.06.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:04:30 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:04:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-ec2a990d55378039a863b94b@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
 <20250318-18b96818299ef211ef8ca620@orel>
 <d7a04d06-766b-4b43-8c42-2b681629c35d@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7a04d06-766b-4b43-8c42-2b681629c35d@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_060448_264111_B1659DE9 
X-CRM114-Status: GOOD (  52.00  )
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

On Tue, Mar 18, 2025 at 01:58:10PM +0100, Alexandre Ghiti wrote:
> On 18/03/2025 13:45, Andrew Jones wrote:
> > On Tue, Mar 18, 2025 at 01:13:18PM +0100, Alexandre Ghiti wrote:
> > > On 18/03/2025 09:48, Andrew Jones wrote:
> > > > On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> > > > > Hi Drew,
> > > > > =

> > > > > On 04/03/2025 13:00, Andrew Jones wrote:
> > > > > > Allow skipping scalar and vector unaligned access speed tests. =
This
> > > > > > is useful for testing alternative code paths and to skip the te=
sts in
> > > > > > environments where they run too slowly. All CPUs must have the =
same
> > > > > > unaligned access speed.
> > > > > I'm not a big fan of the command line parameter, this is not wher=
e we should
> > > > > push uarch decisions because there could be many other in the fut=
ure, the
> > > > > best solution to me should be in DT/ACPI and since the DT folks, =
according
> > > > > to Palmer, shut down this solution, it remains using an extension.
> > > > > =

> > > > > I have been reading a bit about unaligned accesses. Zicclsm was d=
escribed as
> > > > > "Even though mandated, misaligned loads and stores might execute =
extremely
> > > > > slowly. Standard software distributions should assume their exist=
ence only
> > > > > for correctness, not for performance." in rva20/22 but *not* in r=
va23. So
> > > > > what about using this "hole" and consider that a platform that *a=
dvertises*
> > > > > Zicclsm means its unaligned accesses are fast? After internal dis=
cussion, It
> > > > > actually does not make sense to advertise Zicclsm if the platform=
 accesses
> > > > > are slow right?
> > > > This topic pops up every so often, including in yesterday's server
> > > > platform TG call. In that call, and, afaict, every other time it has
> > > > popped up, the result is to reiterate that ISA extensions never say
> > > > anything about performance. So, Zicclsm will never mean fast and we
> > > > won't likely be able to add any extension that does.
> > > =

> > > Ok, I should not say "fast". Usually, when an extension is advertised=
 by a
> > > platform, we don't question its speed (zicboz, zicbom...etc), we simp=
ly use
> > > it and it's up to the vendor to benchmark its implementation and act
> > > accordingly (i.e. do not set it in the isa string).
> > > =

> > > =

> > > > > arm64 for example considers that armv8 has fast unaligned accesse=
s and can
> > > > > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even tho=
ugh some
> > > > > uarchs are slow. Distros will very likely use rva23 as baseline s=
o they will
> > > > > enable Zicclsm which would allow us to take advantage of this too=
, without
> > > > > this, we lose a lot of perf improvement in the kernel, see
> > > > > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel=
.org/.
> > > > > =

> > > > > Or we could have a new named feature for this, even though it's w=
eird to
> > > > > have a named feature which would basically=A0 mean "Zicclsm is fa=
st". We don't
> > > > > have, for example, a named feature to say "Zicboz is fast" but gi=
ven the
> > > > > vague wording in the profile spec, maybe we can ask for one in th=
at case?
> > > > > =

> > > > > Sorry for the late review and for triggering this debate...
> > > > No problem, let's try to pick the best option. I'll try listing all=
 the
> > > > options and there pros/cons.
> > > > =

> > > > 1. Leave as is, which is to always probe
> > > >      pro: Nothing to do
> > > >      con: Not ideal in all environments
> > > > =

> > > > 2. New DT/ACPI description
> > > >      pro: Describing whether or not misaligned accesses are impleme=
nted in
> > > >           HW (which presumably means fast) is something that should=
 be done
> > > > 	in HW descriptions
> > > >      con: We'll need to live with probing until we can get the desc=
riptions
> > > >           defined, which may be never if there's too much opposition
> > > > =

> > > > 3. Command line
> > > >      pro: Easy and serves its purpose, which is to skip probing in =
the
> > > >           environments where probing is not desired
> > > >      con: Yet another command line option (which we may want to dep=
recate
> > > >           someday)
> > > > =

> > > > 4. New ISA extension
> > > >      pro: Easy to add to HW descriptions
> > > >      con: Not likely to get it through ratification
> > > > =

> > > > 5. New SBI FWFT feature
> > > >      pro: Probably easier to get through ratification than an ISA e=
xtension
> > > >      con: Instead of probing, kernel would have to ask SBI -- would=
 that
> > > >           even be faster? Will all the environments that want to sk=
ip
> > > > 	probing even have a complete SBI?
> > > > =

> > > > 6. ??
> > > =

> > > So what about:
> > > =

> > > 7. New enum value describing the performance as "FORCED" or "HW" (or
> > > anything better)
> > >  =A0=A0=A0 pro: We only use the existing Zicclsm
> > >  =A0=A0=A0 con: It's not clear that the accesses are fast but it basi=
cally says to
> > > SW "don't think too much, I'm telling you that you can use it", up to=
 us to
> > > describe this correctly for users to understand.
> > But Zicclsm doesn't mean misaligned accesses are in HW, it just means
> > they're not going to explode.
> =

> =

> They never explode since if they are not supported by the HW, we rely on
> S-mode emulation already.

Exactly. Zicclsm is just a new name for that behavior. Profiles try to
name every behavior, even the ones we take for granted. Unfortunately,
like in the case of Zicclsm, we don't necessarily gain anything from
the new name. In this case, we don't gain a way to avoid probing.

Thanks,
drew

> =

> =

> > We'd still need the probing to find out
> > if the accesses are emulated (slow) or hw (fast). We at least want to
> > know the answer to that question because we advertise it to userspace
> > through hwprobe.
> > =

> > (BTW, another pro of the command line is that it can be used to test
> > both slow and fast paths without recompiling.)
> > =

> > Thanks,
> > drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
