Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0675C606A88B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VV4AwwWp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZFErvSkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PqEmXvgjMA9Reyz0zdBJtALxXRClMVqGah7xEc1FKGM=; b=VV4AwwWpvhcGSoLPlynSb364J8
	ui84m4PIpks1ycleGsOHZDenzy8Raq7KLuAv8NNjqp175ADAgUUhlZITpB0k7mi7nTRqScfM/iWLK
	HpOhGiCXRXBsso9VeJtw3KaLOHCVx5rQZkmxYf06C0HH7A3uYwYGncBYlQkq/P/fKswTSWCBRt1Td
	SH3FdMGhWMv2IZNN9TkYOtIsAV6NvUcbhV9e9mG0FYuMJ6vn59FzPahtzSus4ADHhSnqpOtzpSVJN
	WAxmqrJhrEkGj15AwYeRI199I7xeIFWvOIoE9MMped6D+fRSxajEhoWfvAUSxiS77l6+/8fQ2oVFy
	4hdQQqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmpd-0000000C6Tq-3kVG;
	Fri, 13 Nov 2026 08:40:26 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmpT-0000000C6OF-3R0k
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794559203;
	bh=6WNAQRBi98h2rRNmIF3+dEJhZIMUbBlpuSNyCZ2B0FQ=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=ZFErvSkUbS3LmhGaWhpJdq1IjdBCSR/6zPNUAC3l+L0tLTKOqLVM6BDnx39jwwaXY
	 yb18dmnqL8hPJ38VzHXpPWhQde0QBNGpQGkUQ0OIoAEqZcctjHcsEFVUPh2BuQ5aav
	 bP2CX4hsWCB6zMe9UQMKazg4kRB+RCBkG9QzX2Fw=
X-QQ-mid: zesmtpgz9t1794559202t4bdadd69
X-QQ-Originating-IP: Ipks7jxgs1sprA9x/MuqmIpTxP//z84Adf3qIwSonO0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 16:39:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7073859681775993480
EX-QQ-RecipientCnt: 16
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 13 Nov 2026 08:39:58 +0000
Message-Id: <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sarah Emery" <sarah.emery@canonical.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Guodong Xu" <docular.xu@gmail.com>, "Yangyu Chen"
 <cyy@cyyself.name>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
In-Reply-To: <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
 <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mrv4zYML0Tu4yumLMt0nupP/qBAqfxMj8/Fw8NU3nD+/lmX5NHUiHtFo
	38UkHWXQGKC+7IZix+ESGTLRL+14d0shIfwLfjCZ3QBWC4yjmRSEVYpJGtUIsyvJXvUQgzw
	EJ6tDA4zoc0jss7bo30jkHEkl0f4XO4kAvKxNg+cO6M4m1084C64NLTg0RprcQ+1lmRxBx5
	6jc8TDnMCrNK7hV0DW9WCEY7sLh7EBRTnnfXLzHVGACHHsW7f0iHW0botrE2nA8R5gzi1Yc
	31OjCN2TEyDHU8QiciuvTmXoRJESz3JOACkHE+jluCG3EK6X7JwQ5d3OKRxduRvgytujNmb
	nko1nlRCZiAubc2c6Q7H1VvQyMKIkPLTuSCDxE+XI3xfVZUqnCMXGfmgTb08uU7DHDrsHV/
	U5d8x2R/wF9h4/7bOEUEo2CePCOrHI5ET2l9gDDTe1CLhkMzwgK1VWyxpC501FtK0Mh8DZs
	Remhb9HwZMfnqQwxiIz/r+TG9S7nbyQDpfSmvz02GjyCBA8eBsjWkCFNlaern0CCAYvw3qb
	OgTZ1Dd81nixqOXb0lp6kSErVx04qoOqjWYFdS3KpI6yy22tqxdlelmRC6J5UWdBCLRI4aK
	z9pmP2/EyGkXLe1+lzYyjWJS1ApzCg0I40fW32r2bW3WoTI/vURah7orc7j4Jt5tDucAdxW
	tu+smF3Tdrn7SKG0A4ijHK+SOgrIH0COn/VXwzEhJgrhFpiACVaxiHBySPMkVCNXKjYN5AU
	ZIbiWseOxqILhL+ClVKyod1ogvgJLiS8lDSEQfuABC7jJhxUjhaQcH5JJmnmtp9njQq+05d
	VIMmDToBcDOKpfQlVI62hnEjs7EVj+0/mA6qIwBcILn5MXJPFE1MH9FEMhnCV8MwMcaCKNf
	OXdUjryQxU7ipzeeGjBzsxK53Z2NmNOK95xCUGC0LXuUm9ovqE3ehfMi0ArBbeeIBZb3bso
	14xrOrq0xwg2FgS8IypoFxiwhetl4wrhfccIXNiXWK57eTW5kE008g80Cn1JzyPM0e26Laz
	h+N2+BcrCrXyjiXKpeaZYlgNTQb8k+IQFqlZ3cgG+lovDvooVLxyQmtSPlm9IXd3uVs/N+a
	4fiEtxPbQ0mzXVMx76Vm4dRzdXEGvVSi86wXVrZXLh4
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_004016_647656_F2AF8523 
X-CRM114-Status: GOOD (  17.13  )
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
Content-Type: multipart/mixed; boundary="===============4649732497355610544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4649732497355610544==
Content-Type: multipart/signed;
 boundary=75fec2531929259e420737857d2eefd1ef8c8ecf6776076da3f66f382a1e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--75fec2531929259e420737857d2eefd1ef8c8ecf6776076da3f66f382a1e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2026 at 01:46:28PM +0100, Sarah Emery wrote:
> My understanding is that the nodes from CSB1-N10SPK3, the "K3 CoM260 TQ"
> and the "K3 CoM260 IFX TQ" are all the same: a "K3 CoM260" module on a
> "TQ" or "IFX TQ" carrier board.
>
> Is there two different carrier boards name "TQ" and "IFX TQ"? Or is it
> just the same thing, called differently in this patch and in the EEPROM?

They are the same carrier board. The only difference is the power scheme
of the CPU clusters. The bootloader programs those regulators at boot,
and upstream Linux currently keeps the voltages it leaves. Support for
the regulators is not upstream yet, so the two boards cannot be told
apart in the device tree for now.

> I'm not sure how devices out there are referencing themselves. But if it
> is in fact one device and the EEPROM calls it "k3-com260-tq", this patch
> will not work for device-tree matching.
>
> What do you think? Can you clarify the situation?

You are right, thanks for pointing this out. I only had an IFX TQ board
when I sent the series, so I did not notice that the TQ nodes identify
themselves as k3_com260_tq in the EEPROM.

I will restructure the series as k3-com260-tq.dtsi holding the shared
carrier description, with k3-com260-tq.dts and k3-com260-ifx-tq.dts on
top of it that only set model and compatible. I will add
k3-com260-tq-power.dtsi and k3-com260-ifx-tq-power.dtsi for the two
power schemes later.

Yixun, what do you think?

--=20
Troy Mitchell

--75fec2531929259e420737857d2eefd1ef8c8ecf6776076da3f66f382a1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavbM3iEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+OFAD8DkzKg77z108s
t6A5affx343Q8qDBLdDgmzx1/Gg82koBAP6j03pnTUgvYXaOreMfsh84OOdsFZp4
i2lB8WgqVg0B
=mVsV
-----END PGP SIGNATURE-----

--75fec2531929259e420737857d2eefd1ef8c8ecf6776076da3f66f382a1e--


--===============4649732497355610544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4649732497355610544==--

