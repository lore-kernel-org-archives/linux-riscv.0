Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC501CD4F57
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jDPUHe508tZWIL4pUBBvplIM+k5yw5H0tDL0hXqxlU=; b=gmxwzC+kOuEO7DWzXLe0mPF6y6
	Hp3iyxAp5XBfRThm+u6AK/YaBGDy0niW+aH14TzBdyGK8LRgHgYhmgnKiI9GPm2Na2MrOg4n+UDPl
	dYyWVJucg0tNYIQ91/wYZgU04ZM7cCLm4bG4wMMBmC2pS62YvVUOE6ydjyNQ0lBv4KAF5VSv81jzi
	sOT1fd3jeTTxx2eZPvERikHkWz4cJixa9LEjsbHfs+m8PeczxgU+gZbWquOWIyxSSuXgHN774uP0x
	Znwz07E6uF+jIV4S73d8EC7A5bt7J3GTV5k/3mGvtWn2X0+LS1lfvczLexjiY49VkyEOvbwNYdtbc
	sSlF2WBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdkC-008tYK-0f;
	Fri, 22 Sep 2023 10:50:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdk8-008tXP-0G
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:50:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6D2EFCE240A;
	Fri, 22 Sep 2023 10:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C63DC433C7;
	Fri, 22 Sep 2023 10:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695379835;
	bh=II1IpALtM+CSWP4ja3PIzra3ILdt436ZbfinoMTMIBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLhUR8HytmqIL6L7V2IptxGBAHMpWlG/SdlcnIe5/tu0T2mNLPDil4HaXIjw6I1Mh
	 7+bGG0GYtCLTIvbCrbX1vdVztobulbCE9jWjMOXJRLAwVEpmvWWDefiRlLFkeh82Q0
	 JcXQIVQQk5orRD6ffbhKTlju5V9bhSfxN0+VA28OT5fiodI6Si/VoGNWsR8s7873Lt
	 v1vJZjwF3eueuk1YVMrJNHgIYD4CTYSL9lkG6v0odcVyblQySaIi5RpkMir4dQ8PoD
	 fCDhmbVI+J8znUxYa4dmomcPr6MUOL7UNLulbqja026MzcA/Q83KZfqx/570ZpIari
	 DsNwp+FOEh0Vg==
Date: Fri, 22 Sep 2023 11:50:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com, guoren@kernel.org,
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 00/11] Add Milk-V Pioneer RISC-V board support
Message-ID: <20230922-salvation-splendor-61533091f87b@spud>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-muppet-wad-ee76f3112651@wendy>
 <CAHAQgRA+uN2xG=imVe4fuSyGxjDQk-AOo4r5b4bvAcTuEewwiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHAQgRA+uN2xG=imVe4fuSyGxjDQk-AOo4r5b4bvAcTuEewwiQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_035040_479584_44B25848 
X-CRM114-Status: GOOD (  24.95  )
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
Content-Type: multipart/mixed; boundary="===============8546013330388107425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8546013330388107425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DtwC+yOilvVlaIfy"
Content-Disposition: inline


