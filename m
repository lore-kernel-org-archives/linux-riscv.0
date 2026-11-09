Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BFB606A333
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dUCkc+/z;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=PltO8V7e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MGsfFV6+dOXKg8W/7bhsy3ythAtLg2zHJRWWUrZE9Pk=; b=dUCkc+/zUqM8X5BCJ3dorkWmDP
	5vkLyJgAM0ZvQfOQa05j/HWQVq8nNfH7i7SoKFW/U8hhtefn39MA9N6nzB3JxNBNK4UuCDoEF6wLt
	YRpjrgHKYCEIsWSosMLOxvLWxvGkbssCVfSgdVhXyj5axxb5nnAxKg7OHhRQ7kUSTmd09042c20zL
	h3AQMzQ6k/e4ELJnmUnJsCxH0MlcihLs5SzPNiAX/+MYvOj8LXiXPZZwyZId19tY2HzlZad/qk75C
	2cYcilO1dVwi32GR2Cj9vg3MRnSVfMnuWpu+GN/in8VHbunt5TVATO060OzPyQ3VvdPcJB6BeRZJP
	EIR9dueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKUD-00000000212-07JU;
	Mon, 09 Nov 2026 08:12:17 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKU8-000000001zy-2xtx
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 08:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794211866;
	bh=rorBGLAsniE2vG3yATMjVG80a6o5W4YIh5/81HTrjZo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=PltO8V7e05fEme6ODZcHf8hfiTft5tk2vK4EC1PgIiwTKZH15rTA6ykEg1glJvQO/
	 5MYiEqgrLMFtNMGMcPHSp3nTVmhqt+wCQHhThb8nBe78IZhJB0G4O3Ay7dmZz65x4v
	 D/FdwY8NGfx5uOfhTXwTHknGU/QfYuTOu4bC1UwU=
X-QQ-mid: zesmtpgz7t1794211858t8407dd36
X-QQ-Originating-IP: ttxQFy42B6HOpJChlAzs7cKsMszT5V8pJkxIGpqntUU=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 16:10:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9920573175547933257
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 08:10:54 +0000
Message-Id: <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
Cc: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Yixun Lan"
 <dlan@kernel.org>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Siddharth Vadapalli"
 <s-vadapalli@ti.com>, "Tomas Hlavacek" <tmshlvck@gmail.com>, "Muhammad
 Bilal" <meatuni001@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Vivian Wang" <wangruikang@iscas.ac.cn>, "Ali Tariq"
 <alitariq45892@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Andrew Lunn" <andrew@lunn.ch>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
 <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
 <DMPNAPNEGQ5I.XYUIB7Y8HDCA@linux.spacemit.com>
 <ee3f414c-fffa-41e6-8bec-6af7ce676c4b@iscas.ac.cn>
In-Reply-To: <ee3f414c-fffa-41e6-8bec-6af7ce676c4b@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MVxas+91YiZt1KmADi2maYROyRQuzgddueoNjN4kXwICpOCBkJ1IrWH2
	B+pMIObRohj1+81FimdV72smmi1TYIdwPGItGUzsl2TVZOI3nYGvlrvArmFhpaNoqlSKBnU
	SZ1+BN+F5Swv5UC4HQIXcNAx8kT6toDburJDiTxY1Ua2iWhoDOLrA1CwcWiCFh//YtLTfWf
	3rKNqz1jL272GqnMFcPZhiyWQDhTnpI+RWW6iOtxMKElrtmf0z1Oa0tRHgrXUqQ2CzoFvYt
	nOuZiw7E2ILNXrVZh1YnaUQPj6tFalxMYUK6vjdhQBzHl+r+YYETx2Nb7BS4HgMBesItL7U
	iXTLe5XbT/pf9GpOrhUwNgTJ78bhDAWhL1GJH4xtW1MGPpDXVntABJJ0nIBG7E0dcTxOWFw
	z8UPPsWc7S+sko3RJAmidX2yNcXDooiVRbb8hqU64d0na88mpLGVFy3wIUpgHvmNMn97n5y
	UFLhkaOuVi0DemjgRM8fZ2IUpnZgJmGuWINTMO7x16+KtLjhqm/JDxzfjb6ZmqJzQ7BeT9Z
	vrWB2ql4xbt5AKRuDjLatsbOB1U9nzXbeHwEldz+src8J1CUQtcm8MPsyhmExlit4KxDDsE
	10F3DL/bQR7jQxOpxmYKekblvpM4V+RSjjz+CMZ6/d+6X6Dunm7QaQUIAvEZzBkSJNsgtZz
	9EgPsVj5dmVByPGY4c44MfN32AoRi2Nd7f3K7bummbsRUL2ktaX/XyohcTZ1pZSEQS7/h9K
	qv83d9nDdxiuqGlQ53MmbVNZeRPURDDdr4DkTw8aSSknt2KbXv5xZewyk5NyF6/ZDVTTzjU
	UYavO1CUmEgoAflwdt95vpwXsHHGzqt2QYTNidOK231ytLMGCeyqmEYkIwVOf2Y9Sv8RN2N
	YWge54F+whXv9QBfAH9MkGJXswxkiZWoBYcg/yvzbx+Q56JRt/RNK7etTQrUNzF0uTs/jsP
	JwYRVvoIx9fpNylOOXVdag0R+JD2s5xREVk8TwAYq/Z40dwpIMBttZGl1tEaOpDSn5SNSDO
	p8dLUlD9AD/MKUmo4wUQH6eOGlzl1deRBzsdkBwPquGlTw89MimByMP61OXgpugr8MiaOG/
	AxW4e4KCMwJaAoS3ec2x9YyvxoHTSTt5z/Lo8y/nGbxZYdh3jIGDnAey7yga5Nuk9vd3rtG
	w5Da
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_001214_728969_7E971796 
X-CRM114-Status: GOOD (  19.46  )
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
Content-Type: multipart/mixed; boundary="===============1204743469594282303=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1204743469594282303==
Content-Type: multipart/signed;
 boundary=451327d1c3297fa83e6d3c22c14fc23d5eeb61071de10435f2daa7ad48fb;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--451327d1c3297fa83e6d3c22c14fc23d5eeb61071de10435f2daa7ad48fb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 9, 2026 at 7:59 AM GMT, Vivian Wang wrote:
