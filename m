Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E66C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 06:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRWhTCWz85lp1JFQf2yz72kylVQvorK9NPhhBv14Qpg=; b=uG8M5VbD/roPVk7AeFG75vG87q
	vCVCEWd8zSanAhBNgOBU5OkXxpMsAabjItNR//fFIrKIc8gmXFtZFYOwNrNwZvgPXiS8Vl6TJitwB
	R9LLsh5oBVfsbUd+VsojsFm0OWAM8K6pgHyi1t+00C6HwJca+/KBIkKWx765u7Lo5edhhm4Ge3da0
	JtaOHIKAki8LJevogBGEJR3c/97MPhl59mFBQJHRa44bvNQsl3hWi489JUnq0UrM2ay3mg2ILU5fw
	WpjigaFbTd7m28Zwl5VJmTND7+003aQHmK0vzUNJ1qLr9cVyOhfhEMlLbmdKdJu47y2mtrMV7+XLA
	USxoD0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toyz0-0000000HIoj-1G97;
	Mon, 03 Mar 2025 06:08:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyyv-0000000HIoM-3vjL
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 06:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f5nJ
	8GqBX+Y0PrnG8QSegNiuA3L+EfgTgBBMgy7TZVk=; b=T4UCCK7DQt9aqX9c+GfN
	fUNHTol0fucwK8j0eQFSey4k03s5iQgBENYRYIO8K+nzjxBRlcbEEBQ4pvsQGMtU
	4DIwHPYI/1eMixVAmXa1yJ9/4W9QhOv/Xz8xvGEkoMvsjdw/O+gkqd3bi9BSTR4K
	pZeHX+y0wRtWFOGgGgXsuCPyXyL1Tvxa2drkBkg4Yz3C9bxO3TY4/ACXI4BA+Szm
	171V6q4y6f7LfbBxizqzC6nxrAyNkvTJkXdfVndrXXhwmQ0ri8Lt8GGVvksRKkx5
	ly7DyrXNb1Jj6mdAN4g+CtMTBpTr84VewA6Xemrduc1Z246LmuqGd+8F1ch6gq7B
	yw==
Received: (qmail 2094502 invoked from network); 3 Mar 2025 07:08:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2025 07:08:41 +0100
X-UD-Smtp-Session: l3s3148p1@DB3o/Gkvoq0gAQnoAF7DALd8qOkixhgf
Date: Mon, 3 Mar 2025 07:08:41 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
Message-ID: <Z8VHaQsqAmhtQnbv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_220850_828483_9EB2A007 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============1394055462923487325=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1394055462923487325==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tWU+hAMp67fkq/U3"
Content-Disposition: inline


--tWU+hAMp67fkq/U3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +/* spacemit i2c registers */
> +#define SPACEMIT_ICR		 0x0		/* Control Register */
> +#define SPACEMIT_ISR		 0x4		/* Status Register */
> +#define SPACEMIT_IDBR		 0xc		/* Data Buffer Register */
> +#define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> +
> +/* register SPACEMIT_ICR fields */
> +#define SPACEMIT_CR_START        BIT(0)		/* start bit */
> +#define SPACEMIT_CR_STOP         BIT(1)		/* stop bit */
> +#define SPACEMIT_CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
> +#define SPACEMIT_CR_TB           BIT(3)		/* transfer byte bit */

This looks like a lot like a variant of the i2c-pxa register set. Has it
been considered to reuse that driver?


--tWU+hAMp67fkq/U3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfFR2QACgkQFA3kzBSg
KbadHQ//T3DW9roZhtPTeDwT9s9mkDm+L0NzczjCou49UCord1bP05lglXi4wjPM
HILnG/VCQvIEvThXiNTA5qmWhMUQGbl+D5BZgbiRMFSD3y3S3E1ca/VbUMOhqR7F
aj4kxIeopHvLJX4YBMRxLduRpz/HLpLpoOEhOLaF2sXo7e2MoMvxDrQ/6y4abvUj
W/UqFaIIEz7Of7JG9D5YfPplLD0RVuiFJ6h0/gglu0MicaFvQ73GAVLec7TNche8
9lpn9CbufaQJ2aUdFDPJiOzPfy8I0zBBGDVaI+yJYLvdm3v9GaNnqM/GC1M4SSHx
BlaYzBN3XRKjU/6M9SziVPb4CO1Aoy4VScvTVLXlkoNUfB0j9Zb46iB6sS7ex+AW
TH7XIT9WF8ef45NfSmb6jB7WHYnSlZ+iFc71uIK3zyJphVABhD60ykB3NU5QDCVT
QRVBGSkpLJSnl3GG7HYIl35Phl5ns1ROnJNKd9Z0iccFQ/JJg+GFCiAQPqnrBoX/
rGcrLfMgf4NVHOLfttL8E/kNk7YcDvbk/6soBJF5VYT+bgRNpsPBBWusWYx2Aefv
nj/n+kngXPQ4PnyuY3kj1nKI6/J9pRdq3E8+OwT5vXSqFDaM3si33IximlTsfkmt
23AI8N+S6KUFzcQXOg5CfYMmyHDIXdcfm410qTP+4odobQO2Oco=
=1qER
-----END PGP SIGNATURE-----

--tWU+hAMp67fkq/U3--


--===============1394055462923487325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1394055462923487325==--

