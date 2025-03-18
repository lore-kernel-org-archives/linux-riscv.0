Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25DC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m781FVSJb9VlAgUKtQzpeL/DDmZ3q0CvvpGE79vcCF8=; b=ryFF+kvqR1mKsb
	iOonUS/c0HadGQPU1fgU/k2J/H5V+7rM01ujW1GxZPxiQTHcenTiQAz+UyR+YnCqJgZcEQmN+fus+
	h3IB2Zyc3m/kYTzAVV2sQYIJWwZM+HJXAs/2tdxGBDtGsRzndd5/CM20ts8DSYb46/WgC1SOn+ZT5
	lrNL2AxcCGsFoh3Zf4b1fK4+C2h+S6T1OdAglDn7YrnU01bInwNI8R0Whkhj7HCudXRQEpHRVLXQU
	fr9rqiywnrzFphNlWwuBRrI8SgoNhu09XsVB0BxdWOwACQajZx8JhcVsQZqSZ6FC4fbQJ1kJidLnm
	hwOYHv4T+bCZ6lZjdc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSkc-00000005F6Q-0w8s;
	Tue, 18 Mar 2025 08:56:42 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuScZ-00000005DkL-2GQ0
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 08:48:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso938966566b.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742287701; x=1742892501; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WqyNv0rkWuAmQG+zonKK152xqjaBxNEetZ8Fug7pRk0=;
        b=IeO1NkP5w1GpREvDo31K8Whq1Or/WOAsmtd1VShUWm12LzaI/oMnw3wvjwYJh1LAco
         Wob1llM7Djh1l6sX4LGf5LzxnQNerWFHwJZG2f4i3xQxpnQxgty65jH+z7gdEFI4VLgG
         WcsmHl2mXGIp6mrGamPeGxFetB21rhkP0ZUiLOeHgng7as3FUy91O9EE6JtlkKPb3exd
         j2guMdvt2c1Q4we9YMCi3gTVeE9F02eh8lPu9poGeQZQSh5dZgOiRfT99wawgaI1IhTh
         t8YnKdYlLP5KeYeuc/RmnsBdY5c2w0CfGbBDyij6VDAtwqhDDsPjxgtipEQxyCwAElVU
         lssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287701; x=1742892501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqyNv0rkWuAmQG+zonKK152xqjaBxNEetZ8Fug7pRk0=;
        b=FguyJB5WiDW9lIEs+wFHLySZdt1q/uFaLOA7BAy3NpQzQkvn1GbWIpoNhmfh4tBkWw
         xcNAxefMdkGzuLUac3zlDpjBR1KVjom6o8tc3GEHGWGDRIo4n7JH7farCSoB0Aw26fpX
         DztLC7TPhToDwBC9+/kuWZQHgvrpf8cm9AcdnRmFt/zL9Fj0jUT7cobW9+8tJ1o1whQE
         2irTXwmAPx4X/O/pm4m/IUPjbjo6Ggt60xAbO5Tnfg/TPSSl3BDU5ehNTbOrTsKE4s7o
         Ub1OOvaL+tKTjuVUnlcCt2I3Ocf/cfqdafwY8d0+bLocs/lGEgRjADibJ5dkAIhUiZfq
         10FA==
X-Gm-Message-State: AOJu0Yzb/6Oj26InX9V3+lwK8mKeelqa0+jwndkgouSCDxNb9FCMXPgS
	fnTNCsWHSPO16ovVsFNhSOsJc2EZyXFTV0HmS3qqCH6/gE9tqDELyZNYbh5ut7w=
X-Gm-Gg: ASbGncuppM2K2LjlNxt5spHCKd9YjgoqhWatAhaN8UctzLNikxMZ8DqOX97np2oUpog
	ZgffTzn9TcVAotQUEkMxJVNSJ0PFxkrO22HrkSAPND1bPD5P2hSjml99Oppkdyw8jK0vl1OE4Xc
	ehiHgjO+6I1C5sFZTGdwCF+cTrvt7UinlO7CO86Alg6xsCykpbn8bXk3CYdJ84PuYiDdeSPM+qF
	5OduTz15E59QAYsBSbbzJunxEBX5DfREDdpin7o79HEsqv9UVxynoizcl6lqCjnbhWPVUiqRNUk
	6xctgCR7m7E+UJu2T/9Lho2cDZv/Vb2r
