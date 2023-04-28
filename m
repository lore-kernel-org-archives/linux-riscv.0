Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3E4C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYgcAuwXWFVNilN2hpyuFBvPF3pJGMWWMfM1KOs4ZnQ=; b=KlT3HN/K2liOp3h45l26zHsphY
	9aAa43W3rFI2ZC4GNMXlI2XAYVP/A75ywLEdenZLmeImJNNXG0fGJThCFpYya6f4TLM25d8WZk4bl
	1jjoSUM42LgA5ioHuiSYM+v7/ikoNZrw3bzl5kbHP90xd1YmNSX3OeSZ/B+RTHkcUv3rbRHjfphfJ
	lLspCAAG4f/AiBh0usibr+OMX566v676f2+zpZbLRXp7v5I6qPuZm9K8sXav53c6EE+k+dwGuRvZq
	+Wj3pSC4Oz7SJxZ4wcj9FCTzKybHsraD6TD+s9tTIjd2Givau42V2TcMT8aaSrHHYHCGfBV1gSDUD
	lR52epcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psRXm-00BJ0j-2E;
	Fri, 28 Apr 2023 17:06:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psRXk-00BJ0F-0h
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 17:06:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DFA0644C4;
	Fri, 28 Apr 2023 17:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52ECCC433D2;
	Fri, 28 Apr 2023 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682701558;
	bh=PBNgi24wLhulSF0zuj6iMWeLEm97lHhM6E5QUQLKk3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCYBDwRJ0dzlVXBN4iA/ohH3nPhKEeoAux3MMWX6gRNTNzzR55VTo2dAldmWdCRrM
	 2LYZoFENr0kx8IVk9D/whEz37pOlSUCL3flWEBJcM2xPI0Y2T/XqOYo3Zs6vU1Np8s
	 I3VA5s6Ko4xbmBlabtxEVozLLDFhlCgzT9qdhGIQATRXjdlfG1iDRum+a0DIA9d7+S
	 QvSRqFYboBy1GkGyEzePbtYr08Y5bkrMBvRSg1kxoRFd11YEyB21Cj4MW3rxgYFY6n
	 Zc02bduRKLXALq6qi8G4eZC+6C0bJw1mysndoksvtCsQYIk70gafm05h9FEKPMyM37
	 lb2Wb254b8XrQ==
Date: Fri, 28 Apr 2023 18:05:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: riscv: drop invalid comment about
 riscv,isa lower-case reasoning
Message-ID: <20230428-repacking-percolate-79be27947af6@spud>
References: <20230428141601.678489-1-cyy@cyyself.name>
 <tencent_85F69423082E524C478844E31D5F8920A506@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_85F69423082E524C478844E31D5F8920A506@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_100600_331946_9C37A7B1 
X-CRM114-Status: GOOD (  20.94  )
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
Content-Type: multipart/mixed; boundary="===============2761347448402920334=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2761347448402920334==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="duh32IVum06IkP5O"
Content-Disposition: inline


--duh32IVum06IkP5O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 10:16:01PM +0800, Yangyu Chen wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> "Ease of parsing" may have been the initial argument for keeping this
> string in lower-case, but parsers may have been written that expect
> lower-case only.
> For example, the one in released kernels currently does not behave
> correctly for multi-letter extensions that begin with a capital letter.
> Allowing upper-case here brings about no benefit but would break
> compatibility between new devicetrees and older kernels.
>=20
> Drop the comment to avoid confusing people.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

You missed an Acked-by from Rob here:
https://lore.kernel.org/all/168261158214.3107331.4410018416833510357.robh@k=
ernel.org/

Also, when you are submitting a patch authored by another person, you
need to append your Signed-off-by to the patch ;)

Cheers,
Conor.


> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 001931d526ec..1ee97621d0c7 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -81,7 +81,7 @@ properties:
> =20
>        While the isa strings in ISA specification are case
>        insensitive, letters in the riscv,isa string must be all
> -      lowercase to simplify parsing.
> +      lowercase.
>      $ref: "/schemas/types.yaml#/definitions/string"
>      pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:=
_[hsxz](?:[a-z])+)*$
> =20
> --=20
> 2.40.0
>=20

--duh32IVum06IkP5O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEv88QAKCRB4tDGHoIJi
0jmsAP99ehYUNjIbvjxkbNmAqoqscoLdD0claGcn5TvVuJyyTAD+P2K++thvAX97
EKhJQedy4RCGdCPiHbW3eqRL5fjwyQI=
=bqeQ
-----END PGP SIGNATURE-----

--duh32IVum06IkP5O--


--===============2761347448402920334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2761347448402920334==--

