Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C3B606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 07:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVqOovZa;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=l0ptajlX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y8hNpZVeCyVxFw2j9HP+uAiwl4eSwXXFk3R4F1vwGgg=; b=SVqOovZa9nCRTgHqRUBeBqC8ua
	zFAQ7u4YxEwTNT6RaFjX5AjUEmUvHqj24QWti08SBgrgzqMrhVtWQ9PjhFiwJxdcrfQgAPBGtjmhF
	FFt5rzakEri/pTWr0D8QJkcZoKXSZ67OTN+3SfVJv/fFDi9IMPhhn0/36tzEmeG2Id2jT6wQohCWO
	vu5Gi0zDrcrzR0OOVI1RDieSnoWt1Je6yyfrkXpodxHXRm8wWLBrm92d5tRLqs8dUCpLv5Wvng08t
	faPu7rov3jZidLlJsxx/T2OFfG1+9O15J7FowzREUuSv/GVmm+Bp+qiatlA+c98E3t9wYVM3npUBe
	gfVNlA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxCZ-0000000FmXd-3xHg;
	Sun, 08 Nov 2026 07:20:31 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxCW-0000000FmX2-17xA
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 07:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794122370;
	bh=oK11WFoEYcxKkv5gOP1n+/n0b5JmGN4huhLMKQpylEw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=l0ptajlXbZ1z/LmNL+8Zy2JXI2/679E0JwjjM/4chZYVXNgjlN3weW/PUCagY0KiJ
	 Mh7aOIkwibLfLDTV/IQF1kv8+xdRDpNacN1Z7uYTkeO+/5lA45ub3opd/i7CsS+pqX
	 U9VDqubZ3YNltyHuVYmoikqJtQKOaB0WUZg0iiVU=
X-QQ-mid: esmtpgz15t1794122363t4cfaa196
X-QQ-Originating-IP: 70UR/8/Qz3+J8nvl4pXEMghTUj9NoHrmNfQe2/YfDAM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 08 Nov 2026 15:19:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17965104858753304052
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Sun, 08 Nov 2026 07:19:19 +0000
Message-Id: <DMPNAPNEGQ5I.XYUIB7Y8HDCA@linux.spacemit.com>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Andrew Lunn" <andrew@lunn.ch>, "Ali Tariq" <alitariq45892@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Vadim Fedorenko"
 <vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Yixun Lan" <dlan@kernel.org>, "Vivian Wang"
 <wangruikang@iscas.ac.cn>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Siddharth
 Vadapalli" <s-vadapalli@ti.com>, "Tomas Hlavacek" <tmshlvck@gmail.com>,
 "Muhammad Bilal" <meatuni001@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
 <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
