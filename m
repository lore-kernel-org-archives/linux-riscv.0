Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A521BC25B77
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukhTM7MhZw3BGxqBVtYpY3mwKdXadWYcDJzp1vGGy2Q=; b=T3Om6KZTQlNOX8eyNWBpV8gZ42
	bpF1MEaWtmNAJn3IctGHQBfZoPzoOJDIJzG26tbAAuqbFgnbnTA3sbdNzO5NdqLkHh1FYZ8LDLRTI
	lfmgbd06kdtll0q7IwcL+1HqnRCN78DFAW3176sJyOIjQwcfrCDs4ZON0jObqxSYUNDv2CmIY1BEf
	7joyBKumx+YPwpFV515q7nKqRLi9GZu3d02P/YTUOjYpSLbOT5gVzi9pArqcOEZihbt/GQ+3Fey0q
	dBy1g7LldQx/ygd2VMQOqVcgNUi+dUKTl9L9xs1XDJWte0MnGjRUW7fVVKJAMDCirr5mB/1rQ1oHK
	EsAl0MPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8fBg-0000000BwCT-3eRb;
	Sun, 19 May 2024 11:58:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8fBb-0000000Bw9I-1P7T
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 11:58:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A1A7CE094D;
	Sun, 19 May 2024 11:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B85DC32781;
	Sun, 19 May 2024 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716119914;
	bh=dcVEt97hUxkGKz1aWzRDKQTnNqLSCp0T8noaZJtuUzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvP2t5vj1ksvtvlcenwM+cQPxcydvPT89O86WQreTgAy27RGmvJZf9wz7pmSXItGs
	 eXmsHk3HScT6KmOacZkZlbj2Y/ivzBFrWRfWw/jtOqzbHDdiakUjGLIBF5nw0qQpBf
	 Uw+0FGDT+8DbNIYOKV5WJa9XA5W4mOptqXYDiiRDFac78wpDh2UorIZNdCTQwtEzR3
	 P14cQR6uPtiG83G4QWYEokKt8GTJJ4THc/+CPODCfySIt58o3WOAKq2YCKF8GEzaoc
	 G1H3sSiEImi0+hjTzIcg21O3Q5OdNNVsGS9tcYR+2L4UbxtY0d4vkImhCCK/kjVhzZ
	 cqxLRYE5cBYGA==
Date: Sun, 19 May 2024 12:58:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: riscv,cpu-intc:
 convert to dtschema
Message-ID: <20240519-ideology-nervous-eb30a92e1e42@spud>
References: <20240518061925.43549-1-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <20240518061925.43549-1-kanakshilledar111@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_045843_812645_92B4C063 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4353913584659634677=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4353913584659634677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zy1Bb1+InXaHquRd"
Content-Disposition: inline


--zy1Bb1+InXaHquRd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 18, 2024 at 11:49:21AM +0530, Kanak Shilledar wrote:
> +allOf:
> +  - $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller
> +
> +properties:
> +  compatible:
> +    $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller/properties/compatible


Unfortunately, this is still not what I was asking you to do :/
I said to make the copy in cpus.yaml a reference to this binding.

Cheers,
Conor.

--zy1Bb1+InXaHquRd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZknpYgAKCRB4tDGHoIJi
0ipvAQCE3mguMXiwmqezXEUwqtkp5cDzTgZtQWbNBe5f5n+cfAEAnohxuGJ3V23p
6rPB3lvwGKhNzA2dPsrKc1nFDlLqcAI=
=4iLx
-----END PGP SIGNATURE-----

--zy1Bb1+InXaHquRd--


--===============4353913584659634677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4353913584659634677==--

