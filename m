Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D58CD111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 17:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBGuKGqrfQOQ0BwnjDNOp/zFwQjBm5ljnDqwMb5iICE=; b=YSfmbyyjCswWcOsMTlOr/zb2U3
	xl+ZLKsnDGNazVXuMYd/6NJFvfvzBDtR3DpTk4QpZhk3rMEOvTreL0k2L1/VnM/k80TnQVThE2gEc
	DfNkWatdk0jqJRZspvASlnDDKV5Inoqlek5IaT9J4eAaDBfT4onb2nxN8U1vpcsFEX6SVOEQRWJfp
	Dmalu/6k5pR5pBNJ5f8+KmDPwC6eJ1wjRt/behBS8dv9mPzmOCzp1bP01hq1sWrxPUfP9/hDlLSA0
	ZkxtPyyoYiMyxognkw2rS9P3zIQTCIU8ERFR8jG2eVxfaFekRRNJ92CfRnEmwPecIr1lXV2C2JTzM
	m7SAVf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfnN-0000000H0dn-02vU;
	Thu, 27 Nov 2025 17:28:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOfnL-0000000H0dV-10Bs
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 17:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65B3E60224;
	Thu, 27 Nov 2025 17:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248B0C113D0;
	Thu, 27 Nov 2025 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764264518;
	bh=l3P5ZCfOP+eyjvDmOMYppYEmDowRq4xuEB/nR6g0sII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1NZKKY0Hk9XXuWqQ5waVtrtcKyk0CmWj7f/IDMm4vhUszh8UpQZRs3BUa2T74ajN
	 783XpZsSlnx3Ax+i0u24gUIj1BgdvNA/Hr0CGZTdO024s1bJ3DLKwv73HqKF1s+QX4
	 WcLx2GjkZMpmfBlkWhdwWZVa+1mpL2u3Upsz4xfEhQRjRBrr/gk6YgE7A8JDvYsEAU
	 KV5ICvvCQPbTVotYb1CM5BL11jr1gYCG/y5VE2w0L9FRafl8N7a8zmxmY/Xwl79Xxz
	 rESnn4IIiwUMk8iYTaPYBMF569tgsc+a6E8irdTBKlgBIAFEDYu3L83qkTPVCYangN
	 bhClzLltHrC7g==
Date: Thu, 27 Nov 2025 17:28:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <20251127-tapestry-wispy-f790520ae754@spud>
References: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
MIME-Version: 1.0
In-Reply-To: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
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
Content-Type: multipart/mixed; boundary="===============0162948719152066437=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0162948719152066437==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q2nfZtZoNiMOXgju"
Content-Disposition: inline


--Q2nfZtZoNiMOXgju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 08:45:11PM +0800, Xukai Wang wrote:
> This patch series adds clock controller support for the Canaan Kendryte
> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> PLLs and an external pulse input, with the controller managing these
> sources and their derived clocks.
>=20
> The clock tree and hardware-specific definition can be found in the
> vendor's DTS [1],
> and this series is based on the K230 initial series [2].

FWIW, I've had this on a branch since 6.9, waiting for the clock driver
to replace the fake apb-clk-clock:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dk2=
30-basic

I'm assuming Stephen will grab patches 1 & 2 if he is happy with what's
here, and then I'll pick up the dts patch after that.

--Q2nfZtZoNiMOXgju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSiKQAAKCRB4tDGHoIJi
0ggYAP9cwEIbbYEhMwhtCpNVRYaBj4jB3LGed5ICY187QRtTrAD/SVmchC+vps1S
oRSDqD76SHQoz+NAImzg2pRnuMHP0ws=
=8dOF
-----END PGP SIGNATURE-----

--Q2nfZtZoNiMOXgju--


--===============0162948719152066437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0162948719152066437==--