X-Google-Smtp-Source: AGHT+IH0qrrdRDWB/aWr2KgdxO/sTiN4xjisSw2joUvqvleAHMb/eh591Phxpukd/P9DfWxekAP8Eg==
X-Received: by 2002:a17:907:7ba4:b0:ac2:3a1:5a81 with SMTP id a640c23a62f3a-ac38fab7961mr200393166b.26.1742287701201;
        Tue, 18 Mar 2025 01:48:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9ab1sm817130566b.52.2025.03.18.01.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 01:48:20 -0700 (PDT)
Date: Tue, 18 Mar 2025 09:48:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-1b03e58fe508b077e5d38233@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_014823_582675_9BE4966D 
X-CRM114-Status: GOOD (  26.17  )
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

On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> Hi Drew,
> =

> On 04/03/2025 13:00, Andrew Jones wrote:
> > Allow skipping scalar and vector unaligned access speed tests. This
> > is useful for testing alternative code paths and to skip the tests in
> > environments where they run too slowly. All CPUs must have the same
> > unaligned access speed.
> =

> I'm not a big fan of the command line parameter, this is not where we sho=
uld
> push uarch decisions because there could be many other in the future, the
> best solution to me should be in DT/ACPI and since the DT folks, according
> to Palmer, shut down this solution, it remains using an extension.
> =

> I have been reading a bit about unaligned accesses. Zicclsm was described=
 as
> "Even though mandated, misaligned loads and stores might execute extremely
> slowly. Standard software distributions should assume their existence only
> for correctness, not for performance." in rva20/22 but *not* in rva23. So
> what about using this "hole" and consider that a platform that *advertise=
s*
> Zicclsm means its unaligned accesses are fast? After internal discussion,=
 It
> actually does not make sense to advertise Zicclsm if the platform accesses
> are slow right?

This topic pops up every so often, including in yesterday's server
platform TG call. In that call, and, afaict, every other time it has
popped up, the result is to reiterate that ISA extensions never say
anything about performance. So, Zicclsm will never mean fast and we
won't likely be able to add any extension that does.

> =

> arm64 for example considers that armv8 has fast unaligned accesses and can
> then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though some
> uarchs are slow. Distros will very likely use rva23 as baseline so they w=
ill
> enable Zicclsm which would allow us to take advantage of this too, without
> this, we lose a lot of perf improvement in the kernel, see
> https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org/.
> =

> Or we could have a new named feature for this, even though it's weird to
> have a named feature which would basically=A0 mean "Zicclsm is fast". We =
don't
> have, for example, a named feature to say "Zicboz is fast" but given the
> vague wording in the profile spec, maybe we can ask for one in that case?
> =

> Sorry for the late review and for triggering this debate...

No problem, let's try to pick the best option. I'll try listing all the
options and there pros/cons.

1. Leave as is, which is to always probe
   pro: Nothing to do
   con: Not ideal in all environments

2. New DT/ACPI description
   pro: Describing whether or not misaligned accesses are implemented in
        HW (which presumably means fast) is something that should be done
	in HW descriptions
   con: We'll need to live with probing until we can get the descriptions
        defined, which may be never if there's too much opposition

3. Command line
   pro: Easy and serves its purpose, which is to skip probing in the
        environments where probing is not desired
   con: Yet another command line option (which we may want to deprecate
        someday)

4. New ISA extension
   pro: Easy to add to HW descriptions
   con: Not likely to get it through ratification

5. New SBI FWFT feature
   pro: Probably easier to get through ratification than an ISA extension
   con: Instead of probing, kernel would have to ask SBI -- would that
        even be faster? Will all the environments that want to skip
	probing even have a complete SBI?

6. ??

I'm voting for (3), which is why I posted this patchset, but I'm happy
to hear other votes or other proposals and discuss.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
