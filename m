Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CE5CD4843
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1bX4zzJdVqARs5IPEulz5k3nvElU0BBuZK7pBOVUro=; b=WxYi7f21ibHJOo
	rZb14KlAMeMcYsLvLepSKCb9Ej188vJ2Yw83fM8pIun5oMaIIryM4KAr72jeRNfueml5zB2NcCChE
	RlDMXL3aO0DI6fV0XM6LPp6i6zf9kbgVsE+QuDpST9yzZbp37P8sX4yEvLz4thj5lBrUPnQnTOKRt
	Z4iOiMX/Axzpo5NCW9gePlj6VOWlgL4JV+go19MpV7qUL4zDTxPHkrUjYVbNyfLy423BoeBXiYwzv
	RgxdALswfkQzwEL6mHGWPjg1vTRB+0dxpebpk1vR/nb9MX91tLT5KeIrATp9r5kYSfU8Hh1GA+mxT
	AGojYWDLTOc3IixKEnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiwF-009P6i-2z;
	Fri, 22 Sep 2023 16:23:31 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiwA-009P4w-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 16:23:30 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso1982483b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695399804; x=1696004604; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AHg6WGFiYjr1HXimk+u+8jzAweDZw4kGMIG8TL93+tY=;
        b=HuIv6tmUJ+j7/x8VHrRk9/Dyls/Ez7Dw0Yevpf/ZtAgTs4zpX6rjCbPoAiqLw51lCb
         lDrNWA4XCtfzgfuHiP2wfjG80Ng5d8hBIAcu6H2XmjJDj/wKGdC5BoSQVjmHQDEVZD9P
         oXFQX1OMMsTpWqGJcsyhFJEtPaI65CJCnp5do3Q/2YXpFVBeS58h+ygpNzb6BxYazc/a
         NGuFomwxZFLvSxg88Bn0Z71R3YFXMdmOa9vmuaUcvkl9y1VBX6Ig5eaEPFdpahy0oHUx
         JWOyteP4uMLCoHiF83+Zw77TY8ZMLVwK2/A57YlhDGC0CjpDdlKmoJ19YfSRjU0IbJ2R
         4hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695399804; x=1696004604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHg6WGFiYjr1HXimk+u+8jzAweDZw4kGMIG8TL93+tY=;
        b=xIUGwcFtuRbknOWlaxG3rDlNIAwKcKlmXpv3s86cimRcEKyW5KY5zvVxRXcgFphlAi
         pLJK1K/yRXvll/J2vw/K6DfMgCLCtAHZjXFqvtFwoJmHRmoMkMsjf9II/+R+TUNy8/N9
         VihwXAtGN79rpJ1b7N9opAUlpiMEGxTndmTQi42Mx/mDXETKraXHtNZWB4IFy2aIKiKy
         +ohmS1TIOlsGxEvgfLnmsfFXVhCCaEJTT09tqFCsbZZW0gY7u9zpeChIMgCIggsYOKhX
         BDDxuSWshYahjE+HiFFBAHWtAU6tuGertPXW+EJ86UUkGGcN4fg+3+KaEW8SK7lYEJ6p
         rEPg==
X-Gm-Message-State: AOJu0Yw8O3BeHBFkkYHLF9KFy3RyAUlBDhcoyNOuO8MywYjQb8B7LePt
	caTmTzuNonRFGEFVwkp+tEZ0og==
X-Google-Smtp-Source: AGHT+IFmxJwCFBncjjkZSaX6oosj8CqRhfXIommcUiSmAdtJAZgRc2IHT8A5lJUeO5ShWEdV/QZBwg==
X-Received: by 2002:a05:6a20:7283:b0:134:73f6:5832 with SMTP id o3-20020a056a20728300b0013473f65832mr281394pzk.16.1695399803769;
        Fri, 22 Sep 2023 09:23:23 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:c44:77f:ca7d:adec])
        by smtp.gmail.com with ESMTPSA id u25-20020a63a919000000b0057ab7d42a4dsm3249805pge.86.2023.09.22.09.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 09:23:23 -0700 (PDT)
Date: Fri, 22 Sep 2023 09:23:21 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
Message-ID: <ZQ2/eUKbW3wK7kHp@x1>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <c1a4a7ab5c68c00dd8b3bb249c0371dbb8bcb929.camel@xry111.site>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1a4a7ab5c68c00dd8b3bb249c0371dbb8bcb929.camel@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_092327_155028_5C3D19BD 
X-CRM114-Status: GOOD (  29.48  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 22, 2023 at 07:41:37PM +0800, Xi Ruoyao wrote:
> On Thu, 2023-09-21 at 18:49 -0700, Drew Fustini wrote:
> > This series adds support for the eMMC on the BeagleV Ahead and the
> > Sipeed LicheePi 4A. This allows the kernel to boot with the rootfs on
> > eMMC.
> > =

> > I tested on top of v6.6-rc2 with this config [1]. I was able to boot
> > both the Ahead [2] and LPi4a [3] from eMMC. The following prerequisites
> > are required:
> > =

> > =A0 [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus [4]
> > =

> > I pushed a branch [5] with this patch series and the above patch for
> > those that find a git branch easier to test.
> > =

> > Please note that only the MMC controller connected to the eMMC device
> > is enabled in the device trees for these two boards. I did not yet
> > attempt to configure and use the microSD card slot. My preference is to
> > address that in a future patch series.
> > =

> > References:
> > [1] https://gist.github.com/pdp7/5fbdcf2a65eb1abdd3a29d519c19cdd2
> > [2] https://gist.github.com/pdp7/91a801a5f8d1070c53509eda9800ad78
> > [3] https://gist.github.com/pdp7/1445c3c991e88fd69c60165cef65726a
> > [4] https://lore.kernel.org/linux-riscv/20230912072232.2455-1-jszhang@k=
ernel.org/
> > [5] https://github.com/pdp7/linux/tree/b4/th1520-mmc
> =

> I've tested this branch and successfully booted a rootfs on Lichee Pi 4A
> eMMC with rootdelay=3D10.
> =

> Curiously is there some way to make it work without rootdelay?

Thank you for testing.

This is the kernel command line that I am using on both the lpi4 and
the ahead:

root=3D/dev/mmcblk0p3 ro rootfstype=3Dext4 rootwait console=3DttyS0,115200

I seem to recall that before I used rootwait that there would be a VFS
oops because mmcblk0p3 didn't exist yet.

Have you tried rootwait instead of the 10 second delay?

I imagine an enforced delay would be very annoying. With "rootwait", I
don't notice any delay, it boots to the login prompt faster than I can
read the text scrolling by during boot. (my rootfs is a simple
buildroot).

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
