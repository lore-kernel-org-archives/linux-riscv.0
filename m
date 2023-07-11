Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F271C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 11:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayoWHrNmf6ZIm7Q5cHJXiWjVspvU+jClzTPIrJUNa5A=; b=vAy5XhXa7Yo+M7leI2Xi34sZ5Y
	5Dv4/yBDUluz7RiCwGu/Sy1eB0E3uVWC/W5wEUq3PGpv3fDEZGnlEi3yFeOCCkcxfky0oF4yBuuMW
	ebUJ1TVbrupf18T/2Eb1XKT3ZTaFSOdIpzNcILtOhQkPeU6NbEFQb5MMIh5AfDoaOGYGQlm3txpMu
	olcMoD8qD4+4d2WeM4Me1f4afvdic5/d18L/5GuKtSAm3pjwmu4xLyYggBrg2CpMHPk+D62OUORir
	yuaHpZrqNPtWkZLVxgcHaT2fSnS1t6blDE4VXTqKY+FMl5Oh9tK5QhkcRmibuH77vei6ewzsf2UZu
	6S44Icrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBi4-00EmVj-17;
	Tue, 11 Jul 2023 11:39:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBi1-00EmUw-2S
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 11:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689075549; x=1720611549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZVVsS6wun/m2iHEQBE7o95Tjhy9U3B1DpVXbtTxW4os=;
  b=hXO25d0N4X4LKMKOKA4gxFgYG9NugRV7XZoNN+4udUTaIWvuGi5wxzgD
   FwEMiDIPTeHF29GB6WkBePlYn4Ynp+sFh3n69O+46TlKGFLUtSVUXiWiP
   uQhNUB6JAWPOcK96uOcxYscPj7vM3wwUkgtqZRsAmYDTMwYWPz5cOTwKA
   BbTg+3a5gQ4rYpPIze/en16Jz5+WhPZ19SXs3Bd9q1jxvQwvUJsZyLBx1
   CtvQ7UnaOAn8/LaUemXDCJ89aXRd7jrAgZ32NwIfpBENfUShHbVpkpv4M
   Kkn0NtuuRWsKx7KDIL8D8MPHX46PeUcvurQDE7YhYpUVE/mMjAoiJR5Gg
   g==;
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="asc'?scan'208";a="234816665"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jul 2023 04:39:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Jul 2023 04:39:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Jul 2023 04:39:06 -0700
Date: Tue, 11 Jul 2023 12:38:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 0/2] Misc RISC-V timer driver improvements
Message-ID: <20230711-dab-imaging-2124096a7b3b@wendy>
References: <20230710131902.1459180-1-apatel@ventanamicro.com>
 <20230711-remission-from-581829b1ff05@wendy>
 <CAK9=C2XG9fsvUxnL98gKstxdpdOOAV3UZ3DAV66=S4DJcutzKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2XG9fsvUxnL98gKstxdpdOOAV3UZ3DAV66=S4DJcutzKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_043909_809196_7DEB0E6D 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============4789384078156629227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4789384078156629227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="th+QX7GWLadOiiRn"
Content-Disposition: inline

--th+QX7GWLadOiiRn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 05:07:11PM +0530, Anup Patel wrote:
> On Tue, Jul 11, 2023 at 4:51=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:

> > Other than wondering why you opted for 450 (curiosity really), this
> > stuff looks fine to me.
>=20
> It is the same as the rating for clock_event_device used by ARM arch time=
r.

That's what I figured, thanks!

--th+QX7GWLadOiiRn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK0/OgAKCRB4tDGHoIJi
0sryAQDPy8c7d4yVTO4UXMI9onT2ENWGMKOpCA0/OBGnIgyYugEAuOIkqZ7wTz/b
IsE+VFynbx5ptjZaWV6ND4UaTlJn3go=
=ByLl
-----END PGP SIGNATURE-----

--th+QX7GWLadOiiRn--


--===============4789384078156629227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4789384078156629227==--

