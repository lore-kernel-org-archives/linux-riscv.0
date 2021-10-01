Return-Path: <SRS0=1++v=OV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A75C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Oct 2021 11:24:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 096EB6134F
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Oct 2021 11:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 096EB6134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ1NbHXJHBIMVJiV1qCGE8AzbrI2D5eqL5cNDIDEVAw=; b=0kvwnDnAKKmZndIuL+PO4/53tM
	pU/7CKoxFWePcRcKvzD5BxUiMSGxvwMIQAE2tR4YbkSKz669Jk9B+8ijnsHtwiCsPrRjeMESfLDqX
	7AD7a8P3rnSSB8VQBYgZ5a/C/MRq4JVHxf0raP6Nk7nCMLuldJQI+9EZWXVQy/q67h88p8nMe7Os5
	l0RfQgOoNj/5SQXu9kqdB5tRa+fBeA8H7TR9IyGa5TxqKK9pEVZyo3zxng5UKAyNbjQFPbT5HOL/b
	A4xQDLqlvNaq8r68KlNTDwlj0UyZo/TPFGE6KSYPJ5zGEKM5sgMR8fDL5E5t3/7xJzSJY7knkk9/7
	BXRZG/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWGe1-00Ha9G-6O; Fri, 01 Oct 2021 11:24:01 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWGdy-00Ha8d-2i
 for linux-riscv@lists.infradead.org; Fri, 01 Oct 2021 11:24:00 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4B4681C0B80; Fri,  1 Oct 2021 13:23:54 +0200 (CEST)
Date: Fri, 1 Oct 2021 13:23:54 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v5 1/3] riscv: optimized memcpy
Message-ID: <20211001112354.GA10720@duo.ucw.cz>
References: <20210929172234.31620-1-mcroce@linux.microsoft.com>
 <20210929172234.31620-2-mcroce@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20210929172234.31620-2-mcroce@linux.microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_042358_298458_1C41694D 
X-CRM114-Status: GOOD (  15.16  )
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
Content-Type: multipart/mixed; boundary="===============7301486488869068071=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7301486488869068071==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Matteo Croce <mcroce@microsoft.com>
>=20
> Write a C version of memcpy() which uses the biggest data size allowed,
> without generating unaligned accesses.
>=20
> The procedure is made of three steps:
> First copy data one byte at time until the destination buffer is aligned
> to a long boundary.
> Then copy the data one long at time shifting the current and the next u8
> to compose a long at every cycle.
> Finally, copy the remainder one byte at time.
>=20
> On a BeagleV, the TCP RX throughput increased by 45%:
>=20
> before:
>=20
> $ iperf3 -c beaglev
> Connecting to host beaglev, port 5201
> [  5] local 192.168.85.6 port 44840 connected to 192.168.85.48 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec  76.4 MBytes   641 Mbits/sec   27    624 KBytes
> [  5]   1.00-2.00   sec  72.5 MBytes   608 Mbits/sec    0    708 KBytes
>=20
> after:
>=20
> $ iperf3 -c beaglev
> Connecting to host beaglev, port 5201
> [  5] local 192.168.85.6 port 44864 connected to 192.168.85.48 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   109 MBytes   912 Mbits/sec   48    559 KBytes
> [  5]   1.00-2.00   sec   108 MBytes   902 Mbits/sec    0    690
> KBytes

That's really quite cool. Could you see if it is your "optimized
unaligned" copy doing the difference?>

+/* convenience union to avoid cast between different pointer types */
> +union types {
> +	u8 *as_u8;
> +	unsigned long *as_ulong;
> +	uintptr_t as_uptr;
> +};
> +
> +union const_types {
> +	const u8 *as_u8;
> +	unsigned long *as_ulong;
> +	uintptr_t as_uptr;
> +};

Missing consts here?

Plus... this is really "interesting" coding style. I'd just use casts
in kernel.

Regards,						Pavel

--=20
http://www.livejournal.com/~pavelmachek

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYVbvygAKCRAw5/Bqldv6
8vL4AKCm6Y1l3PaTBC4mmrpz0UrY1DvWGQCfYF5/9wrjjsk9fb68mC20qc3UVpc=
=NRFP
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--


--===============7301486488869068071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7301486488869068071==--

