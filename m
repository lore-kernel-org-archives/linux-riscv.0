Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4303C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hfj8lh0AfHCdY0TkEDi/Fgg6Z4tcmmB+Phrw0UNja4c=; b=gr9tDCWwS4b2ds
	p2XVZI59jWMUNQ1H/KSWzXCbt2WOVFIADgMjfhM8xbdQO0q2UhbNCjQZ6weBTCdIq/6AMUQ8KPh5i
	l7ZYfdcMrYZGbs5KLFLHgyvA9JoPmtmx7cP2yLwj0fVTtbP8ASIyByfegeF7y1Ay+lcXR1n4/xzjY
	lwpYfAg+T7bpeheMoEDc12OnyV7z79/9gzYJZG5ySNDeDGI6ST7v3hx7ooNLv+X+daDqhXr2/WGlU
	NNQKxrKQCwtDyDmR85INmikTT+ZgRlvezd/oG6tiRwRnLpREB4yK6rdZ41u7t7h6WGXdZJE4UCPA+
	KucPpca5yBGNNPl0nFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSua-00000005H5y-1op3;
	Tue, 18 Mar 2025 09:07:00 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSob-00000005Flp-1CfI
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 09:00:50 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso7843639a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742288447; x=1742893247; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wr4dUiqaKywBCUa33frJJ04baPImRwSaV0A/LlSiREE=;
        b=d3Ey9JrKuhPJioghr4L0Epjc4Oqy3VjdY0ZU4cW6If3xaAjM+VGkM0+EfcV59ONie+
         7OKY2VU1NV4wuM4JoUKG1uMMVZHEl6tx0+SuLsKNK9nRZLQFtTpA05B2pxIlsZcFnJo3
         cw18WJhr7A8KuB1FTNt5ZbAS5HQtDypxeKcIPfAHCwMz9GQmDpHFfbIVo27wh8NnseTm
         +QoQFwL4yUer5dWALGhI5NHcOxGb7MklMFc17oo3xG4zFSC5OwQzuBbOeayDfq4wac7n
         BM9qXpu2OXCV9Z+sL0sAMVf1NnVgay/hwFigpY0txO5ujMTVQHB5PGfn9voXIa+AbcxB
         0IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288447; x=1742893247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr4dUiqaKywBCUa33frJJ04baPImRwSaV0A/LlSiREE=;
        b=nX8InFqhjFO5zHHg4N7Xoj6UaxoRKwn7JzrSrd+gh9kFiYLs7M7baCAfOO8y4vj0KI
         8ZDfwaU1Tb/R3rzavc9R/9xA/RDQln58/KhP8RVrhpvVtzgbMZh7mXy+t3GimSEB3GsG
         9knz5DaJ/rPx/NJi0FjJ1gXOKo5ElHPLI3kjTBphMwjofUh0u9H2QPM6LMOP5fncD6n+
         ZC1dsJ5NXr7lCXlADgFK6vXIKDHGVrSkBequkv3ehd6qX3QMZYydBWYCkZbuwhLmCTPZ
         GaulsZZ2pkA5dumdYeoXCamLlGym4UJ3+YWEttGGEq1OGiSS3Wi/ZBLaz0F2u6bagRCt
         CQ0w==
X-Gm-Message-State: AOJu0Yyb8MpQSd1AIvkphuNAX0LpMcJeiGDr3yzd3CP4aF6til25N/jz
	0KZlkCwSzXkNp4rNAD1sE332ayA5yUothpFBnBZfUoqOsmxCzqMnmVZUmsYmslY=
X-Gm-Gg: ASbGncu4WKTQ0EesKbhgY4s9EvZWoF0UKX4+L/1ZhZBqBnvDoq3sUg5FnKgu/wonS9X
	wCSvk+zvaUegzIw6LUd13eQzTyj3p8nVHfDUegv2bG6xXwKXT2LNfKlwBXQg5FGOi2+gtkJ8nMC
	b6U7DOCHHcKaBOQ0QhmM5xK28axk2wQHyy8wUAuQC7tGjYCX732/IrFC5DWTU7yq2u2/VKr7ihL
	mfJ/TwgvYWY3S6ncMYK2GeWU8KUmAoKjr3TPaV9WksfG8/6tBB9Tm/m95FmfOizVnEH5DRanY0O
	iPUtM6cWtHGyL2NmCY8kKRLcHDxvY50No/3rv0R+53o=
