Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6C6E748E9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 11:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdWV6H8z9hv2DL8MIS6K4gC4+S7wiQ7zyio4JleNd7U=; b=B3z83yrYjcWa2maUpURLUxQLd4
	JrVmTukX+dh6QK53vpCmoPDYuGPXfu0L7Rh6UNiFKh5NFqICfNfSi8carW0DIz9WINg7OZBxiEOYR
	oCxWC5wzHfuK/Vlc+U9gpqVQE40grX928LbSuNF8xF073016gH5F1gYmvXuyXc96FevIrLAxp19lS
	2rgmbV/Y8U+bg50BKMO/NP16txsDcf03cbkpKU6ZQV8NhcKuOqZL9sycz7vd0Fs+qOQaTT7JNdNrB
	LKTQ3u0NcRdIYBKzaz8PYEbbKNDNoVBzJjnt4NiVG555pXc9NhHgc3IIbqyykOUdgYzO/CWzDaQnI
	zXeM75Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmua5-00AzJ4-36;
	Sun, 01 Oct 2023 11:25:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmua3-00AzIM-01
	for linux-riscv@lists.infradead.org;
	Sun, 01 Oct 2023 11:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10BC1CE0A68;
	Sun,  1 Oct 2023 11:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101B6C433C7;
	Sun,  1 Oct 2023 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696159544;
	bh=evB5bY7/C6FdyGJIUHIWeQ7AH4xS5MwJRsf7lHXWW88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMS91LYZGS3vcia9UVje1csH1rVyQDefPYcESD0sQUN9sIWhZZUODTqYZIA1+uOmT
	 HrXpOCGdtZDx8iA/Oh4LWi8KBzNQaz37y+zzBI/uO1wrMEanfynWet0FEvsiDNSG+J
	 xsvTH977/vw6wlXEEbJtV7S8Z798H2IkEmF6xgnWkRPqi59w9YbbTOha+wMeM2RfJl
	 LgprszVuIKzH0b8HrJHHF8ls+4Bgw9mYQ7TcPo4x3c59xDDBQQzV2ZGrBApwGUIO70
	 oOK5ACc4A6l9ql0QaPk6Dug6MS2Wbv6312te2YGIJTUt9uF47vXJrXV0EhFB9Bf1Y2
	 BL4jkQBZX40zg==
Date: Sun, 1 Oct 2023 12:25:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 2/5] dt-bindings: timer: Add SOPHGO CV1800B clint
Message-ID: <20231001-election-overdue-c8e016b7c61f@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230930123937.1551-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_042547_226293_A2EB07A5 
X-CRM114-Status: GOOD (  12.92  )
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
Content-Type: multipart/mixed; boundary="===============2543232162474884067=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2543232162474884067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dSBleoVdBpsFBCLv"
Content-Disposition: inline


--dSBleoVdBpsFBCLv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 08:39:34PM +0800, Jisheng Zhang wrote:
> Add compatible string for the SOPHGO CV1800B clint.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a0185e15a42f..98c76d5893ac 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -37,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> +              - sophgo,cv1800-clint
>                - thead,th1520-clint
>            - const: thead,c900-clint
>        - items:
> --=20
> 2.40.1
>=20

--dSBleoVdBpsFBCLv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRlXMgAKCRB4tDGHoIJi
0giqAP43PdDm3+hme45s4Rubpl2HyCQBpSrzT5M242Alx1ONnAEA+8fbHhfHJT8V
1MyIzX28EkoOdUMsCNsRXBP2ZbztwwU=
=6qEm
-----END PGP SIGNATURE-----

--dSBleoVdBpsFBCLv--


--===============2543232162474884067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2543232162474884067==--

