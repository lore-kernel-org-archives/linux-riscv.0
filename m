Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B37C61DF0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 03:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrpFbVbgxcKJEuviNsLAoy1aly8P+mDWg5fBtqRN2sg=; b=RwM+auT2yGg/xmc1Vd1+k9qDd2
	oK76iGzD1gEN+w6soc0nPj/MrF6nolCDlfumWT5r06IYHcD4ptAh5HA+tkQtlvTrnkD45OZVURQTD
	7R7a0QxhyaUmK2NQnNUdoOXE5K3mTD26af1XJ55x4qR1p42GIhF4MvCEmc0bDZ0Ast1yYfDZopg3q
	HTgFz6AyI89vO//YD246i/xLqJnyu0TJES2m8h0SfXsS8CWl/q1XzqI/Xmb1urrBGai9/MTgMXgrr
	Cj40ryFuFESkboYXliFqvmmBJQRsAmzd8dRSP+LH1qae9ac5792zJEGBLI/R1bdbIjqa2Zd3s6ZVC
	q3tdFMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0suc-00000008QL4-0yYf;
	Mon, 31 Aug 2026 03:42:22 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0suZ-00000008QKQ-42BL
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 03:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788147655;
	bh=NnwaB5ujAvJmVoXXw/A5RDLqLJgznXnQE/ZxtU6ybE0=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=tJdo+P4bteT6QNe+TC6tuV5IRXcNloTr6yWzob+kWIjG7KRb5KUmJWMoFatvadzci
	 nCoi1B2P2VPMeQ1zzZRfiI9bo4M0O1LhhWK+oYSYzrRNYcP1h7QTZGOCHSAC7tIl7p
	 ldjAv7INtpq3FSGJR5Q5sMx24C7SBhU2V0WPwdr8=
X-QQ-mid: esmtpsz16t1788147647t12fcc224
X-QQ-Originating-IP: r/8jVrT4i8gNmZxm/dFB1QWDjJiD0EoKNYpdcbUmelk=
Received: from = ( [183.48.245.118])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 11:40:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10785841376019705639
EX-QQ-RecipientCnt: 17
Mime-Version: 1.0
Date: Mon, 31 Aug 2026 11:06:00 +0800
Message-Id: <DL2SP646WOSO.2762R9GD5RXSI@linux.spacemit.com>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "Yixun Lan"
 <dlan@kernel.org>, "Inochi Amaoto" <inochiama@outlook.com>, "Alex Elder"
 <elder@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>,
 <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Subject: Re: [PATCH v2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com> <apRncBmtm7w0Emwf@aurel32.net>
In-Reply-To: <apRncBmtm7w0Emwf@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MZz3ry4sOE6iJ8ue5OroegOa9Mt+qn2PMDOPx4UPPiEAwFIK19oP6j6P
	nNmhYBqaLou4E9UNPvV7sxXt5lNqYPA2pjVsovjOIdykSPrJkIQmKt5Qv43pc9897+aXgJF
	y5Ni2e/2MHjYURWR1HacxzKNfxu0B8jyyFYK7GVCXnbME5fVyBXV+Gthlf1P1gQ/iqVkYpf
	FPclvvgtYYqGWTghkqs44GAT/TDsp/CQ577liZdjWYPOz5F3fmdMQwKszR6gTsbRTmsLb6s
	U9WYoKb0K+JU5Nq2XH6+zaAfER5S8i+AV3xqvogtAj2UbLe9oZSrjBsrB0ys6JTTf/7hD1l
	i4Ux7NExmgrCcV1tKoq2FFbGmZdka9P2pm6fTYIFbLHE1rM5onvWONwWtxzU6iuWIV6VDSq
	0z71eioFHz2FRcGOIWwf6scqvhvFJZJIBfZMtkR5qLIxp/7EEmrJTmQqZ5bSi8wBAveZf1h
	GECGZyQW7kplroog8dFig0smnhboQh26AZuXRoF0Ker42ZaRj2ux6Cl5SFemH25A4IfuIGO
	BYIeYoDAkdobjjy/xXHq31yt2yatzMJZ7OUfTBgxWVcUIC2Pbr3IDiLwjZHH6qhZ0YQEEgV
	F2BUk4BDYFeJ8/GCwsDqZdwA61fIbEpZDTD30VDZeVg8edzo+8J9l0XU9AMKqMapA+ZncgS
	B8/Vowlq68/G310LxHdYRew7f/keMdq56cm0AMXFBrEIQOYLxEHeMeZKRSeZB85SjgjiSTR
	yb4mC7uGqZL8LSjd1kAKmAioAqLtzwL6hzt3/JL+GdJp1kb1NiPom+qrgpoEiQ2nUEPKtNE
	s1Hz1UDAgHVtXKW2GUMxTqzcDqtTaAR4C9yU2JKTGghTkJTQ97uToclWg0PMg94HMj9MLrZ
	qARLYYB4dk5ZdIvAIrOB/HYgVvn8VQ45B3FzaP3wTXsJmg+KGyJ4y3QtAjTcdQwtf9/0eC3
	6Qy+cvxN+9vGs53mp3CL6VOnXk3m4XflRqW/x+BpnYzz3fKf5ifF+5j39ffB8sJVYDbuvyv
	EfiAtaWma7sUOUNcyr/vcx5z4JrmLxVPIW84yTJgcP/pFos4zOWCH4RknulSKcRDwo8m5ac
	hpI0ILFRU9XlLKxC0z1CCdCggiQyhnPehUDcljOTLFeTR+N9B2lOpVxlcoFHdr7UoiM/sd9
	dH/r8mknnQ/VCP1wVlivDgj7TYj6Nqg5XRuZ4JOJcKhvTACKBvMyYMbxINNzECPOzwuv
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_204220_299179_2E1658A6 
X-CRM114-Status: GOOD (  12.47  )
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
Content-Type: multipart/mixed; boundary="===============0822751491865549083=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0822751491865549083==
Content-Type: multipart/signed;
 boundary=76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Aug 31, 2026 at 1:25 AM +08, Aurelien Jarno wrote:
> Hi Troy,
>
> On 2026-08-10 16:46, Troy Mitchell wrote:
>> K3 boot firmware configures the C2 and C3 CPU clock domains at
>> 1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
>> currently contain only the 2 GHz overclocking operating point.
>>=20
>> Add the nominal 1.8 GHz configuration as the first entry in both
>> tables. This lets determine_rate() and set_rate() select the firmware
>> operating point while retaining 2 GHz as a supported overclocking rate.
>>=20
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> The related U-Boot change is available at:
>> https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b=
5a1b3e5cbbee223faf352
>> ---
>> Changes in v2:
>> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>>   will be handled in a separate series.
>> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>>   patch.
>> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
>> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-=
0-a3a75866ce32@linux.spacemit.com
>
> This make sense and looks good:
>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
>
> I wonder if it should be backported to stable, as users will deploy=20
> newer firmware.
Yes. I'll Cc: stable@vger.kernel.org in the next version.

Thanks for your tags.

--=20
Troy Mitchell


--76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapTvmA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvQDIA/3RL7VXwzHuHjnzdOwa1VtWuQpzXbNq9GItBdCdH
0H0gAQDz6KseX2X3tpAb+avR3WoWXHlYlpXdXrZQ7y29Mk+zCg==
=sgJs
-----END PGP SIGNATURE-----

--76c5c7c6483ed5fd9eb1e185aa1b9ece1314890f287a7c78af87385efe71--


--===============0822751491865549083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0822751491865549083==--

