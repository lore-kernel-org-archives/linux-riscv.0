Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD33BC83F33
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/r2Sjd/duBVoy3T+F6qsKUd0CxYADdXidVyRcxsqK0=; b=jTTpUEk5yh+HKS
	CHnSmjvy6o2cTt2Ped3TBgcIp3wJcHpDqPCTi0itK0HhBSf8DGp9SZJyeBAclJx8eNnOGWCb8IPO8
	B7j8kBdJ3jWsgudoisgNqxeA5MTJiq3Rhxcx8bYnykZpN1H6FJXYyRrdRl1AcijWf3Ei2t1eDiv6H
	ntJbhjkWZimrQrM/16C7Aa0EkW6XAo6kl6YvkaxdVJ6hN7aKgyE11/ADh+gDV2TNJQDlgNL7p4PCE
	7TJPr29I7ve5aKVPowRAPdOrX0Xp22u7SNxBEjiDPbbvhyC4+JCTUHttuW4sbpCd9tUtxSGZi4DsQ
	OhDB97nFrILACoIZE/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdFEq-004hHZ-10;
	Mon, 04 Sep 2023 19:27:56 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdFEl-004hHF-0R
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 19:27:54 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-53482b44007so671819a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693855669; x=1694460469; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWREej5t+eIqMC63lmoGy+XChxC2cKp7ZhM4c1pDWR0=;
        b=XYkOFATMpHtD56kKCoCCOeW1lYziPZwq7ryPvlsRtPfdDdqaHl2jvjiSARmHPvTeo1
         +QKD++oj595aXPz91W1CG9yobWzkKtsGR8+KRcpxey7u1ZVgTVyZaLOxD6AjbrYQDFqD
         ShCx9DsDNZJ6gNkcMpLaDeZ6ji75Qu2rBns4V8xi1wAkpPPAkUg3Gpea9Mrk6FJ00oM9
         D7WS7RUUWo5PUlni/ZAxTh+UN6vw+24KMvdw0iX2BHIIGIB8fVnZ1fchLSklwxHdcMKJ
         kfD3LLdq0pCCD/EP4/Akv6SZt0EQWLj36/v6dj7xOW2gxdCfkC/8tC9fm69N7foaTOul
         Dvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693855669; x=1694460469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWREej5t+eIqMC63lmoGy+XChxC2cKp7ZhM4c1pDWR0=;
        b=Oct4mJIrJWf0Zi3Aw9OUWvuu8Uh2cu6rImHmMwaBkyYcrOPE58/pMHhwV1/Qap1l7G
         yavlHg2VEWoyC3oSt/iPX27zXdxJp9z2iKDnjxVzDKm2SyaOl4e1CgQbOXYM1Oydn0J0
         hWc6LMAyF4bWWFHfRHVp0Y60SFrh28pQ4G+Lx+kjo51Rf9ap8kOO+3P6KuWZOpQlyGYA
         fBy8mly6ozpfLOV1z/MtPUKAK2lB/02FLAnXi5aYss4y7ykEO7HwFZEFv530GdfAN2Hl
         Q5W6QdbjBY8WDSTht+2lKTsgKUEuC1hN0+LMVLnFlKh5GA9Ml0nkof9QlxG0xMy5ZVQ9
         W5Kw==
X-Gm-Message-State: AOJu0Yy2DdG/lS9bCBRKIlT54UuRQ4016QgMjDsemXPq3raV5ITrt2Us
	4cEIZ6Fe78jGrokoZK2fvrwsYg==
X-Google-Smtp-Source: AGHT+IF8jZgXYFF7x4w9/EJ+mUhvyY5RomvN8zh7QIx1a3gn13jt+ZjTcXlJuczNF8kMK83V8bbJpg==
X-Received: by 2002:a05:6a21:4841:b0:14c:c511:387d with SMTP id au1-20020a056a21484100b0014cc511387dmr9713357pzc.9.1693855669066;
        Mon, 04 Sep 2023 12:27:49 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:5de2:2323:20de:e26d])
        by smtp.gmail.com with ESMTPSA id cg11-20020a056a00290b00b0068c9fc82bfbsm6591591pfb.197.2023.09.04.12.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 12:27:48 -0700 (PDT)
Date: Mon, 4 Sep 2023 12:27:46 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZPYvsvCYWibrKXOz@x1>
References: <20230820115353.1962-1-jszhang@kernel.org>
 <ZPUXhe7ogxvaB6Eg@x1>
 <ZPXtl1iWlsYwmixc@xhacker>
 <292198d3915bafbe1c82372da2f2755a1842512f.camel@xry111.site>
 <ZPYZZ4blDwaM8/ru@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZPYZZ4blDwaM8/ru@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_122751_178447_9BA09100 
X-CRM114-Status: GOOD (  34.85  )
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

