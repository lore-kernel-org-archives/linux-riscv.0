Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F50CC04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9tlEywB6Ro5vuRww4ESsvGTttqyZjC9C/F/sxX9XDM=; b=esNdSfSaemGygy
	fKG6d/04tdUsVyPXFURNjM4Pd+RSDpYXAzqnhvbqL+ggq78QaWsrytwxDBtElIokIanAq5ni41U94
	b+G9J869RLtBkg/y3OSm6vHZwwBh3Es4LG7gPI5MztJYfh2ENom3TvBIzR9jSrMPGve5PNjNkpVuy
	DZPl7nC4hmdQw4RUXbqmZMZPdGsRRgMr3s+uh9PLOxvV8vt6BUtxZZ7hgNDRaOOn0W3MS5vqGToNn
	gxsn6pZ8QA6FwnsjU3n1XSbFkYQcQHZoiB2ZxRC+1zsWzSuHtF5XVkXB97DQW9VdtN1pYFpNsw58T
	k68lCGvf6M5a9IXxAunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCz3-0056DD-1U;
	Wed, 02 Aug 2023 14:37:53 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCz0-0056Cu-1u
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 14:37:51 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso106553351fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690987069; x=1691591869;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WncrNnvFQyyfsztP2Iwrl3jRrmLhWxhdL3w/s+ItBds=;
        b=hrC4HuB38uP8Dqr9BfP5b/XQC8PUZXttdbZNB9cSapc6d3trmP8GMVi8d6SEVgUSHk
         bpO+pIedWMTEkgoW9tM+UJZGSx23yeSbsoGv3pbBWom3SKnEVHyiVB8B6aU1zBTK+5oR
         kw9RT8DqWgIl7UoeK7kNwJK3LZJTkqqlZIkfvAIRH7WS/93Uu4V/NeVHzn/4Hw/N3k0S
         x9Qx6iotKwbvasEyDuhB7+MJvAoQbzFJn2Eey5rr6B1PSsk7DDSMckPhCcq2QXpy5rm4
         7zvFuwNq+MiAMsq3+ITbAGjpgGGiKWSd++/kY3Pkn9IOLObkSgDgy5MvJH/Mn4faVyDV
         xerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987069; x=1691591869;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WncrNnvFQyyfsztP2Iwrl3jRrmLhWxhdL3w/s+ItBds=;
        b=enNPcwqrS5QI7Ga2jL7cugKEoumWptuuIaxPzs8vaOi7wm/hK0vgCh5UjJS4VbA2Ym
         Iy5fJgM+V7fo4fYQxE+LwSjIacpH/AeNlxRWJLT0v6Bqg1C0XXjx/ZQBWNC7EnW2Ya5K
         vq2izzww66ET2vKJvoUNp+4ZZzXfB2MdGVgA8XRWtcbFmnSLDGSfstC7U/Jj+2RvooH3
         Pm7cvdZTYcqJe9ZUWxfj3ulcu6tjZbr5vxM9HejShjEXSDgLdEqfxzg8Elqc6kg2UmI8
         vzltqWv10sY4JYPBbBpM/mxo8NYJPmHYP+ip2s5kWaTpUWsZk4AnVqLZbCt/GwRRu772
         bawA==
X-Gm-Message-State: ABy/qLaFU/UQt2CiK0IiS9BfRuiGnlrQp6sXBjNgPgYAu312JHhOmtTL
	AahTZNvCJp5PqgKavSWUH2nhGkJom6d68Oe3K7A=
X-Google-Smtp-Source: APBJJlG94bbaHKCsJAZntxx4NQQLJHpCxfH6x7RhpcRxTSCGNpFlM72WHCAvu/b1JA8gLmalBU4U3MWkyUAXsl0SXSA=
X-Received: by 2002:a2e:a411:0:b0:2b8:39e4:2e2c with SMTP id
 p17-20020a2ea411000000b002b839e42e2cmr5217164ljn.1.1690987068676; Wed, 02 Aug
 2023 07:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9cd5:0:b0:2b7:787:e49d with HTTP; Wed, 2 Aug 2023
 07:37:48 -0700 (PDT)
In-Reply-To: <CAPm8-H5d_Hp0zaYh+uX6=KhB2GHGHTkaB6tu6Q82AgR4zK-4xw@mail.gmail.com>
References: <CAPm8-H43P4WrgibV2MGNFZt7ommkchAeom4m0Kt3N-CsG6D9RA@mail.gmail.com>
 <20230802-palpitate-defection-4908b4cbd142@spud> <CAPm8-H5d_Hp0zaYh+uX6=KhB2GHGHTkaB6tu6Q82AgR4zK-4xw@mail.gmail.com>
From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Wed, 2 Aug 2023 17:37:48 +0300
Message-ID: <CAPm8-H6A9HoJF6B8U5WP2ucqZQrszN-avV6ETX=iPWXq4EvaoA@mail.gmail.com>
Subject: Re: dts - linux,usable-memory
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_073750_631647_9C9DFF14 
X-CRM114-Status: GOOD (  15.85  )
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

On 8/2/23, Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> wrote:
> On 8/2/23, Conor Dooley <conor@kernel.org> wrote:
>> Hey,
>>
>> On Wed, Aug 02, 2023 at 04:51:47PM +0300, Laurentiu-Cristian Duca wrote:
>>>   my name is laurentiu-cristian duca and i am an open-source enthusiast.
>>> lately i have tried to use the linux,usable-memory in the dts memory
>>> node
>>> and linux freezes.
>>>   if i use only reg, linux boots fine.
>>>   does anybody used linux,usable-memory and can you show a working
>>> example.
>>>
>>>   here is what i tried
>>>         memory@80000000 {
>>>                 device_type = "memory";
>>>                 reg = <0x0 0x80000000 0x0 0x700000>;
>>>                 //linux,usable-memory = <0x80000000 0x700000>;
>>>         };
>>
>> What are you actually doing when you freeze? A normal boot? Kexec?
>> What hardware is this?
>> Are you using OpenSBI, and if so what version?
>> What version of the kernel is this?
>
>   linux5.13.19 with busybox minimal rootfs, bbl (berkeley boot loader),
> hardware fpga board with only uart and memory 8MB
> i simulate in verilator the verilog sources and i have success if the
> dts has reg.
>  when it freezes, i can not see any message in simulation
[    0.000000] Linux version 5.13.19 (laur@laurPC-100)
(riscv32-linux-gcc.br_real (Buildroot 2021.08) 11.1.0, GNU ld (GNU
Binutils) 2.37) #402 SMP Wed Aug 2 15:27:14 EEST 2023
[    0.000000] OF: fdt: memory scan node memory@80000000, reg size 8,
[    0.000000] Machine model: kise-lab,simrv
[    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
[    0.000000] printk: bootconsole [sbi0] enabled
[    0.000000] printk: debug: ignoring loglevel setting.
from here i can not see anything


> if you want to, i can send you the sources
>
>   please tell me if the dts memory property is written correctly for
> linux,usable-memory
>
> thank you,
> laurentiu
>>
>> Thanks,
>> Conor.
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
