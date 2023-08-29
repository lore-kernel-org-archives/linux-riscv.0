Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C8C71153
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 06:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vVobFySrKlTE7QjxjE+4mZ1BnwWlm4YZ6FgcVOB7W8=; b=QoF4ttS0Uup+2FA3wlHVTFuX6H
	gGG5Rr9OVax8xTcXfCZTpFtZUvGbZ+/+F628OVwy7Z+DqFmQ5lHKdnTFyd3Hw6IbkgVmrr24qhMlL
	ehbmVYcaetOXjSLzWNMgm0yKaPSW3ogyaZzn7Ok5kac5JnhpUmaUgJiYWv7ibK1ijnO5MzutPTOxy
	LPPvSmuc5XwIbFKgKOobO14khJFyyik8ir0VQuRbLDb49g3I55OxnTJohHPLbdnmRttKstU7I9C9t
	K75OhihSSlPr/dgun2b8kWEIXHmKOzkI9rIxv50GmVLLQK+mUdaY3bOucu3+t1SQC+5XjIKAfEh+j
	evFzdyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qas2X-00ArFa-1w;
	Tue, 29 Aug 2023 06:17:25 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qas2Q-00ArEM-33;
	Tue, 29 Aug 2023 06:17:24 +0000
Received: from leknes.fjasle.eu ([46.142.49.30]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHoVE-1qVyDm38PW-00Eqhu; Tue, 29 Aug 2023 08:16:56 +0200
Received: from localhost.fjasle.eu (kirkenes.fjasle.eu [10.10.0.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by leknes.fjasle.eu (Postfix) with ESMTPS id 7DC8F3E75F;
	Tue, 29 Aug 2023 08:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1693289813; bh=Tee/zKgIxi0MjayamYCOiUTorl30qi/G3fi5jQxu9uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i77dORvdD3FaDs5i6DL8ZDK8Unesg1yl+uxIVHscPJOTiKMcP2VspJD2G9iOvGdwt
	 g66IuuMz7ZWJ6u7k5WjE1Y4BlJcxwiuINQexDhpLTiMQ0wsn0nnwKtN8vhCBKG0iZ5
	 ZvRHgNWgIPsQ0q0qgSPI44uFj8TAzGUWkgXHMIw8=
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
	id A94463949; Tue, 29 Aug 2023 08:16:52 +0200 (CEST)
Date: Tue, 29 Aug 2023 08:16:52 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
Message-ID: <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
References: <20230825194329.gonna.911-kees@kernel.org>
 <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse>
MIME-Version: 1.0
In-Reply-To: <87ttsjlmho.fsf@mail.lhotse>
X-Operating-System: Debian GNU/Linux trixie/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:OBnWK3wK1nt78UyoQFBURm442v+SvSoVVT7mPovCe98T1OcdBRW
 545IdFbHubnZv1c8kyxGda2FhHOhq6S+JNQcmvQsPh86El8Z2oDObUTGZNkSYi3rBEhtPpe
 iFj+PMJcKoRUGTqyvPJRbQqi8muo/oIxULf5nsWJp9ECrUUtbCOcliu478mDcsJIYXLPwgG
 aRaGMaOKjgoTFmVfIQeAg==
UI-OutboundReport: notjunk:1;M01:P0:aho7zI6zb94=;UNc0eYoT57cppRUqjLHjRPHfS+a
 8VdRohInis0c7QGayzX+M5ASnk+RITNqxgfvW+u0ATCKZX6oHyS/jhoLszKOLFd9Ilq4q0LE3
 XULvJczVDMa7GJRyJRb42EmiNHu3LDuHB6N+qHt/r7XKkjCqPzweWqVOclorxQuc07TYmVKEB
 VYLDvnSi+P+Qeu6sZGS9lfdgcj4/xs5ZYCXgxVpyiYn66G1gKe+iFQu7/xCearw+YuHZ/VcZi
 aDavfRBduMQ+GVtBn3i3f4Q31B+QC/X7ArBR3FD5Rw5Cog6qiC1M4Q6bbQEvjx/d0xYqdejjF
 TRWrnlnXo5lxza+CvhPTsO0ho/Ja0ZX7NEgwr9rZUSkU0VAd9VBGmNYZAUeCiK4P0JXy23wcB
 zgjblDKsWrzA9Mrz8mBkq2ZlQGpxu067zGzyCNtJeAXBQ0c3oXIolZoy0hf3b6Of41DUudgww
 EfT0Oq/xtmWKTKA9Hn84k1P6lltuVbMP26dqOEzbogRrIFOTnIApQfP6TaUF00gJePbxUojC7
 2ZqXHrN7uT0wiCjgA933j7xFsgztlouzm9tAROAp6phsqxgdWBQvZJTY4zbeG8leFWCnOQDvp
 U/apGQzqW+btzLmP1yyHi1YpREj9VCyBhPnTIpMjho2NwQ4FOzbdJJLg53Mk3+lVkOPe0ByyQ
 x5AxUhsQv4eeZmpJSUlDO7KogsTOj1uBThtXziSFRnAAtb1tHGm3FpJQ4p3vDQvbE5QFgH1K9
 K4u5I9HUmcKhg06Ny38PSF8fzMInmdx/sunR2VgSRethU2f1xLOkiBkzneQ7wKi/kq/cdCfC1
 DsHyAnOhcZXIcLIKss3iNfnfDJtqyaRyHkrNM0JfYg2Cw++cn/SKPQNx3rWg3Ygqh2+otIvNj
 5Zy5bJ8wvsLjqb4cOXe6Sva06ebxscY0hHGg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_231720_829417_77012935 
X-CRM114-Status: GOOD (  23.33  )
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
Content-Type: multipart/mixed; boundary="===============6992720676128250018=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6992720676128250018==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JaIvwu+DOSVoCCpT"
Content-Disposition: inline


--JaIvwu+DOSVoCCpT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 28 Aug 2023 16:17:07 GMT, Michael Ellerman wrote:
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > On Sat, Aug 26, 2023 at 4:55=E2=80=AFAM Kees Cook <keescook@chromium.or=
g> wrote:
> >>
> >> Hi,
> >>
> >> This is my series to show *.config targets in the "help" target so the=
se
> >> various topics can be more easily discoverd.
> >>
> >> v2:
> >>  - split .fragment from .config to hide "internal" fragments
> >
> > Please do not do this churn.
>=20
> That was my idea :}
>=20
> > Like Randy, I did not get "why" part quiet well,
> > but if you are eager about this,
> > you can show help message only when the following
> > ("# Help:" prefix for example) is found in the first line.
> >
> > # Help: blah blah
> > # other comment
>=20
> I did think of that, but wasn't sure how to do it in make.

Something like this should do it:

	@grep -Hnm1 -e '^# Help:' $(foreach f, $(sort $(notdir $(call configfiles,=
*.config))), $(firstword $(call configfiles,$(f)))) | \
	 while read loc dummy helptext; do \
		tmp=3D"$${loc%:#}"; file=3D"$${tmp%:*}"; line=3D"$${tmp##*:}"; \
		[ "$${line}" =3D "1" ] && \
		  printf "  %-25s - %s\\n" "$${file##*/}" "$${helptext}"; \
	 done

but this neither beautiful nor elegant it likes to be improved.

Kind regards,
Nicolas

--JaIvwu+DOSVoCCpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmTtjVQACgkQB1IKcBYm
Emnu6hAAiTYwlEcuArYqUntbY96On0jGhH2Ro38eVcbugkgaGXZdG2o6LDj7+Jv1
diCScvmsCCd0LT80ZjU8liNtsde+lqrL5XMAnELCaOMFDQPrLSp8HQ1NoPGkR3G7
He4w0psuLoXtKYlfc5txGbe7xiXqouA0UO0p+t/LX+roPbGFNsB6801KbXfHdvQu
NeQM/chgqVRFESOgQ15prGDNjfvhCkmPL0tnsLTWbhmvH0JPhgkwbJDyJfoTiynV
+RSgVhYh2IF2pN9NHcWfKspTNX0oBQJQ0OZMuFUNJz0+wOebpslo4jGbKHE85XD+
eEAJ93mWyDzA1eAoCfEb/mJqag7FWYTou+lIxSnPwdvhp21OS6wcYxp0jSjHCYGS
bIyN/i4AGB3nGufPwyouWbu7N1ObEuT6M80sDJOla2tRCC8JpmXkMfyP6My/TZRl
h5NPK9cirqd8HYUnayL7FUYX5jgfSgm+4G37gGHmzdPor2Ugr3QEDCUIssTyw22j
v3EuoqJHuGTQWo80W8h07CFNgMxtW/zrq5ArTI9/N6vqtFQm6pec1WTAKC1/1pOU
IaMdv/ZrebiU5u9QPGGL2qi4AVe8EWKMMzsaUvfVFfh19pW0KxMW4y7afFy7t+6v
ICmnB7nhu0MM51uchAm+GjkTVLIEwVLbuq+hv8WWjpV4bfexyw8=
=Puw/
-----END PGP SIGNATURE-----

--JaIvwu+DOSVoCCpT--


--===============6992720676128250018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6992720676128250018==--

