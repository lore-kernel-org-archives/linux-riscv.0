Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58712C7EE43
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGUKdmexniNdwAs3zqX1Q6OYZP16+v1qfEoF5dJ2VC4=; b=awsThWi6DkgREmjOKyleqm4NeS
	URR3I87MmrB+iLn4JTlrJuyAE7GypEq/Tkj/3EEqK1XOIRANyyzfnsneIO3buF3lDQAykkqGWCjGy
	cRd55LZnwVkXHk3Gf25fwaP+aTKB3fD7cNzgYxIrEGNhvuTEwRcuO92R0tUurnntwWinqZkabpOrb
	X26tvU0ixgCEFJKqWgXcq8TY+k2d0xLta90oEBVMhBVCbEzxPJrkcj293mqnptRPE5FAALJBP/FZF
	Xtl3z43dT5ZZ6qg4cBH19JnA2VChfZhovR57yKp1CtnA6cypebxr2kYmzSn270yiHAAwHg5Imxc3b
	WKtdwNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q80lP-00GTwb-1x;
	Sat, 10 Jun 2023 15:44:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q80lM-00GTwA-1X
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 15:44:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4C2560DE8;
	Sat, 10 Jun 2023 15:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F872C433EF;
	Sat, 10 Jun 2023 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686411863;
	bh=/d0aPoZrtu5RnKE0NB858Rjj6Plv6oc8XWir1e+Z0OY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tzc+aW9U+5W1DD0JHawm+1C7ABCtr0K7hHNw3f+PaNOaGBFFZtZyySMGRE9lFmr1J
	 8TY+Zn+wiYlwQfsH2znwsp/5R6/cWfpWw0IOn/j/pJu+hawmtJKeIe4Bm7g+mdlAy4
	 MA2JJ91Gzj61NZhIs8VroSha5XY5hw7APoMO4schlS9tYXmeSeO7q6rX6PSt68eTvu
	 O6W/K9WV5BXLhvSJ66O9twll9+gArNyUjC3ouWODl7gHsiwZn44BMDo+gN/iLJlNCb
	 mzsgbRJtD/rgt/SqimhRlHrPHWCgxDeh3TAix1gtVF5QOWM5NilWA/qDyxZRzVQJmP
	 VstojO26hwG8A==
Date: Sat, 10 Jun 2023 16:44:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Woody Zhang <woodylab@foxmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: move memblock_allow_resize() after lm is ready
Message-ID: <20230610-ultimate-moisture-630c7672358b@spud>
References: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_084424_561373_01CEC236 
X-CRM114-Status: GOOD (  11.41  )
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
Content-Type: multipart/mixed; boundary="===============4871911740360842927=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4871911740360842927==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ktqcJ4plNqwb0t69"
Content-Disposition: inline


--ktqcJ4plNqwb0t69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 07:43:20AM +0800, Woody Zhang wrote:
$subject: "riscv: move memblock_allow_resize() after lm is ready"

s/lm/linear map/ if you resubmit, please.

> The initial memblock metadata is accessed from kernel image mapping. The
> regions arrays need to "reallocated" from memblock and accessed through
> linear mapping to cover more memblock regions. So the resizing should
> not be allowed until linear mapping is ready. Note that there are
> memblock allocations when building linear mapping.
>=20
> Signed-off-by: Woody Zhang <woodylab@foxmail.com>

What commit does this fix?

Cheers,
Conor.

--ktqcJ4plNqwb0t69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZISaUgAKCRB4tDGHoIJi
0laWAP4z2lkAoDmsLz77dp1mJR+bLMchM0rK0Ts2lt7Tph8YogEA9p/sz+WuUouz
GEVID6D/Inc6RxHIbBNY3VziLdR0ZgI=
=w7Ug
-----END PGP SIGNATURE-----

--ktqcJ4plNqwb0t69--


--===============4871911740360842927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4871911740360842927==--

