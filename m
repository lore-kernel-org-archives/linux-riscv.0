Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8303C982DF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 03:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gY3Xv7/fNp/DLmag8Hf4P56MXIXD9haIhOP7sHElm24=; b=HoR12YdhK5S13otjidrc+0xkSq
	z6wVv//Ln3Mqd2kPgifKxPNeNxnMQXslfSLkFOd3ns0QHr3LmAaFX23KphI5WG92FSJcBJNwl+44L
	90uQaBlvOSyvt1mDFVc+OkenGkQWRepIL/PsmLgKvFU1g3a9PdYNfq2fI+vy/YMPjusUs0LvoP2Y1
	qO8/CuqrcAlpUIvahuqvF444w4WCVVWPnNMBNWtpaQPHSTmu4GLJhiVYGJGxtuNR96f0OrfcIWpZP
	o9t3lMgogH+HOMsIs8L0ewmSBIqXqlskVaKTidNgQsLlaOUAGGaxyMKh3eTeb5yZRikuzb4NWuK0J
	G1T0zhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rUl-00000004741-3x68;
	Tue, 22 Sep 2026 03:48:39 +0000
Received: from out-4.mta1.migadu.com ([2001:41d0:203:375::4] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rUj-0000000471p-0UaT
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 03:48:38 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qjEB8CG00z+rb0Eckb5vU5Q0rLTkaQK7eKWMgJ/oCZw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790048913; v=1; x=1790653713;
 b=AD9VWmAxPqsHQ54P8fTv4eKNEMRGWVX2eQaBHHHjLUnD1Wg0ApHbro167CffYmZDnw2w8W44
 sWmwKdMzVrCb2RybFUgr4Oridk9Nweo446he1sf03FAfUTECk+56fPwXyfEO1onc9dHlTStCowm
 /Lv3E0jnyS2nxLmx0F0El5zg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id d63a82b7a813fa63;
	Tue, 22 Sep 2026 03:48:33 +0000
X-Mizu-Trace-ID: d63a82b7a813fa63
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Tue, 22 Sep 2026 11:48:23 +0800
Message-Id: <DLLJDLKPZ4S3.1KQ5O4OQBBTEW@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: <shao.mingyin@zte.com.cn>, <pjw@kernel.org>, <mikey@neuling.org>
Cc: <jiangfeng@kylinos.cn>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <zhang.yue5@zte.com.cn>,
 <david.laight.linux@gmail.com>, <qingfang.deng@linux.dev>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, "Troy Mitchell"
 <troy.mitchell@linux.dev>
Subject: =?utf-8?q?Re:_[PATCH_v4]_riscv:_lib:_Fix_ZBB_strnlen_wrap-around_regressi?= =?utf-8?q?on_on=C2=A0huge_counts?=
X-Mailer: aerc 0.21.0-reader-ipc2
References: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_204837_308134_0F4B6378 
X-CRM114-Status: GOOD (  12.28  )
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
Content-Type: multipart/mixed; boundary="===============3670281705813633716=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3670281705813633716==
Content-Type: multipart/signed;
 boundary=315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 3:26 PM +08, shao.mingyin wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> The aligned scan boundary is derived from the last valid byte,
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the boundary lands before s, so the
> ZBB path returns a bogus length.  The original implementation
> (5ba15d419fab) had the same wrap-around in its (s + count) & ~7
> boundary computation; after 5d588c684833 the wrapped boundary is caught
> by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
> aligned strings of 8 or more characters and strnlen() returns 8
> instead of the real length.
>
> This silently truncates strings built by fortified strcat: the dm
> sysfs name attribute shows "live-bas" instead of "live-base", the
> truncated name pollutes the udev database, and blivet/anaconda (as
> well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.
>
> Detect the wrap-around and saturate the boundary to the top of the
> address space, making the scan equivalent to strlen().  The saturation
> clamps the increment to ~s, so it stays branchless and wrap-free:
>
> 	s + min(count - 1, ~s) =3D=3D saturating_add(s, count - 1)
>
> Normal counts are unaffected.
>
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Cc: stable@vger.kernel.org
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Acked-by: Michael Neuling <mikey@neuling.org>
Tested-by: Troy Mitchell <troy.mitchell@linux.dev>

--=20
Troy Mitchell


--315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarH6hyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+YjAD9FDuL8GGk9nGD
AuMDfrGSpqKOkmUteU1PhJ5/ANGz25UBAJd6WAztjmhW7qsMzTjAUuVxMBaERCOS
egaKs+itVEcH
=+47f
-----END PGP SIGNATURE-----

--315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad--


--===============3670281705813633716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3670281705813633716==--

