Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F43EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yj47Z5FsFxe1/eKghxFmegtCV7E6XKzXxP045m0Wgf4=; b=mQlfNn1Vj79qK7pqHT9adv6FTw
	ZQl3wDrx0Uosm+laDwytXdnJnKogBGZD/lhhZWLcAnmE3S2EgI+5r1bIGPGMGVaaLPCpF3SgWL4M9
	WrROdxXYfqrygyqiw/VTLnXynQwRkUKwNh1KzXmuRHiLkmjJctoFx515aO+oEAVm5k8W+KijS0pSt
	e0hShB8hTTG1yjLlMZ76EnMfNv7oERXgAKp6zG3V2wm1XbNW8R+VMVDa+Cno0IfLEXY0vjSlFcpxc
	fVWONHrQldqaswc1IAwMZRonkCVNzwqazR28rcwkqDlEQuMvHiOA8BZYKLFkrtgN5kmBb2kKR8zYk
	zwWJPxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmFq-00DVTB-12;
	Fri, 21 Jul 2023 09:16:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmFm-00DVSK-2A
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:16:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A9FA6188F;
	Fri, 21 Jul 2023 09:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112C9C433C9;
	Fri, 21 Jul 2023 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689931008;
	bh=7Nr2A3s+7x1dmfoTrYBQ8x3KxtQ72YCiKrx22ldOFGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFHdka10pBwiuXAvP+N2q3HaSlqy5pN61gGLufjyM0xxLslEgcNBdiuZEpnntHmRv
	 r/GJuGteKUpWiltxbrt1Tilc83yguiN198hkM3992vCWmZY8wbRVItBWn+ls3moF5g
	 hTDqsEoZIU81elyflfK9zmItNgyWfse9s0c69zUk+HcpSngGAFOhYGtRST79pLj9DN
	 yJe5/EHzfrxA3ziLf6f5QVC02gc3eBXSmyoqr9hurp0DfLePKV20MuJyZf7QBAQdRh
	 ePuC3JJKTbigOA/xzLZ3pHeqATi/uj2fYH4ygVKaSiRLG0I9tYpYpBIm69R3ohWdmv
	 wldvuiAufGPKg==
Date: Fri, 21 Jul 2023 10:16:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Samin <samin.guo@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
Message-ID: <20230721-passive-smoked-d02c88721754@spud>
References: <20230714104521.18751-1-samin.guo@starfivetech.com>
 <20230720-cardstock-annoying-27b3b19e980a@spud>
 <42beaf41-947e-f585-5ec1-f1710830e556@starfivetech.com>
 <A0012BE7-8947-49C8-8697-1F879EE7B0B7@kernel.org>
 <ce3e0ffb-abcd-2392-8767-db460bce4b4b@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <ce3e0ffb-abcd-2392-8767-db460bce4b4b@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_021650_816021_BB36A93E 
X-CRM114-Status: GOOD (  19.45  )
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
Content-Type: multipart/mixed; boundary="===============3231456631133775694=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3231456631133775694==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nLLwIQv8s4nvN5n3"
Content-Disposition: inline


--nLLwIQv8s4nvN5n3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 03:27:33PM +0800, Guo Samin wrote:

> -------- =E5=8E=9F=E5=A7=8B=E4=BF=A1=E6=81=AF --------
> =E4=B8=BB=E9=A2=98: Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH=
7110 SoC
> From: Conor Dooley <conor@kernel.org>

> =E6=94=B6=E4=BB=B6=E4=BA=BA: Guo Samin <samin.guo@starfivetech.com>, Rob =
Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@l=
inaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palme=
r@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starf=
ivetech.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org=
, devicetree@vger.kernel.org, netdev@vger.kernel.org
> =E6=97=A5=E6=9C=9F: 2023/7/21

btw, please try and remove this stuff from your mails.

> > On 21 July 2023 03:09:19 IST, Guo Samin <samin.guo@starfivetech.com> wr=
ote:

> >> There is a question about the configuration of phy that I would like t=
o consult you.
> >>
> >> Latest on motorcomm PHY V5[1]: Follow Rob Herring's advice
> >> motorcomm,rx-xxx-driver-strength Changed to motorcomm,rx-xxx-drv-micro=
amp .
> >> V5 has already received a reviewed-by from Andrew Lunn, and it should =
not change again.
> >>
> >> Should I submit another pacthes based on riscv-dt-for-next?=20
> >=20
> > Huh, dtbs_check passed for these patches,
> > I didn't realise changes to the motorcomm stuff
> > were a dep. for this. I'll take a look later.

> After discussing with HAL, I have prepared the code and considered adding=
 the following patch to=20
> Motorcomm's patchsetes v6. (To fix some spelling errors in v5[1])
> which will then send patches based on linux-next. What do you think? @And=
rew @Conor

I think you are better off just sending the dts patch to me, adding a
dts patch that will not apply to net-next to your motorcomm driver series
will only really cause problems for the netdev patchwork automation.

> [1] https://patchwork.kernel.org/project/netdevbpf/cover/20230720111509.2=
1843-1-samin.guo@starfivetech.com

I meant to ack this yesterday, but it wasn't in my dt-binding review
queue. I'll go do that now.

--nLLwIQv8s4nvN5n3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLpM+QAKCRB4tDGHoIJi
0sgZAQD0dSzvCgT6QBV4QteZEHj8xk6HSmskaiafKuzZBSHOCAEA91aMVNeLutXk
+GHuhA9YiiDTsg4DYMZ+HD318oah9Q0=
=SUU7
-----END PGP SIGNATURE-----

--nLLwIQv8s4nvN5n3--


--===============3231456631133775694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3231456631133775694==--

