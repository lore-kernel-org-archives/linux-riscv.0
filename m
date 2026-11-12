Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD9D606A333
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BCmm22EB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eE3ubBA3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TQc7Yp7UiOvGc8Kp/QTWIl22nA3UcGj6pgwKqT2rNZo=; b=BCmm22EBTyPz/uypAsP7EAEQU1
	O3zr3gxLHqJsQ5Mgyhk+0Ktzda8DySubKDhFSvCBsPuB0AyRtAZrZtllqcrMIadDDnh1VOOmnSevc
	fZMihAZ49dtPI1x9OjlT++DlVCtH4FexdtNzJQ1fhVNvPlRITsNR+1NJj6SZr+NZnXmaS3ZcbbBP5
	hFk1IhA1CVrSvnEHIcQNkGJneMTWGKEEZSI53BRN4sTByOy30e8DCl49sxr8pFJK5X3hoWJq9O9Q+
	Mz23pcG0yhlkhl/xa3nXJ+AQYHMmmZVbRFF5dFwpASxy3YrW5lzqO80kRw+Fc0WAfLcKji/F8u5aL
	D59JQcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRW7V-0000000AJvB-1cdo;
	Thu, 12 Nov 2026 14:49:45 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRW7S-0000000AJsn-00eN
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 14:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794494916;
	bh=zjGNu9iJUY6tRHH5ZIf6zaOe5ITdcxUbrHIdm2i7RUM=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=eE3ubBA3X0MpCogcaANxkRVGRDUfVO+FpsUIcpRjTj/wv/pjP1/j2TEZb8dG6WTep
	 i9S9cPYnMuICpBAoeKDRCmYXPQ2u9FcYTPbrXogorP6HfRNJxpgE/W+IM/wQoJ4Ah/
	 8Q71nK/uxm6JPfI84cfFnMoxCjMPpd+oklXoU56E=
X-QQ-mid: zesmtpgz6t1794494909t187aaf4b
X-QQ-Originating-IP: Js536/AgtVk23vBPAsP9wENuhTH6rx7T9W8Qieg91IY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Nov 2026 22:48:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5432486051573447005
EX-QQ-RecipientCnt: 20
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Nov 2026 14:48:26 +0000
Message-Id: <DMTBCR706MJ6.23YJ33SOJOGV2@linux.spacemit.com>
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Ali Tariq" <alitariq45892@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Vivian Wang"
 <wangruikang@iscas.ac.cn>, "Andrew Lunn" <andrew@lunn.ch>
Cc: "Vadim Fedorenko" <vadim.fedorenko@linux.dev>, <netdev@vger.kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Yixun Lan"
 <dlan@kernel.org>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Siddharth Vadapalli"
 <s-vadapalli@ti.com>, "Tomas Hlavacek" <tmshlvck@gmail.com>, "Muhammad
 Bilal" <meatuni001@gmail.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
 <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
 <DMPNAPNEGQ5I.XYUIB7Y8HDCA@linux.spacemit.com>
 <ee3f414c-fffa-41e6-8bec-6af7ce676c4b@iscas.ac.cn>
 <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
 <e11f1ba6-6e56-4bac-a0cb-f9258a53f34e@gmail.com>
In-Reply-To: <e11f1ba6-6e56-4bac-a0cb-f9258a53f34e@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NLi1mgTFjGdmJKOnjnU1dcj96CS7m087g6q8eBa2g8j00V22DQXGl1K7
	mQz3vJ4ziV8zd5+DvAPLaPDv47QyuuOJH1XkoTEljW6h70ugGwgkaK1gFkEchnhuL9yF6f7
	yK8HJsjiVHV9hqMmyDoJGoPKytHl8L2L3Jw057ah7Yil0ZyTL0tq4EDr4nxjzv5ciH8uF7z
	fxQ7N4gdJLtpxk8jQljMZutUvq+7ltRdxQXtn1pmR3sIH62Gz3ISLyvk4GXRzuivsXmg4Cw
	8/Ec7wHB1/onWNecC3GFu8UWjXAm2yzalDxRpOUrL8r62zOKpIQ7m5cq/a2nQNbn5iH+9qr
	fGtjs4PBK0q9Zieg/Z7vF5LhMkwaUOVNTAXJuK6OoyN4TXFrpLehP2cf33OGRUXwLe79xY9
	Ms27eX4NHEafYTazY4O/ZaF4eIIRPozXBdxFCo4PK33SrDnkH1jX5OTjsIfP5Ww6ROk7KbX
	tHeX9IlZVhkGLknQgg3F+oDfsHepokVTxlq2CkqNb0wT3GJl9ZS4qmI5JdbykP9pBGt+si5
	V2p8Pk/AMRYT/LaHSl7TFP/Iw2KgKNRwu/rMuGMI6R99rbpPgFfYpvnCQ0bELauNORc7eM1
	1MlIsTj1y3nahpLlkqfOGQGIJbSps9koNlp6tpv3mwngbh9ZTBHpA3sQ35mY7potVEMCQ6F
	oi5lolhtutXU63M+l63BAx4NXjSf2cqb53BGHDzydcGNHcOeEm0cvBKZ6fTJwujAweBCpeO
	r0sI92g92Oi+OAx/qpoSzRQkirPuKb1mOsEeD551NVHk+vZ79v8qE49VN1VWbEZpDua/T+k
	IFa28lJgH68fFHHoJu65+l1JcnagD1ZNppeChJgB9vvtnoeHVOT2PmJoGBAgjtOOykqCi1Z
	a4VXXA46une/fpAPWASON1sesNUSq05E1WlpzvZjdYHKpUpGE8DH9AvjZVpWKWal2xubVcp
	flSpw3dCzgWZ7DCHmndGy14pmnjtoM2X7I1Eny7trfDfDyo/fw/TEIgS+GqWR3BRk8OwHZ2
	8ToeW3Xv2pz9Uhtv6mHzy/t9g/CC6UNpUU73IArqG5yeRzf24ChXE0AqdDcb2q/Xa0FBpzg
	W4dKKl0iTb1SlXGzrz/EAqnSxADRBp6wmQNi0N75nZhW7ytt7RkIXQ=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_064942_477416_2E868C6F 
