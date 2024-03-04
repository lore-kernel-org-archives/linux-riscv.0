Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4EEC5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 19:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRtwQ5/pIcgYh/xHTwobo7hYkmbXwVFsmZMp8Ua5pMw=; b=Dq/ervd++q46ru00p19hMLrNV1
	y4HXPCesr7QnMXeE1qmUAgSKcexDzWdsVItoNKwR716P0YQcJ1uFFXrKlfHJyUmF0s+q7XKv2A7yg
	7lavn820FpUI67flgdxaN19KJH24Sclcvh1deYCNiHE3sADR2lw8GctuGg47IM/7CT7TWC0x3mw/n
	n3lRa+G9GTjIC5W827Lu9Bj+ZB2+yRsyu28QMEHq/2DMZwY/Y0h5uzOvHSsLOXZpyub8I4XdZhU8T
	usJRb/UBgVhs1taNfp2k6JhRF569hubROJfqZ7mNUEr8cVz8PB1a5sIlV7g32g+qQI9BW2P65L3Oh
	SWkoE2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDxy-0000000ARGc-3Lo7;
	Mon, 04 Mar 2024 19:27:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDxv-0000000ARG1-44CC
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 19:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06DBE60AF8;
	Mon,  4 Mar 2024 19:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40826C433F1;
	Mon,  4 Mar 2024 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709580430;
	bh=NRGBFSK4UAvrZUKX4v3ipPB7T87gQNkUmQIBQgtrHhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g07YAk8CLZHQ43AdB8ZPf6pYoLYryNyswI6epfxNEN0+JvDkWygaKsd2i/tEN5Q+p
	 QGjHCr06rpUacf6XFj7+6t6FRGCCYrnme332ZfXtzeIJdPyJA+B2WPhSJzp8NRTj2r
	 pfTFb4CiC9hCzYzEsvBBoXtuI6vbmSIuHCYXcRj/Ocp0iA9XDh53h8W/WVq7z0yPK8
	 3M9+2zjE5oxnmj/zWgfUVE0m4aHThHS9SryjJ+q2360QcRuAyBclpGVISvf1ua88t+
	 1xjL5HassavRpM9UTiIfZLsusZfJbl6ZujRp0KZaZ8HEoU5cfxXvDlPKstVS3LA/oQ
	 xmU2IRo8La7kg==
Date: Mon, 4 Mar 2024 19:27:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Fix text patching when IPI are used
Message-ID: <20240304-makeshift-bakeshop-26c9611de1a3@spud>
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
 <20240229121056.203419-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240229121056.203419-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_112712_080489_D7BB6AD9 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Type: multipart/mixed; boundary="===============6544358944054737951=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6544358944054737951==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CGU1t6lbMj/vUiqU"
Content-Disposition: inline


--CGU1t6lbMj/vUiqU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 01:10:56PM +0100, Alexandre Ghiti wrote:
> For now, we use stop_machine() to patch the text and when we use IPIs for
> remote icache flushes (which is emitted in patch_text_nosync()), the syst=
em
> hangs.
>=20
> So instead, make sure every CPU executes the stop_machine() patching
> function and emit a local icache flush there.
>=20
> Co-developed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

What commit does this fix?


--CGU1t6lbMj/vUiqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYgiAAKCRB4tDGHoIJi
0qjkAQDn1f/dT64PtnCiJNs8Qio3UgBL19K4uIcjx/5UwnIPSgEAwwKcIIoDYm3r
ATY6C+CwtQiaTrYXHsoo0LaLIsGgCQ4=
=Ko4a
-----END PGP SIGNATURE-----

--CGU1t6lbMj/vUiqU--


--===============6544358944054737951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6544358944054737951==--

