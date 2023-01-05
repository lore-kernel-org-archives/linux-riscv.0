Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1478C54EBC
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIVMuUGgEzhizv00Xqrb6gRFshDb8e8+5NoAhDuRNz4=; b=I+uVuThpnQXlXK
	3meR/EkXMesUU5u0wR2/YBlqr9Z9ckzD3b5AY+N+MsN3cr6+FIM/lUG677HTITX1nG1wqAxSC0YxQ
	b28eyTm01S0mWxPcSfOj7pTwJTP3N/FapK28E2yS02450wPfwhgWr81xfp4Rg9FWIfY20/d7L8LrG
	Je9QS/ZfokMZ804HM12UMNU6fO7gv4EfcjjPglAnHOsKyV1Qw5n6ULAND0/lW7UiYXPrnyuOXrMgr
	MEEYtECAelWKcNhHny9WRIJ3s4LdWQOD/sdJpgGnscmlTaflIDZjcaIgpBOhx5o47LPBymxqIERrY
	7RTSgz+Um87/mZr66lsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXWp-00ExOd-If; Thu, 05 Jan 2023 21:11:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUoT-00DTJB-Cj
	for linux-riscv@bombadil.infradead.org; Thu, 05 Jan 2023 18:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IUMik6OP1WSOi7B4ycd8iNPwGDffJZx2uMiF5G9HMxg=; b=FnCmXPT2PfGVH/DJBcWrIVQZlE
	51QHHCbGR3WV9iwx6zDhLITC3Gf77UNBMXH0P/ByN1mqZVPsygppT4ctUHXSZPpOHpygJ9k8Xuj2f
	+/cJvZJuN5KuQmvjROguaTKMd0QOICnHXsLD+YYZnoX+nttgx0hdMObT3iMNWaTSEfiiFYuRTdAiB
	fuXOhFrs68lSz3vb7YxJmBNdA+XiZ0p1OE08XA6ErBFTYxdqPzyR51xTxkixXWgUh3QE1cWxzB0kX
	ZT094K/BYbpRcOrmgmHRl25tY+p1PVlm6c7HoCbH6RFIKwIMto32RaCv6aqC4sNi2A8wvAqY2tDoK
	O9r99raw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDRjW-001PMM-2q
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jan 2023 15:00:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id co23so36422974wrb.4
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jan 2023 07:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IUMik6OP1WSOi7B4ycd8iNPwGDffJZx2uMiF5G9HMxg=;
        b=HupsC+BYGN9XspL55XKODEbECmTzBw81o6X54RNl/b7VMK1qlFvmBvdRPHDwIiZSKi
         zoV/sFuEym9QySF5udKPQBwFoTV8CmGsj+ot1U9XXSADHwKaDAA0dPz9qFHioevF9Agz
         mp/RbhozRY/5iFXlskY/vM39ZZaj4a1KUVg4fnW/CU4Sy+mVlG6B8SiOTwi1pKwrUGdn
         fE/SVw+zeeteTbw6Lja5s+tvVoLHB4toNDBsCoJy3w37TWJtci/Ex4RGsuAQLMFBBQgd
         0GO74Gg9ThMbTSnEyRNheS1++XnnJHhN4Ogiuzr2MU7h4tePwxC4kEb9IxKhrWSowfyj
         juUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUMik6OP1WSOi7B4ycd8iNPwGDffJZx2uMiF5G9HMxg=;
        b=ccipNFEZ6Px+RCs/+fcEGgvlZN6b8AH97mbKZo5UUbdqLxRlGqxpmlEav1Nt78hHUT
         9JcNmPSVeNX2dk8C5uBTisvcRbQVS2PWLxNHt0xrhIg6R4H2wntjgljfeJdkSs6ECwrp
         MYlsTBKpiBV1j7k8EdcvSwtNLkCoGoxOuVZk5AiW4SpCIRX6kRR/0IN8OFXc0AKacrsI
         SVvl714QrORqL5DTjr3PrKwsc58IxSOwKipkRus76fR/heYLgEP9n2w/vm26fvQ82GWN
         TKdoQuk7Wm+h2t/1BXJiYd9eqKHChBna0QnONgiSZaJ1LMMFGIrms5XmNb+KWOh94O7B
         JtWw==
