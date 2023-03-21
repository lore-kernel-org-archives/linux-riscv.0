Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BD1C6FD20
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjJ9IMoJ+emL52VL0gKv3hdOAXIcAM7ZnaKjGB7m51A=; b=u31yzNH6DSNPiFGTxGTtM0UrTS
	Hi/A4X0NO7zADfC+Jr0mcemguJNbyAr6jRoMERvQJXWWpu41oU/C0gtRF8bAJn7IEI8KM2HtkZ9Jm
	5i4ZDOwiucmmUypgOMrvPmDFFl1Hxt90+YpiSRhrwogSgWeOfoSonMglwGdZ8gKtYWlwRO3Bmb5zg
	NlnFNl8r9NDQYYuWHn4C7qzglecWbjQLsvIQwmol6EWqEliaBEI3FNAnLxrcjQ3uSEfuUObNrbIpR
	feo8e1KJYIRdRbSWFXDnGNlzmMyG4bDnqPPjDbew/MyhjQYcNPkkFrc28caF99/mzfj79VB2kHf9/
	N9YHxyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pekSH-00Dy5z-0I;
	Tue, 21 Mar 2023 22:27:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pekSC-00Dy42-1H;
	Tue, 21 Mar 2023 22:27:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3208B81A63;
	Tue, 21 Mar 2023 22:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C30DC433D2;
	Tue, 21 Mar 2023 22:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679437657;
	bh=XsHij0+BjfqI4rqTScfDv0AssQdKZ+pcm9X+ZsVj9qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0JEjCuWMLIE3T9sI7o71hYI6RGYvLIpfxbioYeLQa5FAz7EBzPRutNmbfUXBLsx6
	 8+wR0LZaqO1dWzFiQILDai586zNGXaZQuyjAcik1/hsTUCEuroUjX/cs+I7294n6Gq
	 UW852zdZvttEm9n+oqI8SGorf3kiNAKXgWBM1SN6fNUbl8qdHQ/lXL8+1M/7lYL3Rc
	 vhn9L0rhYDZmywiB+VcqcdZ/ndJB9zupIPNzf487Sn5I44opvVNG2/Bd+8CZ/8qEXy
	 l50E4Snc4j7AeJLCfjaRYs0RWd6TDSWbMH4Z+jTGLxkmunarRgTJ2lgeh0Jes9vgTD
	 QMuG5xfGhRqEA==
Date: Tue, 21 Mar 2023 22:27:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
	peterz@infradead.org, xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <89607a60-d3a7-4f89-84ae-bf3e65efb487@spud>
References: <20230321084650.769212-1-pengdonglin@sangfor.com.cn>
 <20230321084650.769212-2-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
In-Reply-To: <20230321084650.769212-2-pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_152740_623570_7B494169 
X-CRM114-Status: GOOD (  14.63  )
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
Content-Type: multipart/mixed; boundary="===============4625635841445600046=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4625635841445600046==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zJIfbxas1xSJly7d"
Content-Disposition: inline


--zJIfbxas1xSJly7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 21, 2023 at 01:46:49AM -0700, Donglin Peng wrote:
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c5e42cc37604..3efa4f645a39 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -139,6 +139,7 @@ config RISCV
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_GRAPH_TRACER
> +	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION

BTW, and this is such a minor nit, but if you end up having to do a respin
of this for some other reason, would you mind adding the new option in
alphabetical order?

Thanks,
Conor.

--zJIfbxas1xSJly7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBovUgAKCRB4tDGHoIJi
0pH1AP9ab3KXHhTA2YhZs4WtiizIGeRBhjdfsR9sovX0Iy+53AD/XUWT/IDFWMgh
lK/ZPBfSfjgOJ90dNrP/Yemt9EuGRQc=
=zBK+
-----END PGP SIGNATURE-----

--zJIfbxas1xSJly7d--


--===============4625635841445600046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4625635841445600046==--

