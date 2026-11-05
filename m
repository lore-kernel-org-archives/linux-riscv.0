Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA7606D80C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 01:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aeyiqMcp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eMR10iCu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YfLO3/3rBgUPfNtZUnWi5wFosaEVOTTN6pdLkH7ncJs=; b=aeyiqMcpm2q4w5QQqWoonCZ0Tr
	tCcYl4SGWY7pibo5FvT04UYs6hgvwxMvFQi+V7vRjE7B9dJploFEXK6UbRF1myAaMkR3IdzO11HiE
	srkWSeRNRmhuFchTw4QxiiIMRFCCGGhz14JR5fah6YxGJ6uhDEs31qaFsoJjr8KonSpZAYmJ5qWk6
	lBxdn4bEfXf82ierXZ5Bhlo3xHjtmTOBQocMZfICc39vkdf+/XO/O0KzziujPh0xV4If5gjJ+zKKn
	DLPo0/Jm8cIkraglqe6JWYLBgGwyBQse8LSW+qOnm4nwXFuOhizPDIg9x6FEYAfxWP6JqRA4k6zM3
	HZQ34GNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlqc-00000007OQ8-23Zp;
	Thu, 05 Nov 2026 01:00:58 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOlqX-00000007OPY-0z79
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 01:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793840430;
	bh=kZxX/XIkUIJjuTAxtj9rZq8g8wa65n2oh9KUXIeg7Jw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=eMR10iCuDsFB1F78SQwns91/ipxyB7mOxad6ESpd88ZvFIjKpj/akcwHlXtIdCwwl
	 Ou4DipQck0jyIQYbeWHT4kwcNTV36CGWcwFKFBZ+GqDLsqvAxtZO3prWnUzw8JqwUw
	 ByACrxS2jSSln4YLVdmNhMljLKusqm+G8q2cz9Jg=
X-QQ-mid: esmtpgz14t1793840425t9f665007
X-QQ-Originating-IP: 3kPxtlDRI3SKmHDdIjQxdPAEL0gM87Iz4VIbjjf+RIA=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 09:00:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13532499832840154010
EX-QQ-RecipientCnt: 17
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 01:00:20 +0000
Message-Id: <DMMVCWRCJKLN.3GKI5P3X6TQNB@linux.spacemit.com>
Cc: "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com> <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
In-Reply-To: <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MiUxkXieYO8R5F479AZG0CCaMSPpI8BjUSMydLSCmKzOjNvTBU8VtAxi
	JXZtp8ezY8aeOdCyzCS68nr5BR9s4J5taYFHCI29RbWgLuuaEgBiio42s4AfEgpVvUW1v5C
	vz44OcAsPCP8c2ym2stbX2lS/5w9FjlRiuXwS1ywnZUr8nXmP1lrmXPzYUbSJxmmp5jBnrV
	v80FChJoAqRZgz5jzHb6l7KXGEYf7amU0KYmfWCqP5MX0KbJGYuF8aVSx0zogG3ooezDwm6
	5+nUenLK6WLTULzqQ6QokEePTnHJv4O/Av7FPNhq3xL3UVje/OWHF988AjgpQEpA1WUy3//
	HC4ZJIhi1Jrm3ZdzR3xV8XG4EtNAfDEcygQf1RDkRAvt9bdBzgBfn20Gcb2cidTyxJSKgHp
	Epsliz4+qn7LT59G0rfjR1Vb2ucHv1wS4NxLQWtALGh5TPdutL0jtJ9z/GJ2VzVMFjNdKIt
	rma1VXM+Roq0LryzShJY275dJO8/4hPop8YWZEXxkadRB49/GRhsM9IB0dNIcjmojx+SHVj
	3KOujew+YVtQkJKtndue5qytOKPklFQoyEfudQGI7Z4RMrlKyNuro4/qyWiroKJi4w/nPvs
	PrnB/mL3AWFMSYnMr3yh0+cHDf/QAhpzzIXnW2AJkfn9vbmBFXokVBi5QVfcvCB8Wcl6O7v
	JM+XqSM+3kCcXdfhAEOooifBDp08DMR6OSuAkooEEx8Kuc2DGAWTnRy6UQIJN7RLF+DhfgH
	GkQY2tPUD4puqZdudoev8npCls87+8gfRom5zdsQgs57B7WN4lCtSmWiN3APxjX2OztO902
	zhtEwyAfKdGo8IhlGFGDcemzzZZ5V00xxX8ye/Ag1amGAEdiTM7/572BAy0d3clZysxob/N
	LIvdMRi81e4zn+PVOx1pqYx4HDUPIKwQJnZL86Idf5220YQfzvIB5DkSHt6urfbodVjK/YB
	F2FkRkaeJd4/PWhzeVCMSOsprMYdVAi8Z/aXaya/Tb/nM8S20lcRsksxLE3tyo23dl4uw/j
	ugMuTeJusH9FT8OtPFDt3kSoMofx9CASt5N8u1LYU3g/rv6MdJrLZKiIcskY7w02zUI333n
	PfcnNp74GY93SlLilW4oIaEj8LklxqT9QrhsGVl5biU
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_170054_321705_045037C3 
X-CRM114-Status: UNSURE (   5.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3664234355120707362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3664234355120707362==
Content-Type: multipart/signed;
 boundary=ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 6:34 PM GMT, Iker Pedrosa wrote:
> El mar, 3 nov 2026 a las 9:56, Troy Mitchell
> (<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>> [...]
>> +               timer0: timer@d4014000 {
>> +                       compatible =3D "spacemit,k1-timer";
>> +                       reg =3D <0x0 0xd4014000 0x0 0x100>;
>> +                       interrupts =3D <23>;
>
>
> K1 timer specifies interrupt as <23>, but K3 uses <26
> IRQ_TYPE_LEVEL_HIGH>. The IRQ type should be consistent.
No, K1 uses the PLIC but K3 uses the APLIC.


--=20
Troy Mitchell


--ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauvVJCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+QZwD+LjXA7nF7yyOy
r5aU5N43nrOkq5zWRWyg3wPUqMQ60okBAIu/lWTjTK76ntl7G6+I0RE4LaYRG3ec
dmzhL1IFj68D
=Fl9h
-----END PGP SIGNATURE-----

--ac3ca7b792b26755fe7a725c28bb57121983448927d4375be7781694ab05--


--===============3664234355120707362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3664234355120707362==--

