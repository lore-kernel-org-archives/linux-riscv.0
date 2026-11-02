Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F960A5BE7
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j39wdPtj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuxwWPkM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zxbPZq+KvyOj0dl0Y8aEMXnFfA2ltsn96o5SZy3Wf2o=; b=j39wdPtjjkTWLQ185Dncclkg2z
	go+Rw7l5JhB/cfIgF1blPTJhhJ1keo53FSgk9Okmofs5CsU7I03woTyhINKisonsN/5s/uMOXna+l
	wBJd+0x4uGA+E879qsKO0El2hgq6uP6LomXo3Vfc9SEmxUB9xXi7/woOfy5mPSFj7CBsXHozgXazM
	/l+kj3WeZA3E7Z03spay8M+vuz93us9gtqaeSQJ3q6xRQmRjpQc4hbcGPDuko47fw0eo7jV3A6wT0
	p2xzHLzB9EXfV6ABv8wDzLDs2r63szGGG5l9iospiEnOK8O1+Y8VRDSNqrM2Fyt2NzBj3iL6RsJbn
	hnXxCP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxYF-0000000056Q-49NL;
	Mon, 02 Nov 2026 19:18:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxYE-0000000056K-36Ll
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 485EE43D43;
	Mon,  2 Nov 2026 19:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773761F00A16;
	Mon,  2 Nov 2026 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647118;
	bh=WFJM7Bezg8OF7GxEtGbM8u9hxpi3HX/5YjbCfaLYPUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SuxwWPkM5EUmuq9/N3/8AyNZuMM1hhNrapR0quEl59l2K8ykPQSkgJCyfRtnQ3duE
	 1O5b8jrSAJlnKPMJMV+hGSNjvJ1YZ1b7UOjbDrtpDGJeoNldrckyIkxpbevE6RVvXz
	 dN9KwlnlTqOOUoAOjR1nssKbQSRdc7gkFOi0jvGOpQF9L90LJT4iBnWhtaFiMXU179
	 ZG83Jgk70NgOZOWGdKz3VAJdXo8w/kym2H7VJVMrq3EoIDFD8sz7Fw6+/4Qk+J+E3A
	 cNRN293lW8ZZ5UIcfpRxUEt1QBR4np8MyZ3hGqIMv99akXb89GGq+oFA8XDlsue0qg
	 evyoKKjvQYsrg==
Date: Mon, 2 Nov 2026 19:18:33 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: interrupt-controller: sifive,plic: add
 OpenHW Group CVA6 APU
Message-ID: <20261102-camisole-spotty-ab44d620ca87@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-5-marouene.boubakri@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102141727.640769-5-marouene.boubakri@oss.nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0315031620014663505=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0315031620014663505==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="foRJlODssOE16KBF"
Content-Disposition: inline

--foRJlODssOE16KBF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--foRJlODssOE16KBF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujiCQAKCRB4tDGHoIJi
0m0JAP9ssPe1+vgE7h0PM+HcbZEpi4oY0JfxJDRlg9kMd5sQCgEA7Yn6718Xw3Ap
ixUcG4e1O8Nw53l0n5swatGg4QxDzwQ=
=KOL/
-----END PGP SIGNATURE-----

--foRJlODssOE16KBF--


--===============0315031620014663505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0315031620014663505==--

