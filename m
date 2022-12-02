Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA90C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 12:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/+u5dSVekcQGffyeThWWt5AXclMkPd8cRYWJpvQB90=; b=1d60SPpK3R1BI3AVTm/e/lhP0C
	bMgtNJ+75E9JtqjztTSmX+Afrgf/NcdBQKPgKQvz1h/ZKVKw9iELV74ePrNKmZPnidr08CwSjtDuP
	Va3ME+aou+05VTDRfadXFbIjXs9GPjbDj7Ciw37SMYE7fBUDEFavx2Z1gyUCbflWO/vjWYHUfZk39
	AU/V2tZspw4IrKsUi8195+DQd7TROmShZ0w9Cne7N74EyVZYdPr8cEjFGe9jh0EInq6JpmQywV8Bi
	5o8Gy5fiWh1IqZ185tVy1CWVeK8Ymc6frB4zRcgzODoYHfcQqNM+k/dWOtxeEZ9x5QvS31P+d1z1x
	pEzREkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14nn-00GCp1-6Y; Fri, 02 Dec 2022 12:05:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14nk-00GCoN-6M
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 12:05:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCF5D62277;
	Fri,  2 Dec 2022 12:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD70C433D6;
	Fri,  2 Dec 2022 12:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669982755;
	bh=//XNj4SQWZKKZVQhTBw0rAdtdWRbsJy4awbNElMStmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvSIA7M+NRUw1gvLeZsCoPN8umCo/3oxrkiu5SgPBbQP7+xaEa7e9jHTJQXEaagZd
	 GpsDTgYSDCYPmaYXh3EerXoYBbZm/a0di/JaSrpmn0AAOXTVC8wTm6CEpQXqRa5lyW
	 C3Xl2yASx3mC64f20WmYFSjE4YISQ981r35gsjwr3e8hTvU4S+TQ0dwY+aYkLCV6eN
	 7SrqL4nlT7y55xEUCMbhs6NRMySUrTMXAcNIXPUNPOBXsiT02VmaObkh5dqVvsH3Vv
	 /RKCABP3kVULp/Dgz+CXxcqCaBZTjXlMnD8oJPViR6CsP7lJI3r/untmvMevpjvD5H
	 y2ORkRS1W4MdQ==
Date: Fri, 2 Dec 2022 12:05:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Conor Dooley <conor.dooley@microchip.com>,
	samuel@sholland.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	dmitriy@oss-tech.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH] Revert "clocksource/drivers/riscv: Events are stopped
 during CPU suspend"
Message-ID: <Y4nqHl8mjbsRj7On@spud>
References: <20221023185444.678573-1-conor@kernel.org>
 <9d0211d8-eefe-9464-940f-ac113ddbb0a7@linaro.org>
MIME-Version: 1.0
In-Reply-To: <9d0211d8-eefe-9464-940f-ac113ddbb0a7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_040556_290001_DDFD29EE 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Type: multipart/mixed; boundary="===============3618427299578843194=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3618427299578843194==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hd4ZDEpuaruNBLYK"
Content-Disposition: inline


--Hd4ZDEpuaruNBLYK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 01:02:20PM +0100, Daniel Lezcano wrote:
> On 23/10/2022 20:54, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > This reverts commit 232ccac1bd9b5bfe73895f527c08623e7fa0752d.
> > If an AXI read to the PCIe controller on PolarFire SoC times out, the
> > system will stall,
>=20
> Applied, thanks

Hey Daniel,

Looks like Thomas already took the v2 of this patch:
https://lore.kernel.org/all/166989319052.4906.3934360150862233210.tip-bot2@=
tip-bot2/

Thanks,
Conor.


--Hd4ZDEpuaruNBLYK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4nqHgAKCRB4tDGHoIJi
0hauAP9F1ohXKqCSFx1Z2po98FplDIMdOAERbdzx5pVGdHRBPgEApvII36TFxMd3
ku3gTocQLCjVmYIy5pNqlffPHUyySQo=
=3uew
-----END PGP SIGNATURE-----

--Hd4ZDEpuaruNBLYK--


--===============3618427299578843194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3618427299578843194==--

