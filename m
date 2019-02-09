Return-Path: <SRS0=fNze=QQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0C7C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Feb 2019 04:26:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 921C520844
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Feb 2019 04:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Txp7gLJo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQiQma1l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 921C520844
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0JyeB8yC5w9xLXffOQYcA412mHEwBEUiqsOJXJuZXU=; b=Txp7gLJoRVtm73
	0GFS45K4WFypwjBeY0vkB3E93OGZdjiq9jb3LDQmv5tCdEqLJ9ne8NkQtuF2wU+42RoHo5QZDwP0Y
	WwmxcDLotSCXUobKMYth54z/V5uffqyqA4kb9T1RzcQWa+u2Hwf2Nj0KmmHmiOhIjHTxnrG5eJq94
	lCxOcG4U7V5I4qe4HzaiGLU5NZM4p4yDQQR/1xugYGqe0iR6ILHmZ4pYokvvVhW1Bi25t7CZ2d6Ly
	sem6cxh6oPFx3LwY8mLt5UYCk/+4MlgNTE9vblKw7M53XgO0cr+L7ZeM11BAb1dZQNt2qUQTkeNBA
	s1Jst2Fw04eUaQq9Hlzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsKDg-0006iy-7G; Sat, 09 Feb 2019 04:26:24 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsKDc-0006hW-VS
 for linux-riscv@lists.infradead.org; Sat, 09 Feb 2019 04:26:22 +0000
Received: by mail-ot1-x342.google.com with SMTP id s5so9416560oth.7
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 20:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CZJDGOMdtOXRFRWAYeO/KPnzhNLntdqWpebs0iRo8YA=;
 b=VQiQma1l4XjIR6eEGYzmQfvOVEYwLgceJHo0bDOsEo1p6z5vRQGwFKhxpGhjlbyRrR
 HyLSsDt87agl/M6yKmMUGdaXQbzAwIrAjNtUJstv0ieTecrSia2QMV3ymJK+Wi6GTgpw
 2RrQWl3Zc2zQfy94Sk0ycwsaJnEWoxXwfBP5azefsYQVZXMf9e8lFBqy7PWXVjHF3yEj
 vo3OtaquHHe187nNaAdfhzTYQWt+5LQFlNsG9IKrSY0MEBGDcNQ1j82kEZJEbfY8m5du
 bEDU5gMmESUu+P7l6hGBqk/Ejy78DxtTFn/tv8cjKB9sqBoFm/xEyA4kljHabelzg4Ad
 H+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CZJDGOMdtOXRFRWAYeO/KPnzhNLntdqWpebs0iRo8YA=;
 b=Ag9L2W8/w9lkWC03peWb9x/7FfSi4JfJQbxPkXVf4pdjhS2coptKPouCS/HS6vF4Gb
 NM7xtDen2/ET5fDCbJtsC8L6x94mZLFysJpqCjsspVmcXxOaXYgzgxUw/ny16QVImOLs
 V5tgB/f/rMs/H1vPbBVko9uvHV90fhorXpKIJ7PaSjr+b4x5ONIisNaCgrVBfQpuEdIz
 IzMfX6U5HRX53SRQUGtOBXadxapNN6htOfSNMrAgobvjoVQSThpKlfz7bjIIVwidNJxD
 /bUOtO3RyV8Q1n2JNgHFQ/6vUHoOl6Q6vGFKffSf2Ipk46dhDZWBfIiGb+XaCs/URYaM
 AKKw==
X-Gm-Message-State: AHQUAuY5LLeQgW78ANmQT9J9Kt/gvDfOM+ntAoR4laeqTFH8jun2JoW3
 TDmNyGA7GSnaKTsIO+S8H8f3vRDgTRz9E8Xd8gS6iv3osh4=
X-Google-Smtp-Source: AHgI3IbKMEU/Wcgm9oUmuK1GMSHmJdaqpMETuAn7dHhzWPQrK7BECwfAXT0yMi5hh2N30KuxUY+R7FX+l+sEFXxm2kc=
X-Received: by 2002:a9d:137:: with SMTP id 52mr16706091otu.307.1549686379154; 
 Fri, 08 Feb 2019 20:26:19 -0800 (PST)
MIME-Version: 1.0
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
 <1549590681-24125-9-git-send-email-atish.patra@wdc.com>
 <20190208091133.GD16932@infradead.org>
 <8f5fd0c8-0320-00b1-4ddf-b1225be352c8@wdc.com>
In-Reply-To: <8f5fd0c8-0320-00b1-4ddf-b1225be352c8@wdc.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Sat, 9 Feb 2019 05:26:07 +0100
Message-ID: <CAEn-LTqx8CQ7kY3kRKWFoAkSSu_FNoZkd9JnNYDNLAYX1kLHSA@mail.gmail.com>
Subject: Re: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_202621_039276_AE8FC176 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Feb 9, 2019 at 12:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 2/8/19 1:11 AM, Christoph Hellwig wrote:
> >> +     * We don't support running Linux on hertergenous ISA systems.
> >> +     * But first "okay" processor might not be the boot cpu.
> >> +     * Check the ISA of boot cpu.
> >
> > Please use up your available 80 characters per line in comments.
> >
> I will fix it.
>
> >> +            /*
> >> +             * All "okay" hart should have same isa. We don't know how to
> >> +             * handle if they don't. Throw a warning for now.
> >> +             */
> >> +            if (elf_hwcap && temp_hwcap != elf_hwcap)
> >> +                    pr_warn("isa mismatch: 0x%lx != 0x%lx\n",
> >> +                            elf_hwcap, temp_hwcap);
> >> +
> >> +            if (hartid == boot_cpu_hartid)
> >> +                    boot_hwcap = temp_hwcap;
> >> +            elf_hwcap = temp_hwcap;
> >
> > So we always set elf_hwcap to the capabilities of the previous cpu.
> >
> >> +            temp_hwcap = 0;
> >
> > I think tmp_hwcap should be declared and initialized inside the outer loop
> > instead having to manually reset it like this.
> >
> >> +    }
> >>
> >> +    elf_hwcap = boot_hwcap;
> >
> > And then reset it here to the boot cpu.
> >
> > Shoudn't we only report the features supported by all cores?  Otherwise
> > we'll still have problems if the boot cpu supports a feature, but not
> > others.
> >
>
> Hmm. The other side of the argument is boot cpu does have a feature that
> is not supported by other hart that didn't even boot.
> The user space may execute something based on boot cpu capability but
> that won't be enabled.
>
> At least, in this way we know that we are compatible completely with
> boot cpu capabilities. Thoughts ?

There is one example on the market, e.g., Samsung Exynos 9810.

Mongoose 3 (big cores) only support ARMv8.0, while Cortex-A55
(little ones) support ARMv8.2 (and that brings atomics support).
I think, it's the only ARM SOC that supports different ISA extensions
between cores on the same package.

Kernel scheduler doesn't know that big cores are missing atomics
support or that applications needs it and moves the thread
resulting in illegal instruction.

E.g., see Golang issue: https://github.com/golang/go/issues/28431

I also recall Jon Masters (Computer Architect at Red Hat) advocating
against having cores with mismatched capabilities on the server market.

It just causes more problems down the line.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
