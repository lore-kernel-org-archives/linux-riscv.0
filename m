Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A56C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBztDNBNOopsDhD/m4/QiX1b2pKEaAZNaoeCMf8zxgM=; b=SO595yz9ws4WndlnBoR6MPK++o
	K+7v9FeDZVcZQtjWrPPNjWNNlH37PD1HvLlrP+bOxzuxr4mAgnqrYb1+O9/3sOvfZNXjo5iPwdMKI
	rygKowwsPUtjbf3lezrFMIwTew6cZifMIHLguXQ/iZ81ZMyInpohp56gB7M64/CAZzBmnCfwoxjJp
	jkxGgAVXu/GXgEmp4eWi2JEDFNECRpjdIpWMnxZkf/jRNTW7L1+e410Uzr2opsJAdD0W2fGDvO2os
	eI36mzldMCLYe+e2swSlAtmQR7b+ZXH6PXgtLeVEVDHX5nP+ahsUClwrD6MqF9z3+I95849e3L158
	mL0ZXjpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1cS-00000005pDO-2zu2;
	Tue, 12 Mar 2024 12:52:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1cP-00000005pBo-1mzt
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0C6ACE12D4;
	Tue, 12 Mar 2024 12:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAEAC433F1;
	Tue, 12 Mar 2024 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710247950;
	bh=3Lst4rHk190LS/mdF+w4VIXC0m1eA4filNYo57TdeYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kv4L6KF15hOjEQgAOW11UYkhY6Ks3gb6yfmXKH/sH4sfq0qI1rKFiAuo72Z81UYJ8
	 Oy6T0FssypXawQC7tLZB+FsXbw/vY4lHlxNUixfSL+77yDV42pdsQa6iq/VcOwk5Tl
	 v2Slk2OXz6p4VYO8ZMB8QRs0uU/EKP8L/vFtkYu+tvVSyDHjUAkvucojCYeSV5m5QO
	 SfORJTUxdXxDkTT9sUvsH2eHVaLxCbiHvE9j/sn4uXfxn6WiYQPg5QD4ymQGOhfUuA
	 n+UyfpqwMqctILz8XyOncZgxExhkeVT75R/Gx8EUsxxhhhRoShD3VrqGz/d7avurRW
	 +S7lQLCoT0xRA==
Date: Tue, 12 Mar 2024 12:52:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH v2] drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_*
 while not supported
Message-ID: <20240312-simply-oval-135dfe40666c@spud>
References: <20240312012053.1178140-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
In-Reply-To: <20240312012053.1178140-1-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_055233_662175_A529B813 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Type: multipart/mixed; boundary="===============1228271412584422716=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1228271412584422716==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7wIqCZ6CtZGzbmbT"
Content-Disposition: inline


--7wIqCZ6CtZGzbmbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 01:20:53AM +0000, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
>=20
> RISC-V perf driver does not yet support branch sampling. Although the
> specification is in the works [0], it is best to disable such events
> until support is available, otherwise we will get unexpected results.
> Due to this reason, two riscv bpf testcases get_branch_snapshot and
> perf_branches/perf_branches_hw fail.
>=20
> Link: https://github.com/riscv/riscv-control-transfer-records [0]
> Fixes: f5bfa23f576f ("RISC-V: Add a perf core library for pmu drivers")
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--7wIqCZ6CtZGzbmbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfBQCQAKCRB4tDGHoIJi
0j6lAPwM72nK8LHC0w2dR+6JdRc7vB0lSIKmeAIsUvIAtrZiVAEAl88IW/Yh9Ns5
gwAccIoQyB0v0YVeQveHF0ZlBiMhAQ0=
=fLGd
-----END PGP SIGNATURE-----

--7wIqCZ6CtZGzbmbT--


--===============1228271412584422716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1228271412584422716==--

