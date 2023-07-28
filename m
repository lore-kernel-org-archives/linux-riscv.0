Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FA4C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 00:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MFl+SHPtezw/ehT2KCDCjvbqXUWC0+ZzVrGbpBm3aE=; b=TRqppQza1hAW7K
	xOkgaIrra3q0YRKNDLZLUZSJPwTTjx4L7Z+3frM3Trg6RSBfYo6tkaadWzbltqzywtNCflqoXXrNj
	uIikccDwqWx/nqIsa1oewC4u2QzyzM6I70/bBR5cdMY2jcncXJKXHw5AfQA6o5TA/YEaNg8GQM6Td
	YuNDrvH/NcxdqqRroX9EIFGGhxvFdzf9HoQqUyB7+Ud/qVc8y1z9JG53SpiOKvIfQPpliYtbqgs5q
	/5B/k6WtW+2/0b/Ag7WQDPK1+p2AQyNOEJ2FK8p7/hFE4XbZLbHGdpP5FqaXyQE+eiasMP6iXus6S
	xfo7wz2LFIVOpfx36iCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPB4g-000zIf-24;
	Fri, 28 Jul 2023 00:11:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPB4c-000zHZ-22
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 00:11:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bb775625e2so9948165ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 17:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690503070; x=1691107870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gqNRWVrOFVBkH+VSmfu09hLMLUWIZedxHx1Mg4rsMuQ=;
        b=d2OF3EM9KD1Gz+cvj2pCUh/1Yj5q9pjk4yeRolGJ5YrTetpr/fOe8CuP+jxce2Ukpi
         Uly+gxlwzxpflH6nRUYG5wuOd8oDmFsPt1zUs6vw0EMfQ2aLHSY4M35IW/9uFEfDiHLA
         iAOVYMVPUu8E2/VQwufyh94Gprvod9xICH9rwpwpkOwpjAGghf5ui+eulfS/tyZDKU6b
         vsp550qP7XgPuYI7mzx10za+Z73Rqj133QVRDXeyg9l49Kz3o14NeljzexJVo5CkEAoo
         YUHwS98wLbaOM0u+mKrRiI5t8sTOcEwSyHO9y/OW1Tuqinmo7beDX3HALza/PlNc1ZnB
         cFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690503070; x=1691107870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqNRWVrOFVBkH+VSmfu09hLMLUWIZedxHx1Mg4rsMuQ=;
        b=OE9oiFsptauSUq11t7buu+JSwc8Z0+WRLDs4NN8ENjKtWXEbjfZCJYpvxFIRJ30bbl
         hiQb2MG4wxyxfQ4pfasU7ji1ovB2Xcfv/b7vfvCrCs/9hbGtbNIwbPUEafBW8l/kTxCi
         zscft/K/jj1frXcuiGF8k64alnpifbmTOabsZhIzKYEom1Qads1lDCg2VsrU67zpMymc
         MxK2nXFwa2/nmTTcS7eUjsqY0LroPGPBNRt8C1SZbviNgXy7PVtmxmz2CZITJkRphR9U
         9pVwOGZOA4+nGjMQxCGpYVDkODcekPwErisp4B4Mqe+UsgGiwML6kCo0Xxi6eIAqY9gD
         114Q==
X-Gm-Message-State: ABy/qLam+ioskJEkhaG8FiKlGgWR6sD7NadhIM9IuyeQJAywFZwMt7En
	We8gAhaI6Bz2Xt6nRzDpSGuAZQ==
X-Google-Smtp-Source: APBJJlHiOMKTmPn4xexa7u68szd4odgOExv7eGQ9Eaq77/8uCykPj7QdZYFF40DGQ4hv5SQqsug33w==
X-Received: by 2002:a17:903:32cf:b0:1b9:d38d:efb1 with SMTP id i15-20020a17090332cf00b001b9d38defb1mr290557plr.8.1690503070496;
        Thu, 27 Jul 2023 17:11:10 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:dacb:3a1a:fcaf:c0fc])
        by smtp.gmail.com with ESMTPSA id l16-20020a170902f69000b001b8a3729c23sm2230932plg.17.2023.07.27.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 17:11:10 -0700 (PDT)
Date: Thu, 27 Jul 2023 17:11:08 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Xi Ruoyao <xry111@linuxfromscratch.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <ZMMHnPQ5xkY2+fB+@x1>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
 <20230725-unheard-dingy-42f0fafe7216@wendy>
 <ZL/jMYL3akl78ZZN@xhacker>
 <3e0994dab495920ac590dc28d6b9d9765abe0c7e.camel@linuxfromscratch.org>
 <ZME1J4mpVf5yth32@xhacker>
 <866eab3e30a18c50742a75d62aee223fdc7e3cee.camel@linuxfromscratch.org>
 <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4986b92f1a5aa303a529c6004aaedd2184c3ccf7.camel@linuxfromscratch.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_171114_695169_F2C5BF38 
X-CRM114-Status: GOOD (  18.42  )
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

On Thu, Jul 27, 2023 at 08:54:59AM +0800, Xi Ruoyao wrote:
> On Thu, 2023-07-27 at 08:14 +0800, Xi Ruoyao wrote:
> > On Wed, 2023-07-26 at 23:00 +0800, Jisheng Zhang wrote:
> > > which dts r u using? see below.
> > > =

> > > > =

> > > > Or maybe my toolchain (GCC 13.1.0, Binutils-2.40, with no patches) =
can
> > > > miscompile the kernel?
> > =

> > /* snip */
> > =

> > > > Boot HART ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : 0
> > > > Boot HART Domain=A0=A0=A0=A0=A0=A0=A0=A0=A0 : root
> > > > Boot HART Priv Version=A0=A0=A0 : v1.11
> > > > Boot HART Base ISA=A0=A0=A0=A0=A0=A0=A0 : rv64imafdcvx
> > > =

> > > what? I don't think the mainline dts provide v and x. =

> > =

> > I copied the compiled arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb
> > into /boot and loaded it with u-boot "load" command onto 0x46000000, and
> > passed this address to the booti command.
> > =

> > But maybe I've copied the wrong file or made some other mistake... I'll
> > recheck.
> =

> Hmm, and if I read OpenSBI code correctly, this line reflects the
> content of the misa CSR, not the DT riscv,isa value.
> =

> The log of successful boot provided by Drew also contains
> "rv64imafdcvx":
> =

> https://gist.github.com/pdp7/23259595a7570f1f11086d286e16dfb6

In case it helps, the thead fork of u-boot contains an important file
include/configs/light-c910.h that defines the boot scripts for each
board. Here is the BeagleV Ahead:
https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-u-boot/-/blob/beagl=
ev-v2020.01-1.1.2/include/configs/light-c910.h#L361

It might give some clues as to want commands to try.

From the lpi4a config:
https://github.com/revyos/thead-u-boot/blob/09e2c3f93f1a64c10ca51d9b9c0c22f=
bc0947c43/configs/light_lpi4a_defconfig

It looks like it sets:
CONFIG_TARGET_LIGHT_FM_C910_LPI4A=3Dy

And that corresponds to:
https://github.com/revyos/thead-u-boot/blob/09e2c3f93f1a64c10ca51d9b9c0c22f=
bc0947c43/include/configs/light-c910.h#L425

Anyways, I finally got my Lichee Pi 4a out of the box, and I am going
to try it out too.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
