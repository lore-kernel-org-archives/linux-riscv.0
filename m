Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B63C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXeA9Pz+Mm56DLBoTm9tO3t5i1meXKMUNmxEBEO/PMk=; b=QRH48pEYbVflUbbqOSy1XvxfPc
	fYhWyl/H7KKQsQJHvBbFgtQOmZqNQ2Ev58zPm3dcJh5OciJjqKPz0npz6RQcejB+UX01OC2FLv7F2
	ZqQ3WT58PBMvnl+o+I4OPsSa6J3PKyGEerZTzitmmM3Vaq5mLxtDMnq7kYThgkOpq5AMVJaZH+eaJ
	oPf593MifkEdOmUns/CydbIue0wFx1F1CNCacSCAX2AJUgTGXHg9vs+Xrtcq2SmWOuqxyxCpyJCgp
	QnRe+9A2WYmcK5+dPhoGUTjAdxCGCegPNhJzIhHu8IUL+N8HH1AQo1K2nozYjyt7cPHKKKBbpAATZ
	Cav5q96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXBH-00000005knt-2LJ7;
	Thu, 01 Aug 2024 14:53:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXBE-00000005knB-2FAU
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 14:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F11E0628A6;
	Thu,  1 Aug 2024 14:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA45C32786;
	Thu,  1 Aug 2024 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722524003;
	bh=pihbMVCA3QLJMolaC1JlUKs2kdaJDmWc7g29tWCaf1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFnl2k4v+sPK5hUTLtjsm02gby1FH7+7nTBXOrq9SFFhvoOy6W31Vm0ulS3N+hwo6
	 0LJmE1boYr7t6A/zDghoKxHoRDEOfOW/JSzPf9sKxJaO0Kvj9g7dbagQVpRgGXUlJb
	 JH4emFWM5qtq38pSNidhjU6gMLpz9/Sb4dI9fC15Gl33qFDAqAxehCOnspqgSZAFJ8
	 M+mc9E9+g4ls4hTrOQ3H9tJBq65Ii/9YfIwjPUMdo3KKjytWSRzY9GuWwVF+bzTCxc
	 YQgZ2QtHDdDa9kqZujkqAeC4OBr/dt4gO1CRqahW1bUlodcIFhRs2XvcYyBYgR1w+g
	 edesfaRakfPvQ==
Date: Thu, 1 Aug 2024 15:53:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 04/13] dt-bindings: riscv: Add Zabha ISA extension
 description
Message-ID: <20240801-outmatch-handwash-8622a4972faa@spud>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240731072405.197046-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_075324_638553_0D18693F 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Type: multipart/mixed; boundary="===============7030559773351777081=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7030559773351777081==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ChwbiayH3N33d2aF"
Content-Disposition: inline


--ChwbiayH3N33d2aF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 09:23:56AM +0200, Alexandre Ghiti wrote:
> Add description for the Zabha ISA extension which was ratified in April
> 2024.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928..a63578b95c4a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,12 @@ properties:
>              memory types as ratified in the 20191213 version of the priv=
ileged
>              ISA specification.
> =20
> +        - const: zabha
> +          description: |
> +            The Zabha extension for Byte and Halfword Atomic Memory Oper=
ations
> +            as ratified at commit 49f49c842ff9 ("Update to Rafified stat=
e") of
> +            riscv-zabha.

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--ChwbiayH3N33d2aF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZquhXQAKCRB4tDGHoIJi
0q0gAP4w29iDC4m6l/qSPS+MMlI/WiH69/4G+fcBBKIq7aRTCwD/W8P7PX8RBqjX
vFrgiE5bcGwtx7wKqCuveDiYrxM2qAo=
=FU44
-----END PGP SIGNATURE-----

--ChwbiayH3N33d2aF--


--===============7030559773351777081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7030559773351777081==--

