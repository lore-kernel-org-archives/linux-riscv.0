Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442E3C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fMTSKWs22m74ZKWU9eN42Pl1cIAAMrJaIvdQp6uZ+o=; b=LeMVo9UHcNF+1vpqxllvn40DpO
	V9N13vggPBRpvYqOZjORlfRQs9BIZymHjCQ5VP+E3mdiihFKqLOkkng133jS9kxnrCMbzc5hHg0Z/
	IoUnleL/LXKl6cpZIA2CrWrBsJp9Z5HxAYgvt7/Iji7koGzSnCO0E1BpDQcpBVcYC7zJpBM5ByVpY
	oaHQc6v95vl4UZsKW+9I6nH91ihbA187MDUkN9Wy4hJIGhgf/Yi2tRlj38I6ZKaN1P56fXPtn68Mu
	12sAVAicjZvzhkFlAHpLdoJkUGJw6vzA+lAOxWMPPCkFa8vmGF1KK9ksJS7kX3LrzlpPiLG4EdunX
	EZnx4Wwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q573N-007JA5-2G;
	Fri, 02 Jun 2023 15:51:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q573L-007J9U-1g
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 15:51:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30FF46519D;
	Fri,  2 Jun 2023 15:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677FDC433D2;
	Fri,  2 Jun 2023 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685721057;
	bh=uB7RdhiqMXZj0Kk8iwK91jgxrux4B83iiv1sDrmQEb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgxhZO+CpHzVztd4Rlg2GqHIDY9LhuL7yIEBQkCSCluRAvLfeeRX7102ZG/WsC4la
	 3UoK5isDFzScpbDAi63KBAdyv0ferp4ed6A4Qh32p/lc9POgbh+WylP93SNvFa4RHQ
	 v08XTgyG51jddoSvkvxFnG7nQ+WyIvfwTD0cKxaRdGmLiIkBUSxq2NGnQn5MrSLH9i
	 2+Dwpk0o2081y9MX/lJCu7vVa5JQS2qT1jaHsEfWyo+XhN2CNay458l1L7z3QFg+NX
	 2ZBOosnbuEgzDi1420H2I8qIhhthbXe9jbAHfP7FJUXmEbTsQT4N+CsJQDC+EJQEvv
	 O+6EkxYGVI7dQ==
Date: Fri, 2 Jun 2023 16:50:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: (subset) [PATCH V6 00/21] Add basic ACPI support for RISC-V
Message-ID: <20230602-reformist-jet-9fd642b971d2@spud>
References: <168571787727.17224.6663458864222960682.b4-ty@rivosinc.com>
 <mhng-4fad860f-b5ff-4dc1-968e-219be1983acd@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-4fad860f-b5ff-4dc1-968e-219be1983acd@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_085059_631700_C17BE38F 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: linux-doc@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, Bjorn Topel <bjorn@rivosinc.com>, platform-driver-x86@vger.kernel.org, linux-riscv@lists.infradead.org, qianweili@huawei.com, herbert@gondor.apana.org.au, corbet@lwn.net, Marc Zyngier <maz@kernel.org>, daniel.lezcano@linaro.org, linux-acpi@vger.kernel.org, lenb@kernel.org, aou@eecs.berkeley.edu, markgross@kernel.org, hdegoede@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, nathan@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, wangzhou1@hisilicon.com, linux-crypto@vger.kernel.org, rafael@kernel.org, luzmaximilian@gmail.com, davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============4056643839519799159=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4056643839519799159==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Yq3pFkyoejdiFUi"
Content-Disposition: inline


--5Yq3pFkyoejdiFUi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 02, 2023 at 08:11:04AM -0700, Palmer Dabbelt wrote:
> On Fri, 02 Jun 2023 07:57:57 PDT (-0700), Palmer Dabbelt wrote:

> I also don't yet have any testing for the ACPI stuff, but hopefully I'll get
> around to adding some.  We should probably add it to the patchwwork CI as
> well.

Yeah, just like DT testing should be added too! I am planning on doing
some work on that front next week, hopefully I make good on my word...

Cheers,
Conor.

Also, having ACPI support in means we now need
https://lore.kernel.org/all/tencent_B30EED51C7235CA1988890E5C658BE35C107@qq.com/
to be compliant with the ECR. It doesn't apply as-is, so I will add a
Fixes tag & rebase.

--5Yq3pFkyoejdiFUi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHoPwwAKCRB4tDGHoIJi
0oOjAP9bCWu1mHF0lnDALjWsfK3ipt7wNaQvkVtzWRvXSaAe+gEA8E5S7Doc/P7x
0QVi9g8WmJX7vWKUTklpsWiBLsEd8w0=
=ON4g
-----END PGP SIGNATURE-----

--5Yq3pFkyoejdiFUi--


--===============4056643839519799159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4056643839519799159==--