X-Gm-Message-State: AFqh2kqS1iUwmruWINcc7mVYgwAN/v/XxpfsV3v2gMu9w8X+iBCvyofk
	1hqcPqLKa1WXI3dI5A0KUQJrSg==
X-Google-Smtp-Source: AMrXdXtDhzTAtUXL41SCyf9C3BfxFxfi4LqkeWrH7goo0HhOqvklNoBOX0bTJoMzhe7kIxtp2beNUg==
X-Received: by 2002:adf:ec43:0:b0:280:cc12:2827 with SMTP id w3-20020adfec43000000b00280cc122827mr23052343wrn.21.1672930846595;
        Thu, 05 Jan 2023 07:00:46 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d438d000000b0029e1aa67fd2sm8198003wrq.115.2023.01.05.07.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 07:00:46 -0800 (PST)
Date: Thu, 5 Jan 2023 16:00:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
	philipp.tomsich@vrull.eu
Subject: Re: [PATCH] RISC-V: fix compile error from decuplicated
 __ALTERNATIVE_CFG_2
Message-ID: <20230105150045.ksqcqsypnog425gi@orel>
References: <20230103214228.841297-1-heiko@sntech.de>
 <Y7V/NZdDf4TpPBh9@spud>
 <20230104140833.nbulmdsgcm5x7d47@orel>
 <2035002.VLH7GnMWUR@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2035002.VLH7GnMWUR@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_150043_150296_F58DB9EF 
X-CRM114-Status: GOOD (  23.83  )
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

On Wed, Jan 04, 2023 at 04:58:00PM +0100, Heiko St=FCbner wrote:
> Hi again,
> =

> Am Mittwoch, 4. Januar 2023, 15:08:33 CET schrieb Andrew Jones:
> > On Wed, Jan 04, 2023 at 01:29:25PM +0000, Conor Dooley wrote:
> > > On Tue, Jan 03, 2023 at 10:42:28PM +0100, Heiko Stuebner wrote:
> > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > =

> > > > RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
> > > =

> > > Hey Heiko/Palmer,
> > > =

> > > Was a little hard to tell from Drew's mail if he was objecting to this
> > > variant of the patch, but FWIW s/decup/dedup/ if this gets applied
> > > as-is.
> > =

> > I wasn't completely objecting, but rather suggesting we still try to
> > factor out what we can. However, after reading a bit more about macros
> > I tried this
> > =

> >  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, ena=
ble_1,   \
> >                                 new_c_2, vendor_id_2, errata_id_2, enab=
le_2
> > -       ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \=
enable_1
> > +       ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_=
1, \enable_1
> >         ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> >  .endm
> > =

> > which appears to work for my simple test. Does that work for you too,
> > Heiko? If so, then I think I'd prefer we do that. Also, we may want to =
add
> > quotes to all macro arguments which may contain spaces, even if things
> > seem to work now, e.g. the \new_c_2 argument passed to ALT_NEW_CONTENT.
> =

> Yay ... adding quotes really seems to work - at least a GNU toolchain

clang isn't complaining for my test either.

> =

> I guess that may have been the reason to move new_c at the end and making
> it vararg in ALT_NEW_CONTENT originally.
> =

> And in fact with added quotes the varargs argument wouldn't be necessary
> anymore.
> =

> Just removing the varargs argument alone results in
> 	Error: too many positional arguments
> erros, but wrapping the "\new_c*" in quotes lets it compile again.

Excellent news. Do you plan to post the patch? Or should I post with your
Reported-by tag?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
