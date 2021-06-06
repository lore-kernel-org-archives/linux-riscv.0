Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23D5C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 870B26140F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 870B26140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYR8gV3sV4Jrnduf6X0AjCqT0g0wJuMi0wNdlm54A5A=; b=tiFpZ/MT1hIVw3
	MNjESRRgU9cXsoMfbnbBWMyPs4PIyRgsgq+b4pvfKpfu6Lge+rW9uYN/tU3id3GzyqsUP1ooMJzJb
	N7JPf/wmakvpmU6teFwJc5HTqf5u0XZ4JSM1w0mxwq9BGGNN7bWlUETSclckVvWT61CSrmwaAHjnT
	7xjprD4a4o3KAe4nT8NnFdrUQaNmH9wTZ9hG+5K6VkDUkDf+lX6qyubIKHntHwgudSDXvfliNEtKE
	swBxJcwDglWhtCCo7pu/q5pYZBKLfcRV4934X4jIxYK7fkL50YlKB886rlD19v+xJHxbclFj8RAZ4
	nL0dv66TNsmCfoLfP9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpvin-000Ynq-EI; Sun, 06 Jun 2021 16:33:57 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvil-000Yn6-7g
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:33:56 +0000
Received: by mail-wr1-f54.google.com with SMTP id a11so12747442wrt.13
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WY+YV1R5ZgejabQGRTVw30i8+uym8jnUtOXA94/K5lw=;
 b=pDNjmTE9Fw2s8w/IYPMqwLkqVK0ZnfsZyN/vW6EZdkc8VQu8pqVkSoqHa/IFNWsah0
 Xk9BMZau+4UajqSK3D6dGg9P2rhhLCOmi49Thovi1uREAelVPdWtwCJLxP5qfadEmcAk
 b2BZ5h+5krfK1+iC/Y9oNZbhBtDU73wA3wE8xcB+jfluZLoEG4bVfDcWOvtrpwIwxMka
 pGHdyi+gkGIxMEUcjdmpiHN9Kn+clhkiEW8J2p/XBP+PlgVLPT9ckvUgFsLnaQ/B+foi
 RqwU+ggam2Xp/MYk7kvLqMZawzi/wp6yZ/Z9D12EerUa3MUOheTlO/q9Km5c7kScfYZ2
 FZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WY+YV1R5ZgejabQGRTVw30i8+uym8jnUtOXA94/K5lw=;
 b=n+x1dQrM45CakuNY3OYHpNuN5hEMEmt9rTMiQ4BRQjAzpc7Dd27/5UV4VAXUbicmQJ
 yUqu2fUTehvh1uRSFUb6+ibQodfqIAZGqxDq25kRzj9DC+1/qCxv8FyjajIY7Q5n6VNh
 l1rCSo1dMJ69lJnFBVK4xma2Y8eST5jIZYTHR/y3PR9rvIME4d9PH0Rn4hw44PLOtsWJ
 3WD2Uq8aN6O9gyObms1Sdkr1zwGuYDo/o2f55R1wsBMF1mNOeZvCTxjsPPVNijKvOpgr
 ctUwV/WUbKosx1uWAqbzqR8uD2hMSMTuAp+4QTBNb1YkDn16PDqTlkllO4/GuPLLEMOg
 vE+w==
X-Gm-Message-State: AOAM533Rk0M1PVSffQRqCi9Trfut//VmFVwU1IoN08aF3+/dqoBtQJ+6
 ZXk6cnBDE/33YowJiQ1csRA=
X-Google-Smtp-Source: ABdhPJx9EE3POJCPH3kxhrEgOKzF6jzZizEM4HKXVQ6BY0PswtcBRetUeMuVDjcmubaKep41FB6ang==
X-Received: by 2002:adf:a28c:: with SMTP id s12mr13841510wra.105.1622997173876; 
 Sun, 06 Jun 2021 09:32:53 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id w11sm13382470wrv.89.2021.06.06.09.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 09:32:53 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 lazyparser@gmail.com, wefu@redhat.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>, Corentin Labbe <clabbe@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.io>,
 LABBE Corentin <clabbe.montjoie@gmail.com>, Michael Walle <michael@walle.cc>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only
 for temp use
