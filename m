Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271FEC27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 18:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJU18eJVXAygYLeRqJpstmiH3H/M9O+YOqu+vu5KNBo=; b=FEFm40JvkxDp6xOcZ1V4upJVSV
	S2C5lPaqgLdFbskdr9ECERwk1s8eU1Sj8sPiLFYpKcQ075PAv9soWws8cKC7NascF0OY/+sPK2w2h
	WXQCyA5Ti2xsFJKgMTOxNRS6gG/fJqbB5jT67XgXOjpUYqvwAKC54xGrd4NjzBPqWbzHbCHV5NnSj
	S+DV6ArToXiycY8LPKJv/yNMTo+c5+lhhuM3lgmQTOulRFvykQ3vv2IOsZ7dlmemd7ZpyqARwfr9h
	XkHj2mUZ+cGwCd4YMld2SDlPePQU+4GG9J4aCceKCHuQlleL7csUabDPzZuxEi6bXBFz9kIWdiYGg
	lHcCbczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIuls-000000086vl-18pG;
	Sun, 16 Jun 2024 18:38:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIulo-000000086vI-2P4u
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 18:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FF5460DDA;
	Sun, 16 Jun 2024 18:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7311C4AF1D;
	Sun, 16 Jun 2024 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718563107;
	bh=mKljWFCEhr4ejc3sfHEzZLzWr53KPVcA5FfLGTbsJHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S78wpN6SwSUeYKlNi+qGGtGDZ/DGfl5WZYihFc4RNV+iekIa+BqjXaPCP3s/r99cc
	 SRcbh6rQgjTlxof1oFJa5cE1AQhwW2aJJG4SlA3cSICp1q7JbpKQK2DXmVx8LAPPG8
	 KinUnF3HWCIRITCC9VYrofnnlC/3s7XaDUqqHUv5Apy1V3e65poWfeyg7qOePqxti3
	 Vx4PFD9ampodJz7jEOgQzY9lFXuTo8ri4jkBr3f2cL5T1STHFa6Z7ovbkQaIl4c0KD
	 +ikBGtl2nU1i0lCziGuYLFPjnRrx2+PuaYKOAc3NClRsOP980nJq47Ipr74dOdUsPl
	 sS+TsW6pEK0iA==
Date: Sun, 16 Jun 2024 19:38:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS
 controller
Message-ID: <20240616-reaffirm-thud-e3fb4de33d7f@spud>
References: <20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com>
 <20240615-th1520-clk-v1-1-3ba4978c4d6b@tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20240615-th1520-clk-v1-1-3ba4978c4d6b@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_113828_701021_3C98583B 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: multipart/mixed; boundary="===============7125247044632316438=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7125247044632316438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GV1+ODsExlaKnTkx"
Content-Disposition: inline


--GV1+ODsExlaKnTkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 15, 2024 at 06:54:30PM -0700, Drew Fustini wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      clock-controller@ffef010000 {
> +        compatible = "thead,th1520-clk-ap";
> +        reg = <0xff 0xef010000 0x0 0x1000>;

Drop the 2 cell stuff here, it's not needed in the example.

Otherwise, looks okay to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +        clocks = <&osc>;
> +        #clock-cells = <1>;
> +      };
> +    };

--GV1+ODsExlaKnTkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm8xHQAKCRB4tDGHoIJi
0nakAQDI/dX7wq4wr9fhDskwIEdo5GYlExy1/hq7ZvnCAqI/sQD8DXYLfuYeZ3h5
b137VHF34ez/lW6qbnhU7C8kg1Cl3wY=
=2EDw
-----END PGP SIGNATURE-----

--GV1+ODsExlaKnTkx--


--===============7125247044632316438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7125247044632316438==--

