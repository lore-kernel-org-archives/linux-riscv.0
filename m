Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7BDC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0sDkfSnfoDxoOHjhLdN74UWnX9nle8n4YBhLkmu3kM=; b=RhYEf7UCFZ6LDe
	X7m98Ma8iNjA+mZD2a4J2HDt2SnGyZVOYy3FfIkDzRe/oQDmOhWmy7LQcZkVITuy2nLxrTr75OSj3
	+LgXcLSO3rZZps0SKXdKND8/1/HqhvPQ4tXcL0ng8UsimRGX4ZjtoyyVujAP8Tz8UbTrWC6DfNI+x
	lLhlQDxkwlocAohFZ8U/ruCFMIlFRM3lJ4xMsmiLKLO3155iw8Pxcoth+uHyzFk0wAJmW2S5hEVCF
	L66gVcdyx2iKVWT0VQy6bCkVapXKpT3gF0hGdL/L4AYzHSOcUn8KhHXs+ay6YY4mFKBEskG5joWix
	Y3M8wG3cLag2JOm8udtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWbl-00000005xsY-1bxx;
	Tue, 18 Mar 2025 13:03:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWK3-00000005vGr-0lcV
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 12:45:32 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so10685452a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742301929; x=1742906729; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qXTe4Yk90Sg3VlPoYATULTaZLwTfgsY3sNRfc2hTRIU=;
        b=Ymgx/Ok3+lBrmtEC/vi3iBw6/9PcUc1AxqcFYwKmYt/KL/QuUia5O6KYumvh2CqPpJ
         VPuzWsqRfcVADZkrkaJitv9+8XMR+qcsBlLv/bfiE5GrPLYFVN/Q0e8dZmrzsNAiwuaS
         10IFxlO6eF6UgeTYCf1juksjFYjV5HnnLV4fFQZEy+Bzgu65636YaPzreZkixybfuxAf
         vCkkNUJl5XRhSH++IHgGJQd9AN/rJ8G6SvBygizf9P4pHfdVfHV/pPIjn9zHekeN2J66
         jIJhpwVZ5wbaZGmY7oKLZFQtC6N8zrfhJpreKzAXQxhxckoo4UG90rzy/5c+EXDir4w5
         mM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742301929; x=1742906729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXTe4Yk90Sg3VlPoYATULTaZLwTfgsY3sNRfc2hTRIU=;
        b=G5QBFA3KX2mGs+IVMLGF0LkS7KuvPQQfxgavdtoRZn84jGTli4MlSDJnvEVb7Xmphv
         hVaQFdsPkauTQ1jbXvmTg3XZPDKNHqsx2t2OPuZBXZbJi5RGu8HUBmSO0pgguskU7GZ1
         OyZbtTvdlkdeMKHcA02J4rEiC6t/Yxpl4p+i/yfyG1PODgUmFGjGFw8EBETYr6SAKS4j
         b69K6hov4VIs4WX0qLi4ZSzhwKMY0HojkzjxNaDjmBkZLOpmz0ps4zOxS1MPgEkX4kby
         lHqKYzAEcue/ClCw7ppBE2T4DBzrbEXZN1Rl1LtOq+Ro4q2l5ByI1YO0psdE3KuBRriO
         ePYA==
X-Gm-Message-State: AOJu0YwviSZykVbJ4/4K+i36tAVHYmJbyJVskYmjHl0ta2EXBuWQOQoW
	7d1R4Rq8vPMRVVqGg5G1tf+tSu0vUmPoO2kaMshhLJNKUPvJMq/FKgSsP3cgmRM=
X-Gm-Gg: ASbGnct3Ib/Q99Y/JOWk5vLMYxhJtBLbnYmrn+o98TdrkHdAVD7HWtMqdRB1xinA00L
	UK/u73+BdDvP5k80sRW7Zcef6jwbMLjgLhzIPCYJQxAq/q0mNky6kgCxYS855y5Nc/cm7PS0zga
	unVMbQL4in7zq8CkhSOr8dJ8d3DSfWo5GUlOBU0DG0Qx/u0seFTNwSmY2GpdU5xlzJo08vcAavz
	TZTMtDHa+cVGtIHfv1rVXvUnU6ULzLzADF7aPGvynDfT7to6bbdw/ZTi9lwVWoend1ElfVeYCG5
	org7k0SqWCJeD1EuF6f1IeW8mp7ot6bI
X-Google-Smtp-Source: AGHT+IGvtDbPjVoxVTWOd1NdIY09lXluivgwU090ch5Y5u/dyIz8R3TJbsTLRkeF7B6H3y+DKjJ5nA==
X-Received: by 2002:a05:6402:278a:b0:5e8:bf2a:7e8c with SMTP id 4fb4d7f45d1cf-5eb1dee2f2bmr3489732a12.11.1742301929333;
        Tue, 18 Mar 2025 05:45:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b04e5sm7873781a12.35.2025.03.18.05.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:45:28 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:45:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-18b96818299ef211ef8ca620@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_054531_230553_FED374C3 
