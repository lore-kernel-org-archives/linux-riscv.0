Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8086E82CA0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16DhsSVwbTs0oJoji4nJy4szZbmxFx4PPzqhqqSO0Q4=; b=l26f6WLhZoQsbRoJ/mWeJuSeKO
	csGY1BNGQuA1v9sPgSGcueOgKwqDbjMvdZGE6anGPdBCr17zxcxp04N2y3yXRVV3KjSz4A4yb0KJw
	8YuOB8OKxY6n40V56GUZFGpkUugWP4kvUS4kuix4WloJi2TYyXVLI0hsnHOmZuNH3Hl+hRFOlHJCw
	Zm+L0G+iLVaOxm0+zMe7uTSmSUE/BcsXKN+YoKKZ5R0Y6BtbBUAG7wyo7AiGUkGH+ueq9zfQucNcA
	82iC+YCEfFyqz0LOcaZYy7V93y2ZxJd0C9hhq6t6Dco4AU6p0uS0lnaXjdlYp7mGYxD5DuoR15sjk
	4pnMXUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVnI-001A5Y-1Z;
	Wed, 27 Sep 2023 14:45:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVnE-001A48-2R;
	Wed, 27 Sep 2023 14:45:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 89721B817F5;
	Wed, 27 Sep 2023 14:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4E7C433C8;
	Wed, 27 Sep 2023 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695825933;
	bh=u5mSK+ETqJiKORZJywzslvagA7g/tSjSxUTNQ6vOmcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7rMseEE9HGEpW+317qdYZUAuRIVkN72nhW/YDjgrNoY+f/EpZ31mTeCmKgCbLV1F
	 4zX5Mhm7n3HumvTTiJGm9fgQckcOw6lEg6W7ns2XTshG2VSkAR8fgREeYBgmOOZOme
	 T19mfTu1SGJS/hE0pfDZU4kbfCKNVSFGPhMLghB0kvaqhM8ZOGspji6+IoRlXpV0kS
	 NGuOYyK+bPo5UNf0JpWoZw1nxS5cYihIWATMpx+tv59rl7Qsimjw5ypD1haDdrl/Mz
	 +rLlQ6tcbrHpsZ1Lp1nXc/KY+jHuWWfzw6ZbzWRDRm4grJhGVoZ3xJx3BrvqOBNhC/
	 IdVvZtUfNHigA==
Date: Wed, 27 Sep 2023 15:45:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/9] KVM RISC-V Conditional Operations
Message-ID: <20230927-snowcap-stadium-2f6aeffac59e@spud>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925-gorged-boxer-3804735e2d18@spud>
 <20230925-reappear-unkind-7f31acdd82de@spud>
 <CAK9=C2UBgNWFTdQKt29+bNnWDgHZGd5fU+oP1bqsarkqc5+jgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2UBgNWFTdQKt29+bNnWDgHZGd5fU+oP1bqsarkqc5+jgg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_074537_090551_A0AA4666 
X-CRM114-Status: GOOD (  26.54  )
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
Content-Type: multipart/mixed; boundary="===============6773576134328505211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6773576134328505211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iiRtwGBozE76B1Lv"
Content-Disposition: inline


--iiRtwGBozE76B1Lv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 07:54:49PM +0530, Anup Patel wrote:
> On Mon, Sep 25, 2023 at 9:07=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Sep 25, 2023 at 04:33:15PM +0100, Conor Dooley wrote:
> > > On Mon, Sep 25, 2023 at 07:08:50PM +0530, Anup Patel wrote:
> > > > This series extends KVM RISC-V to allow Guest/VM discover and use
> > > > conditional operations related ISA extensions (namely XVentanaCondO=
ps
> > > > and Zicond).
> > > >
> > > > To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_c=
ondops_v1
> > > > branch at: https://github.com/avpatel/kvmtool.git
> > > >
> > > > These patches are based upon the latest riscv_kvm_queue and can als=
o be
> > > > found in the riscv_kvm_condops_v2 branch at:
> > > > https://github.com/avpatel/linux.git
> > > >
> > > > Changes since v1:
> > > >  - Rebased the series on riscv_kvm_queue
> > > >  - Split PATCH1 and PATCH2 of v1 series into two patches
> > > >  - Added separate test configs for XVentanaCondOps and Zicond in PA=
TCH7
> > > >    of v1 series.
> > > >
> > > > Anup Patel (9):
> > > >   dt-bindings: riscv: Add XVentanaCondOps extension entry
> > > >   RISC-V: Detect XVentanaCondOps from ISA string
> > > >   dt-bindings: riscv: Add Zicond extension entry
> > > >   RISC-V: Detect Zicond from ISA string
> > >
> > > For these 4:
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Actually, now that I think of it, I'm going to temporarily un-review th=
is.
> > From patch-acceptance.rst:
> > | Additionally, the RISC-V specification allows implementers to create
> > | their own custom extensions.  These custom extensions aren't required
> > | to go through any review or ratification process by the RISC-V
> > | Foundation.  To avoid the maintenance complexity and potential
> > | performance impact of adding kernel code for implementor-specific
> > | RISC-V extensions, we'll only consider patches for extensions that ei=
ther:
> > |
> > | - Have been officially frozen or ratified by the RISC-V Foundation, or
> > | - Have been implemented in hardware that is widely available, per sta=
ndard
> > |   Linux practice.
> >
> > The xventanacondops bits don't qualify under the first entry, and I
> > don't think they qualify under the second yet. Am I wrong?
>=20
> The Ventana Veyron V1 was announced in Dec 2022 at RISC-V summit
> followed by press releases:
> https://www.ventanamicro.com/ventana-introduces-veyron-worlds-first-data-=
center-class-risc-v-cpu-product-family/
> https://www.embedded.com/ventana-reveals-risc-v-cpu-compute-chiplet-for-d=
ata-center/
> https://www.prnewswire.com/news-releases/ventana-introduces-veyron-worlds=
-first-data-center-class-risc-v-cpu-product-family-301700985.html
>=20
> @Palmer if the above looks good to you then please ack PATCH1-to-4

These are announcements AFAICT & not an indication of "being implemented
in hardware that is widely available".

--iiRtwGBozE76B1Lv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRRACAAKCRB4tDGHoIJi
0qQEAQDTNOG4ag8LjtNZMYFOnkSFGHrw50GOrUOnnHOGQ9gTaAEA4l7aRLFtSW8o
WiJV1zWNZaMssu0BppMJh3/v3IudAw4=
=xlPj
-----END PGP SIGNATURE-----

--iiRtwGBozE76B1Lv--


--===============6773576134328505211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6773576134328505211==--

