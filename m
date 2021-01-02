Return-Path: <SRS0=P1Ac=GF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF53DC433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Jan 2021 11:30:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E23C20857
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Jan 2021 11:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E23C20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/fggPNBOPniKWWxG+Er4An+x3Q1X/0xCHVkZWtbRGvc=; b=KabOjFVjFtMJniBhZrdrEczoM
	W9ubm3quRU7KDJFBlWqSmpADmGXCop/MVxiJwVetHb2D/WbG9G5ZbAi06+qjtM9SFIFrqdpfHjU6C
	Rup/obJcvBJwofk6akBPPtKWwjO729CzzeE7lGzPl3Wx4zH3Q8lvvJxJsJDfmlvIyOKzJY7N4LZlW
	gdJEVy3NR1P3ct4L2ctrwyZIN35CLXmnfpS28V/Ydzj26XQhv5YTv6X7Oy7FIcdnClytfjejegE1K
	IBxJYh6HgAIRpiFBITxl9srJJMw9cXRchrgD+tuB1b27fxWfC/3wi4oj4fuero/ZGJ04snau1Kn/H
	SxClZ94wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvf7E-0005Q8-07; Sat, 02 Jan 2021 11:30:36 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvf79-0005PY-Is
 for linux-riscv@lists.infradead.org; Sat, 02 Jan 2021 11:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1609587017;
 bh=m/57QOMlv3IGIwaLNqziIdqqnhLXOo/2igPxxFFjLsY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BWJ5Bv7sBkGB7JHBHhjTQynSZFjGxzIhJVbRxqIpsSEVm9hdtahd2ckSjolbTPpgm
 7WgkgVGxNNWWKAzHSe/EffTgv4PikzCwy3xlOACbBbbH29U8SNv/ksN/dX5j910lnz
 tQPMq9UTY3cYuD5XlKGyoaFBen9m3TUyIOpYCdCg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1kOG6R08xS-00azeU; Sat, 02
 Jan 2021 12:30:17 +0100
Date: Sat, 2 Jan 2021 12:30:12 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v3 2/5] dt-bindings: add bindings for polarfire soc mailbox
Message-ID: <X/BZRLWx8vOLzARB@latitude>
References: <20201223163247.28923-1-conor.dooley@microchip.com>
 <20201223163302.29057-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20201223163302.29057-1-conor.dooley@microchip.com>
X-Provags-ID: V03:K1:a13/NsyMphX1DrLzFr4PvsSYFZnk5qsgcY4tJ/yOqT+uhdWom4q
 PZkryeErLqhtbC79IfVbeTTOT/XGngcn+k8AVmnP/OXaVTpW9I98c3gkfRscB1CGcEkyEIt
 fy/onPuEg8L+tlUWicLCmzNTnUldj1LFVuz6LFBa4CJYWND+rgDxQYYUUMhBsG1ANZ0wkzZ
 JiPo8OwDLHc5jECy0K1wA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MpRJRrJXoKk=:OIUYE0BmzHgcKKd9lDl1Bq
 4VeWhyB9tRj16g70NO/fN47IrxA7qkg2xhozoF051C7cWMrSyRVVkjh0T5ZYHhcMdDDEjQkYF
 B8fx6s4aQjex+QUCx39hHx27Dz5KZ64ALLmPFQwRYDRhdPwBy3v3ztnhXmH5N480Nw4uR06Nz
 gnUqWbewk4vDZc7G4KWaifeqrOQrTH80usL11+PpVkJZ0wof+efUFQ2ZS/uNMboHa3zIQQMQb
 EKJ8o08s71c4dPC1yPRIWof59GZAjJVQZrnRSEyLNVpEJmw8nl9PpMIUtbhmm/SWco55yl6OV
 KFgqNDMNv39qGNhVRcRsmslulqPHQ5t9N7m+nhn0eJyWoNFak/juJLzPO+NaYVwHacZlYxQJh
 1kF56kU5osIZhO5nvNp9BeZSinz1rtw+82UT+WhW+65kzNk9a6YFAAaVj1rk9I1nfhiaiiS0l
 hGq3c3YcR7LVOyyw3tm5ZkbD8KL2bc1tv0fmd24bB3GX8KdA4GOsJ0AezMtYXh0dnWVUR/xjY
 H3q8xEe0O9uur140bwdo6cH5qzMKKVpbLs6SMFFfVJcez65KL8JwUlDYaiH+INGqJTeJmprrj
 juPSX/c+NjA0DhvwFfdDh8W/4I0Ix3JjnbbDXGBCO589ZKbuXUo/UgypKxs0TCBFVruOsn8P8
 1UZ4FsJX2l5l9QJULKOq3bg3qokFQcKu8t1j+8wHjhIY76xLJkdqKgPp0LQN7XE23iX9wrH61
 aNmtlqaBQkm92Y+amBL8q1RSm5q/d17oyIKjxPL43Hysp/h3FiM2ii12DMbHJfoebs79KtHnF
 TZpccs3sZkn1OjI41p0n7am9jUILa+pWqpTy4lGyfOp+pAojJGUxAmLfcIgKv7pYqnUaegr2G
 qeuDIINjWXwzDKEqAs7w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_063031_929706_44FB9ED1 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, jassisinghbrar@gmail.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, anup.patel@wdc.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, cyril.jean@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1711374842660177835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1711374842660177835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lgUL0vHJFSWo4OLl"
