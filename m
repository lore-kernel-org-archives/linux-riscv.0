Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB865C0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9h+3QgsfggHgG4qYGSYj+OzKGp9qX619k/IbeFPA0o=; b=WsPZrYknrSJ5Ov
	xDECkXnsSLJba4rtiA7Tz/HYl7EBjFdYK6nboN+o1chpIn0fni7PI081ujXmmy7vSRU1wkB3XpUTD
	8M9rn3PHocT3OamqpiCzY4Jk6V/iP7IpUnAg9eoSdotrK3GxSknWxbPblQJLiNWmbA9hqPIVop3zL
	LvNdRMgYfvNlWkvfLJVlvl5HJJeS4XGpAqUpApkFlwCMdDoVnGJuwmVON9zdB0qLqvuXLGDLUZWl7
	AEJBWbN+BOlACdU48O4L+ICgmz87LjyT9jh2A9ly4IVBxGGNY4d0YdDOqu3rjPp8MWgLw0FyBpJWW
	v+9qxKvY7qXy9AZEZ4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRT6u-006vZN-1d;
	Thu, 03 Aug 2023 07:51:04 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRT6r-006vYd-1r
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 07:51:03 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9fa64db41so9544191fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 00:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691049058; x=1691653858;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wCff3AY735/RifGIKqrNwC7ynL+iFT9I7gjyha10YBw=;
        b=CHY9K7/4jxSChdfaTwrY0h8SbigMOdklHElsqj+GCSqHyNHWxMroYJmWhYqbo7Izfu
         g22L3NewWHCz6vD0K2tHXB/w7YVjxTtu77BIJAL0FgRvtk3QbmrQx44Fgv0GFSNUEBzn
         ILf/4OnWIiKWGJrmaAa0tFW57SN9wCSz+AyKllfD2w7KT0lpeFS5UqZoyRpOa/+tEO53
         y2Nip0pFfCHZzTD6qYPuIMmTEsxwmlp0Qe5320PdUTLQhMaATV6nAQeZ3rLime21bNs0
         qSGmRULBcAKocvmGavP0J+Xio+mCPSxLsaSUhKgYwlRoPWzMUpYa7sagq7kYZQUtYPTp
         ewHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691049058; x=1691653858;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCff3AY735/RifGIKqrNwC7ynL+iFT9I7gjyha10YBw=;
        b=fM9ZRbUVCwZoI+61iHoWyqb/lns+PvTGpW8Z4Nd047a4J2AB8PiCGGlSPc0rKQp3iR
         av7NqhlCiDB72QDpoSWiGfUAvvZ0F4zLRoBRyqnLV8AV5Gg0qOqpiJCt3j85LBuvBmxN
         f7xeQsVyA2KHYuYlbdx+JjwFUlD2gusgNTH7vHP2EItWDLxX1oewFBMv1V/+hMmUr1ec
         Lq4LVE2PWX8C1p1LYXscO7na8pIJCHPYmPi5dBJb5KK4fihPQnNRL6hK8N80cWIumrkL
         oU3lO6AVyCH3zrhO9mJKnJW1twrD0WoRoI8lpZIxCT8jAZCpykWEedTf3Xl2CKsZ5kaB
         DqEg==
X-Gm-Message-State: ABy/qLZrz8M/WsipPZxcu1KIlNevqhv5QZIktlaFah6SywqG6S++zlNx
	rDFuY33CZoIKVHZrijVRogdfsZiiDTrkeaSpcfM=
X-Google-Smtp-Source: APBJJlHhhvl30MNwsB0WxiiIyhPAy0bIZ2mWz1CFr5NKI8AYrAVs22vStSFifEYSehfy7XT9au6jtoVmlEg/7IqPmxQ=
X-Received: by 2002:a2e:4942:0:b0:2b9:4413:864e with SMTP id
 b2-20020a2e4942000000b002b94413864emr6828729ljd.53.1691049058295; Thu, 03 Aug
 2023 00:50:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9cd5:0:b0:2b7:787:e49d with HTTP; Thu, 3 Aug 2023
 00:50:57 -0700 (PDT)
In-Reply-To: <1e5419bc-049b-cd4b-a820-f75f57c59c6d@sifive.com>
References: <CAPm8-H43P4WrgibV2MGNFZt7ommkchAeom4m0Kt3N-CsG6D9RA@mail.gmail.com>
 <20230802-palpitate-defection-4908b4cbd142@spud> <CAPm8-H5d_Hp0zaYh+uX6=KhB2GHGHTkaB6tu6Q82AgR4zK-4xw@mail.gmail.com>
 <CAPm8-H6A9HoJF6B8U5WP2ucqZQrszN-avV6ETX=iPWXq4EvaoA@mail.gmail.com> <1e5419bc-049b-cd4b-a820-f75f57c59c6d@sifive.com>
From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Thu, 3 Aug 2023 10:50:57 +0300
Message-ID: <CAPm8-H76FEDF1K-q0C3u_D231jhOEQJ-p=FgTfYMDN=M5=2VAw@mail.gmail.com>
Subject: Re: dts - linux,usable-memory
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_005101_616562_6D71A3C3 
X-CRM114-Status: GOOD (  17.18  )
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