X-CRM114-Status: GOOD (  23.75  )
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
Content-Type: multipart/mixed; boundary="===============1517741210154777204=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1517741210154777204==
Content-Type: multipart/signed;
 boundary=4b60170ac85986e157bd72089ccd51b2afc8a5789b706b54e2b49f94448f;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--4b60170ac85986e157bd72089ccd51b2afc8a5789b706b54e2b49f94448f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Ali,

On Thu Nov 12, 2026 at 1:33 PM GMT, Ali Tariq wrote:
>
>
> On 11/9/26 1:10 PM, Troy Mitchell wrote:
>> On Mon Nov 9, 2026 at 7:59 AM GMT, Vivian Wang wrote:
>>> On 11/8/26 15:19, Troy Mitchell wrote:
>>>
>>>> On Sat Nov 7, 2026 at 5:32 PM GMT, Andrew Lunn wrote:
>>>>> On Fri, Nov 06, 2026 at 03:44:50PM +0500, Ali Tariq wrote:
>>>>>>
>>>>>> On 11/6/26 2:43 PM, Troy Mitchell wrote:
>>>>>>> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>>>>>>>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>>>>>>>    		return 0;
>>>>>>>>    	}
>>>>>>>> +	rtnl_lock();
>>>>>>>>    	emac_stop(ndev);
>>>>>>>> +	rtnl_unlock();
>>>>>>>>    	clk_disable_unprepare(priv->bus_clk);
>>>>>>>>    	netif_device_detach(ndev);
>>>>>>> This can deadlock. emac_stop() -> emac_down() calls
>>>>>>> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
>>>>>>> emac_tx_timeout_task() starts with rtnl_lock().
>>>>>>>
>>>>>> Thanks Troy, that makes sense.
>>>>>>
>>>>>> For the deadlock, I think the correct function to call is rtnl_trylo=
ck()
>>>>>> inside the emac_tx_timeout_task(), which would return if the lock is=
 already
>>>>>> held and will hold the lock if it is not.
>>>>> rtnl_trylock() is generally a workaround needed for badly written
>>>>> code. Please try to avoid it.
>>>> Agreed. If the reset is done in place, the work does not need RTNL at =
all,
>>>> so .ndo_stop can keep cancel_work_sync() as is.
>>>>
>>> Thanks for the diagnosis and suggestions.
>>>
>>> Although, maybe we could simply avoid cancel_work_sync() in emac_down()=
?
>>> emac_tx_timeout_task() checks for !netif_running and does nothing if
>>> already down so it should be safe. The task cancel_work_sync() in
>>> emac_remove() does cleanup on unbind so the task is not leaked.
>>>
>>> This seems to be the pattern in other drivers as well. What do you thin=
k?
>> That was my first thought too, but I'm not sure netif_running() is
>> enough here. emac_suspend() calls emac_stop() directly, so
>> netif_running() is still true and a pending work would stop the device
>> a second time. And since the netdev is devm-registered, emac_remove()
>> runs before unregister_netdev(), so the work could be requeued after
>> the cancel there.
>>=20
>> So we'd still need to cancel it in suspend and remove, and at that
>> point resetting in place looks simpler to me. What do you think?
>>=20
>>=20
>
> Thanks Troy, Vivian and Andrew. I'll drop rtnl_trylock().
>
> I think a simpler approach here will be to go with Vivian's suggestion
> of dropping cancel_work_sync() from emac_down(), and handle Troy's two
> cases by disabling the work where the device is stopped without the core:
>
> 1. Suspend: emac_suspend() calls disable_work_sync() before stopping
>     the device, and emac_resume() calls enable_work(). So the work
>     can't run while the device is suspended.
>
> 2. Remove: emac_remove() uses disable_work_sync() instead of
>     cancel_work_sync(), so the work can't be queued again before the
>     devm unregister_netdev().
>
> For a normal close, the work's existing netif_running() check is
> enough, because the core clears it before calling .ndo_stop.
>
> With this, nothing waits for the work while holding RTNL, and the
> work doesn't wait for itself.
>
> v2 will have two patches. First the TX timeout fix (reported by Troy)=20
> then the suspend/resume patch, which will take
> RTNL after disable_work_sync() and before the netif_running() checks.
Sounds good :)


--=20
Troy Mitchell


--4b60170ac85986e157bd72089ccd51b2afc8a5789b706b54e2b49f94448f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavXRuiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/PdwD8DO7z3cbgb16T
doImdDC4h5bI5kgpf0udTdwgsfv+jDgA/iBx0Shg3fNGZonovHhDnPSigl1PzAZx
DoQpm0TbFXIC
=2L/5
-----END PGP SIGNATURE-----

--4b60170ac85986e157bd72089ccd51b2afc8a5789b706b54e2b49f94448f--


--===============1517741210154777204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1517741210154777204==--

