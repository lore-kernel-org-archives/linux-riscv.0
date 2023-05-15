Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED9BC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZX0dxd2nvD0YKBLFp92ZFCeDlUvdN7DeICeiGYqvZ8=; b=EX6uEN0ldKycNa8t4obCLptgGb
	HT+dOKEbfg/9w6dT6vo1cUte79JVb1csyCmHaR2Q1zpazMY5Nfz/ORXeO4a7xt1zQ4PhcKwthXcZM
	SfXRhrspTST7NolyNs7VfC/4T2Ql6qwRLC1zLkjCM/7taMjHfHtoUpM8J7SymGSKhhAHvESaup4gJ
	fTS223P7SGrGM0WQ9dRywbOM/3xUa5kUi8FhKlpdb/3hUKLAX33Xg+mY30xx7lu7JRmA9PlSSSbfs
	WijmbRk6ilF1fu2Nf6akJelbUkY++0sedfiZWQ3EFrGiA9rUs2IKkCqa+H5PQwT536RbWtKDnoouE
	CTy6EDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWGI-001xcn-0l;
	Mon, 15 May 2023 11:21:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWGF-001xcJ-0l
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 11:21:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A50C622B1;
	Mon, 15 May 2023 11:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A59C433D2;
	Mon, 15 May 2023 11:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684149662;
	bh=T9fUIZM//OsaJoszK2rbswFzc+I4mXJQ/XmvdRAp4Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxnqPdLb3m/VqY4ug2kVgU5qZqloUDQHQVPZeluUdr8l3mjkkvoXSaXdxIToBfBtO
	 Fz8kuh86bJ+B77su2sh0jtfsfCjMgOvg5Z3tLhC6AC2NcrthHURs5hmszzoiqM7f58
	 kao6P7OhvBtH7deZIW92FOwbCSM99Xyl2dCFlMJOFJ8hJsDoxrZkv90EQfKZEQJUNT
	 xkpyJiAAMy66g/HsIgDDEvPMdPQHP3AzjjkU3FxZJZIFUzv1rJNMaKZHZJwhY99BnM
	 fClP+I7y5JGSE+N0ybTcTlCnDS73tXDdg2Vg5outqNhUp+U5xGsR2aXB1ftLLPLTrH
	 V0ReRNOs0Ouiw==
Date: Mon, 15 May 2023 20:20:59 +0900
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Message-ID: <ZGIVm6LHMpIylvAC@finisterre.sirena.org.uk>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-4-walker.chen@starfivetech.com>
 <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
 <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
MIME-Version: 1.0
In-Reply-To: <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
X-Cookie: Avoid contact with eyes.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_042103_336308_4CC8FA02 
X-CRM114-Status: GOOD (  13.12  )
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
Content-Type: multipart/mixed; boundary="===============4333103905984093584=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4333103905984093584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mqP7O91n5Vmg09iP"
Content-Disposition: inline


--mqP7O91n5Vmg09iP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2023 at 09:58:12AM +0100, Conor Dooley wrote:

> It's only been 4 days chief, of which 2 were the weekend, you don't need
> to bump it yet! You'd be better off asking one of your co-workers to

4 days, 2 of which were the weekend and 4 of which I was on holiday...

--mqP7O91n5Vmg09iP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRiFZoACgkQJNaLcl1U
h9A3UQf+Pl3EGxms+J3grtXRzBY+ejt6SgLQdSTJw9Uqz7Fwgfsw7oQ+yPWHDHp1
mXYCBFBWzfWWVh+Q9ogUF7GFDGMM9GmzU2ywgbDvmrxKBugimlXWbEArFWNi9vdr
qNsA4VX1rXD7qkkDptHDxoHuhcIsef6Rc3SGhCjByAeom+lEgOrPLmLOSxO+Fuh5
SemO/Tlac48KtG2L+oNRrQW3EVA8buAkkilgRmPpXOBQpJRinJNy/Lfc7KSCqk1U
MT4BpMeIS0kugU0brTvopy7W8+VuZhuflVhGOn9DWiKPJLz1Dt59TpKcdE9ABGVV
KcFKmBwEaJacIJQ8yKhiiEakuLImFw==
=6jDZ
-----END PGP SIGNATURE-----

--mqP7O91n5Vmg09iP--


--===============4333103905984093584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4333103905984093584==--

