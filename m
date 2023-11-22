Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD10CC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lubuFbUzdLeWl3I2+sMtuadnR8TbaEvMVE3su/UJuTk=; b=ThBHcvrqMCeuyPYflHzC76T+0w
	/7xdkxJNH6VQ1Ju04n6uLWoseHrYbSE1YIQSplVuGBfBvK5fr0imn15TqTiKybJ1LG/nW5hGlWsJs
	biKyxrVEHO+23x28yq3q7NJmbLG3DNkeZ1sh9GqM/84H+12WIHXALeqslVxTs/16ZiWWpgdSgI9ym
	OZwc8Z+voFK9XuC4+kfFFZr0oBwpelnuxyxyCa7hKxEj177xXiGGwWpi654X80JPtuK6/EptbFmYU
	Hqu+i1kH5wadsYrTyb7na+97Fsrqjed6Gk4zlIClJ/YA/MPloPoQNy+IZFST/FVsZu9yJvLqAyCti
	ZLS0vjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5puJ-002Pmp-2z;
	Wed, 22 Nov 2023 16:16:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5puI-002Plz-0U
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 16:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAF9C61E66;
	Wed, 22 Nov 2023 16:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2F9C433C8;
	Wed, 22 Nov 2023 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700669813;
	bh=gnjtMK4pS8juI0a9kdN4S8I0WN77dg3aOR53D/91PXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXlrH0UO3dELezbaZOre2DyRuj73aehtvV66h0GzMuxPdyCr4QrlP19Co3jWchB1n
	 g3Zqir7OXoapnd8pFPjFdwVLpR8tKUGNpjcyPZ9B8+wmrdFc4946kzyIJ6HIk3b6W3
	 XtPuD2TC54Aw31pYBdLYPnL2DZzj01R4FlcafROoJ9M7bK7JUXXxpfQUWlwrP/4moC
	 hcytvBKK6xfoakbMmCAGG27jocAQp9DXh7Qgtrb0eOJspbz+uQFOoKCR/C/hmBoHeY
	 rcS3OQoeD1vjCrMip05pjXFZxrA5kE5wnpcPQy/07w5lZ7z2XImgdFEv0NimH4o74G
	 jynTOPEGlGl1A==
Date: Wed, 22 Nov 2023 16:16:48 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 00/20] riscv: report more ISA extensions through
 hwprobe
Message-ID: <20231122-detection-antler-124b9460e893@spud>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_081654_231717_EF25A0E4 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Type: multipart/mixed; boundary="===============1973991649703594073=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1973991649703594073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U/2uIv7Yhb2wSwUv"
Content-Disposition: inline


--U/2uIv7Yhb2wSwUv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 09:12:36AM -0500, Cl=E9ment L=E9ger wrote:
> Changes in V4:
>  - Add a text specifying that Zkr string dt binding means that the CSR
>    provided by Zkr are accessible only by the privilege level to which
> the device-tree has been provided.

This text don't match what the change was. Here you say "only", but the
binding has the IMO correct wording, with "only" removed.


--U/2uIv7Yhb2wSwUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV4pcAAKCRB4tDGHoIJi
0rUqAP0dwQyCCmdgf5TjCz0Femc8nr1+zCexAneYj8slpm6vggEAuiD6EdxWLRpq
ndEmecDSWnY8Blrjc3NQy8JdQcNxPQA=
=jqFD
-----END PGP SIGNATURE-----

--U/2uIv7Yhb2wSwUv--


--===============1973991649703594073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1973991649703594073==--