> On 11/8/26 15:19, Troy Mitchell wrote:
>
>> On Sat Nov 7, 2026 at 5:32 PM GMT, Andrew Lunn wrote:
>>> On Fri, Nov 06, 2026 at 03:44:50PM +0500, Ali Tariq wrote:
>>>>
>>>> On 11/6/26 2:43 PM, Troy Mitchell wrote:
>>>>> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>>>>>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>>>>>   		return 0;
>>>>>>   	}
>>>>>> +	rtnl_lock();
>>>>>>   	emac_stop(ndev);
>>>>>> +	rtnl_unlock();
>>>>>>   	clk_disable_unprepare(priv->bus_clk);
>>>>>>   	netif_device_detach(ndev);
>>>>> This can deadlock. emac_stop() -> emac_down() calls
>>>>> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
>>>>> emac_tx_timeout_task() starts with rtnl_lock().
>>>>>
>>>> Thanks Troy, that makes sense.
>>>>
>>>> For the deadlock, I think the correct function to call is rtnl_trylock=
()
>>>> inside the emac_tx_timeout_task(), which would return if the lock is a=
lready
>>>> held and will hold the lock if it is not.
>>> rtnl_trylock() is generally a workaround needed for badly written
>>> code. Please try to avoid it.
>> Agreed. If the reset is done in place, the work does not need RTNL at al=
l,
>> so .ndo_stop can keep cancel_work_sync() as is.
>>
> Thanks for the diagnosis and suggestions.
>
> Although, maybe we could simply avoid cancel_work_sync() in emac_down()?
> emac_tx_timeout_task() checks for !netif_running and does nothing if
> already down so it should be safe. The task cancel_work_sync() in
> emac_remove() does cleanup on unbind so the task is not leaked.
>
> This seems to be the pattern in other drivers as well. What do you think?
That was my first thought too, but I'm not sure netif_running() is
enough here. emac_suspend() calls emac_stop() directly, so
netif_running() is still true and a pending work would stop the device
a second time. And since the netdev is devm-registered, emac_remove()
runs before unregister_netdev(), so the work could be requeued after
the cancel there.

So we'd still need to cancel it in suspend and remove, and at that
point resetting in place looks simpler to me. What do you think?


--=20
Troy Mitchell


--451327d1c3297fa83e6d3c22c14fc23d5eeb61071de10435f2daa7ad48fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavGADiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+e2gD/YgsXO0i+wbp0
YbJpT9nglIg76qI/eZv+U64XzNFHF5YBAJh+8gKVh4eYAy2JDB7r0FgzWcGReBGG
GbVSaS7QWJkO
=YcRX
-----END PGP SIGNATURE-----

--451327d1c3297fa83e6d3c22c14fc23d5eeb61071de10435f2daa7ad48fb--


--===============1204743469594282303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1204743469594282303==--

