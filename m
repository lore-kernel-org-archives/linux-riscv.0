Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A760C282D7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 22:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66AEF218AD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 22:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxNmPEKy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mFmQgTb8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66AEF218AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zsgFD+eBjmhal9L/gZOjjDIBNd11qWqXJcRRIKe4hgk=; b=bxNmPEKyKhBgOH8K0PyqSbsyX
	Zp0FM/NYdv/cPhqSAGEA+yCLRpjW3el9eKYShNru2krYrdYDK5rZSNRQQpPNS/prR5IsNI4wVC8IL
	zpq1khulpQi/0SiI9ViQ2L1ek3lJ1o4dMtuJnmPZ9oNxjTLSOHCOrAAU7ehY24kVyjKFFj9IuuESh
	SFU5i5363uirLbP+Y/BQi6EcrtBak32LECbFb7gKN/Wh4So1rYKw9BAGX+MM2cVKXxMgeIpo87TI0
	C88Y+jdzs1HMbbzMHzo8TuZAuzQp4Rh/UUcz1hYlxeSUNePCJS8oJ8sWThS8/kaWALIv3vj/mfxhp
	n1EOEjgdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtJyz-0008Lr-V4; Mon, 11 Feb 2019 22:23:21 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtJyx-0008LT-3P
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 22:23:21 +0000
Received: by mail-pg1-x543.google.com with SMTP id g189so224063pgc.5
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 14:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MrPICWp6pz3MZZf/m3HgNLOFtoUsRY4n1DmcuA0FpPY=;
 b=mFmQgTb8/+n35SO/Ed/3B4oKrYHYM7sQMf7ottpU4Zs9XqfVyXQf9Ar75K3fnIeX3r
 pPNAxcqBAVSIdVYAwIkJzE5t8VPkxk/AQ5ThWwj/h/4n/0yUq7iMghzpCAJVW6NUgx62
 b9MQMStQzj2JSzF/OzQG46+J6/glq3dLgsQ8FD2x15wF1wTAXXkkSpF5/GNmz2paG3Sm
 GxrZyXPVlzvcD7QypO5hlyLfvnZsqcpoqdh7ux27B49nAIAf7KCO5JwauJY8qNcRl5Xi
 lFeqdyJynv6j8993VztefbH1oVYCWyIuo/AKfAdbGBfJMGSkzep3GYRvDz0KZLeS9KxN
 TcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MrPICWp6pz3MZZf/m3HgNLOFtoUsRY4n1DmcuA0FpPY=;
 b=jAcVDjhnlO7FbD0Pj9zYUidaUPSK19Od6Ih35hvbjDK5aHpuS0W0/Yw38fxKg3fhKf
 OEX6g7adDLNBTPqg/whgbKhUmDqEigEUpI5hIk6vg6l5AAI717b0zgM7DOmNmCF5wwb5
 PnNcVrfROb2p3IeQiF7NwximwPRWX14n8svUmVUpMqFehkTKP2/DxmMQGvPUqysAbxXA
 sq5qPqbAU9VHcRos5e1PPFmzQ6ZHPpdOq5ltcMv9jvm8rpFneaMDOkoIMDtoLpb79u6T
 pZ8zodebCIsz6XgeE0ee7Q9g5Dh3CLa4CX3HISByeq4BTiorTLmqCnDok5FjKv6f3y1n
 PBuQ==
X-Gm-Message-State: AHQUAuanogcb9AfPKJAEDsYkPF3vKyOxYsVgOpNZ3iGS7eoMde3YwUav
 ZZTibGP6/t0TfYLL7ixX3VXtYQ==
X-Google-Smtp-Source: AHgI3IYZP91WKA9faP5sK3q6a60MyNbanyy5FvH4gGveLqeZo9s8vLPuCMlq81WHFL87hoTz8maJZA==
X-Received: by 2002:aa7:849a:: with SMTP id u26mr516187pfn.157.1549923798419; 
 Mon, 11 Feb 2019 14:23:18 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l11sm14324508pff.65.2019.02.11.14.23.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 14:23:17 -0800 (PST)
Date: Mon, 11 Feb 2019 14:23:17 -0800 (PST)
X-Google-Original-Date: Mon, 11 Feb 2019 14:22:30 PST (-0800)
Subject: Re: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
In-Reply-To: <20190211221325.7244b575@why.wild-wind.fr.eu.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: marc.zyngier@arm.com
Message-ID: <mhng-99c5091e-32b8-4609-a92d-d3ff2a239887@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_142319_149063_943325E7 
X-CRM114-Status: GOOD (  19.57  )
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
 alankao@andestech.com, david.abdurachmanov@gmail.com, dmitriy@oss-tech.org,
 anup@brainfault.org, daniel.lezcano@linaro.org, me@packi.ch,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, Paul Walmsley <paul.walmsley@sifive.com>, schwab@suse.de,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, zongbox@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Feb 2019 14:13:25 PST (-0800), marc.zyngier@arm.com wrote:
