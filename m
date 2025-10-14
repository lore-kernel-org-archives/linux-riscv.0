Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A964CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izVjhWYt976tZ9uovHY5K7lZoPijeH1zStnDfJ8LKOA=; b=bhNXb8896HGZi4ZK2Q/Ui+LmNy
	yepZECcVkplte9zboj/akPgJfaH2HaW6P1sIeVTtD4Neiy8H+HunqeKEFOXHrvH5HIwiZPHhxSYqy
	lpWWpOmLQt2qTulC0gv3voHIF8SPVpRm9MjKwh5tujulX6PULYZME2/mHvSsUqHi/5oNnTcDFH5ZG
	n7x/ACcN+RzFZfTIZ5LuI3GLMO7ky3puld+/Wef04ethdFQU2LR4U2edD4ehPPLxP6YC1vQdYwWqd
	wC8Jsh37PCMrq8pOdrmtUsDVm/rIjq5E82gjYX/Xt1GA2VXBovHoLhCEBXeGeRHT7SDJtRbhBNxH2
	viEf0EYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8j7W-0000000H6mK-19ic;
	Tue, 14 Oct 2025 17:47:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8j7T-0000000H6lr-35dY
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 17:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0091140BB6;
	Tue, 14 Oct 2025 17:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6666FC4CEE7;
	Tue, 14 Oct 2025 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760464050;
	bh=OC84EuBFP9yfoy7CzUJOQryfa1blEGQPmqdzo1E57lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KASKeYjVUTH3PqDcchUO7bZMufvM0SIz0SRz6YfNNx3+DP67690bNiCO70/AdPkoS
	 RYDN9GDYn9/g/fAtEPGeitem5XDOAEGfW/2NoP2fbrP5Oo74eQOPZq47E1+/YqdiOs
	 lZb4dqnG87/WhJM4y6/k35RpA200Dtq7z9c0rH0WHrgBQlP8kfLd3M6FfFLA3iln17
	 RQxmvOPgAWayoDtCYuTYw6sTrcehXuLLF2yxXVnmt9UmH4mLRymFlmNizDTPEUmCU5
	 IGqMYrZhj+kag9011XEm5zKgxk8Bspm8jyTROMIVUi8CuEUDq+0r7QKiWp8lVXPRi8
	 5DRTSWwpgKgqg==
Date: Tue, 14 Oct 2025 18:47:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org,
	Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>, linux-riscv@lists.infradead.org,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
Message-ID: <20251014-coma-zeppelin-56256bf7e3e6@spud>
References: <20251013111539.2206477-1-lzampier@redhat.com>
 <20251013111539.2206477-4-lzampier@redhat.com>
 <20251013-trimness-stainless-48343053f204@spud>
 <6b7c3c90-d3bd-4d75-9cc0-74d3945fbdfd@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <6b7c3c90-d3bd-4d75-9cc0-74d3945fbdfd@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_104731_813871_93C6CE56 
X-CRM114-Status: GOOD (  28.75  )
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
Content-Type: multipart/mixed; boundary="===============8379993229652397341=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8379993229652397341==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eck5RHWSnCUGqPAQ"
Content-Disposition: inline


--Eck5RHWSnCUGqPAQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 05:14:17PM +0800, Vivian Wang wrote:
> Hi Conor,
>=20
> On 10/14/25 02:30, Conor Dooley wrote:
> > On Mon, Oct 13, 2025 at 12:15:38PM +0100, Lucas Zampieri wrote:
> >> From: Charles Mirabile <cmirabil@redhat.com>
> >>
> >> Add a new compatible for the plic found in UltraRISC DP1000 with a qui=
rk to
> >> work around a known hardware bug with IRQ claiming.
> >>
> >> When claiming an interrupt on the DP1000 PLIC all other interrupts mus=
t be
> >> disabled before the claim register is accessed to prevent incorrect
> >> handling of the interrupt.
> >>
> >> When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
> >> the enable state of all interrupts is saved and then all interrupts
> >> except for the first pending one are disabled before reading the claim
> >> register. The interrupts are then restored before further processing of
> >> the claimed interrupt continues.
> >>
> >> The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
> >> SoCs using UR-CP100 cores, regardless of the specific SoC implementati=
on.
> > Why is that? I expect that you're doing that intentionally given the
> > ultrarisc employee listed as a co-developer, but with only one SoC using
> > this IP core it seems possible that this bug in the hardware could be
> > fixed for other SoCs that are built using this IP core.
> > Is there a plan to, for example, change the core version to UR-CP101
> > when the bug is fixed?
>=20
> I originally proposed to match on ultrarisc,cp100-plic under the
> assumption that it would be the case.
>=20
> Furthermore, it is my understanding that if the bug is fixed in, say,
> UR-DP1001, then the PLIC node can simply be
>=20
> =A0 =A0 compatible =3D "ultrarisc,dp1001-plic", "sifive,plic-1.0.0";
>=20
> I meant my reply that I had assumed this bug was associated with the
> UR-CP100 core, but I should have stated so more clearly.=A0

Ah ye, very true, could be done that way if there's a changed version
that's compliant.

--Eck5RHWSnCUGqPAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6MrQAKCRB4tDGHoIJi
0lASAQDunHKDUhoLhTyJvT7pkWAOan78lbIL/4qDP7M47VuIvgD/U4EAlAQLiNV8
FsdMjrvL/8CLKBVSBkHa1eYJxzoq4AY=
=LWPz
-----END PGP SIGNATURE-----

--Eck5RHWSnCUGqPAQ--


--===============8379993229652397341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8379993229652397341==--

