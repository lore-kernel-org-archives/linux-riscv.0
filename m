Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F01C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 19:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7670220863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 19:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TEjVSPXz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="N+v7LreT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7670220863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5oTzhNmhnDdy8xbmFOj3zeL8PjUEr6Np9glwSvG+HwM=; b=TEjVSPXz+5Ekkvk+jglcmpXL/
	M8UxpSemy5kTnnUSa4GDIMWqEFnZDPkft8gAVFdHImeF8zOJHFy6L2pq6zSMsYYeRvAgMviMKTzV0
	tSIDv3ScRuHZFGZ8CIsI3YaCUq934Phm6jYQ9aoMJdZzqUOkiUu2bz1DbZKnOAo+dQLa2QEDM3a9T
	ZlcUGXrlO9RQwmpURrpAHsU9N8HKAIzoUgdrChGhpnPU/lhTViyfBfDnTg/CdlljmX/D3XihSgJlU
	xf/4Jt56lZtGRD5kEwDb1XuLIuGn3Gbvgswi0Rb/QibLQMuV+TqRFf5dxS1H1j/DACsE6yV+DOHJR
	DapkKI/JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtGqi-0003WP-VL; Mon, 11 Feb 2019 19:02:37 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtGqe-0003VZ-Qu
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 19:02:34 +0000
Received: by mail-pf1-x442.google.com with SMTP id y126so5697476pfb.4
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 11:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+4TfL/o8ePF0fI2rvClWd5kU9XAo5kGOyfgSfeCu4R4=;
 b=N+v7LreTPw8gE1xv4G41vgn5iaVikZDofR5Bg6lzAKfr8xutniUnq5QWpN8ufNMjkI
 7D1J4ll9qbhPsjoUFXI6zc22/qahNaxYe8bhILwgc0PDsuECOUVtsyyXI8BWuoxUyFju
 OUI3LOZR/v/by9cYctqbnDs9P3SbmITfn4RdG0pee2mivStr2gtQxPYnN3YpQUGC/MgZ
 1SAHcpKB5OSBLVunX+2XrwhCVIHJ1Mfk3FJ3EnvWegA6jwWM9RyLxpx9yLBfCWXL2rHx
 9n4CGJ7po/mYbwI3oLn22TdCLZeCbsbd7cKZX8NkP6kf8tgIrp9ItvFYsi+EQxoEJqp4
 VIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+4TfL/o8ePF0fI2rvClWd5kU9XAo5kGOyfgSfeCu4R4=;
 b=j6h0Z1U1NTFJEPcE98ia3HNx+B0meZKXUrBw1lGny/WeFC6xogCJK2PYqjLvmpx3xk
 YX5aXxO/BO9YDrKXYDyGH357ctkPxrZmxc8zmIWBuQHoxP9W2binklJRltN27XTzv6vf
 agtBPZKqjjxwHXERXcsbCXBoGvC4w2LDq+BqWsCTmEtjtqFP1uoeudv4YZxTzGukwICa
 krSjUM0BUdG67Hs7KIFHX1roF6oSdm31GlQRqJXxNpd4dkXvl+dim3w0nGUS1DLSo0LP
 3WNWuNeUuv37YasEaXgpbTh3Qzx5D9w4zrmyfjeOAAxNRWyXlopWIgfvZUKaTOHPhKIh
 6LIQ==
X-Gm-Message-State: AHQUAubb0tDyMlBpxFDazD9Q2FqIAQVgl4Zl1VdvbvEC8iEqXlbm1pzU
 I2t7ObesDAk1qX4Pj1fwNazeyQ==
X-Google-Smtp-Source: AHgI3IbGUnYqq0gjNt56H6AiHggXnwVA1VyjwryXcIj6PKK6X7AOB8w35z8IOEfLIrQ9KeiEQchmCg==
X-Received: by 2002:a63:9f19:: with SMTP id g25mr30120186pge.327.1549911751541; 
 Mon, 11 Feb 2019 11:02:31 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e24sm15371893pfi.153.2019.02.11.11.02.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 11:02:30 -0800 (PST)
