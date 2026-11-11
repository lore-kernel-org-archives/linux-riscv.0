Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A34606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 01:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=soixyxTt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Vt/70HQd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jes30UfccwKN00NI64pyIXeLqwbfgMSVwIA4sTJjuOc=; b=soixyxTtjJoTCG3wJdpafe5dZN
	oyDw/tB3wMCicYm/uBB21fDAfiPmkWuUSh5lw2B0nDP0sIu0LqR3ZFFOHDVct0zTw14gSRbrwBFIh
	703L8n542jHLbMNx6yecb9vaEwvBQnBMs0mdimAioHiYpe3PJSqFzOyZiBeS8J46F7aKB01zwyxJ8
	/SdPOxDvTDTVj+35/6UnAasM4b8ouvuorujs/QCXzrBgeTYazow0bdDlgiOOR9dn3ds/UnFhSxHa2
	NNwDcCvvVOTjXaWGy+6UXrG8Cd83ZyxF1gOX1xWQMEGa6BX16GnEvBIv41uKFPoLDm0Rke+YXdi/I
	Tc8UM5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwy1-00000005MUk-0MLV;
	Wed, 11 Nov 2026 01:17:37 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwxw-00000005MTt-0HSz
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 01:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794359806;
	bh=lM7X7fxngXPk+eDICso8sUtsp/OwQONHWclMf0C8lHc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=Vt/70HQdVY+paZcPt1cDcawCd1TkEK6nCXrWfiD4DpmQISy/xcMds3zmrUv/CSBYr
	 c3LKaCYBHBdUORt9eWfpbsTZq62h18ZFJS3hlVUbEo0Dz9jPKuU+vW8aKxdqzxxW9F
	 UoHezvI3o2a/mt3HrM636+01tkk5jOnzbMiw1FQo=
X-QQ-mid: esmtpgz14t1794359799teb8f1d41
X-QQ-Originating-IP: +kWDJtfHflgoOFufqb5Vc65dmmJeFNZ5FXCZp5/CqWE=
Received: from = ( [183.48.246.46])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Nov 2026 09:16:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16278285784164575929
EX-QQ-RecipientCnt: 11
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Nov 2026 01:16:36 +0000
Message-Id: <DMRZGMGRLD4S.KT6VEU28902E@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Sebastian Reichel" <sre@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "open list:I2C SUBSYSTEM HOST DRIVERS"
 <linux-i2c@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>,
 "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Anand Moon"
 <linux.amoon@gmail.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261110061429.2036-1-linux.amoon@gmail.com>
 <20261110061429.2036-2-linux.amoon@gmail.com>
 <avOL1mCkI4YSaDeO@aurel32.net>
In-Reply-To: <avOL1mCkI4YSaDeO@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NL3fB1gebWXoD6SwPos3DavG4+/U/Hq9X0DSCCB6vebTon8xktnh62yd
	qvB+PSzAM/40yzcvXSvzLfrXAeCUQpiAShEBkdXJCo9Ff/fcYYUWVxFa6ovCSU1DKcy2Vgf
	ElJV+07G3N+wk2fxX8Mo/Z6J9Eg997xRJahsJLxXK3O5Hgf40xRoP1MwEuuDcoNWZ1IpxNC
	Cpl16bep2gosSlEUYaQ62tcBqVxS0n9PAY766kRtpBuTiBpzaarTYLImQ2o2W+cmFKGdAXj
	Y1ipN8rN8TBskpkQqlDk+wTRmuKopyQ1IAHdRm/nS0qqePu0i5bZ3ZcRYKTJyPQOiJ1JWLK
	WFhG6/HjrDmRFl7XoQR0AH8yfLAB6Qgv+Owq6cvEfTrid9/oP/kFLH6lKD15KHaoFeYBrSA
	hzFjBNRF8ExFolTiq9+N7EM4/yDw1cjr7HlIBWMh0frH+hlR7/T4yQJznZVnVZfTLVxfgcE
	3pobZ6wcze93ErX2joI1FAg8eiZUpUgq9gGxJ/PYd6gU83vmzcrdhGjeo6le6IbfSI50Lsp
	yvJbNnqHuw0KSSDfaNpIOqtLNamM2E0IwJbSvJHe2m3OA1Lrzg+LvBhyitA8Zyry13Qvgth
	P7RhZ4oD6Vf5mn43N7ucLLppXgwTVnqoaa6o02BjouqC11D/TWVo2V6MZHUYATkx8wYR4yk
	aaYhEOY4qBJB7XP9/DkH8Jkh54+LXGhE0bO0zKD3w4BQHlvy/8if9Wn2jEacqw+sYTi5uOd
	L7EkqdnrwH0mp1xQ2F1i2CIW5CjPiMtzKrcYXxmVdxlcYBDxBqLCfJB2oYGCbDAOIzUwFt8
	8nqMW4aG0fO5fqJ3wkAGZybOX1C0SpADqJPw//SsusYIIEkRtA1ok8gKOJh6jrgtYUUmWAM
	/2+HhXaFy2o7QKnza2hmJiEL5J9Jh08PLWSvXjSPuayBFVIVAf1kByEN66Ycvh31lBE9imc
	H7z4jaNC6XaxNQFHueFFBeVXz8Ms1O1fIph7B1DVdStft9tSFJ5P28Vks4A9nZfM7Vy9FRI
	OQqUqMIQB4DEo6fgPlQrx/9DQLPsfS1unLaMleCv+jHPdvsewqnyRvQSGPScmMFTH/ScEpk
	ETLXVJ4KBuJfucAXJfhJkmYsDc65Slla4/YKekAG28QbYbU+IgEgpI0rEx4bq3bntYJpv+n
	NO9hwc904o+qMkp1Ypm+SvtBDkzr6RVDYzrL
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_171733_004284_19822746 
X-CRM114-Status: GOOD (  19.40  )
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
Content-Type: multipart/mixed; boundary="===============7681805715097003372=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7681805715097003372==
Content-Type: multipart/signed;
 boundary=11646ab292b69992658ecbc426bd320fb3756d48584897919a6b53c3f3eb;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--11646ab292b69992658ecbc426bd320fb3756d48584897919a6b53c3f3eb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Aurelien,

