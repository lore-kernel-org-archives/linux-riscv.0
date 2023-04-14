Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98819C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbmK3jV1aar5T+TWe9DdLMSKOYDIBsgLmr6eGga9+30=; b=Lie6mipO+vKFwn54aSeRJhfRwc
	tDt3EuuB5YjBl2HRqtBp5Qp5O2WIJ6ohUWXWuZ4n/cdEAfaYuwWpne9DBZ8O+p8ntCkdUdGstn3im
	DK/B4bCYRQcqrz7BLtIbc16OR0pj6n0NPf6KGRsEr6hwpKElbRhR6qVJbCPvBXsii2WXGjw/yjkgb
	nFE2z35714GD3uGYBRP73c0Sd99VIBTj8Kdj9GzSfu45EPQbEoZ3q3+z/en21eMpbZ0Cv1UI6Muhv
	8n1vGbKUH927xdC/95NKLAJcehKwESlxKaOhxJQm0Z/X77x3wQ2Qqj8SyD45Rh4eA5Elv44HAgiRp
	t3illJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMZu-00A9Gb-2A;
	Fri, 14 Apr 2023 16:47:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnMZr-00A9Fx-2g;
	Fri, 14 Apr 2023 16:47:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 658C7647D2;
	Fri, 14 Apr 2023 16:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23059C4339C;
	Fri, 14 Apr 2023 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681490830;
	bh=V+3AlzUEvU220Qfu5FQzGqeb/Diu4gbuqSKPjUsqsC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOgMDPAuldNfaIluMPFZGKLBLlA8L0JYUjPEKzkuwUExITKMCZXQigT3XcKoJcymx
	 aPog8vXXskrALKG8LD4AOafSP0IL+QJHfMFbRks2OGwMLl7dFqMXpne/FpvWkTY+Kc
	 oKL7JmMX+lPQmny9Z69KIYPOTSo2Emz2uhzHGLI1WLNjL65j0WBtwjQqUSkoLHEZ6J
	 IaT/k2SF3VG+AsF+EbT8/JtXHtQDhrDR+UUTuhayv38FNdHSoFoOs7GA21xKPfJGJD
	 azmz2xKzRdTChQtfHUNRlSIW2Hk/9Hi429oxUjKCyWRxwifNBTxQ0gcZqfkd+mxOG1
	 NTngOnQlC86eg==
Date: Fri, 14 Apr 2023 17:47:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v18 07/20] riscv: Introduce riscv_v_vsize to record
 size of Vector context
Message-ID: <20230414-kerosene-jackknife-2bf17e228b1d@spud>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-8-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230414155843.12963-8-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_094711_903292_77C5024C 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: guoren@linux.alibaba.com, kvm@vger.kernel.org, atishp@atishpatra.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Xianting Tian <xianting.tian@linux.alibaba.com>, anup@brainfault.org, Masahiro Yamada <masahiroy@kernel.org>, greentime.hu@sifive.com, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Liao Chang <liaochang1@huawei.com>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Vincent Chen <vincent.chen@sifive.com>, palmer@dabbelt.com, kvm-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5031725077475095056=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5031725077475095056==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mODSqKfubxZdcXl/"
Content-Disposition: inline


--mODSqKfubxZdcXl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 14, 2023 at 03:58:30PM +0000, Andy Chiu wrote:

> +	if (riscv_v_vsize != this_vsize) {
> +		WARN(1, "RISCV_ISA_V only supports one vlenb on SMP system");

nit: systems
Clearly I don't expect a resubmission to change that!

You can re-add:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--mODSqKfubxZdcXl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDmDhwAKCRB4tDGHoIJi
0rSyAP9qZMzkst1MmzvhXVxyB6lP1VuWBHZln/+8EWDjVy1dawEAyvgTJdrucXuR
hwzRuGZuH4b2+10D2XhKW5cQ5K9ckgI=
=wnXU
-----END PGP SIGNATURE-----

--mODSqKfubxZdcXl/--


--===============5031725077475095056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5031725077475095056==--