On Mon, Sep 04, 2023 at 10:52:39AM -0700, Drew Fustini wrote:
> On Tue, Sep 05, 2023 at 12:28:41AM +0800, Xi Ruoyao wrote:
> > On Mon, 2023-09-04 at 22:45 +0800, Jisheng Zhang wrote:
> > > On Sun, Sep 03, 2023 at 04:32:21PM -0700, Drew Fustini wrote:
> > > > On Sun, Aug 20, 2023 at 07:53:53PM +0800, Jisheng Zhang wrote:
> > > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn=
't
> > > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > > > =

> > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > ---
> > > > > =A0arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
> > > > > =A01 file changed, 1 insertion(+)
> > > > > =

> > > > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/b=
oot/dts/thead/th1520.dtsi
> > > > > index 56a73134b49e..58108f0eb3fd 100644
> > > > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > > @@ -139,6 +139,7 @@ soc {
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0interrupt-parent =
=3D <&plic>;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0#address-cells =
=3D <2>;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0#size-cells =3D <=
2>;
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dma-noncoherent;
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ranges;
> > > > > =A0
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0plic: interrupt-c=
ontroller@ffd8000000 {
> > > > > -- =

> > > > > 2.40.1
> > > > > =

> > > > =

> > > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > > =

> > > > I tried this on the BeagleV Ahead. They system booted as expected a=
nd I
> > > > did not notice any problems in the boot log.
> > > > =

> > > > Are there other patches such as the dwmac series that I should test=
 this
> > > > with?
> > > =

> > > Hmm, this patch is necessary to test dwmac, emmc ;)
> > =

> > Drew: does this fix the "broken DMA" issue you've mentioned in the EMMC
> > support patch?
> =

> After I sent my reply yesterday, I then tried applying this patch on top
> of my eMMC series. I removed SDHCI_QUIRK_BROKEN_DMA and I discovered
> that SDMA did not immediately break and the mmcblk0 partitions appeared
> in /dev [1]. Note - I am using CONFIG_INITRAMFS_SOURCE set to my
> buidlroot rootfs.cpio so that the system will boot okay regardless of
> the emmc.
> =

> I was able to mount the emmc boot partition /dev/mmcblk0p2. However,
> after unmounting it, I noticed that I could not mount it again:
> =

>   # mount /dev/mmcblk0p2 /mnt/p2 =

>   [   41.684899] EXT4-fs (mmcblk0p2): mounted filesystem 6ea98ccf-2178-48=
a9-a1ad-0eb454f57268 r/w with ordered data mode
>   # ls -la /mnt/p2
>   total 22696
>   drwxr-xr-x    5 root     root          4096 Sep  4  2023 .
>   drwxr-xr-x    4 root     root             0 Jan  1 00:00 ..
>   -rw-rw-r--    1 1000     1000      26455552 Sep  4  2023 Image
>   drwxr-xr-x    2 root     root          4096 Jul 29  2023 extlinux
>   <snip>
>   # umount /mnt/p2
>   [   52.101003] EXT4-fs (mmcblk0p2): unmounting filesystem 6ea98ccf-2178=
-48a9-a1ad-0eb454f57268.
>   # mount /dev/mmcblk0p2 /mnt/p2
>   [   58.826078] JBD2: no valid journal superblock found
>   [   58.831041] EXT4-fs (mmcblk0p2): Could not load journal inode
>   mount: mounting /dev/mmcblk0p2 on /mnt/p2 failed: Invalid argument
> =

> I was completely unable to mount the root fs partition /dev/mmcblk0p3:
> =

>   # mount /dev/mmcblk0p2 /mnt/p2
>   [   58.826078] JBD2: no valid journal superblock found
>   [   58.831041] EXT4-fs (mmcblk0p2): Could not load journal inode
>   mount: mounting /dev/mmcblk0p2 on /mnt/p2 failed: Invalid argument
>   # umount /mnt/p2
>   umount: can't unmount /mnt/p2: Invalid argument
> =

> I suspect there is some corruption of the buffers happening. I see there
> are also these patch series from Jisheng so I will try applying them and
> see if there is any difference:
> =

>   [PATCH v2 0/2] riscv: errata: improve T-Head CMO
>   [PATCH] riscv: mm: update T-Head memory type definitions

Good news, I applied "riscv: errata: improve T-Head CMO" [1] and SDMA is
now working correctly. I can mount both boot and rootfs paritions and
then is no problem umounting and then remounting [2].

Note - I didn't 'riscv: mm: update T-Head memory type definitions' yet
but I will do that next and make sure everything is still working.

I'll post an update to my eMMC series.

-Drew

[1] https://lore.kernel.org/all/20230827090813.1353-1-jszhang@kernel.org/
[2] https://gist.github.com/pdp7/c72c91530c46ef560f4d1940ea1964c9


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