In-Reply-To: <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OLw9GlLWtKW/J1wI9COrZ8m4Rvm7AcJvYQWonqDnZ/Qn1ieXLi3y076u
	5rQiQTfLHhwVyrOBEoAgOkEZlqsqrJ37EyJrVN044chFlmDZ+vC/4zNyYRfELqx3GnAs2Kb
	tIKSSrI+LD2825rxl9hFFY6k5PJlH451RDTdLG4K47/4qfynPzK/wbjqJwnjTKL8a6x09FS
	hAx0VRwjYPf+s0f9+D2jYnwDvY30ukSDVTnRk01uCmyfkyFttDwOHaQRoCEK9T1atvca5jL
	uBbo9RvQp3lSiYSegmHNpAr75ObY2ihEjIPf8LiaRFEAMRZWm55/DGgSIp6sS9HaAy7Y4iD
	8gt9EoSSo/1ZCBHqCu9KD6r9bVuntMzMClYCyD2KxGERjIQuQToarvSUZI669ulCq5bz+qE
	b6QhzLR8vZav7PJQu4W9kCzBpdRq3dwlCAm3S0xl3wb4rUqe9fkfAFPz7Z1sddTZQT+enIl
	J5i0Xrw9oifQ8G1Sa96eBJaAMtAtI/odG5NjlxeSAimUAQQsga8x3QqpyrGeX/b8ieh8xex
	iqZI6qcuekVdMlvp5D33WbcvdGxUWkVLv6HL39nAJ7bUqn6QnDeZkWyOIcinFlnqvosxWof
	zhaKwwUj5ty1g4GGZhnWKKC6gFuO7MdI2bE81drRTeMqQ/At5ztdkH3qoAO2HaFF2TrETmf
	mhkXZSP/RyO6LLIiEQIILIkbwq0vD1nTxJPur4PoXfF3AuEBVbuOCisCjfsXc/u3fYBAOlj
	xVHBAyF/Qm/K5QSitagFoMV1FNEx5vSwcEBdYhWaix7+8togKfNBQ9l/lxV+aHGKgg7shfS
	uYPkkcjHOGYxvNwI+51qKPsZbS1uJgeMjmn/XB37+7YUKVEP1OB7Am4RRSPDKg/X5I/2zqj
	2Gk4OQrlOUreJ5RbYewLvmTGDeciMHLeTT9/68mXsIz3T9kkWO1/ftbc3p6NXv26Yok3Pvh
	0R1qcOJh3wpu+1uM4sEuXSjlxnuBOMeXrNqxI+5xMTugh2slsTn22Klz/Hoh3luKP4LTOUF
	D3ZUefQkpaV+hOde2eqlkafgMZujml5Jc9HlPrd7PK0tL23xDR/oGAN1fFO7DUZhtLDPze7
	JdQO5JuKWE9ATbbHxh5vfMG9nK7sh2kU3+a0m6NrK9k
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_232029_288249_8B7011A5 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: multipart/mixed; boundary="===============6916046085891742582=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6916046085891742582==
Content-Type: multipart/signed;
 boundary=a02f21ac2a7151b86497f96503bce060f3b96109e2e2f1aeb6516b655868;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--a02f21ac2a7151b86497f96503bce060f3b96109e2e2f1aeb6516b655868
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Nov 7, 2026 at 5:32 PM GMT, Andrew Lunn wrote:
> On Fri, Nov 06, 2026 at 03:44:50PM +0500, Ali Tariq wrote:
>>=20
>>=20
>> On 11/6/26 2:43 PM, Troy Mitchell wrote:
>> > On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>> > > @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>> > >   		return 0;
>> > >   	}
>> > > +	rtnl_lock();
>> > >   	emac_stop(ndev);
>> > > +	rtnl_unlock();
>> > >   	clk_disable_unprepare(priv->bus_clk);
>> > >   	netif_device_detach(ndev);
>> > This can deadlock. emac_stop() -> emac_down() calls
>> > cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
>> > emac_tx_timeout_task() starts with rtnl_lock().
>> >=20
>>=20
>> Thanks Troy, that makes sense.
>>=20
>> For the deadlock, I think the correct function to call is rtnl_trylock()
>> inside the emac_tx_timeout_task(), which would return if the lock is alr=
eady
>> held and will hold the lock if it is not.
>
> rtnl_trylock() is generally a workaround needed for badly written
> code. Please try to avoid it.
Agreed. If the reset is done in place, the work does not need RTNL at all,
so .ndo_stop can keep cancel_work_sync() as is.


--=20
Troy Mitchell


--a02f21ac2a7151b86497f96503bce060f3b96109e2e2f1aeb6516b655868
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavAidyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9B0gEA1znr4tPpsYVC
nAv98ga0dRZipfyxeRX03GPDfyO2H9kA/0MZoMdmj9AE80+OsoJRT6mWefpeM6Si
aoXyFnKOqZsD
=cK0u
-----END PGP SIGNATURE-----

--a02f21ac2a7151b86497f96503bce060f3b96109e2e2f1aeb6516b655868--


--===============6916046085891742582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6916046085891742582==--

