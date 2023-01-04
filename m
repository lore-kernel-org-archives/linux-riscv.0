Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BA8C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akDTvHVCoybfjm2I709Sbg5D2Z5dmrUnESBTammqLu4=; b=WPs9iEnOUVy1hD
	NPb+VD6MLBmG7wzJYJA49rHJC13Lx+MpKtP9GZ3aCqFQDHUIU8j0fdjcLT+JqI9S17yxlt/ZLJtCe
	ZUA8TxvykVw6MiZ2brhOCDWKBWc0pOYjqbokpM6zX+qJ9WoPHfo3EYdsmRas68ZtN+11IoZzsvr9T
	9bP6w2/3GtigB7w8Li/6drtASZqMYK8PgYl6mDFkaK+heKPShjGzI0VhBuQwSOa9TJY2tEQGJHdip
	KpX3Jx28PjnZOixN/PDLHyWL4sbo0lpsOhJWdo++sTeQ3vKPvRqD+vDPOrXGIEwk5uutDLRDS9EX/
	pVLvIaxjGYevoIeCjzQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5f3-00A6ND-ND; Wed, 04 Jan 2023 15:26:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5ae-00A4RC-2I
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 15:22:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id fy8so19382494ejc.13
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 07:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20LSKy+F6H/ibVso/7SWMiaNKhjpieAdY4EC6AFhBiE=;
        b=LahJ+an5Tr1vvuLs85cH742nMxkvgXxw6nMO54s105BDeWuqchnZz6NSMJUoJJ6sXe
         /s9+lzqsiwKlyG8WspgGDhVjfM6mr76+Cyt4YIlUxJtDWTzchY+otIpStyMLrDRY8Jmi
         3xdhf4opGUCATPnIRdvCgWHxZmS91/1/E1xDbOZmOcNTrlRyTxhnXQGI3RMvG5btgpKb
         5pgQd0VK3V+DUfaFrVQgzd2xWZBbJAMpIS/vAAInhHaJhIX1+dTuNvGOMuqBAges/8Bm
         oGeSmKc8dc/7qskXHKsI3c85ZN6jhOwPFI1wuZsn72A/9sVMP/a2pDeaCZELZ6muRMU5
         Qu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20LSKy+F6H/ibVso/7SWMiaNKhjpieAdY4EC6AFhBiE=;
        b=GywttCtUp1fCSLGn79Fyo50866ISYnpSvrtgGSiO1E1LRDZt0o/DiTQJYLm61O+cvs
         rd5JBax6uw01wbQ16H4997cAuAd29K1YjpupGMkVpniufqYyenZtYeMDol4fWkMocksP
         +kRlBYDuqBoV8VOz6OuIDLKccpbmRYoQv62+EDTL8PswUW5/r9K0bY/CyskPFZIpe3Mw
         ZSZB8ILc7JY1S9RJ3BkquU6q2+8KF6lGMbDeVHOSSQniVujaYB9ZlrUo0IpYN8yj1q9v
         fPUbx6R+kHeDNdwphtwaBZpnpYyqtGvRx3nkbWTc5NpFVRlBRQOyporeX/kQT+nVXiGG
         aj/w==
X-Gm-Message-State: AFqh2koqdp/sEEQlvySPvQOp2ot3GiqyafcL3wpot7rnxAmv3156rDqO
	EUT5nidu5SVI2V6V0IABYBRO9Q==
X-Google-Smtp-Source: AMrXdXt3mbJSa2YwDa6Pb8OMitAoawu5ChBIZ3MotE5D5M4DWNFFNzvb8R/ZHGM+shSOMT7y6ieJXQ==
X-Received: by 2002:a17:907:9a98:b0:7c1:d4c:f08c with SMTP id km24-20020a1709079a9800b007c10d4cf08cmr41394995ejc.4.1672845720231;
        Wed, 04 Jan 2023 07:22:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p15-20020a056402500f00b0047eeaae9558sm14780308eda.60.2023.01.04.07.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 07:21:59 -0800 (PST)
Date: Wed, 4 Jan 2023 16:21:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, linux-efi@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, alexghiti@rivosinc.com
Subject: Re: [PATCH v3 12/14] efi/riscv: libstub: mark when compiling libstub
Message-ID: <20230104152153.ae7zki6iofc7ugbs@orel>
References: <20221130225614.1594256-1-heiko@sntech.de>
 <20221201193455.2hr6mwm6sa6vnd3w@kamzik>
 <CAMj1kXG=zM0EFFPn8MBWFurk=oSRPqwdd6CP1dudQC+JXV36Og@mail.gmail.com>
 <4822525.e9J7NaK4W3@diego>
 <CAMj1kXGBSLf4ppjA5_F4Ork+ZJ45Sk0w6SnPc3eDcWbTMkj3SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGBSLf4ppjA5_F4Ork+ZJ45Sk0w6SnPc3eDcWbTMkj3SQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_072204_184993_0686716F 
X-CRM114-Status: GOOD (  25.25  )
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

On Fri, Dec 02, 2022 at 05:37:16PM +0100, Ard Biesheuvel wrote:
> On Thu, 1 Dec 2022 at 23:39, Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Hi Ard,
> >
> > Am Donnerstag, 1. Dezember 2022, 21:57:00 CET schrieb Ard Biesheuvel:
> > > On Thu, 1 Dec 2022 at 20:35, Andrew Jones <ajones@ventanamicro.com> w=
rote:
> > > >
> > > > On Wed, Nov 30, 2022 at 11:56:12PM +0100, Heiko Stuebner wrote:
> > > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > >
> > > > > We may want to runtime-optimize some core functions (str*, mem*),
> > > > > but not have this leak into libstub and cause build issues.
> > > > > Instead libstub, for the short while it's running, should just use
> > > > > the generic implementation.
> > > > >
> > > > > So, to be able to determine whether functions, that are used both=
 in
> > > > > libstub and the main kernel, are getting compiled as part of libs=
tub or
> > > > > not, add a compile-flag we can check via #ifdef.
> > > > >
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > >
> > > I think it would be better to update arch/riscv/kernel/image-vars.h so
> > > that only these generic implementations are exposed to the stub in the
> > > first place.
> >
> =

> Actually, all references to string and memory functions are going away
> from the stub. This is already in -next.
> =

> EFI now has zboot support, which means you can create a EFI bootable
> kernel image that carries the actual kernel in compressed form rather
> than as a hybrid EFI/bare metal image.

While chatting about EFI stub string functions again in the context of [1]
we recalled this comment that states the references should be going away
anyway. I'm just replying here with interested parties on CC to try and
bring it back to the forefront.

[1] https://lore.kernel.org/all/20221216162141.1701255-5-alexghiti@rivosinc=
.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