X-Google-Smtp-Source: AGHT+IGBsklbulm+vYAotQHhh8oVdp47PW9k6WK8XOOUPLWd/0Ehy9b34njTBzMzUsYjAPB/A6Vdow==
X-Received: by 2002:a05:6402:51ca:b0:5dc:c943:7b6 with SMTP id 4fb4d7f45d1cf-5eb1dec1a1bmr2420615a12.3.1742288447279;
        Tue, 18 Mar 2025 02:00:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816977a5fsm7228660a12.32.2025.03.18.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 02:00:46 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:00:46 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-61be6a5455ea164b45d6dc64@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318-1b03e58fe508b077e5d38233@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_020049_325707_FD5637F7 
X-CRM114-Status: GOOD (  37.84  )
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

On Tue, Mar 18, 2025 at 09:48:21AM +0100, Andrew Jones wrote:
> On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> > Hi Drew,
> > =

> > On 04/03/2025 13:00, Andrew Jones wrote:
> > > Allow skipping scalar and vector unaligned access speed tests. This
> > > is useful for testing alternative code paths and to skip the tests in
> > > environments where they run too slowly. All CPUs must have the same
> > > unaligned access speed.
> > =

> > I'm not a big fan of the command line parameter, this is not where we s=
hould
> > push uarch decisions because there could be many other in the future, t=
he
> > best solution to me should be in DT/ACPI and since the DT folks, accord=
ing
> > to Palmer, shut down this solution, it remains using an extension.
> > =

> > I have been reading a bit about unaligned accesses. Zicclsm was describ=
ed as
> > "Even though mandated, misaligned loads and stores might execute extrem=
ely
> > slowly. Standard software distributions should assume their existence o=
nly
> > for correctness, not for performance." in rva20/22 but *not* in rva23. =
So
> > what about using this "hole" and consider that a platform that *adverti=
ses*
> > Zicclsm means its unaligned accesses are fast? After internal discussio=
n, It
> > actually does not make sense to advertise Zicclsm if the platform acces=
ses
> > are slow right?
> =

> This topic pops up every so often, including in yesterday's server
> platform TG call. In that call, and, afaict, every other time it has
> popped up, the result is to reiterate that ISA extensions never say
> anything about performance. So, Zicclsm will never mean fast and we
> won't likely be able to add any extension that does.
> =

> > =

> > arm64 for example considers that armv8 has fast unaligned accesses and =
can
> > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though so=
me
> > uarchs are slow. Distros will very likely use rva23 as baseline so they=
 will
> > enable Zicclsm which would allow us to take advantage of this too, with=
out
> > this, we lose a lot of perf improvement in the kernel, see
> > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org/.
> > =

> > Or we could have a new named feature for this, even though it's weird to
> > have a named feature which would basically=A0 mean "Zicclsm is fast". W=
e don't
> > have, for example, a named feature to say "Zicboz is fast" but given the
> > vague wording in the profile spec, maybe we can ask for one in that cas=
e?
> > =

> > Sorry for the late review and for triggering this debate...
> =

> No problem, let's try to pick the best option. I'll try listing all the
> options and there pros/cons.
> =

> 1. Leave as is, which is to always probe
>    pro: Nothing to do
>    con: Not ideal in all environments
> =

> 2. New DT/ACPI description
>    pro: Describing whether or not misaligned accesses are implemented in
>         HW (which presumably means fast) is something that should be done
> 	in HW descriptions
>    con: We'll need to live with probing until we can get the descriptions
>         defined, which may be never if there's too much opposition
> =

> 3. Command line
>    pro: Easy and serves its purpose, which is to skip probing in the
>         environments where probing is not desired
>    con: Yet another command line option (which we may want to deprecate
>         someday)
> =

> 4. New ISA extension
>    pro: Easy to add to HW descriptions
>    con: Not likely to get it through ratification
> =

> 5. New SBI FWFT feature
>    pro: Probably easier to get through ratification than an ISA extension
>    con: Instead of probing, kernel would have to ask SBI -- would that
>         even be faster? Will all the environments that want to skip
> 	probing even have a complete SBI?
> =

> 6. ??

I forgot one, which was v1 of this series and already rejected,

 6. Use ID registers
    pro: None of the above cons, including the main con with the command
         line, which is that there could be many other decisions in the
	 future, implying we could need many more command line options.
    con: A slippery slope. We don't want to open the door to
         features-by-idregs. (However, we can at least always close the
	 door again if better mechanisms become available. Command
	 lines would need to be deprecated, but feature-by-idreg code
	 can just be deleted.)

Thanks,
drew

> =

> I'm voting for (3), which is why I posted this patchset, but I'm happy
> to hear other votes or other proposals and discuss.
> =

> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