Date: Sun, 06 Jun 2021 18:32:51 +0200
Message-ID: <811499816.OAcyhOWOk8@jernej-laptop>
In-Reply-To: <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-15-git-send-email-guoren@kernel.org>
 <CAK8P3a0yHEGH8=o_TQ+ajRn53j+mHxYxqyYLPXnUe=YWkTHDBw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_093355_334187_74746CE3 
X-CRM114-Status: GOOD (  25.95  )
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

Dne nedelja, 06. junij 2021 ob 18:16:44 CEST je Arnd Bergmann napisal(a):
> On Sun, Jun 6, 2021 at 11:04 AM <guoren@kernel.org> wrote:
> > diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> > b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts index
> > cd9f7c9..31b681d 100644
> > --- a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> > +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> > @@ -11,7 +11,7 @@
> > =

> >         compatible =3D "allwinner,d1-nezha-kit";
> >         =

> >         chosen {
> > =

> > -               bootargs =3D "console=3DttyS0,115200";
> > +               bootargs =3D "console=3DttyS0,115200 rootwait init=3D/s=
bin/init
> > root=3D/dev/nfs rw nfsroot=3D192.168.101.200:/tmp/rootfs_nfs,v3,tcp,nol=
ock
> > ip=3D192.168.101.23";
> These are not board specific options, they should be set by the bootloader
> according to the network environment. It clearly doens't belong
> into this patch .
> =

> >                 stdout-path =3D &serial0;
> >         =

> >         };
> > =

> > diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> > b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi index 11cd938..d317e19
> > 100644
> > --- a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> > @@ -80,5 +80,21 @@
> > =

> >                         clocks =3D <&dummy_apb>;
> >                         status =3D "disabled";
> >                 =

> >                 };
> > =

> > +
> > +               eth@4500000 {
> > +                       compatible =3D "allwinner,sunxi-gmac";
> > +                       reg =3D <0x00 0x4500000 0x00 0x10000 0x00 0x300=
0030
> > 0x00 0x04>; +                       interrupts-extended =3D <&plic 0x3e
> > 0x04>;
> > +                       interrupt-names =3D "gmacirq";
> > +                       device_type =3D "gmac0";
> > +                       phy-mode =3D "rgmii";
> > +                       use_ephy25m =3D <0x01>;
> > +                       tx-delay =3D <0x03>;
> > +                       rx-delay =3D <0x03>;
> > +                       gmac-power0;
> > +                       gmac-power1;
> > +                       gmac-power2;
> > +                       status =3D "okay";
> > +               };
> =

> Before you add this in the dts file, the properties need to be documented=
 in
> the binding file. The "allwinner,sunxi-gmac" identifier does not appear to
> be specific enough here, and the properties don't match what dwmac uses,
> which would make it unnecessarily hard to change to the other driver later
> on without breaking compatibility to old dtb files.
> =

> > +++ b/drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c
> > @@ -0,0 +1,690 @@
> > +/*
> > + * linux/drivers/net/ethernet/allwinner/sunxi_gmac_ops.c
> > + *
> > + * Copyright =A9 2016-2018, fuzhaoke
> > + *             Author: fuzhaoke <fuzhaoke@allwinnertech.com>
> > + *
> > + * This file is provided under a dual BSD/GPL license.  When using or
> > + * redistributing this file, you may do so under either license.
> =

> Are you sure this is the correct copyright information and "fuzhaoke" is
> the copyright holder for this file? If this is derived from either the
> designware
> code or the Linux stmmac driver, the authors should be mentioned,
> and the license be compatible with the original license terms.
> =

> Andre already commented on the driver quality and code duplication, those
> are also show-stoppers, but the unclear license terms and dt binding
> compatibility are even stronger reasons to not get anywhere close to this
> driver.

I got impression that this patch is not meant to be merged and it's forward =

ported from vendor kernel as a stop gap measure for developers until proper =

mainline ethernet driver is developed.

Best regards,
Jernej





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
