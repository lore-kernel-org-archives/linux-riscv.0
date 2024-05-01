Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC7AC10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfhmTHef9cQ1rC1uBDpBJcnt0jaPvBXTPjbFX4Ketnw=; b=H72NHMtOxL76JQFKX38OII80gp
	jMU5NoJCe+8QM0eWhr2jYEaonlaGFv4HpeT/MvQihp4Xe3iUBwrM+n2+H9FNUfdc8mO/I3FoelnLj
	zAgXszEdj1+epq67gyA3TZ/8pRGkXzsbYUs2vN8jDN+crHUjZIxR39vYsnqc52u8gDdgkqETeXzCi
	+ZbXMLrdok7ili9HKFlWBYV/v/23o/tJgYGxiFQfeqVAo/kM5uA1KoABE83RmerLMN0K08BPMl84X
	tLfcjMJmYrsZdVfsjWUOhK1rWFDP7qF/ZIBuaX7mpFnfDA0g7x3YLaefNiLPQETkDzem69oNwwGFy
	h8IHkTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26Km-00000008zg2-1wd7;
	Wed, 01 May 2024 09:33:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26Kk-00000008zfJ-3vG2;
	Wed, 01 May 2024 09:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5YH+MmCm3Gjj0HC8Tjm2tLqYxUcTFGdd/LlvFnv0Zmk=; b=AOuj49TL1bj0yj7PCYLSuvF9jk
	honfSMspj997ptBoEgQBaQbjTZuj1rjjU34QTa9+MjOAeMxoiJDlS9T8kB7i+VV3C9rxw+D4a1N8m
	pX0uGH0f7+MYUJTcPv7A/ItX8B0/ui86UxOqVPPmA7L9bRMw8LzqJU21yVC379SevAyImtOCf4XUS
	GjAyd17A6nLSDtIOOBKRMWpeA35O9jZmRg5SJu45PoPFZH9NYOfejJRq07V+hmNZS+AxEF8fFqYK7
	SdlckukAn+8c8mDh5RiFLt46rdUbBZZeHGbnr+NTwMP9sEMRFKNxqmMIvYHqyxESWM6U+h31EXGh0
	XOmjbTTg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26Kg-0000000HKKH-0Lrr;
	Wed, 01 May 2024 09:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30CE761879;
	Wed,  1 May 2024 09:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB76C113CC;
	Wed,  1 May 2024 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714555973;
	bh=5YH+MmCm3Gjj0HC8Tjm2tLqYxUcTFGdd/LlvFnv0Zmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opacnROi5vN+SdVTQqnNOx5Mdk6i7iuTBhYvkto9/M+VDpoBgYQdQ2+9ZFbtVguAo
	 rESrV46brivLuXaaHZgP3nfKDiBN2GX5OiqCOLXaCkv5YakDFU8tL0weJpGk0hc2dm
	 ToRqGD/wW+3aelUUq0M4tXadp0IcMbVJkCkwdmibdb1gEyiQ2dN8DswBcD4s+WXFQE
	 s+nugEj0NTlAPfI9IN5BKIL1+y0eZpXbm9rFp3KpyJ4b0L1VHnw98cT53kppGUuHgD
	 w7dwiwCRNW09IwFm612/wkaST8QXtVeUIv0vKlbTIy/eOzlcDWDDGPJ0jFjTBC7TEj
	 CbGeMKrLeOs4w==
Date: Wed, 1 May 2024 10:32:48 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 03/11] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Message-ID: <20240501-waltz-choosy-59e08e6a1099@spud>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-4-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240429150553.625165-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_103259_167874_2C3CAA56 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: multipart/mixed; boundary="===============1615832313167367909=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1615832313167367909==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="342icLqh9B/uSr91"
Content-Disposition: inline


--342icLqh9B/uSr91
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 05:04:56PM +0200, Cl=E9ment L=E9ger wrote:
> The Zc* standard extension for code reduction introduces new extensions.
> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> are left out of this patch since they are targeting microcontrollers/
> embedded CPUs instead of application processors.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--342icLqh9B/uSr91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIMQAAKCRB4tDGHoIJi
0uwCAQC71T4oeRQGkk9Ig895iznNgUNZBhUBni4qknp8a7dg3QEAtnqR3qU/PwpZ
kLiHt0NXsVwN6O0JCML1X+/ptOrA1AM=
=lQyI
-----END PGP SIGNATURE-----

--342icLqh9B/uSr91--


--===============1615832313167367909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1615832313167367909==--