> On Mon, 11 Feb 2019 12:03:30 -0800
> Atish Patra <atish.patra@wdc.com> wrote:
>
>> On 2/11/19 11:02 AM, Palmer Dabbelt wrote:
>> > On Fri, 08 Feb 2019 20:26:07 PST (-0800), david.abdurachmanov@gmail.com wrote:
>> >> On Sat, Feb 9, 2019 at 12:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>> >>>
>> >>> On 2/8/19 1:11 AM, Christoph Hellwig wrote:
>> >>>>> +     * We don't support running Linux on hertergenous ISA systems.
>> >>>>> +     * But first "okay" processor might not be the boot cpu.
>> >>>>> +     * Check the ISA of boot cpu.
>> >>>>
>> >>>> Please use up your available 80 characters per line in comments.
>> >>>>
>> >>> I will fix it.
>> >>>
>> >>>>> +            /*
>> >>>>> +             * All "okay" hart should have same isa. We don't know how to
>> >>>>> +             * handle if they don't. Throw a warning for now.
>> >>>>> +             */
>> >>>>> +            if (elf_hwcap && temp_hwcap != elf_hwcap)
>> >>>>> +                    pr_warn("isa mismatch: 0x%lx != 0x%lx\n",
>> >>>>> +                            elf_hwcap, temp_hwcap);
>> >>>>> +
>> >>>>> +            if (hartid == boot_cpu_hartid)
>> >>>>> +                    boot_hwcap = temp_hwcap;
>> >>>>> +            elf_hwcap = temp_hwcap;
>> >>>>
>> >>>> So we always set elf_hwcap to the capabilities of the previous cpu.
>> >>>>
>> >>>>> +            temp_hwcap = 0;
>> >>>>
>> >>>> I think tmp_hwcap should be declared and initialized inside the outer loop
>> >>>> instead having to manually reset it like this.
>> >>>>
>> >>>>> +    }
>> >>>>>
>> >>>>> +    elf_hwcap = boot_hwcap;
>> >>>>
>> >>>> And then reset it here to the boot cpu.
>> >>>>
>> >>>> Shoudn't we only report the features supported by all cores?  Otherwise
>> >>>> we'll still have problems if the boot cpu supports a feature, but not
>> >>>> others.
>> >>>>
>> >>>
>> >>> Hmm. The other side of the argument is boot cpu does have a feature that
>> >>> is not supported by other hart that didn't even boot.
>> >>> The user space may execute something based on boot cpu capability but
>> >>> that won't be enabled.
>> >>>
>> >>> At least, in this way we know that we are compatible completely with
>> >>> boot cpu capabilities. Thoughts ?
>> >>
>> >> There is one example on the market, e.g., Samsung Exynos 9810.
>> >>
>> >> Mongoose 3 (big cores) only support ARMv8.0, while Cortex-A55
>> >> (little ones) support ARMv8.2 (and that brings atomics support).
>> >> I think, it's the only ARM SOC that supports different ISA extensions
>> >> between cores on the same package.
>> >>
>> >> Kernel scheduler doesn't know that big cores are missing atomics
>> >> support or that applications needs it and moves the thread
>> >> resulting in illegal instruction.
>> >>
>> >> E.g., see Golang issue: https://github.com/golang/go/issues/28431
>> >>
>> >> I also recall Jon Masters (Computer Architect at Red Hat) advocating
>> >> against having cores with mismatched capabilities on the server market.
>> >>
>> >> It just causes more problems down the line.
>> > > IMO the best bet is to only put extensions in HWCAP that are supported by all
>> > the harts that userspace will be scheduled on.
>> > Fair enough. Instead of setting HWCAP in setup_arch() once, we can set it only for boot cpu. It will be updated after every cpu comes up online.
>>
>> Thus, HWCAP will consists all extensions supported by all cpus that are online currently.
>
> You must thus prevent CPUs that have a different set of capabilities
> from coming up late (once userspace has started).

and we have no way to do that.  I'd prefer if we just looked through the entire 
device tree and only showed userspace the features that are on every possible 
CPU from the start.  Otherwise the HWCAP will shift around during a userspace 
run, which seems odd.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
