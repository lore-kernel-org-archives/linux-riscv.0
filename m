Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34293C7EE26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBBpNAezHXqxYKo8H7T8arL1qZqv9lhQ2X+FkUCENB4=; b=4KzVaisyAQ6TN5JzZNMymY79e7
	DLyA2KU2H3WNHg8tUQi5RSYhFh4JLt9SenKVIOwhLrneFVwkFjO562YKo+PZm3YN8Yczb8/6ecLZ1
	Lo4xyJRuvhcwpvjks3he2w5C5DIL8I1Bqh9xVJCz7h1bIBVoSg+dddADdVLIVUKW43N6hf0S25Jkf
	vFe2PdapLM5h/ZbifYQEtMuF2VZxVbx2v5cxURLjq/p3fWsPne6Ncu0zb4jvJt1Bknopvg/FXsqEX
	l9TFHS7om9Kdm4a+ZNX2mGs79PT5AwxkE/q+5vvtJSkAFvcn2cjx/zWYz+oQhBC1ttDxetB/R99xk
	shZuvLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzzG1-00GGaY-2d;
	Fri, 19 May 2023 12:30:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzyHg-00G6jw-1e
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 11:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684495712; x=1716031712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cf7E+oHz/GLsISrXOLO5vv/QNIi3P7viGOf6I6RP7jc=;
  b=b1g/IcmhQGLdoCOx/Baw7XLoZE39/aUdaaagqV+do/SGAqelutt51N9l
   rPJPX6QdqgQFGqIzDjeEqi+U5AfYY8VVD0bfaiNRV1poGBzWncKSbO93q
   IrMuPB2CQAsHdAHREhGX/2dRL+ppxCeqZtSB/hvxmuEJJFDFfgmzxrszD
   vkx8z2/Xq00mBW8PYjENIlndzKkzpiDcvCPuQIuPii/EJG0fHMJRa6zVa
   J4OTTumzUJ8qKikjCvxBZ4SJ95+sarlNIF1nGF7X5s81iFyTDOSYXok9V
   6bDyK4umykLAoGeAN+hZM2yM+BEky9AfLqendWc4MVkp36X/MGVh1GeK4
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="asc'?scan'208";a="226063882"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 May 2023 04:28:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 19 May 2023 04:28:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 19 May 2023 04:28:29 -0700
Date: Fri, 19 May 2023 12:28:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
CC: Song Shuai <suagrfillet@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Song Shuai
	<songshuaishuai@tinylab.org>
Subject: Re: [PATCH] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
Message-ID: <20230519-clarinet-collar-ba2c0fa37e11@wendy>
References: <20230519102908.253458-1-suagrfillet@gmail.com>
 <9a274a44b61345e8aba747a44250c4d8@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <9a274a44b61345e8aba747a44250c4d8@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_042832_550386_26B1E21A 
X-CRM114-Status: GOOD (  18.20  )
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
Content-Type: multipart/mixed; boundary="===============6140774359299990839=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6140774359299990839==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EJxUDy+0o/zIR+OB"
Content-Disposition: inline

--EJxUDy+0o/zIR+OB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, May 19, 2023 at 11:14:27AM +0000, JeeHeng Sia wrote:

> > The suspend_restore_csrs is called in both __hibernate_cpu_resume
> > and the `else` of subsequent swsusp_arch_suspend.
> >=20
> > Removing the first call makes both suspend_{save,restore}_csrs
> > left in swsusp_arch_suspend for clean code.
> >=20
> > Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> > Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>

BTW, why the two email addresses? The tinylab one here seems entirely
redundant - unless it is your employer, in which case should it be the
only SoB address & also in the author field?

Also, Fixes tag?

> > ---
> >  arch/riscv/kernel/hibernate-asm.S | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibe=
rnate-asm.S
> > index 5c76671c7e15..d698dd7df637 100644
> > --- a/arch/riscv/kernel/hibernate-asm.S
> > +++ b/arch/riscv/kernel/hibernate-asm.S
> > @@ -28,7 +28,6 @@ ENTRY(__hibernate_cpu_resume)
> >=20
> >  	REG_L	a0, hibernate_cpu_context
> >=20
> > -	suspend_restore_csrs
> >  	suspend_restore_regs

> Good catch. This function is invoked twice to restore the CSRs.
> I am good with removing this function from here.

If that's a review, then please either give an R-b or A-b tag :)

Thanks,
Conor.

--EJxUDy+0o/zIR+OB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGddRwAKCRB4tDGHoIJi
0mipAP9UCMmbIp4f083gUWLawat8G9jMwBB9ejHima6/7Ti7gQEAhWrQ5erXm8Ci
dgutF7nRdqiQDx9tH1J275jBm3gXIQc=
=IWm6
-----END PGP SIGNATURE-----

--EJxUDy+0o/zIR+OB--


--===============6140774359299990839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6140774359299990839==--

