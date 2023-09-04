Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D42DC71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqNTauuM6qAJDFP2svBFQXIvcXtO35Xd6k9yX84uS7s=; b=mQUTsnqiAB1usG
	va3o3okp9EbLH9X9sNWPfwSq+Nvc6QO7jYHgtT2q7zfre++HyEJ3wjpCC51TyTeOCzXCZeEqpKF5d
	tIuRN/lIoS33Z3BrwAwD+PsC4HVd7VI9IJv09yz/Y+s9uyAwd2RrbqJjiyKV/2/XE4l6j6HZLnHaQ
	fT+y7fOnj5fbauyLR95PjVghyfyIkxRCy/lbE+ye17Jz+5/sggN5smf8oJN/rU152XnX7C9pTrwCL
	Rz1KlmOUFe0JBJdZQbe2u7hgyUBrzdey/5yZ0uGSsvYzopyLRfDud/bfpR7yGwl5WRxmGRWzbL3qo
	LfsNM8t4PcFsheFQSTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdDkl-004Xj8-2Y;
	Mon, 04 Sep 2023 17:52:47 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdDkh-004Xfj-2m
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:52:46 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6c07e122a78so918398a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693849962; x=1694454762; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0NSux7WIhOlWENj4GY5q7z9ZP0dXuhkn2qOr3fP13A=;
        b=EBkY/r4RNKu8xJadZXc/6pprGkx0wtoCLUok1lGuz/xrPYPMuBnPxLss8ucgS7y6wZ
         6eq/RDuBfrX2bIKlZwihG1Kb1p88rtz2JMYp8RZ+nDn2uLBYMCY4RCmlC3peGUVCqWW/
         rYY4/pmiwYLFwbEVSYFgst20syMBTD9d8Ycp5bRt2lLvveL1aLPEln5+YYvkrVaSJoXD
         wXcRMl6AHfXgC101iJAY8+ZrhYjFxyqRUL7v0BWj2SsFsFbi5DyV2payJukBuFP5Isul
         VajnrJUeBMCo38GUpe3WJAVlUz8UEsUW0X5ON1ALnDwF3rniEX5Zgl/i5Lwn3eMF/46j
         psVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693849962; x=1694454762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0NSux7WIhOlWENj4GY5q7z9ZP0dXuhkn2qOr3fP13A=;
        b=gILzYSf5R2xDFvmHtm0b9zL5zqJvjUz7LCMn9CK7QwpHVrWxMXSKEewQ8sWxf0cwgo
         8keiSC9823kMKcj5IPxfrAwJc0quzp2OJyxKSGcOuyuNDx6H1jgqm5Rg69Ih3Cijw0QA
         qhH1nf5jKOhyFLz62RDZwBA7J5rWRGXWiZJgKZ2DkjVUn8bT8NKkBrJl/2oh/Ss3xSJB
         b6Ko1xx14tQv/T+DJ3ENo3LrwYUFeqANTf7qreN0Z3EjCPnf2YeUCTZq1qTHcYfxmlZC
         XjxTgtf6jxM1AGZSiCfddznzo3Zj3T90oZHGLu2zw6i2rlpZCfUmAYb/1e3lTc0XvOQy
         sDlA==
X-Gm-Message-State: AOJu0YxH38gY45xCRRsHC/9WnX+63YT/n5jOBy3gnzPipFzw83hZjPWk
	8NVBcf05N+jmMRSDS8au9qKeTg==
X-Google-Smtp-Source: AGHT+IE02hbyxClU0q+VLjVe/UVes00MtfmE3gI74NFN0LhTxB9sOC/Rue1sXT08bzG3eYxwjuSR8w==
X-Received: by 2002:a9d:4818:0:b0:6bf:3f4:3edc with SMTP id c24-20020a9d4818000000b006bf03f43edcmr11297444otf.22.1693849962579;
        Mon, 04 Sep 2023 10:52:42 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:e0eb:2a3d:8122:b588])
        by smtp.gmail.com with ESMTPSA id gw8-20020a17090b0a4800b0025645ce761dsm9361371pjb.35.2023.09.04.10.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:52:41 -0700 (PDT)
Date: Mon, 4 Sep 2023 10:52:39 -0700
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
Message-ID: <ZPYZZ4blDwaM8/ru@x1>
References: <20230820115353.1962-1-jszhang@kernel.org>
 <ZPUXhe7ogxvaB6Eg@x1>
 <ZPXtl1iWlsYwmixc@xhacker>
 <292198d3915bafbe1c82372da2f2755a1842512f.camel@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <292198d3915bafbe1c82372da2f2755a1842512f.camel@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_105244_117827_5D0FAB85 
