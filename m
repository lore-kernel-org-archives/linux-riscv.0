Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA608C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9H/fnLE4WrOQowZiQYaPfbo2nf0UwQnA0wWKHJOJBw=; b=zdADoT8dGbajUD/tAkpXnKEhSi
	u5cmmQm3ml49t7bAUloY0s0ImuJoHD7yJB7k413PfLBvSbtiUKs6OWSz6gQRkE+ZdGnU/nKoNjLAZ
	fWSKb6tj9H5lHdXtAHOsQ8wrc6Kmn6Ac8K37BANu9DvkXuTsqHVTxtxpfZYqAihMo7YMGNxDwaCBB
	dFbl4efHuSkkb+NC0LB3XMlu3TxJBNwWj06B2LtCwIPXbICLrRYHrrmwFupGZW5iPRscG8vythgMQ
	0L1gUjLBBTB9JPfifPoP7iLkd2NmA/JQtsmykRXDtPZYyPs0GjG6o82uf+Kw4WQrqJ64lMPE1oTrY
	w18aQzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7K1K-00A7XJ-22;
	Thu, 08 Jun 2023 18:06:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7K1H-00A7Wd-35
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 18:06:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3857D6502F;
	Thu,  8 Jun 2023 18:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D11C433D2;
	Thu,  8 Jun 2023 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686247558;
	bh=V7u42f2naBOqDowPjpRoAY5sWdX646Mwb4Elfsu16zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bN4mvX+pIWEBE0jiHvTzGzCqSYj0xamnFlHcCq26lbRNO0jlsXx4ozmK2CCbIZ3Tq
	 t9YD0j21cFPvUWQ4nAln0igiH0Q69gaW3pVo6ISPbv6aKnX3L/IKcS6r0ldqlVSy1P
	 P2v0wi5URP+bEKZoXxbezTw7/AZTH7uWADINlLivU306OcNjmJ8Q9LTRVQHeTszTTq
	 F/wJ9qf67h0yDWXk3rw300lUinTEOzQ+y/L18eDQNXz4IuK4czNYH6srgum7JeUwvY
	 A6SdOGKD7svJzIKfZ5llVHKsaaaRo+vA5TMNjRvgw/quMriQgFvZty1RTuNgu4Ut72
	 Lo3XFhDmBwtxQ==
Date: Thu, 8 Jun 2023 19:05:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Oleksii <oleksii.kurochko@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org,
	u-boot@lists.denx.de, Andrew Jones <ajones@ventanamicro.com>,
	palmer@dabbelt.com, Atish Patra <atishp@atishpatra.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rick Chen <rick@andestech.com>, linux-kernel@vger.kernel.org,
	Leo <ycliang@andestech.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230608-unlucky-carpenter-b3a95f269712@spud>
References: <20230608-sitting-bath-31eddc03c5a5@spud>
 <168624654839.3085745.9088493205796442132.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <168624654839.3085745.9088493205796442132.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_110600_066209_9C5531E0 
X-CRM114-Status: GOOD (  13.60  )
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
Content-Type: multipart/mixed; boundary="===============2086445209653519302=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2086445209653519302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+RuwJ2DDVfOcEYrF"
Content-Disposition: inline


--+RuwJ2DDVfOcEYrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 08, 2023 at 11:49:08AM -0600, Rob Herring wrote:
> On Thu, 08 Jun 2023 17:54:05 +0100, Conor Dooley wrote:

> > As a result of implementing Sean's suggestion, I believe I need to add
> > riscv,isa-extensions as an exception to the rules preventing vendor
> > properties being of object type, otherwise dt_binding_check is less than
> > happy with me.

> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: properties:riscv,isa-extensions: 'oneOf' conditional failed, one must be fixed:
> 	Additional properties are not allowed ('additionalProperties', 'properties' were unexpected)
> 		hint: A vendor boolean property can use "type: boolean"
> 	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: properties:riscv,isa-extensions: 'oneOf' conditional failed, one must be fixed:
> 		'enum' is a required property
> 		'const' is a required property
> 		hint: A vendor string property with exact values has an implicit type
> 		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> 	Additional properties are not allowed ('additionalProperties', 'properties', 'type' were unexpected)
> 		hint: A vendor string property with exact values has an implicit type
> 	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/riscv/extensions.yaml: properties:riscv,isa-extensions: 'oneOf' conditional failed, one must be fixed:
> 		'$ref' is a required property
> 		'allOf' is a required property
> 		hint: A vendor property needs a $ref to types.yaml
> 		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> 	'boolean' was expected
> 		hint: A vendor boolean property can use "type: boolean"
> 	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
> 	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

Yeah, expected. I think I need an exception in vendor-props for this to
pass the checks.

--+RuwJ2DDVfOcEYrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIIYgAAKCRB4tDGHoIJi
0l8IAQCHNhFWGWR69Rcpmeno9mCNvE7EiV05GSVbbHObbpVtJQEAmK/PJZ+JTtyj
f1qtwj+vdUYA/q/Am73pR9cOA/e51w4=
=3iEw
-----END PGP SIGNATURE-----

--+RuwJ2DDVfOcEYrF--


--===============2086445209653519302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2086445209653519302==--

