Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F35BC5AD55
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 02:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2fuhUzTtN032vG3ZaEZmMFb4Mw4KXMJcDgjVqVkb4E=; b=SZ8fnguh95KVzNpDCU73Rax334
	+olwurOIzqNJgjo+qvpfnGJ3YkjShkZwVRIWniSm58YGj1n0hv5a4KjnoYEPDHUQ+dOANdTVtLbv6
	SOl2cwFCzNa0nNYdm9wk5zr8GNlkpWkoL1Xx868N6guA5tdAmEXe7nuafzj17ZUgqCq4djbxCBGML
	jWlkDmg12RBST3pY+qT8XQEQx1QYL0aKo4rMW9xH3Wyq1UL+2dU9kbmTgPzn4L1Jgl4vTKBJBbw43
	cVH8EObeNrUmg7pmCMIKd8YP5X00yLPmBt9LLRQRxNjlk1OKRTd/uuLnPBA71g+QhLuWPIEQ9ZdBZ
	b9x5JdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcYq-0000000DBXT-1T1b;
	Tue, 11 Aug 2026 02:49:52 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcYl-0000000DBWf-3J7B
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 02:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786416552;
	bh=23z7k+eAUinRpc8zLgMJ/t0gpWvJdmcP1Li0BPBYWwU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=xdxLf8+FH3LkSba6mwVuHMNjFhX8dSd4xAvsEOSQHBLUmNdSz0PU+w6hUNeyC1/zC
	 NltFsudWmp0QHDKYT6oN1uKJRbdB4wM3yq8KSzoFu1VbP++R0D37BFLPMMCcfYNDlb
	 DFf+2A0d+l2cN8Ool1cX2fxEPJak3SbCvp/uwHkg=
X-QQ-mid: esmtpgz16t1786416545t61b05b13
X-QQ-Originating-IP: 1Lvpn6o7ckoe/5uiobgyDQiiPwV4BQM3WsBUfeRYaQM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 10:49:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14630553172662809268
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Tue, 11 Aug 2026 10:49:01 +0800
Message-Id: <DKLRT9TOCY0W.1ZZ35K3S4Y5E7@linux.spacemit.com>
Cc: <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Arnd Bergmann" <arnd@arndb.de>, "Yixun Lan" <dlan@kernel.org>,
 <soc@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260802024052-KYC1424545@kernel.org>
 <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
In-Reply-To: <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MeDrt9suTKKHaftXhxn9pWBwQ7tX3M8gVT9Cv7+4JEFaArB3V8SYl+ep
	bMxUvvzdHG2yUy9M0cCK3rM87e4dLAquwOL/V+G1WQUXyQLK6fGE2knW3yAh0gXb9zxl/AY
	pzJp7DVkqJn1jgyLlLP+cF7I51Dw2pEScu8GS+HZKlwy8G8oAxvdNImzi/HGB41qZX+2r2j
	fQPV7YY53dCyTRQWokD80gteQ31mIfLX5JJkOEv0eILtY+SGh5e20JNcEUzDNRp4K5cd41M
	W07zeDp1PdK0Jniz2yBfJCNb6JcxrVqqSgwGJrL18yGmlBLQ2l/utuEnOE/kpI2aOWeLR+I
	Yws76Mrm7lvLXKVj1ee+jR+nxPcoROa+hh49L17hc00neud8wYjvU2LNnUHa6hONZ8neSMY
	vMokIM+SM9X8X5W+tx0SBPew/vXcMEy7xnXcOZvv5POmmAGgonHO1n/deKCKFNr91eD1noL
	3tq4/82e6EY5dlyN87uAAvU2j+TNP2gEm8G3VOnCu0T8GgyTmvNF9SH5TDv74NVn2i3P7N9
	v2j62dc7xYMrHWDf2/LmUYldR7ttr9TA+3ljv5YGS3RUj9YNo85yjZTPlqpc+DYsSLaIqM8
	ZK62ilGmADzUUrHKyhMjZf7rLD2//4Jda1rljSuZgE7UGfzH3u8eqJZKqkRSEINJRB+sWwf
	wmEP1bnVXc2naakS0o8BJ+DUbmij3mpYne0+t8UWImVqbCCQuuN3f3y05UaUvpM0lZEVC1j
	JZ/dynlGfV59YIodzYErv6lN0e7Sj+fRcJ5v6ZVjueDT2I66/FO8mwRWvLL8uI/aUzAzP1Z
	DrlUqqR4ljfrrUg50VO21G4a/kCwBPHZvCzmWOG+97/kYDNhhXE+h7ndNz5eq0sVcWztQ0F
	e20RzoS9uAf6vkpM3ch82oCHr7ARIkJk2GSGTQ8RvdxPqFQnkA4Kls8QjcQQ5YlacwUKWHH
	8josAc/0fBmq9yeEWI43pEc0vvTIo+byvyuN5GvCu3y4pRwhs/sta+uPWiMn/OCulSt8E1F
	KJelt2ti1nI5fsXnvNkTFMJv7b/NYPK+xTzZr0KvbRyC06rZxo7C1OHdq3f7cEet/aMP45b
	bbtkNFUTDFLsuNw6lFvSJWpaolyKeHE1SHH3J2LC1N4PDr3Xb+dOoY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_194949_168520_E81A821F 
X-CRM114-Status: UNSURE (   7.61  )
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
Content-Type: multipart/mixed; boundary="===============1895438710373699022=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1895438710373699022==
Content-Type: multipart/signed;
 boundary=99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 11, 2026 at 12:45 AM +08, Arnd Bergmann wrote:
> On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:
>
>> Troy Mitchell (1):
>>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
>
> This commit caused a build failure, so I reverted it for the 7.3
> merge window:
>
>     Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Une=
xpected 'CLK_MPMU_I2S_SYSCLK'
>
> Please make sure that each pull request you send is free of
> build failures and warnings and works on its own.
>
>      Arnd
The missing macro has been merged here [1].

Link: https://lore.kernel.org/all/20260717-k3-clk-fix-i2s-v1-1-e95001a692ee=
@linux.spacemit.com/ [1]


--=20
Troy Mitchell


--99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanqNnQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvShcBAInWAqeYwOl9xiKq8oMW7NOqHZFkbqohC6XK69oo
j4B9AQCdV5AqZTECQxaBbRClQbUxQQC8iWgBu7Jjg/HpAqnWBQ==
=1L3B
-----END PGP SIGNATURE-----

--99dedeb8f6cddb1a793b7e4b254114face358367fe82cecc5177778fdd56--


--===============1895438710373699022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1895438710373699022==--

