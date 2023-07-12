Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897E4EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yGaSV+VR8JU1UCwWZmK8z0j9Ys7l785qsHZo43Y7tws=; b=DxOaM6I3vhTBsU
	MqdwfRgxzK3xcpOGoIf6KU85yyZd+pGpLvquNBbH801P4ePb1AVacr8F5wcO7mrye+c3e0QckT4Gl
	Zw6Q2C3+THRJgLAfs/ZgITfa8obvoiFfE+WIrltSVigjJbsfkDFPxv62wUcjCxyJqlQ8ejyofdEtW
	6EMSsx0LAdRGFMTBVcwrl3MMh5CwOWLOSMLdkjDhL4h7Nau6awKbnDrhlKsGoR/7nkT1K1Ab81SHz
	Wj1CjB+DtDaPPfq25Vlv1R/s4O5+PUh2U4Ek3gnmKzS8Xec4/SG5qMUrA8xrgdodWLZtk81wcrJrZ
	ONAZijZBD/qnxq+lYStQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJexj-000wWN-2a;
	Wed, 12 Jul 2023 18:53:19 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJexh-000wUN-19
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 18:53:19 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5FC703F71E
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 18:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689187990;
	bh=zDGdomtgiC1DNd+2RkB6zaiSgc3riteCyygnxmQ1i88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=atfgGmMReHxBSYv4zE/NlJGemImpp39g7g6yuxTtv7LOATsjDEfxhSZkzdf/UdMgC
	 Su1qXlLW0wHXQP///7MKmvbgUgiRhB75ZHv7uKzB/+rAHkUum21VoEbwD2IjD3RtGA
	 HWtjBYLMFcZpIS/wDBDl/7MuSyXF015TrB+5FFS1xchV1Cr55uuPWt8f38Jjk95bE1
	 /y8CjfSyVHrfQnRfoQ2lGNFZS7M433V+rac8ExsjNlNlHhHvF+F/CJukCsbnUeNAJO
	 ULtbTWSNVJiaAYieQ3M7f/dMkhWs95sf+cPdZWQZu1nSvYWjRLKqvrYMMkhb7rxAWW
	 hqd/57OMBcdqg==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403b84bc821so27258631cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 11:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689187989; x=1691779989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDGdomtgiC1DNd+2RkB6zaiSgc3riteCyygnxmQ1i88=;
        b=J75HNflhRcLHlzpKW5u69EQQpgYDqCTgne0Jj6trCnrVT2m+ethUGfa2LmFKUyTih0
         8yyq4pESMXuV1rAamqf419qVWSvBoThnpcLOwBb7FZ9CAsM8Ap/ENoI6OO56As1f510S
         XoeVEipiRsKu8hwGp9zz5YEPGY/ivaIWCsU/6XBMEOSHX/lU53iv6HRoUx0ERN8gsXOw
         geVX6UGYx3Z9cDwqpqykUAAqdQ2HdS/F0Zbqd0M2rxcPY6NTlrmCVR7cHKM/TMKtfhXI
         NiMNZ6dUvJ3tQ9m/mvFyER2wd3MP5PuT+NCFiB83eIDwO8yrz5zM4YFum1mnxCkLxGSe
         4Odw==
X-Gm-Message-State: ABy/qLbrPYfd2YIJ7dJ4/WU/gP6PZaCNa+bTNhuMhnIdU+7x4h4kkS2M
	0pN3Bk2t/ZSmRUsvcxm7NzlPiw8SkPk1pogyLyPoKaChgRDDEsvUK8cipHtfS6zfAG4RAtxuN+D
	mpv/1tAH4kT1Klp6jT1fHZI5+v5wG8I1cxA2ZdvqZY1RP8MpUK+ZvXyON3RsmIfKaxGTMkg==
X-Received: by 2002:ac8:5907:0:b0:3ff:23e4:40b4 with SMTP id 7-20020ac85907000000b003ff23e440b4mr21858825qty.42.1689187988848;
        Wed, 12 Jul 2023 11:53:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmQwEBRm9hkWnBl5+uXgIhEHsFqZaO51b31k/pOXHkjhUNY9XYe1J765jsNEaaNzKwTZ1bpQJdbzSVsfLDL6o=
X-Received: by 2002:ac8:5907:0:b0:3ff:23e4:40b4 with SMTP id
 7-20020ac85907000000b003ff23e440b4mr21858813qty.42.1689187988619; Wed, 12 Jul
 2023 11:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230627080620.329873-1-felix.moessbauer@siemens.com>
 <20230710-villain-dainty-d1a90ce57a27@spud> <CAJM55Z_0X+UT1s9s4kqKuyg4hF2JooTMXe4RYTAzoEgY=+8A1Q@mail.gmail.com>
 <20230712-single-crestless-93bf57c09773@spud>
In-Reply-To: <20230712-single-crestless-93bf57c09773@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 20:52:52 +0200
Message-ID: <CAJM55Z9zZT5nTCw9R_hq+ez7qgXmczwheEKkJ-0sYwwxXtHqVg@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for
 starfive devices
To: Conor Dooley <conor@kernel.org>
Cc: Felix Moessbauer <felix.moessbauer@siemens.com>, 
	Walker Chen <walker.chen@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh+dt@kernel.org>, Daniel Bovensiepen <daniel.bovensiepen@siemens.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_115317_522486_9844086A 
X-CRM114-Status: GOOD (  26.67  )
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

On Wed, 12 Jul 2023 at 18:23, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jul 12, 2023 at 06:17:19PM +0200, Emil Renner Berthing wrote:
> > On Mon, 10 Jul 2023 at 20:29, Conor Dooley <conor@kernel.org> wrote:
> > >
> > >
> > > Emil, Walker,
> > >
> > > On Tue, Jun 27, 2023 at 04:06:20PM +0800, Felix Moessbauer wrote:
> > > > Add the '-@' DTC option for the starfive devices. This option
> > > > populates the '__symbols__' node that contains all the necessary symbols
> > > > for supporting device-tree overlays (for instance from the firmware or
> > > > the bootloader) on these devices.
> > > >
> > > > The starfive devices allow various modules to be connected and this
> > > > enables users to create out-of-tree device-tree overlays for these modules.
> > > >
> > > > Please note that this change does increase the size of the resulting DTB
> > > > by ~20%. For example, with v6.4 increase in size is as follows:
> > >
> > > Whatcha think?
> >
> > I'm fine with it. I just wonder why it's only the Nvidia Tegra boards
> > and the VisionFive's that need this. Surely other boards have pins for
> > expansion cards.
>
> It's totally not just these two - there's been a flurry of similar
> patches recently. The RPi stuff got it - I think I Acked that one from
> the DT side while Rob and Krzysztof were out of office, partially on the
> basis that the Nvidia stuff had it (and IIRC Renesas).
> Since then there's been a couple other ones that got the same treatment,
> including 32-bit ARM Microchip stuff. I've been avoiding doing it for the
> RISC-V Microchip to see if Rob decides that what I Acked was a problem.
>
> It seems generally helpful, so I've been a little suspicious as to why
> it was not done already...

Ah cool. I must have been grepping on v6.4.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
