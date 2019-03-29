Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62649C10F05
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 18:16:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F962184C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 18:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OV1pycjx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F962184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Q+Dng8e3au06z9mvgGDoEfhVwbSOWz6GAM3YciZyAA=; b=OV1pycjxYTaWajJOVLhUpfiUd
	R8OZ8x3mXgmHB8m+ROE55ynKUj8I6mQeYcOgVs1h1SFHW3uNo/ESqj0Xon3nqmhB2Zfhgd6POrLUY
	KTrwaa6CB9Uy7zg9UeUB7Pwd6M1tm6+A/5HFk/qrfdxgJF1cAsbbnFOguhyZ18fmolajaceD3DcpV
	lE8wCsUuvVZu5/P5qYOWQ7qj/u5cxg+YFxauhHdn8BgiQSvcySu7wCO/7H/e+Qm4A4lUUO/q47NVF
	SYLsdtWbnMs3+qKYJB0Hv6QNtt/FlLIKG+7Uye2+dS1YUGYaNZBBslXtM8oGrEXi/xHmYGc1QYMMD
	4JyyG3CdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9w3E-0004DN-E6; Fri, 29 Mar 2019 18:16:24 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9w3B-0004D3-WF
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 18:16:23 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 0F77D72CCAD;
 Fri, 29 Mar 2019 21:16:20 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id F1DAB7CC74C; Fri, 29 Mar 2019 21:16:19 +0300 (MSK)
Date: Fri, 29 Mar 2019 21:16:19 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] riscv: fix syscall_get_arguments() and
 syscall_set_arguments()
Message-ID: <20190329181619.GB32651@altlinux.org>
References: <20190329171221.GA32456@altlinux.org>
 <20190329131514.3e4ec93e@gandalf.local.home>
MIME-Version: 1.0
In-Reply-To: <20190329131514.3e4ec93e@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_111622_227088_7FA847A6 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7445915611506121316=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7445915611506121316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 01:15:14PM -0400, Steven Rostedt wrote:
> On Fri, 29 Mar 2019 20:12:21 +0300
> "Dmitry V. Levin" <ldv@altlinux.org> wrote:
>=20
> > RISC-V syscall arguments are located in orig_a0,a1..a5 fields
> > of struct pt_regs.
> >=20
> > Due to an off-by-one bug and a bug in pointer arithmetic
> > syscall_get_arguments() was reading s3..s7 fields instead of a1..a5.
> > Likewise, syscall_set_arguments() was writing s3..s7 fields
> > instead of a1..a5.
>=20
> Should I add this to my series? And then rebase on top of it?

This is fine with me.  If you are adding the fix for riscv,
please consider adding the fix for csky, too.


--=20
ldv

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJcnmDzAAoJEAVFT+BVnCUIEwoQAJFU9YuwW0jEozEhXNul4GNR
E1aMCIPrK/9OKouxQNBkQSRgE5bnbmvvSW5UBDKmJ+kzHXSTvZ2iOV5aPkng7Svk
eVjeBnu8pdX3uNFpZ5WHDVfs+qr7oDuBZpdmK3h1RfxA9PBtwpg/SBOBXlGwCS+J
vYn19hxasA5hJ3bXlBP0ssiQT0hTsqmTkIfD0QWtaPJq3lRXYYHt29CoEgXE6/qv
Ju5XS/2pSH6Lt7JJQvT9BmcE7VIJI/T91mRS7CD8UfS2wyaNDV1r3/PMx2KF+nmN
z/4MTFYXbVHKuxn8ljg6qUWhV4lEaKXInBuIKZN/LHmiuRxgTST6EoBYZrtYjr+O
D6KyotRxjJR703YYrZmZq90Ms/nzshgU5OAeg6mdurmC6wYaf7Sm7WdcZv97HMJ1
FHxpy3zhtIuhif6riqolNqusOXFkhtADURXkSfNoJhiig4EWRxrcOml7+dzQN9Z1
QoVkx79yVTFeV8VbnxhYGR0OkSgmp/DOwa0jBJDCecTBs5lmkGe0WPNd5mYhQ/jw
0SevXWtSTbY9BEiTangFnkx1YuwyFybAHTzvgbVBoagWTbypZU3P57s+Sne5xNN/
MZ6EVNraPEbtimzLrXjvqKXgSHCgkmhzP0u3Z4ll1JRz6qA0jL5k43wwB6842+Ss
XhK4Wa03+nTDpzzB4P1j
=wm1N
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--


--===============7445915611506121316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7445915611506121316==--

