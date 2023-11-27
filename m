Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E1DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPMznYTS8KcOMsvsx46N2kftM7ibu89ts9B9TQN+n+4=; b=eI/bG455CCd6Jim01LBZgTJshN
	YVqGczPkxDwrLDPIGFkY1d8CLeOJLKXM86LG+3hhxvT4D3u/94Rcij5ZTj9ls/2xFbLdgtgL9vdo5
	IcQOqnAarVl78MmTB8EXS9BKJj4Cu8KgGURTSJ5O4f4ASSneVvqazWYxlhWPOfjZsenqIea+tp/oB
	LE/rfuZvqzMaYFt6H0dtAvljnKqoSfb71Karnyrw9uNg/IUFy2nDD6xTod8VZf/8BYdA6obHuuacE
	QN9c0aublCy5gPS9SDNi6M2KfG3hdFeu2RUbFPlb1sJPD3fDWTP7oLiUNVI+8nh3cBC5O616sW7Nb
	ejbB9ocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yzz-00278y-2M;
	Mon, 27 Nov 2023 10:37:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yzw-00277X-1x
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701081472; x=1732617472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/K/TBwFkECz7aLxzE8hjx15xz33xVUqkjmbFTjpyh0=;
  b=XPUdoQYshPQiLz398+BPGS+WNLx56XiljN7RAoGHPQOhLZw4CmRAsgTL
   fPtztK6KQzRYQx4aUbQe5ZX8JEHgZ27cS7aUhO8ryou1cfefjrkxgzSnZ
   PJQ7YJpuI5h0QPPTwVYaV4IBOl2emLe+aPUYDo5v3/1e0OFra4l+oVToe
   uIaoC8R4L6q8bg+h+rx4erln7Lf8VZxkQ1Ae9ADDs0iyIZO/bpczsQQpr
   HTkcrK9jrieDhmD8lTL9JTyZkq6Miji3nxKess3R3QHIcME87a7D1j+/e
   QmIpeBUCkD4k62iuIjSb7iHm4FKjXiPk7QbAQwYEVmsYECSacesM9oDsi
   g==;
X-CSE-ConnectionGUID: xOAyVbUwTMO+uJD9UgwqaQ==
X-CSE-MsgGUID: 18YxV9ktRHWC/RgNDyCApQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="asc'?scan'208";a="12327336"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2023 03:37:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Nov 2023 03:37:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Nov 2023 03:37:13 -0700
Date: Mon, 27 Nov 2023 10:36:44 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Christoph Muellner <christoph.muellner@vrull.eu>
CC: <linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel
	<apatel@ventanamicro.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew
 Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Alan Stern <stern@rowland.harvard.edu>, Andrea Parri
	<parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, Daniel Lustig
	<dlustig@nvidia.com>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Message-ID: <20231127-process-dinginess-cea6dd652b99@wendy>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
In-Reply-To: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_023752_748834_AE26A48A 
X-CRM114-Status: GOOD (  22.80  )
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
Content-Type: multipart/mixed; boundary="===============2095132450861577717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2095132450861577717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kbT7YkFzL4BHVstF"
Content-Disposition: inline

--kbT7YkFzL4BHVstF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 24, 2023 at 08:21:37AM +0100, Christoph Muellner wrote:
> From: Christoph M=FCllner <christoph.muellner@vrull.eu>
>=20
> The upcoming RISC-V Ssdtso specification introduces a bit in the senvcfg
> CSR to switch the memory consistency model at run-time from RVWMO to TSO
> (and back). The active consistency model can therefore be switched on a
> per-hart base and managed by the kernel on a per-process/thread base.
>=20
> This patch implements basic Ssdtso support and adds a prctl API on top
> so that user-space processes can switch to a stronger memory consistency
> model (than the kernel was written for) at run-time.
>=20
> I am not sure if other architectures support switching the memory
> consistency model at run-time, but designing the prctl API in an
> arch-independent way allows reusing it in the future.
>=20
> The patchset also comes with a short documentation of the prctl API.
>=20
> This series is based on the second draft of the Ssdtso specification
> which was published recently on an RVI list:
>   https://lists.riscv.org/g/tech-arch-review/message/183
> Note, that the Ssdtso specification is in development state
> (i.e., not frozen or even ratified) which is also the reason
> why I marked the series as RFC.
>=20
> One aspect that is not covered in this patchset is virtualization.
> It is planned to add virtualization support in a later version.
> Hints/suggestions on how to implement this part are very much
> appreciated.
>=20
> Christoph M=FCllner (5):

I know this is an RFC, but it could probably do with a bit more compile
testing, as:

>   RISC-V: Add basic Ssdtso support

This patch doesn't build for rv64 allmodconfig

>   RISC-V: Expose Ssdtso via hwprobe API

This one seems to build fine

>   uapi: prctl: Add new prctl call to set/get the memory consistency
>     model
>   RISC-V: Implement prctl call to set/get the memory consistency model
>   RISC-V: selftests: Add DTSO tests

These don't build for:
rv32 defconfig
rv64 allmodconfig
rv64 nommu

Cheers,
Conor.

--kbT7YkFzL4BHVstF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWRxPAAKCRB4tDGHoIJi
0lTTAP9C2gVptHYxg1wEQyIceVB2NvjKokFBaZX4p4k/YXZz7gD+MoMtrN7h6uWY
3jfYLulJnUx7qvF2seA9F7dMnismKQw=
=roRE
-----END PGP SIGNATURE-----

--kbT7YkFzL4BHVstF--


--===============2095132450861577717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2095132450861577717==--

