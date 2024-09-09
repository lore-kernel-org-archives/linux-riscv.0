Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94ABECE57A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 12:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqlhL2G3fZ8JNTjdRhRqSiqkvQvwjSlNhGXuUOOSZJE=; b=RJ77kMBbKdTFJtPuYGe9ZhfA7h
	V+VCgcBxSCyZF8/2C5SzCT+1nL11kexHniGcKp6i409d0jvu2rV7Mrcc0qH5teGx7OyNEvsNGvNPG
	EexDrnS0zHF1h8/PKJEOSIsPES5kDqV73v5XqPivQR7kLUidBP24DqPqICQSg1rmc4TG9zSNDvB88
	Mw3zH6gq0pcNQI9HQET0RdJGN/mvQrNAqfkuTF/Ok7zcS7uyjGPXjvjsVgTJzwB/IH5725R2OJnfV
	RCD8hMAJhTp0sdoajyipCWRBn78mKRqLR5LmQvVG8GMuVmINcFCgdxqbTAbJE39tKT5NTvshj3/mz
	mzJJLkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndnT-00000001uDc-0qK1;
	Mon, 09 Sep 2024 12:47:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPa-00000001dPw-2WeU
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725880707; x=1757416707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JgQPE6MdDDcEkxERq/X73e5GlAI5lk2dHeZ2yxI4FaY=;
  b=I/MpHrXw55qV98S5GtmI3tggY4ODKoP+JFYCham7lCNaAMsxnp/XMjgy
   GzXki/7F1gW1+7prz+xHGQwwx7Ds21sqekbCdUU1cqPe+guX39XQeHjcX
   cEmqshmmemDtedhMV34AkhP4AUc4z4GJ8sFodGSZu7sahhyYlN5j/5OL7
   QjjXtsh4uZQxqP9l00bUgILK2Jj7ch3lg7tqDRyJTjbGde2EbCXUn2Gdr
   iW/Ie2kow4Tegz5mN3WnTd9b6KFCIO4H1BvagE9hSz6dPJHSh4deC3qRC
   KLXUnx5Gg+bsYBUP/TWtGi6fbcxZQ8O+A54wrsOGMbSYxZrHzoW0JV1AA
   w==;
X-CSE-ConnectionGUID: 0kZpW7rxQG+yf9Z5H3y6wA==
X-CSE-MsgGUID: v/vNzzZFT5OcLwxWDqcaiw==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="262476603"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 04:18:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 04:17:45 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 04:17:41 -0700
Date: Mon, 9 Sep 2024 12:17:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: WangYuli <wangyuli@uniontech.com>, <stable@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <sashal@kernel.org>,
	<william.qiu@starfivetech.com>, <emil.renner.berthing@canonical.com>,
	<xingyu.wu@starfivetech.com>, <walker.chen@starfivetech.com>,
	<robh@kernel.org>, <hal.feng@starfivetech.com>, <kernel@esmil.dk>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH 6.6 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
Message-ID: <20240909-wrath-sway-0fe29ff06a22@wendy>
References: <D200DC520B462771+20240909074645.1161554-1-wangyuli@uniontech.com>
 <20240909-fidgeting-baggage-e9ef9fab9ca4@wendy>
 <ac72665f-0138-4951-aa90-d1defebac9ca@linaro.org>
MIME-Version: 1.0
In-Reply-To: <ac72665f-0138-4951-aa90-d1defebac9ca@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041826_674175_7FE42319 
X-CRM114-Status: GOOD (  16.49  )
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
Content-Type: multipart/mixed; boundary="===============7700731227482952592=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7700731227482952592==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mELJ3Yv+VzyNRPTQ"
Content-Disposition: inline

--mELJ3Yv+VzyNRPTQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 12:38:23PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2024 12:17, Conor Dooley wrote:
> > On Mon, Sep 09, 2024 at 03:46:27PM +0800, WangYuli wrote:
> >> From: William Qiu <william.qiu@starfivetech.com>
> >>
> >> In JH7110 SoC, we need to go by-pass mode, so we need add the
> >> assigned-clock* properties to limit clock frquency.
> >>
> >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> >=20
> > What makes any of the patches in this 4 patch series stable material?
>=20
> That's for stable? It needs to follow stable process rules, so proper
> commit ID.

[6.6] in the subject and Sasha/Greg/stable list on CC, so I figure it is
for stable, yeah. Only one of these patches is a "fix", and not really a
functional one, so I would like to know why this stuff is being
backported. I think under some definition of "new device IDs and quirks"
it could be suitable, but it'd be a looser definition than I personally
agree with!

Oh, and also, the 4 patches aren't threaded - you should fix that
WangYuli.

--mELJ3Yv+VzyNRPTQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7ZNAAKCRB4tDGHoIJi
0jKnAQD40YnduJKErP7PZ43RAIzAUaKKk6GGIuU8UeCorPAtcQD9EJOR7mfJdlSP
KuYQ2DA4cKmdVMLXWcBOhMbzNUVxuQI=
=gS5N
-----END PGP SIGNATURE-----

--mELJ3Yv+VzyNRPTQ--


--===============7700731227482952592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7700731227482952592==--

