Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F56CC3600B
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVm8qbWzpf5lEy5fmTXZTOy8f2p9BNGDerMQwFi/Ias=; b=v0qy/vQpH19nMoCqNEyWb9b5VW
	NGkESHdjft0MQvJjtGqNRIKZ/AadGYJaf6fuQ/H6pl4R+xCYvviinxAFN1AKdfPtSYkXXXwI1FvU+
	qyxzCJxaly29DtINzcZ0fN0s5pT1VfBNY1jjAy5uHibnhX1fdGgI7XJ03CEXP/PJRpZ2/+DEAsJV2
	KZgi5prVr3YUWcfLdrqd7Vl7isRvIf1PaEW2UTDRke196YOBEtrusMUWmpJVltiZ9qYFi3Gu/7zce
	OW6A98gJUpirz+PerBoYnVkUibmERDE9Ae7ZmxYBCMvVzHXmp0pbPXV1b2FAaQ8X+rjCBj68On2Dw
	pIsXdB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHIz-00000000rvM-1IiA;
	Mon, 31 Mar 2025 15:44:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHDu-00000000qOi-2AoX;
	Mon, 31 Mar 2025 15:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D87C614B3;
	Mon, 31 Mar 2025 15:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C72C4CEE3;
	Mon, 31 Mar 2025 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743435528;
	bh=uPSFDa3b3rPozp0DJtpTJXXVjrP8+jyf8IICol+dDB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSKh8JdgV0duer2kbzBdTNP5z5eGNu9pG/3/MHQNO1b+YqRPv750ZGkYlksOPDRgI
	 ncq/Yxtcg3xMJWF/B+xiDDVtJLSidlgAgexzyHgGf1KD+0eMo0gkioOveQCtUD/vA1
	 mXoi3SVE7K5BXW2FgStISu/J3rIAJzEGx/jk/1yXDLjDmb+/ZxImYeQ0pK0neE9TUS
	 0nxNsp1vvtAO1efpyo7oIdGM8P7irU5ppGB/6aRu4K5Ak9Ui7rT/sQ/Dhj9lvXozZ2
	 jBawS/LSOyr2+srkMLE82QgSDwJ0ac71X2amcl5dzDIhQR9jkEWN6UOQSLGqd86UdU
	 qmgno6/eIg/Pg==
Date: Mon, 31 Mar 2025 16:38:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v5 10/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
Message-ID: <20250331-cardigan-canary-cdec5038faf9@spud>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
 <20250327-counter_delegation-v5-10-1ee538468d1b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20250327-counter_delegation-v5-10-1ee538468d1b@rivosinc.com>
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
Content-Type: multipart/mixed; boundary="===============3479335846745004506=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3479335846745004506==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dG1PDbcUbNATIzue"
Content-Disposition: inline


--dG1PDbcUbNATIzue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 12:35:51PM -0700, Atish Patra wrote:
> Add description for the Smcdeleg/Ssccfg extension.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dG1PDbcUbNATIzue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+q3AQAKCRB4tDGHoIJi
0vhqAQCY9B8ZEw2rz3RmJIV81yzCSBeNKE2xgSdx/aEU/fDvlwD/dcuiA0D0Y5R4
7UBK9mlhN8m4DtBZ4u36l9HsPTBdMgg=
=xY5i
-----END PGP SIGNATURE-----

--dG1PDbcUbNATIzue--


--===============3479335846745004506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3479335846745004506==--