Content-Disposition: inline


--lgUL0vHJFSWo4OLl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 04:33:02PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
[...]
> +  reg:
> +    items:
> +      - description: mailbox data registers
> +      - description: mailbox int registers

Does "int registers" mean "interrupt registers", i.e. do they control
some aspect of interrupt delivery?

IMHO, it would be good to spell it out, because "int" could mean
different things.


Best regards, happy new year,
Jonathan Neusch=C3=A4fer

--lgUL0vHJFSWo4OLl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/wWSkACgkQCDBEmo7z
X9vpmBAAsOyUkxx7htYS6UY5pJuUoi6k4x+CExOrVXMXCCJDw3JtcxwuuYtmcUrU
mwXKQzbsHxnisFTfXl1adbTXppH3FVKjVL7mV0YcvMhDAc+aHexft/8KK8I0gckk
NU+Z85oAijNXqJjbBf7mG0ZCMFdtkcIT5QIeuABcRBSIfLtPBmzfSiQ4opf33kbM
nzP1z5DLnwiWWRd0SA12mWI0O2dHFD8CQrawtPeD+N3e+Y1YuSfzxxrKnHQW/T4k
ARTtoaRzO1+lfe4rKvbLFwZ1zZQsOZgDjiIJxByiYsrazCTeYoilAvmB4Th7o2B8
jpEyBPhBaEtKds5ytSRkACFtkcdnNtjWGFe78k+FEtS5CmWB/wU2uesVmt5ir3uO
Dnji9UDFDh2gxyaO4Dln9cCyEyC5Wah0/5Cga9YgcTjILnJZEuPCo2ehArmayHbB
cZ5M8v8wvy8uY+GhT4ZTm8piIpNVsDMzSq4REQQ5DYsoVnjP+vrkEBljI/v/uES1
s4mgvaGqluAhUBTtGrbl/7W0xwx3qnbxLBzMSifc+We0Wp8x9FSpAkYyHDdApU7c
knYIOSGTTScSVkYLrZlcsVqlszg7StYBu4Zz/xqftBMM97/MhBGez9CbKm8qCN2B
Gobc/xRqZozXMkP7mow4D41I+0YpgTTKDVSDFTqkKaqIFONIcCU=
=dd3M
-----END PGP SIGNATURE-----

--lgUL0vHJFSWo4OLl--


--===============1711374842660177835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1711374842660177835==--