X-CRM114-Status: GOOD (  30.32  )
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

On Tue, Sep 05, 2023 at 12:28:41AM +0800, Xi Ruoyao wrote:
> On Mon, 2023-09-04 at 22:45 +0800, Jisheng Zhang wrote:
> > On Sun, Sep 03, 2023 at 04:32:21PM -0700, Drew Fustini wrote:
> > > On Sun, Aug 20, 2023 at 07:53:53PM +0800, Jisheng Zhang wrote:
> > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > > =

> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > ---
> > > > =A0arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
> > > > =A01 file changed, 1 insertion(+)
> > > > =

> > > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boo=
t/dts/thead/th1520.dtsi
> > > > index 56a73134b49e..58108f0eb3fd 100644
> > > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > @@ -139,6 +139,7 @@ soc {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0interrupt-parent =
=3D <&plic>;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0#address-cells =3D =
<2>;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0#size-cells =3D <2>;
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dma-noncoherent;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ranges;
> > > > =A0
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0plic: interrupt-con=
troller@ffd8000000 {
> > > > -- =

> > > > 2.40.1
> > > > =

> > > =

> > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > =

> > > I tried this on the BeagleV Ahead. They system booted as expected and=
 I
> > > did not notice any problems in the boot log.
> > > =

> > > Are there other patches such as the dwmac series that I should test t=
his
> > > with?
> > =

> > Hmm, this patch is necessary to test dwmac, emmc ;)
> =

> Drew: does this fix the "broken DMA" issue you've mentioned in the EMMC
> support patch?

After I sent my reply yesterday, I then tried applying this patch on top
of my eMMC series. I removed SDHCI_QUIRK_BROKEN_DMA and I discovered
that SDMA did not immediately break and the mmcblk0 partitions appeared
in /dev [1]. Note - I am using CONFIG_INITRAMFS_SOURCE set to my
buidlroot rootfs.cpio so that the system will boot okay regardless of
the emmc.

I was able to mount the emmc boot partition /dev/mmcblk0p2. However,
after unmounting it, I noticed that I could not mount it again:

  # mount /dev/mmcblk0p2 /mnt/p2 =

  [   41.684899] EXT4-fs (mmcblk0p2): mounted filesystem 6ea98ccf-2178-48a9=
-a1ad-0eb454f57268 r/w with ordered data mode
  # ls -la /mnt/p2
  total 22696
  drwxr-xr-x    5 root     root          4096 Sep  4  2023 .
  drwxr-xr-x    4 root     root             0 Jan  1 00:00 ..
  -rw-rw-r--    1 1000     1000      26455552 Sep  4  2023 Image
  drwxr-xr-x    2 root     root          4096 Jul 29  2023 extlinux
  <snip>
  # umount /mnt/p2
  [   52.101003] EXT4-fs (mmcblk0p2): unmounting filesystem 6ea98ccf-2178-4=
8a9-a1ad-0eb454f57268.
  # mount /dev/mmcblk0p2 /mnt/p2
  [   58.826078] JBD2: no valid journal superblock found
  [   58.831041] EXT4-fs (mmcblk0p2): Could not load journal inode
  mount: mounting /dev/mmcblk0p2 on /mnt/p2 failed: Invalid argument

I was completely unable to mount the root fs partition /dev/mmcblk0p3:

  # mount /dev/mmcblk0p2 /mnt/p2
  [   58.826078] JBD2: no valid journal superblock found
  [   58.831041] EXT4-fs (mmcblk0p2): Could not load journal inode
  mount: mounting /dev/mmcblk0p2 on /mnt/p2 failed: Invalid argument
  # umount /mnt/p2
  umount: can't unmount /mnt/p2: Invalid argument

I suspect there is some corruption of the buffers happening. I see there
are also these patch series from Jisheng so I will try applying them and
see if there is any difference:

  [PATCH v2 0/2] riscv: errata: improve T-Head CMO
  [PATCH] riscv: mm: update T-Head memory type definitions

As for ADMA, when I removed SDHCI_QUIRK_BROKEN_ADMA, something fails
silently [2] during boot and the mmcblk0 partitions do not appear under
/dev. =


-Drew

[1] https://gist.github.com/pdp7/6d27c57f8280fe1ae35e585d66e73f61
[2] https://gist.github.com/pdp7/23e2bcc2aba09b5c88eb579b61ea45ce

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
