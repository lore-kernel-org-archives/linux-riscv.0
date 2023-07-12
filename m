Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4DDC001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tsu0AZ6aOXrSOOzTxIUtr/DsuMSF6J+RSi39rI1lH28=; b=rnIpY14J6nt8Vb
	GtbgRC2r6Mw7Ay7UIXIidystIx3Ds7QGRvivpJfFsjjfw9UCe4SETs2hEsfIomsQ5Cle+idOB6nGD
	9+yLfWbYRGgzqU450h0m6JcTCUI6i3rliFK3T60r/T0EcXEYohnWwuCiN6JRlYrlhY41Kb0YiFnIL
	r7WkackgFwvXwhHsAcxqsqmCDNIAxF596cD8ankSqUZyUfs8EuB++rFmyHQuynAYzEDHekBF0ZVDz
	V5C+66sUOfX4VdDXjMFLCfAM8yf2p7HnIyzUde058+wH89k/pFWYb64mjWpaZZ0BPVsNuWysfDwBr
	6zku3PNo2fe9APJqO10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdfi-000lIT-2Z;
	Wed, 12 Jul 2023 17:30:38 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcX8-000WIE-1N
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:17:55 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2B8943F0C3
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689178657;
	bh=n4utYa35TfD5wsVmOiQcm6vCoFn5Vk1dm6HnZfMUVHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=BelSOFoEXJZuPw9qSbtmGvAZwt+XdHsvcFLf43IxGxMSwkee5Hc6ER27QMrq7wup4
	 3ZcHFnwoihNQSL42Cb7UDdN+nFf6baBp0oRAIXK1UqDZ3OwHuNQPlpPjl8hOpL4wIE
	 NElidWowb3vWMqj4RVCIXSN/ldbrDk3Hsno3fynM36GSbLs6piP8PZigfOtkUpMl31
	 xP+9jZkJ0+FowcGZ2NPXVyuKJsfiPG33tDG0lnqIlZITV2sy7/7I6ruLVJUmjE0rNe
	 /y7XLGBxoe81R+0wgDDKqC9LU3+6xWncIYVOmzP5KJ58etSsfkQXj7dTr81q2d2SLI
	 exmDTSLJzqoNQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-400fea3d458so81249021cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178656; x=1691770656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4utYa35TfD5wsVmOiQcm6vCoFn5Vk1dm6HnZfMUVHA=;
        b=BiD7OShO/RDZdYIGFJm0t8Y233wO4tGuzNIOy3l4OUoBA+pb8keN8nUtldaP1QRPOH
         qHZd3Nz2ZLnxoecs/OxgcGC091QwP6r5HYTNZUUnK+/0di15U3ftMClBSu9KQ2clMPDq
         CaiMnGIYMVha8FdJk0+NUEpNUjbjsBxyr6ooZ7Dn3elhQHGKW4Z2w3/At8JQpp3COEC8
         GAKmgO4ATyr/DkMJIL9pmgHuyXgG5vGcaOpM/QsnMLLaPmbEabe/dq2Job9QIBnynoyI
         hXlyCIF6SJf3EQoKszDCywrnqTjZXw3yeoxNc8bAPlRoge9MwS7jKmnb8Kb+1SPZD4lV
         dq0g==
X-Gm-Message-State: ABy/qLZxGM7+yG4+3tU4988wd095V0g/yVoP7aO+dKZUGgVVuDmZ9+eD
	H2l6cbizSj0uHDgQAlBwL54vbCWAJrzv6N0+d5xk/lJbD/giOTnAHUefaRXeB+EpPqOy4ykoezn
	tItQJWv4LbfuMzjlA7i6bqoZ3z/JREeVSbC95NwLMvfCv7i1o2ZS+NAc9RPy1HA==
X-Received: by 2002:ac8:5f85:0:b0:3f8:4905:9533 with SMTP id j5-20020ac85f85000000b003f849059533mr23586487qta.50.1689178656006;
        Wed, 12 Jul 2023 09:17:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGIBX2v4lrFqkh9MfymlkmrtaXYfI6hDGPQE1rbvkzdatafBb02lOAezmx4BfX0Q5/dFkKHZd/2bxyPDMKAUcQ=
X-Received: by 2002:ac8:5f85:0:b0:3f8:4905:9533 with SMTP id
 j5-20020ac85f85000000b003f849059533mr23586470qta.50.1689178655789; Wed, 12
 Jul 2023 09:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230627080620.329873-1-felix.moessbauer@siemens.com> <20230710-villain-dainty-d1a90ce57a27@spud>
In-Reply-To: <20230710-villain-dainty-d1a90ce57a27@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 18:17:19 +0200
Message-ID: <CAJM55Z_0X+UT1s9s4kqKuyg4hF2JooTMXe4RYTAzoEgY=+8A1Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for
 starfive devices
To: Conor Dooley <conor@kernel.org>
Cc: Felix Moessbauer <felix.moessbauer@siemens.com>, 
	Walker Chen <walker.chen@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh+dt@kernel.org>, Daniel Bovensiepen <daniel.bovensiepen@siemens.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091742_812476_389A1F4B 
X-CRM114-Status: GOOD (  25.33  )
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

On Mon, 10 Jul 2023 at 20:29, Conor Dooley <conor@kernel.org> wrote:
>
>
> Emil, Walker,
>
> On Tue, Jun 27, 2023 at 04:06:20PM +0800, Felix Moessbauer wrote:
> > Add the '-@' DTC option for the starfive devices. This option
> > populates the '__symbols__' node that contains all the necessary symbols
> > for supporting device-tree overlays (for instance from the firmware or
> > the bootloader) on these devices.
> >
> > The starfive devices allow various modules to be connected and this
> > enables users to create out-of-tree device-tree overlays for these modules.
> >
> > Please note that this change does increase the size of the resulting DTB
> > by ~20%. For example, with v6.4 increase in size is as follows:
>
> Whatcha think?

I'm fine with it. I just wonder why it's only the Nvidia Tegra boards
and the VisionFive's that need this. Surely other boards have pins for
expansion cards.

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
/Emil

> > jh7100-beaglev-starlight.dtb 6192 -> 7339
> > jh7100-starfive-visionfive-v1.dtb 6281 -> 7428
> > jh7110-starfive-visionfive-2-v1.2a.dtb 11101 -> 13447
> > jh7110-starfive-visionfive-2-v1.3b.dtb 11101 -> 13447
> >
> > Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
> > ---
> >  arch/riscv/boot/dts/starfive/Makefile | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> > index 170956846d49..0141504c0f5c 100644
> > --- a/arch/riscv/boot/dts/starfive/Makefile
> > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > @@ -1,4 +1,10 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +# Enables support for device-tree overlays
> > +DTC_FLAGS_jh7100-beaglev-starlight := -@
> > +DTC_FLAGS_jh7100-starfive-visionfive-v1 := -@
> > +DTC_FLAGS_jh7110-starfive-visionfive-2-v1.2a := -@
> > +DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
> > +
> >  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
> >  dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
> >
> > --
> > 2.39.2
> >
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