On 8/2/23, Samuel Holland <samuel.holland@sifive.com> wrote:
> Hi Laurentiu,
>
> On 2023-08-02 9:37 AM, Laurentiu-Cristian Duca wrote:
>> On 8/2/23, Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> wrote:
>>> On 8/2/23, Conor Dooley <conor@kernel.org> wrote:
>>>> Hey,
>>>>
>>>> On Wed, Aug 02, 2023 at 04:51:47PM +0300, Laurentiu-Cristian Duca
>>>> wrote:
>>>>>   my name is laurentiu-cristian duca and i am an open-source
>>>>> enthusiast.
>>>>> lately i have tried to use the linux,usable-memory in the dts memory
>>>>> node
>>>>> and linux freezes.
>>>>>   if i use only reg, linux boots fine.
>>>>>   does anybody used linux,usable-memory and can you show a working
>>>>> example.
>>>>>
>>>>>   here is what i tried
>>>>>         memory@80000000 {
>>>>>                 device_type = "memory";
>>>>>                 reg = <0x0 0x80000000 0x0 0x700000>;
>>>>>                 //linux,usable-memory = <0x80000000 0x700000>;
>>>>>         };
>>>>
>>>> What are you actually doing when you freeze? A normal boot? Kexec?
>>>> What hardware is this?
>>>> Are you using OpenSBI, and if so what version?
>>>> What version of the kernel is this?
>>>
>>>   linux5.13.19 with busybox minimal rootfs, bbl (berkeley boot loader),
>>> hardware fpga board with only uart and memory 8MB
>>> i simulate in verilator the verilog sources and i have success if the
>>> dts has reg.
>>>  when it freezes, i can not see any message in simulation
>> [    0.000000] Linux version 5.13.19 (laur@laurPC-100)
>> (riscv32-linux-gcc.br_real (Buildroot 2021.08) 11.1.0, GNU ld (GNU
>> Binutils) 2.37) #402 SMP Wed Aug 2 15:27:14 EEST 2023
>> [    0.000000] OF: fdt: memory scan node memory@80000000, reg size 8,
>> [    0.000000] Machine model: kise-lab,simrv
>> [    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
>> [    0.000000] printk: bootconsole [sbi0] enabled
>> [    0.000000] printk: debug: ignoring loglevel setting.
>> from here i can not see anything
>>
>>
>>> if you want to, i can send you the sources
>>>
>>>   please tell me if the dts memory property is written correctly for
>>> linux,usable-memory
>
> It is not. The number of cells you need is given by the #address-cells and
> #size-cells properties of the root node (see early_init_dt_scan_memory()).
> You
> didn't include that part of the DTS in your example, but I am guessing the
> "reg"
> property is correct, and it has two cells each. linux,usable-memory should
> look
> the same. So the correct format would be:
>
>         linux,usable-memory = <0x0 0x80000000 0x0 0x700000>;
>

  I tried this also without success. The same error.
here is my devicetree.dts:

/dts-v1/;

/ {
        #address-cells = <0x2>;
        #size-cells = <0x2>;
        model = "kise-lab,simrv";
        compatible = "kise_lab,simrv";

        cpus {
                #address-cells = <0x1>;
                #size-cells = <0x0>;
                // 104 * 10^6 = 0x632ea00
                timebase-frequency = <0x632ea00>;

                cpu@0 {
                        device_type = "cpu";
                        reg = <0x0>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa = "rv32acim";
                        mmu-type = "riscv,sv32";
                        // 104 * 10^6 = 0x632ea00
                        clock-frequency = <0x632ea00>;

                        interrupt-controller {
                                #interrupt-cells = <0x1>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x1>;
                                linux,phandle = <0x01>;
                        };
                };

                cpu@1 {
                        device_type = "cpu";
                        reg = <0x1>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa = "rv32acim";
                        mmu-type = "riscv,sv32";
                        clock-frequency = <0x632ea00>;

                        interrupt-controller {
                                #interrupt-cells = <0x01>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x02>;
                                linux,phandle = <0x02>;
                        };
                };
        };

        memory@80000000 {
                device_type = "memory";
                //reg = <0x0 0x80000000 0x0 0x4000000>;
                // tangnano
                reg = <0x0 0x80000000 0x0 0x700000>;
                linux,usable-memory = <0x0 0x80000000 0x0 0x700000>;
        };

       soc {
                #address-cells = <0x2>;
                #size-cells = <0x2>;
                compatible = "simple-bus";
                ranges;

                clint@60000000 {
                        compatible = "riscv,clint0";
                        reg = <0x0 0x60000000 0x0 0x8000000>;
                        //interrupts-extended = <0x01 0x03 0x01 0x07
0x02 0x03 0x02 0x07>; // m priv level
                        interrupts-extended = <0x01 0x01 0x01 0x05
0x02 0x01 0x02 0x05>; // s priv level
                };

                plic@50000000 {
                        #interrupt-cells = <0x1>;
                        interrupt-controller;
                        compatible = "riscv,plic0";
                        riscv,ndev = <0x1f>;
                        reg = <0x0 0x50000000 0x0 0x8000000>;
                        interrupts-extended = <0x01 0x09 0x01 0x0b
0x02 0x09 0x02 0x0b>;
                        phandle = <0x3>;
                };
        };

        chosen {
                //bootargs = "console=hvc0 earlycon=sbi root=/dev/vda
rw initcall_debug=1 ignore_loglevel=1";
                bootargs = "console=hvc0 earlycon=sbi root=/dev/vda rw
ignore_loglevel=1";
                //bootargs = "console=hvc0 earlycon=sbi root=/dev/vda
rw ignore_loglevel=1 memmap=3800K@80002000,4000K@80400000";
                //bootargs = "console=hvc0 earlycon=sbi root=/dev/vda rw";
        };
};


thank you,
laurentiu


> Regards,
> Samuel
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