X-CRM114-Status: GOOD (  45.42  )
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

On Tue, Mar 18, 2025 at 01:13:18PM +0100, Alexandre Ghiti wrote:
> =

> On 18/03/2025 09:48, Andrew Jones wrote:
> > On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> > > Hi Drew,
> > > =

> > > On 04/03/2025 13:00, Andrew Jones wrote:
> > > > Allow skipping scalar and vector unaligned access speed tests. This
> > > > is useful for testing alternative code paths and to skip the tests =
in
> > > > environments where they run too slowly. All CPUs must have the same
> > > > unaligned access speed.
> > > I'm not a big fan of the command line parameter, this is not where we=
 should
> > > push uarch decisions because there could be many other in the future,=
 the
> > > best solution to me should be in DT/ACPI and since the DT folks, acco=
rding
> > > to Palmer, shut down this solution, it remains using an extension.
> > > =

> > > I have been reading a bit about unaligned accesses. Zicclsm was descr=
ibed as
> > > "Even though mandated, misaligned loads and stores might execute extr=
emely
> > > slowly. Standard software distributions should assume their existence=
 only
> > > for correctness, not for performance." in rva20/22 but *not* in rva23=
. So
> > > what about using this "hole" and consider that a platform that *adver=
tises*
> > > Zicclsm means its unaligned accesses are fast? After internal discuss=
ion, It
> > > actually does not make sense to advertise Zicclsm if the platform acc=
esses
> > > are slow right?
> > This topic pops up every so often, including in yesterday's server
> > platform TG call. In that call, and, afaict, every other time it has
> > popped up, the result is to reiterate that ISA extensions never say
> > anything about performance. So, Zicclsm will never mean fast and we
> > won't likely be able to add any extension that does.
> =

> =

> Ok, I should not say "fast". Usually, when an extension is advertised by a
> platform, we don't question its speed (zicboz, zicbom...etc), we simply u=
se
> it and it's up to the vendor to benchmark its implementation and act
> accordingly (i.e. do not set it in the isa string).
> =

> =

> > > arm64 for example considers that armv8 has fast unaligned accesses an=
d can
> > > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though =
some
> > > uarchs are slow. Distros will very likely use rva23 as baseline so th=
ey will
> > > enable Zicclsm which would allow us to take advantage of this too, wi=
thout
> > > this, we lose a lot of perf improvement in the kernel, see
> > > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org=
/.
> > > =

> > > Or we could have a new named feature for this, even though it's weird=
 to
> > > have a named feature which would basically=A0 mean "Zicclsm is fast".=
 We don't
> > > have, for example, a named feature to say "Zicboz is fast" but given =
the
> > > vague wording in the profile spec, maybe we can ask for one in that c=
ase?
> > > =

> > > Sorry for the late review and for triggering this debate...
> > No problem, let's try to pick the best option. I'll try listing all the
> > options and there pros/cons.
> > =

> > 1. Leave as is, which is to always probe
> >     pro: Nothing to do
> >     con: Not ideal in all environments
> > =

> > 2. New DT/ACPI description
> >     pro: Describing whether or not misaligned accesses are implemented =
in
> >          HW (which presumably means fast) is something that should be d=
one
> > 	in HW descriptions
> >     con: We'll need to live with probing until we can get the descripti=
ons
> >          defined, which may be never if there's too much opposition
> > =

> > 3. Command line
> >     pro: Easy and serves its purpose, which is to skip probing in the
> >          environments where probing is not desired
> >     con: Yet another command line option (which we may want to deprecate
> >          someday)
> > =

> > 4. New ISA extension
> >     pro: Easy to add to HW descriptions
> >     con: Not likely to get it through ratification
> > =

> > 5. New SBI FWFT feature
> >     pro: Probably easier to get through ratification than an ISA extens=
ion
> >     con: Instead of probing, kernel would have to ask SBI -- would that
> >          even be faster? Will all the environments that want to skip
> > 	probing even have a complete SBI?
> > =

> > 6. ??
> =

> =

> So what about:
> =

> 7. New enum value describing the performance as "FORCED" or "HW" (or
> anything better)
> =A0=A0=A0 pro: We only use the existing Zicclsm
> =A0=A0=A0 con: It's not clear that the accesses are fast but it basically=
 says to
> SW "don't think too much, I'm telling you that you can use it", up to us =
to
> describe this correctly for users to understand.

But Zicclsm doesn't mean misaligned accesses are in HW, it just means
they're not going to explode. We'd still need the probing to find out
if the accesses are emulated (slow) or hw (fast). We at least want to
know the answer to that question because we advertise it to userspace
through hwprobe.

(BTW, another pro of the command line is that it can be used to test
both slow and fast paths without recompiling.)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
