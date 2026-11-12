Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C153606A883
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0t3l5BFK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KW/OtKqt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ldQxGdrRdmio4viNEWSwEG23fFQ3Qcnp8IoFbeYeuG0=; b=0t3l5BFKh5NCdabRqF+5tmUVV5
	syX4d6TX+V56WFRJ/32ta8gIGKPEUbIgqT7GaGBCkKZ4pnlRzwTmnkemA/TRTe9bz8D22SYlO8/3o
	Q61h07Qh6m2h8iVBJ4xRI57g+ghz9l8wKAv/TBTeAbQCxgBO/VM6F9TG+vcozEnscJDiiCol/DtV8
	gMelzdf0Ny8B2JaeO2zCWAECU8f3fMvY6UGyCT+z3iAz/Wi6Mt93+8QV58gtY3cvYc0H4gDilLe+q
	NlpJhx/q5wQ8e7MtN+tnaaSksUcBIXqIloFjcOoRc+CC5mPDN8iCJb+7RlIgDTdzIjjycaeZO+5fK
	Picu+33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQlU-00000009I9I-2yKa;
	Thu, 12 Nov 2026 09:06:40 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQl1-00000009I1E-0LD1
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 09:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794474344;
	bh=tRjCHW5JmHRNfYMVVQ7cTaxvP6E3n7AN8iMMHkTyP+0=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=KW/OtKqtEoK1lsY4m8IpSlY8BhiL7cv5ru/UgX2vN7ctVpvEeFKyN7mBEPDZtSf/X
	 Y5qD1AaQaYz9eCfxVLJ9z0dpLbogF7UujjGh+Lbo8d4EKHlpf+xRFFQV7xU+TEKNaW
	 qojewXUaoN6p6iUeMF+Mw95S7ab1zbWvzvmAmsIY=
X-QQ-mid: zesmtpsz7t1794474342t162cc61d
X-QQ-Originating-IP: IlA0oIyOsGcenbBY3KwfaIG3ySBqnU3pDSZoMsU2a7s=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Nov 2026 17:05:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5635266169473473892
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Nov 2026 17:05:37 +0800
Message-Id: <DMT42A4ZNEL8.29E9VX1NOTPSE@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <marcel@holtmann.org>, <luiz.dentz@gmail.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <anarsoul@gmail.com>,
 <alistair@alistair23.me>, <pjw@kernel.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Bluetooth for the RTL8852BS on BPI-F3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>,
 "Yixun Lan" <dlan@kernel.org>, "Luiz Augusto von Dentz"
 <luiz.von.dentz@intel.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
 <179442601916.1604530.1705197925952408060.git-patchwork-notify@kernel.org>
 <DMSUPKS0VL8N.1RUUESQVU8FMF@linux.spacemit.com>
 <20261112061951-GKA62271@kernel.org>
 <20261112085617.516945-1-frederic.mahe@cirad.fr>
In-Reply-To: <20261112085617.516945-1-frederic.mahe@cirad.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NxDjMro7FujaZjwbpQQFZrocKL1ZPj9tYsZJZb22KtIlWGb/PMJNxnNn
	ZqTIwiNj10Ki+AEigic7v9bbvThNpflGlEqG3Az/NXT8ZAiCaKSWNRcEQj9XdVmnY8Biwj9
	c0H1OZylVDd6yzxnb8ehKGE1aIa31dwR16fAr88/3b9drLZUXTOnu3XPLEJT8Ndx24heVly
	mGh3VCdKdRhpv8tOa8ppFfKmc1MIzV2vWod+RZBrrBYHz/9/OuKvcaDoVb7J6IbgbUap/FH
	UuoOXOFlQdb4HaGWRtZYZjvSoSUr6dupsTEeg4JZpMJfmi+oI8lf6BNnK5KONFr650j+jBK
	1hn5Bhs/jqyXVQMXAdcNQFX5TxlpMR6HiF2QI/wwwEaEUtiWOWcjR8WvYS8e5FRvpHTA6Fq
	xIxQffBosTmO/Z3jM+AHkS79PC04btih8qyIjfixgnmBtx1ZvBhhHFpiscBrvmybzv7qP96
	sVqNWRxuklX0Gdx0p1mVYIF5hYGGzGp9gykJqYzZFlN9tV9v1TE6C/KidEt0tFdlxK7f3C8
	QwAjRC9DT+VqzHXtz8td7n1Eq0wwphT9/f3LrIwqJ8E+N8SAKntezGwId8YS7Uy1t4wGsqt
	/IZ4vijTd1kykG8bkp9q2pkcLYVAfGuifEbcKYiD3TtzKZzb6nvRmd3Vgywh/lUp03owjuu
	x4TVhVerZaCNRE6Pi6y7+y2z75uQuSFxSyZKzgnIdEI/041XzmfmKgnfS2+DKjWpQPPPdVo
	Gg5USb1Lk6e/oQy4yt7obleXU6LD0RYIDqg01MlX/i4/LAnt7dKU1ZsXclgxVZFUNBuKRno
	kimHabaxyCYIf978iyat9PEAUo6XkSMRFpvt8L1uR7XMf/yEZoZ2wL/JbCA72A6O9iFM3N/
	SPf6bYylwB6uGnyHj9CPMnaKwXrd+DoD8glK5nnW7bDuw99FJV+fOS2ID+ewXmobozKejj3
	10WJdWbmrpXQUWXanhDp1qgzkJL25tykt+eagnYwgjV2LeC7B4WEk6PsBCtrH+/+vDdkEf0
	cMgHt2m720gEsA6vcW5ElqgtmmmCtni9RdnBH/sTtxLg9GOkFZPsW+zETEA/oFVNt2etXmQ
	hNHiuyuj8juXJHeL/9omO0=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_010615_782459_A1389CFE 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: multipart/mixed; boundary="===============2447712079833707157=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2447712079833707157==
Content-Type: multipart/signed;
 boundary=c32ee5a21c6b100d441d9006521f571ae297a6e48585a5c8ae4e444b3749;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--c32ee5a21c6b100d441d9006521f571ae297a6e48585a5c8ae4e444b3749
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Fr=C3=A9d=C3=A9ric,

On Thu Nov 12, 2026 at 4:56 PM +08, Fr=C3=A9d=C3=A9ric Mah=C3=A9 wrote:
> Hi Luiz, Yixun,
>
> Sorry, I should have said in the cover letter which tree each patch
> was meant for.
>
> The split is fine with me: binding in bluetooth-next, DTS through
> Yixun's tree. I can resend patch 2/2 on its own, rebased on the
> SpacemiT tree, if that helps.
Nothing to apologize for. Which tree takes which patch is for Luiz
and Yixun to sort out, not you. No need to resend.

Thanks for your contributions :)


--=20
Troy Mitchell


--c32ee5a21c6b100d441d9006521f571ae297a6e48585a5c8ae4e444b3749
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavWBYRAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQvtFEA/1OZjuWJIgwA06HIk6xYdeBFMff3E7qYiKdj
v2lOmwOuAQDOFj0BJUXyYaSBUKsihcqMPFi3X1LWjkUMgbppoOnQAw==
=uEhc
-----END PGP SIGNATURE-----

--c32ee5a21c6b100d441d9006521f571ae297a6e48585a5c8ae4e444b3749--


--===============2447712079833707157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2447712079833707157==--