On Tue Nov 10, 2026 at 9:25 PM GMT, Aurelien Jarno wrote:
> Hi Anand,
>
> On 2026-11-10 11:44, Anand Moon wrote:
>> The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
>> to access the PMIC. However, these handlers run in an atomic notifier
>> context (specifically within an rcu_read_lock() critical section), while
>> the I2C-backed regmap uses a sleepable mutex.
>>=20
>> This triggers a "WARNING: suspicious RCU usage" warning due to an illega=
l
>> context switch in the RCU read-side critical section during shutdown on =
the
>> Banana Pi BPI-F3:
>>=20
>> [  563.803475] WARNING: suspicious RCU usage
>> [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
>> [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in =
RCU read-side critical section!
>> ...
>> [  563.841445] locks held by shutdown/1: 2, last CPU#0:
>> [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:=
4}, at: __do_sys_reboot+0x230/0x29e
>> [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: at=
omic_notifier_call_chain+0x4a/0x1c2
>>=20
>> Replace the regmap operations with atomic I2C transfers to avoid sleepin=
g
>> in an atomic context. Preserve unrelated register bits through
>> read-modify-write operations and check for atomic I2C support before
>> registering the handlers.
>>=20
>> Obtain the I2C client from the parent device and verify that the adapter
>> supports atomic transfers before registering the handlers.
>>=20
>> Tested on the Banana Pi BPI-F3 (SpacemiT K1).
>
> While the patch looks correct, I am not sure this is the correct=20
> approach, as opposed to the one proposed by Troy [1].
>
> Indeed bypassing regmap and using i2c atomic transfers needs to be done=
=20
> by all affected drivers. For instance the VisionFive 2 board, which use=
=20
> an axp15060 PMIC is also affected by this issue. And the corresponding=20
> driver is shared between architectures, which make this kind of change=20
> more difficult.
>
> For the BPI-F3, note that with OpenSBI 1.9, the reboot is handled=20
> through the SBI SRST extension, preventing this issue to happen. On the=
=20
> long term, I am not sure we should keep this driver.
>
That only covers restart. The SBI restart handler is registered at
priority 192 and runs before the P1 one at SYS_OFF_PRIO_DEFAULT. Power
off is the other way around: sbi_srst_power_off() goes through
register_platform_power_off(), i.e. SYS_OFF_PRIO_PLATFORM, so the P1
power-off handler still runs first and still hits this on shutdown,
even with OpenSBI 1.9.

So until this driver goes away, BPI-F3 still needs the arch fix [1]
for power-off.

Link: https://lore.kernel.org/linux-riscv/20261104-v7-0-rc1-rv-dis-int-befo=
re-restart-v5-1-956ec09c900d@linux.dev/ [1]


--=20
Troy Mitchell


--11646ab292b69992658ecbc426bd320fb3756d48584897919a6b53c3f3eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavPB9CEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9XhQEA+/SZQ0K1nCjc
8q38r5D4Ar8hTMv6yyEbHYBA2OMfpHUBAP1Swga5o1WjexDHDtlaytztw5gGTAjg
LybIUoMHS0wE
=4Yt0
-----END PGP SIGNATURE-----

--11646ab292b69992658ecbc426bd320fb3756d48584897919a6b53c3f3eb--


--===============7681805715097003372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7681805715097003372==--