Date: Mon, 11 Feb 2019 11:02:30 -0800 (PST)
X-Google-Original-Date: Mon, 11 Feb 2019 10:29:52 PST (-0800)
Subject: Re: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
In-Reply-To: <CAEn-LTqx8CQ7kY3kRKWFoAkSSu_FNoZkd9JnNYDNLAYX1kLHSA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-baffacaa-599b-4c89-a5a0-e0c85ddb6d44@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_110232_903798_36A38C2D 
X-CRM114-Status: GOOD (  20.73  )
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
Cc: Damien.LeMoal@wdc.com, aou@eecs.berkeley.edu, jason@lakedaemon.net,
 alankao@andestech.com, dmitriy@oss-tech.org, anup@brainfault.org,
 daniel.lezcano@linaro.org, me@packi.ch, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 Paul Walmsley <paul.walmsley@sifive.com>, marc.zyngier@arm.com, schwab@suse.de,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, zongbox@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 08 Feb 2019 20:26:07 PST (-0800), david.abdurachmanov@gmail.com wrote:
> On Sat, Feb 9, 2019 at 12:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> On 2/8/19 1:11 AM, Christoph Hellwig wrote:
>> >> +     * We don't support running Linux on hertergenous ISA systems.
>> >> +     * But first "okay" processor might not be the boot cpu.
>> >> +     * Check the ISA of boot cpu.
>> >
>> > Please use up your available 80 characters per line in comments.
>> >
>> I will fix it.
>>
>> >> +            /*
>> >> +             * All "okay" hart should have same isa. We don't know how to
>> >> +             * handle if they don't. Throw a warning for now.
>> >> +             */
>> >> +            if (elf_hwcap && temp_hwcap != elf_hwcap)
>> >> +                    pr_warn("isa mismatch: 0x%lx != 0x%lx\n",
>> >> +                            elf_hwcap, temp_hwcap);
>> >> +
>> >> +            if (hartid == boot_cpu_hartid)
>> >> +                    boot_hwcap = temp_hwcap;
>> >> +            elf_hwcap = temp_hwcap;
>> >
>> > So we always set elf_hwcap to the capabilities of the previous cpu.
>> >
>> >> +            temp_hwcap = 0;
>> >
>> > I think tmp_hwcap should be declared and initialized inside the outer loop
>> > instead having to manually reset it like this.
>> >
>> >> +    }
>> >>
>> >> +    elf_hwcap = boot_hwcap;
>> >
>> > And then reset it here to the boot cpu.
>> >
>> > Shoudn't we only report the features supported by all cores?  Otherwise
>> > we'll still have problems if the boot cpu supports a feature, but not
>> > others.
>> >
>>
>> Hmm. The other side of the argument is boot cpu does have a feature that
>> is not supported by other hart that didn't even boot.
>> The user space may execute something based on boot cpu capability but
>> that won't be enabled.
>>
>> At least, in this way we know that we are compatible completely with
>> boot cpu capabilities. Thoughts ?
>
> There is one example on the market, e.g., Samsung Exynos 9810.
>
> Mongoose 3 (big cores) only support ARMv8.0, while Cortex-A55
> (little ones) support ARMv8.2 (and that brings atomics support).
> I think, it's the only ARM SOC that supports different ISA extensions
> between cores on the same package.
>
> Kernel scheduler doesn't know that big cores are missing atomics
> support or that applications needs it and moves the thread
> resulting in illegal instruction.
>
> E.g., see Golang issue: https://github.com/golang/go/issues/28431
>
> I also recall Jon Masters (Computer Architect at Red Hat) advocating
> against having cores with mismatched capabilities on the server market.
>
> It just causes more problems down the line.

IMO the best bet is to only put extensions in HWCAP that are supported by all 
the harts that userspace will be scheduled on.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
