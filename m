Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0ABC83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/H42hooCId8H0jK7CvUSTUE4CfsRrVa8lWKZflkvj70=; b=skfO+Nb6HgPqdk2Zz3yfzkE2Pr
	b7uLRFR0va19rIzCofzhAWVS7SlD+/Hv4cf5guCJ0PfqEyWMgGwv4q2yaNjLALek2dvym+YBrbzLx
	KKi+npHPYZwtYtLrahoK6S5soHQLhL8C/pI8JGPU/pmle+vzFowh0p2CBbfqV4QghE4FT2p5netLs
	TnWv21NsKAvMt7gIHVIcGQid32xA5FvTqqn1ssg96kpf2c/oNn2lGF7MdgvAo0XpwzII8nuiz8uc6
	gy/Ii+uNf+JI6e8D0wD/5YvwpERJfFp1VsN14HKWBDn6pp6hXpYcbEIdt3kffex8KPz6lEEhhA9bZ
	3sbLqneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFSz-00000002xnM-2PRF;
	Tue, 22 Jul 2025 16:03:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEo4-00000002r09-28Dl
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 15:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD3A446209;
	Tue, 22 Jul 2025 15:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A82C4CEEB;
	Tue, 22 Jul 2025 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197687;
	bh=cf0wdr1CvohXeEFUICFRM8xLV372zGAy0zsKMtrFMXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGWPeere1LxvDxtuOVyK02QKkMZdY/fVcf3E5EfkgtyPVXEpfIZetiJTqIPg6s6j9
	 YJByTAcP1O7AxFqkFRYruTsfur3tgCok95h9i1AiVWwtTy8a7Hcs24Q50fvvoybvt4
	 cYShSTzeVcdZZf5MkEgnSj/SWHw+I6njph+UnSvxkVAhPGJ2B0NlJE+q0MGlwXWtrF
	 fZzVc3HoTb1KeDQediGCl/TFQtgf1d5g3kLFLIHbup9dx8+haFDDAJdtms4o/EOmrH
	 3AOJ7RjTgegP+cTvP4CWvn4pwGiPFMFNP8CQ4j/rYnMTEdnAVH0AhROTlfa9taabHM
	 EKu8+sih1BI1w==
Date: Tue, 22 Jul 2025 16:21:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 08/10] riscv: dts: Add initial Anlogic DR1V90 SoC
 device tree
Message-ID: <20250722-proposal-gothic-e0c3725e0874@spud>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
 <20250721-dr1v90-basic-dt-v1-8-5740c5199c47@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250721-dr1v90-basic-dt-v1-8-5740c5199c47@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_082128_567280_88B0F899 
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
Content-Type: multipart/mixed; boundary="===============2715435275526635388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2715435275526635388==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="afRjLr3VfY6LSQZo"
Content-Disposition: inline


--afRjLr3VfY6LSQZo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 21, 2025 at 11:46:14PM +0800, Junhui Liu wrote:
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <800000000>;
> +
> +		cpu@0 {
> +			compatible = "nuclei,ux900", "riscv";
> +			device_type = "cpu";
> +			reg = <0>;
> +			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
> +					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
> +					       "zihintpause", "zihpm";

Why do riscv,isa and riscv,isa-extensions differ?
If riscv,isa is not even accurate, why not just remove it entirely?

> +			i-cache-block-size = <64>;
> +			i-cache-size = <32768>;
> +			i-cache-sets = <256>;
> +			d-cache-block-size = <64>;
> +			d-cache-size = <32768>;
> +			d-cache-sets = <256>;
> +			mmu-type = "riscv,sv39";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +	};

--afRjLr3VfY6LSQZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaH+scQAKCRB4tDGHoIJi
0kcxAQC07OuxpRCZ8Q37NhGJuCtcTQZB2khVWHrIO4eTpF1rigD9EGK+eM/M4tcx
h1x5Hhtr6tSWm89moTRnYqNzdGKdzAw=
=q4nA
-----END PGP SIGNATURE-----

--afRjLr3VfY6LSQZo--


--===============2715435275526635388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2715435275526635388==--

