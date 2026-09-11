Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5DDC88E40
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 02:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pej06iikAWLWFCHHb4Cau9YLdC22JgQZLt+LAMGrEk=; b=QexC844aIdvyeYLofdgrkowxNf
	gRyjQeaNgD609Mr2bra7DYU6GRB/CCChNnm5eDb5wSxs/shwVaIsRqrJXVWsv1qkOxZeBkAbYwx8G
	wh3RknJ4ooQDcHJqnp981kDqEZT5lWkHguf+TN0MtYQmIEOa4LgIFBJSm/MP0S3AOQB86MJqf3cHL
	T5+Hy3PA5WwlbQM9vmZQJElX0jYZGqRGrciy+HInPyIfSRnT790Uq/X428cve/6AZLZhy5iTJILaK
	HDn1tnKYtFYdLuGqMovEbGR+fhDV+G3WkMkUssMVEm3ON8iyOJOvJeVVR3PV+lRvuK+HNexnh135C
	MnuoKvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qc4-0000000FgWk-3ULj;
	Fri, 11 Sep 2026 02:03:36 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qc1-0000000FgVb-23J7
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 02:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789092180;
	bh=p4+ap8iN4dSSeNIC2F+epq8WIYVdpPuH33P0vIVK/GU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ciCR84JG8J45yBUMsDQsuJUMc6ABdMe+Z2YL6pHg+/rt9iwLkcOBEnQ++YAoT8y90
	 TVyUMKVYB80dNJLA9W/ZVz46y6lV5uoehYp2uCwYx+9B/g4N9U4o9826wF3uUb4igI
	 KMhiDlJ0VKJDgnRJJj+xcTzBRMLJ36BOuSVRfSOs=
X-QQ-mid: esmtpsz19t1789092172t4f8b07e9
X-QQ-Originating-IP: aSvGHA2+aoIKS3fHxwTlfYEZdf0xYuWX7HM/PfxhtbM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Sep 2026 10:02:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10264822679062085663
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 10:02:47 +0800
Message-Id: <DLC48RE9YAU6.1YO47FZILOUWJ@linux.spacemit.com>
Subject: Re: [PATCH 4/5] clk: spacemit: reject rate changes to running
 firmware PLLs
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yao Zi" <me@ziyao.cc>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Yixun Lan" <dlan@kernel.org>, "Alex Elder"
 <elder@riscstar.com>, "Inochi Amaoto" <inochiama@outlook.com>, "Haylen Chu"
 <heylenay@4d2.org>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com> <20260909-spacemit-pll-init-v1-4-b3065ad5a4ac@linux.spacemit.com> <aqKxMmgpFLE3CmQ8@pie>
In-Reply-To: <aqKxMmgpFLE3CmQ8@pie>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzrAUXRIQvKYrDAXR9xjCPK2SxrDkBOF/Ht8IhQa4fdQXo5
	siNFl6sCpD4Cnn7FqEYx8IacMqqy26AJrkNM2hMaoH1URoLv46oyJYlo/JtxHQ4zT48UXaw
	o6+6Wc6TwK+SZrxKTnG5LQw6oTRn9SiuhMpsA5bT6dnNOxMZLPDR1tZMIO8PLNeKm7rQB1A
	Bea/gsjFkFeDoQqcYaymbudKKXnpL488FCdo/BqHBzH43kzPv2DeBgSKkmVDQ+ZwTQo5fAu
	D0z76ghwqxsKdvf5eprwylYrnObBBQ93vRKJFFtjpGbKqRxRSyD003LhPubrhDjtKAjeACj
	EJ4QXfL2RZH0gbBkw2tr68zTzfHa4EkaaGNpYR1tTBVQ1fJkDP0dzl51Eb6Z2ljo+TTzio/
	2C7crv0vxaG5T7xtWOL2DhfSkch4JglXeZK2uZpEBeHB7u2BBwmEOhkygXledXvSwG6wvGk
	KZVy20AafBQ/2+GHQK+jDcZ8NoAmZmLu5QWJ4KSXUS3pbzSw0a+9pXulN4cUqQO4tm5ogx+
	jIQIg7tz/LXOW0Grq4lbwASWrtZIb9I4FohidJXd096q9s3bQzpms9+pd4ylJpnvbtI9xf9
	S6JirXSa1uN3riJFxMqru7lIVAEjNcDUKXMEKAF7JrBHxiRzxo5zl3Rql4K96ZEMbgyVgFy
	B3nOGaU6ccxpwISJMt6wNyUeSKUAxOx+UkgYfbUaD7vFTrhnMvMztlfY6c+XBCgygpe1LJC
	pfoplvrxti0sqLro5HFCNBUghn7JSbRM/VvblNpJ27DrbBOY0UCu5dM8oOTKrbjQHqvpOCT
	F+ApYaqBIM6BCkOxh1Kx39N0zM0NHeOmdxoF9e50xq9POgTHalifb2gZu+VJ5iQ5+MeS4ah
	esXFaXh6WasB1LivaAImsXrfAriehAZwcnwLMTrKPP9wAPfaWGPEuhcxIHHTCNjJlpBnM0g
	lwQxfP4R36xKBFiB3u1umhVTeIgiA3xR27o+gLzOGpowxaDFLWf3WW53Bq3/ZMaVVZTNycp
	jlK55kkRPNIebTzd4bXGRZbYw6PYaLoVNC7lEYAFKpveAhZ2D5id8rn2c6gl0=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_190333_991006_7C544EE6 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Type: multipart/mixed; boundary="===============1864990435581113427=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1864990435581113427==
Content-Type: multipart/signed;
 boundary=215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 10, 2026 at 9:31 PM +08, Yao Zi wrote:
> On Wed, Sep 09, 2026 at 10:07:04PM +0800, Troy Mitchell wrote:
>> CLK_SET_RATE_GATE only protects clocks prepared through CCF. A PLL left
>> running by firmware can have a zero prepare count, so this flag alone
>> cannot prevent set_rate() from reprogramming a live PLL.
>
> Would it be a better idea to simply turn off the PLL before reprogramming=
,
> since protected by CLK_SET_RATE_GATE, re-programming never happens when
> the PLL is required by downstream? This also seems to be simpler.
Then assigned-clock-rates on the PLL provider node? I tested this
on K3: .set_rate() was called during provider registration, with PLL3's
prepare count still zero while the CPUs were running on it. Disabling
PLL3 hung the board. CLK_SET_RATE_GATE therefore does not protect users
that CCF has not yet accounted for.


--=20
Troy Mitchell


--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqNhRw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvFiQA/1yR1e1N5dqm/JjKEw3dfM8yjqKmhTeY4evjauQO
6r/JAQC+EVD4ZL95QJzBkQT+HKp2w5tll5d/gI8NIB1sW9JeDg==
=Z8ol
-----END PGP SIGNATURE-----

--215ee3cf27d68f54324eca2221f65eb243d448b430723bfe53a69c3edd9e--


--===============1864990435581113427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1864990435581113427==--

