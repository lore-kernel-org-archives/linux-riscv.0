Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711E3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LItZNPxGkwsqxHCcS3zeqGj8cVi3rrDLr3Snx9i1uRs=; b=Sch0DzXkDTyG8g82rAjJinqQPc
	w0KNNHTKhDKG88R7Z+4+6FxFW/mpkLvl6bRQ5/qlwdJ90iFlMgK3NVyLl69sicEstW2rMwD7C1Dom
	55SuWe0BmRM3vrhyohQbFh9DK+s/BlfxvlHVtoY/MeK5lew5HG/ZvsIpO1XSrc4V3Q8scxlRXCqXm
	UXhy3Xoe291foPMBxfQpt1AXZ2d1OybZoJgwtXoNNPLYylNTaJ31zIMmligITAEaZn2fZnemyX9ik
	EIbjV2q95JHU1P9VvJlFVp0xJWRcdk5UKBAGXrS1dKpT8wLxdE7njxNPlQxIOBY1pxjpv3VysU8rz
	N5HN+X3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30wp-00GqWc-17;
	Tue, 14 Nov 2023 21:27:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30wn-00GqW0-0o
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:27:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E9D361369;
	Tue, 14 Nov 2023 21:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6F1C433C7;
	Tue, 14 Nov 2023 21:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699997267;
	bh=9ZG+AI0fj8e2HRbIkqu4+FdTFxFjv/se3KzEuXLYjE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbOwQLkUw5smV9aA4vlMU3nBnCLux1jYUWonswLnx/gA1I1q720MF1kd6lE0Qi8Ik
	 5Rz7sRRCZgM9XaIHOTtcibx1VkiTsUjmbwIZxRPab0tcQBm8Wr9LaxU/Bp1k0giRRA
	 E2OiD5RtqesBxSLMAhsZefkWnkSGmnVlFAuZHjJIiFv0T+nD/mltv2xS4u8n2UZL5f
	 YAeXfZB3cgkLAwFd6Krh+hGDEWL4CSXvDVLRZOnYofv4mRLNwQO0igm/3gxEJzKHJm
	 am9WSpEgVOYbpJuFOEzBQG9EjZvBa0saSwKXMgpYKVzAx1O4LbHgxe8EsAr1CLzq4E
	 35U4ARqDTtT5Q==
Date: Tue, 14 Nov 2023 21:27:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
Message-ID: <20231114-starring-swarm-0e1b641f888c@squawk>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <20231114-th1520-mmc-v6-5-3273c661a571@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231114-th1520-mmc-v6-5-3273c661a571@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_132749_329973_CF23600E 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Type: multipart/mixed; boundary="===============5323638345157885770=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5323638345157885770==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="luEG+7A6lTHoA2TH"
Content-Disposition: inline


--luEG+7A6lTHoA2TH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 04:07:59PM -0500, Drew Fustini wrote:

> +	sdhci_clk: sdhci-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <198000000>;
> +		clock-output-names = "sdhci_clk";
> +		#clock-cells = <0>;
> +	};

If only you had a clock driver to provide these...

Is someone working on a resubmission of the clock driver?

--luEG+7A6lTHoA2TH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVPmTQAKCRB4tDGHoIJi
0lBuAP9U7s7Dc8QCdpB5PoIv2t5+2ZksodPnAE+UTFB0b2B4iwEA/05GHKJqoHi1
lD5+SQ6yUh9/FlIek1FwIChWYiF72As=
=O9oG
-----END PGP SIGNATURE-----

--luEG+7A6lTHoA2TH--


--===============5323638345157885770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5323638345157885770==--

