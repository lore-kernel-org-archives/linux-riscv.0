Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0FAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 18:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27C7820811
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 18:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YUJHUl6z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27C7820811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AWCLSrDbjf1hA8sx0HKVjMeasMrE64MrWYhoMWCj0J8=; b=YUJHUl6zQq9jL9PQdLDPPY61y
	nq8Lw6n2J71Fw+v6ZD/ZlyP/3WQt0GHTvK61zq92oHHsXkM1GhBqM9VzfrIaTjHHNY0Jwyzt+ZC4t
	of2G29sUB96OuEIzlY6+uWhjiBLZIxN6S+OKIEt8aJvXhDTGYGM9sbMpN1zPfFS4DIzv58GJ7ifLE
	K2pI4QPh/F4KPg61Geu+o+0sfabudJdmmCV1mW6RgwxFPnTUGbb5SEgul5vHi1vtHD+kaXxyy36XA
	H1L2cm9KsB69MBRezQtLflwxqNoHtjf8qjaLXHfA2xG/MyEoZDZXCX2nis4OXsvlpgg7aas+q6S1T
	i4BTGux4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9vyE-0002gE-Gy; Fri, 29 Mar 2019 18:11:14 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9vyA-0002fZ-Ms
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 18:11:12 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id D572B72CC64;
 Fri, 29 Mar 2019 21:11:09 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id C7C0C7CC74C; Fri, 29 Mar 2019 21:11:09 +0300 (MSK)
Date: Fri, 29 Mar 2019 21:11:09 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] riscv: fix syscall_get_arguments() and
 syscall_set_arguments()
Message-ID: <20190329181109.GA32651@altlinux.org>
References: <20190329171221.GA32456@altlinux.org>
 <20190329131514.3e4ec93e@gandalf.local.home>
 <CAEn-LTpY6Tto1N9irXJeOb4iB=qSYhb=jM0E=Z9ppumbPX6GSw@mail.gmail.com>
 <20190329135635.7e136350@gandalf.local.home>
MIME-Version: 1.0
In-Reply-To: <20190329135635.7e136350@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_111111_099276_90A034E6 
X-CRM114-Status: UNSURE (   9.04  )
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
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1136858843380725636=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1136858843380725636==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 01:56:35PM -0400, Steven Rostedt wrote:
> On Fri, 29 Mar 2019 18:52:18 +0100
> David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
>=20
> > I have alternative version posted in December part of SECCOMP
> > patchset which is based on arm64 implementation.
> >=20
> > http://lists.infradead.org/pipermail/linux-riscv/2018-December/002450.h=
tml
> >=20
> > I noticed that SECCOMP wasn't working properly if filters were
> > checking syscall arguments, because populated arguments were wrong.
> >=20
> > Btw, I plan to send v2 of SECCOMP patchset soonish.
>=20
> Please do. I want to get my patch series out, which will require these
> changes.

Sorry, I haven't seen the alternative patch posted by David before.
Apparently, besides fixing the bug it also introduces new sanity checks
of "i" and "n" arguments in syscall_get_arguments() and
syscall_set_arguments().

Given that your patchset removes these arguments completely,
I see little sense in adding new checks that are going to be removed
by the subsequent commit in the series.


--=20
ldv

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJcnl+9AAoJEAVFT+BVnCUIg2IP/0CQe7zqBd/Ucsy5T9H2Qg+z
cEUGm375hGIVystw8XU6VkZzKKDH5vNv35puJWVPuGyb9LgBVBdpDJo5Y+2icT/t
IONzwecTV4CGQQxT1sdaQdt/zSqDLOczOyby1jOEyqoZy0EGMlrDiDVK251OmQHT
uoqY0HAnaNoNAYGP6ZsO+QNg4bZWonH1AFUxj2Q2Y6h+m28ObyLlRpyuTYRYm696
NBMMWs/oHwb51AA3bR5IfXBZ0hqErWmrk4VJ2LeW2c5xo9thKH4mmLligglACkYa
JKBE4nMmizUFTSu/rKMqisPqEesY3yqgRyj/dRgSQ0/ElDBfhqBxknJUOcLdV7FG
VdiGBln6HrxHsvVvLGJpCa+oH1ju0rW00zvBn726oQt3FVD/7djUwHkKb7DcmEc0
ux+dPVnyNnLM1gxjeRFhbcgQfXWMG5GA3HRDUJpzqFmHP4lbzqxPjdVou4XzFIz0
MngCuVsGEhWsBrTzb4/ZS6BZjn40YvrgsyUI767MwtKG8WylaRpWkarpoOgEc36/
2LuG6IEkVNVY9Cv7r8xC59DUqOu2TeDHMKrpjnf6Z+5aKThQyB8GdmugVu/Dj1Ph
7FAbjAC3wRECwnkjcJnbRfvLdZ3/haO00tIccDVGmzJl2aiQm3wllFW9y6qVo/E1
j+36iOMurjxeiB/dzEJ+
=0Lij
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--


--===============1136858843380725636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1136858843380725636==--