--DtwC+yOilvVlaIfy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 06:24:25PM +0800, Chen Wang wrote:
> Regards,
>=20
> unicornx
>=20
> Conor Dooley <conor.dooley@microchip.com> =E4=BA=8E2023=E5=B9=B49=E6=9C=
=8820=E6=97=A5=E5=91=A8=E4=B8=89 18:01=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Sep 20, 2023 at 02:33:48PM +0800, Chen Wang wrote:
> > > Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 =
[2]
> > > in a standard mATX form factor. Add minimal device
> > > tree files for the SG2042 SOC and the Milk-V Pioneer board.
> >
> > Please run dtbs_check with W=3D1 set & fix the below issues:
> >
> > sg2042-cpus.dtsi:1600.25-1607.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@0: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1609.25-1616.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@1: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1618.25-1625.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@2: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1627.25-1634.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@3: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1636.25-1643.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@4: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1645.25-1652.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@5: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1654.25-1661.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@6: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1663.25-1670.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@7: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1672.25-1679.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@8: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1681.25-1688.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@9: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1690.27-1697.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@10: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1699.27-1706.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@11: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1708.27-1715.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@12: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1717.27-1724.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@13: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1726.27-1733.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@14: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:1735.27-1742.5: Warning (unit_address_vs_reg): /cpus/l=
2-cache@15: node has a unit name, but no reg or ranges property
> > sg2042-cpus.dtsi:256.15-275.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@0: duplicate unit-address (also used in node /cpus/l2-cache@0)
> > sg2042-cpus.dtsi:277.15-296.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@1: duplicate unit-address (also used in node /cpus/l2-cache@1)
> > sg2042-cpus.dtsi:298.15-317.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@2: duplicate unit-address (also used in node /cpus/l2-cache@2)
> > sg2042-cpus.dtsi:319.15-338.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@3: duplicate unit-address (also used in node /cpus/l2-cache@3)
> > sg2042-cpus.dtsi:340.15-359.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@4: duplicate unit-address (also used in node /cpus/l2-cache@4)
> > sg2042-cpus.dtsi:361.15-380.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@5: duplicate unit-address (also used in node /cpus/l2-cache@5)
> > sg2042-cpus.dtsi:382.15-401.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@6: duplicate unit-address (also used in node /cpus/l2-cache@6)
> > sg2042-cpus.dtsi:403.15-422.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@7: duplicate unit-address (also used in node /cpus/l2-cache@7)
> > sg2042-cpus.dtsi:424.15-443.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@8: duplicate unit-address (also used in node /cpus/l2-cache@8)
> > sg2042-cpus.dtsi:445.15-464.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@9: duplicate unit-address (also used in node /cpus/l2-cache@9)
> > sg2042-cpus.dtsi:466.17-485.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@10: duplicate unit-address (also used in node /cpus/l2-cache@10)
> > sg2042-cpus.dtsi:487.17-506.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@11: duplicate unit-address (also used in node /cpus/l2-cache@11)
> > sg2042-cpus.dtsi:508.17-527.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@12: duplicate unit-address (also used in node /cpus/l2-cache@12)
> > sg2042-cpus.dtsi:529.17-548.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@13: duplicate unit-address (also used in node /cpus/l2-cache@13)
> > sg2042-cpus.dtsi:550.17-569.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@14: duplicate unit-address (also used in node /cpus/l2-cache@14)
> > sg2042-cpus.dtsi:571.17-590.5: Warning (unique_unit_address_if_enabled)=
: /cpus/cpu@15: duplicate unit-address (also used in node /cpus/l2-cache@15)
> >
> > Thanks,
> > Conor.
>=20
> I find the rootcause is due to following code in DTS:
> ```
>                 l2_cache0: l2-cache@0 {
>                         compatible =3D "cache";
>                         cache-block-size =3D <64>;
>                         cache-level =3D <2>;
>                         cache-size =3D <1048576>;
>                         cache-sets =3D <1024>;
>                         cache-unified;
>                 };
> ```
> To differ 16 l2-cache controller, we add <unit-address>, but due to
> the l2-cache controller on sg2042 has no address, no reg property is
> added here. That's why dtbs_check warns "node has a unit name, but no
> reg or ranges property". I just double-confirmed with sophgo
> engineers, they  told me there is really no address for the cache
> controller for sg2042.
>=20
> One solution I use here is to provide unique name for the l2-cache
> node. I learn this from  "arch/arm64/boot/dts/hisilicon/hi3660.dtsi"
> and seems this work and pass dtbs_check with W=3D1. For example:
> ```
>                 l2_cache0: l2-cache0 {
>                         compatible =3D "cache";
>                         cache-block-size =3D <64>;
>                         cache-level =3D <2>;
>                         cache-size =3D <1048576>;
>                         cache-sets =3D <1024>;
>                         cache-unified;
>                 };
>=20
>                 l2_cache1: l2-cache1 {
>                         compatible =3D "cache";
>                         cache-block-size =3D <64>;
>                         cache-level =3D <2>;
>                         cache-size =3D <1048576>;
>                         cache-sets =3D <1024>;
>                         cache-unified;
>                 };
>                 ......
> ```
> But I remember as mentioned in
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation,
> node names should be generic. So I have two questions here:
> - Should I use "cache-controller" instead of "l2-cache", though I see
> "l2-cache" is used in many places but not listed in
> devicetree-specification.
> - Even if I replace "l2-cache" with "cache-controller", I think
> "cache-controller0", "cache-controller1" ... are not generic name, but
> due to sg2042 does not have address for cache controller, how to
> handle this problem?

I would go for "cache-controller-0" "cache-controller-1". Close as
possible to the generic node name while having the required differences
between nodes. There's already some examples in-tree (eg renesas) that
do this.

Thanks,
Conor.

--DtwC+yOilvVlaIfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1xdQAKCRB4tDGHoIJi
0rSqAQC2q8Eac9WHZ0kwmpDStSPneHIuoD6unVUY6au6JrndOQD/f9i5UVKVZog+
HOK//YsxjVXAktCB3VITwmlLJ1eOPg4=
=NU7b
-----END PGP SIGNATURE-----

--DtwC+yOilvVlaIfy--


--===============8546013330388107425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8546013330388107425==--

