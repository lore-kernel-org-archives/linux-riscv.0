Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C752C433E3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 12:40:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF00A2070A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 12:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JccGnVfB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF00A2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sk2.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ldJNXI80S2jA3GNHVRF5JRLdU6Y/LWWdbyBFw9mQ9dQ=; b=JccGnVfB80blH8TL+74T7ClnN
	+I4YlzVNGQpka6H3SamOSQFVqvSJjgu70ZuJPi4VRYg/k+6mgsdyQ2Q0qa3UI1/CXKn3S8+eIcCo9
	isSi3QG+fwOzmFWMy5CCjXqSAfjce/3/nHYAOc8fIHPfLN9qXzWcFzml9ixpqxcEsXBhyC0O3nIGF
	yBCgZUAaOirzNf47j7arj4RFFRga3EYs5bzjb21r69ku+5G0CNJPB9EMEarBWxfrX8dx0AUsGlaMP
	BZ6OuExwWtMT43A7mgJhpCSsnpuByeKZzxrTeyStj91qEA8L6DsL3qRDJ2L8R9BUS2SWYoKdRGj3S
	aYr+Su8gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxV5S-0002Au-2W; Mon, 20 Jul 2020 12:40:06 +0000
Received: from 13.mo5.mail-out.ovh.net ([87.98.182.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxV5P-00029h-TP
 for linux-riscv@lists.infradead.org; Mon, 20 Jul 2020 12:40:04 +0000
Received: from player796.ha.ovh.net (unknown [10.110.115.164])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 77F1C28A9E0
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 14:39:59 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 6D8E41471EEFB;
 Mon, 20 Jul 2020 12:39:39 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006a3aeb924-0296-417f-a3b8-f6f0c1881744,0F02D7EA884A4F67B656D4016842B815EED48EBE)
 smtp.auth=steve@sk2.org
Date: Mon, 20 Jul 2020 14:39:37 +0200
From: Stephen Kitt <steve@sk2.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [PATCH] docs: process/index.rst: Fix reference to nonexistent
 document
Message-ID: <20200720143937.00b47310@heffalump.sk2.org>
In-Reply-To: <20200718165107.625847-5-dwlsalmeida@gmail.com>
References: <20200718165107.625847-1-dwlsalmeida@gmail.com>
 <20200718165107.625847-5-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10420766588460813694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrgeeggddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepjeekffdvhfejkeffudekhedvtddvhfeiheehvdehkeetkedufeejffeuueevvddvnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_084004_085073_73AFCC8A 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: aou@eecs.berkeley.edu, keescook@chromium.org, corbet@lwn.net,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tyhicks@canonical.com,
 clang-built-linux@googlegroups.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, jkosina@suse.cz, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8425128331008079976=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8425128331008079976==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/G1ltjrPvjS1uwgqPa15+ffG"; protocol="application/pgp-signature"

--Sig_/G1ltjrPvjS1uwgqPa15+ffG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Jul 2020 13:50:59 -0300, "Daniel W. S. Almeida"
<dwlsalmeida@gmail.com> wrote:

> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
>=20
> Fix the following warning:
>=20
> WARNING: toctree contains reference to nonexistent document
> 'process/unaligned-memory-access'
>=20
> The path to the document was wrong.
>=20
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Fixes: c9b54d6f362c ("docs: move other kAPI documents to core-api")
Reviewed-by: Stephen Kitt <steve@sk2.org>

--Sig_/G1ltjrPvjS1uwgqPa15+ffG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl8VkIkACgkQgNMC9Yht
g5zYyQ/+PriM4pJoTPsHS3SErNTVbeZisEts37yOOuhYiDxzm4YKbmwB7gUcMgWr
H+0eOanfto2X6wh/vSnnkwfZD/ifJLP/eDYryF1BgUL+xi18IDoFobNgq8db4OiT
5VXohSNk6O5Sc4dZcb96RKJ5J2lDjrqJO9Psqa6C30ZYLVcGxh6Mu6D2zriOMWST
Lk7Kp2PJoFljnkU46ZZjODF6EjrBouYmTyX4UkYYIl7OfaQ7VF4JGcBLMiTtYdK3
NbmPvMJry5V7SHSX/RdxnrPq1XeD8mjHK8sdMn+IPpYoz0CHxkKj5OguGUK3MXnT
0/9iJIsYb7SG4Y996Ym3hDrowxEnoexuYk06wSOOomnF6YtM/Rhzx5SRoqG1lssj
25/hxzUdw+3nb4ROyAuAgkYCGy5qXo6JF8lL321tO0/wi0Dk+OHzW1KbtEyFkFkx
xUPCfEmKiHJq71hCWcenE/I04m8oRSTAqoxM7JyS+XIGA8LbxhY9glPqOdaX71dV
GMWKUKF1t9j0UOVwN9JfpTGxRkgBhOI909Zp1guBPAADlCmZYaVLYDFUesYCpCWC
i7KyWshGumH4HrJh+csNiqD/0mvLRdcr7rBmIudm+CdkobzUTIvruo28Vhc+OeP+
4JI1mgedlRAm0HqDj71Kw8nJu2F8iPhbXJy7Ulu/uwIipOQLRP0=
=vV5J
-----END PGP SIGNATURE-----

--Sig_/G1ltjrPvjS1uwgqPa15+ffG--


--===============8425128331008079976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8425128331008079976==--

