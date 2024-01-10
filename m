Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A867BC4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ue1kIpUIPp/lTNvV72vM46+ZO9gRlskk6TQD6r0c8vQ=; b=E0DBIdFArhBVwgQXzPZG7yfBRh
	P8DhbXA2qSj++BqiA7bq0Vxm733iL/6T7yCa1xg8x5Jc6k7FiOAsbxx7zay+0oAwDIhYSmgDcMEsd
	Ud1cmSuUYIfQvym0XCNfI3RnCjgOAoHPmYoqgfn+ngs9LI3d6wLFa8sNcNUXr2X/LXUMiEcFtIY1+
	i9EM+wLRfbMj+SJtEgfq+diCpIg0zk1wrCX1xd+zpw6QvuJBrgLZj3ldc6Haur44FKrIKS1MY4h3u
	GvJoJ7XHw7E2yUb+7e2y5AZAkJj7cj6FgzdMSJeeh4/fBLEP4f/gpmUGC17spnuTncYt0SST+eZCh
	2Q/Co3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZKf-00CEHO-1t;
	Wed, 10 Jan 2024 14:13:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZKc-00CEEn-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 97CA3B81D7A;
	Wed, 10 Jan 2024 14:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CA2C433F1;
	Wed, 10 Jan 2024 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704896000;
	bh=ubT3JpCdUdX478eUAkGKG4N/VQnjYxl/ajam8KuCzW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8rvpcHO+s4fz4TNsN/HyfY+EIuzENurVJp3ihv32jRMWh3bE5uRVQ6yn6TDagupv
	 AK+L8u0WZmOWZeJKFpLzri36x03PmKAbtEsHTGABMWcA5CnL1Yao6Kh6m/kS/F5UFP
	 IJ5LBTyhV023i+Ds4OxmscnIxA0mja58bmWf7sszIrKcEjtp9A+oki/mICAftF25o0
	 vc+dOdx+Tk/A7zsoH9ASJXqLKcottwvx0Paqx/QHCtG8hweuQC/p9/0Dh8g2M94KOP
	 wxOAjGIw5oq+T5OGqRrrs5PeEkdml7/gM4bdYpuQL7KWSZaV4qLlw0tgu/8Z9w4WDG
	 osLhuF9hoT/0w==
Date: Wed, 10 Jan 2024 14:13:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v7 4/4] riscv: dts: add clock generator for Sophgo SG2042
 SoC
Message-ID: <20240110-sedative-reggae-389839cef8c4@spud>
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <25650372c373b15309cd9f3822306838e556d3c7.1704694903.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <25650372c373b15309cd9f3822306838e556d3c7.1704694903.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_061322_364431_86E6CF9E 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: multipart/mixed; boundary="===============5056457403237876670=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5056457403237876670==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nm/CphfyKzDGNTF4"
Content-Disposition: inline


--nm/CphfyKzDGNTF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 08, 2024 at 02:49:53PM +0800, Chen Wang wrote:

> +	cgi: oscillator {
> +		compatible = "fixed-clock";
> +		clock-output-names = "cgi";
> +		#clock-cells = <0>;
> +	};

Where does the name "cgi" come from and what does it mean?
Clock Generator Input? Does the sg2042 documentation call it that?

Cheers,
Conor.

--nm/CphfyKzDGNTF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ6l+QAKCRB4tDGHoIJi
0qa+AQCAkXm3hnS/5roeUv9wiqA5TkGqnJfy0iNrxNKOnLioewEA+fTdCxQZM2mJ
WwMBMSTwB4ADTuG2ZWVcgoFa66ptYw4=
=MhZh
-----END PGP SIGNATURE-----

--nm/CphfyKzDGNTF4--


--===============5056457403237876670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5056457403237876670==--

