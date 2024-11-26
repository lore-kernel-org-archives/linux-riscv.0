Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F18D3B9AC
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfMkrj67KWSPF0k2d+LFKDuPe6hjsKKs1+LfY3ULipM=; b=KgwzVyxrqilNGgUGNvhKN8d6Xk
	U3z/7TnGWyt3PLFGL+6RXpXdPJMzrfO2Ul6YuJ3XcnGr9A0Lb8tZkcUt5RSbxTT55iMPh5owhnsJ5
	CY9vixqRffctNSINJc+rdsZ0YNvNvmMemLcbBVQgZZMWHx/CfR7GNtp+ULHesEQ71Sj1h/Ws58LXe
	XGCCUtiHzzfmg3Gg03c/pMy+F3N5kkvrCN4iftytx9TeOUCy4VvDV/sqVyfOeFOmrDPg5hIreb6KB
	kXIztT3zFMg1TDIJy7cuHPltoybaFXgr6dSHE56MjMdDm3+tVC16NMLmtNXSoM848jYD8fzGm7+hi
	ISe1ZuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyJW-0000000B8ni-2UKm;
	Tue, 26 Nov 2024 16:21:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyJU-0000000B8nL-3Of1
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 16:21:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 30F09A40834;
	Tue, 26 Nov 2024 16:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39030C4CECF;
	Tue, 26 Nov 2024 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732638079;
	bh=5NmvJsX5yjhL48h+migyyRcy62wI2+uB4AjXYTR6pJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMCYUhPyDHSp70aRs9lCF0ePGlUnJoPz828YujfSa5tOGr4vA6E3+XgtSxhgioCF2
	 Wyq6iM1Q/77BYaDvbRD1baY9O7wwWxdZxei4UpzAK9qv84fQc+6QIqOjDLX6qztRR2
	 SnTzDzk1Rwq3pZMn/J6aDk2MytEj/5YzyLJdxXmyrpUgXCITa6qh0yJB9cw+QdyjDM
	 gTJSFF1zFKwQP61UEKjXvySx03BNVpJCpFWxf+A4hiJJh7MAQy5OxYHe25V1P9j4pR
	 gO+kqmHrvdI63kKJTIL24Y2lg//H3aARdtFw0isypQy6EGOThndUrnn4CKo4r9YaHj
	 3r0F1YxOLwTiw==
Date: Tue, 26 Nov 2024 16:21:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ycliang@andestech.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	peterlin@andestech.com, samuel.holland@sifive.com,
	conor.dooley@microchip.com, alexghiti@rivosinc.com,
	ruanjinjie@huawei.com, takakura@valinux.co.jp, conor+dt@kernel.org,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox controller
Message-ID: <20241126-pulmonary-krypton-30da3faa8482@spud>
References: <20241125175818.213108-1-valentina.fernandezalanis@microchip.com>
 <20241125175818.213108-4-valentina.fernandezalanis@microchip.com>
 <vkw7o25szfn2upi5776xdojg5n5fxxaxwynth5kynjwjqzrgua@5lwrjqgzlxzi>
MIME-Version: 1.0
In-Reply-To: <vkw7o25szfn2upi5776xdojg5n5fxxaxwynth5kynjwjqzrgua@5lwrjqgzlxzi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_082120_980656_482B07B7 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Type: multipart/mixed; boundary="===============5881720313619833556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5881720313619833556==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHhEcYF+Tebg/wAN"
Content-Disposition: inline


--UHhEcYF+Tebg/wAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 08:04:38AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 25, 2024 at 05:58:17PM +0000, Valentina Fernandez wrote:
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description:
> > +          Intended for use by software running in supervisor privileged
> > +          mode (s-mode). This SBI interface is compatible with the Mi-V
> > +          Inter-hart Communication (IHC) IP.
> > +        const: microchip,sbi-ipc
> > +
> > +      - description:
> > +          Intended for use by the SBI implementation in machine mode
> > +          (m-mode), this compatible string is for the MIV_IHC Soft-IP.
> > +        const: microchip,miv-ihc-rtl-v2

> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: microchip,sbi-ipc
> > +    then:
> > +      properties:
> > +        reg: false
>=20
> What does this mean in reality? Device does not have IO address space?
> Then it is completely different programming model, isn't it?

Ye, different programming models. Two compatibles for the same hardware,
but one represents the m-mode/firmware programming model that has MMIO
access and is the SBI implementation and the other the s-mode/OS
programming model that uses ecalls provided by the SBI implementation.

> > +        microchip,ihc-chan-disabled-mask: false
> > +    else:
> > +      required:
> > +        - reg
> > +        - microchip,ihc-chan-disabled-mask


--UHhEcYF+Tebg/wAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0X1eQAKCRB4tDGHoIJi
0pV3AP9Q0WEJXVAedx6l0dgDDRC1T1u7gst2xaLmNAJdZULXCgD+NGtzaOJiNZfr
DFwVWzDxNzpUytgABiEoCMczznCo0w8=
=XItn
-----END PGP SIGNATURE-----

--UHhEcYF+Tebg/wAN--


--===============5881720313619833556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5881720313619833556==--

