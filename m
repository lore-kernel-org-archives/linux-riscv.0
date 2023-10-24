Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84624C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWRhsEjzoEl0E9qS79/TIbsLuqD2exjNVMbquz8pItw=; b=3DluXihFXc8e9wKt6HG3DgClFY
	Ok97W+eg/Ogm0qDf5cDmzMv5rBY1ZPQK4KvwlWtE9AgGPWgTKFGtFe0o/rNmYeG1VVrwWFRopQP7n
	caTQPJu0CFHiaghU2Nqneks4Yj76+lOHlS4FItegu28KrAPDYJZuNyt9BWtd5QJG4rSTOGqv+e7/E
	I3QSf1pdslmQOdTorOwKfaNjGmTYtAQIoGb57HtFXm0Wv4v5Kc/9/MbN2jaD6kypMlUfwR6BBqL8+
	DrH5WLZuLM4eu4B23osCxRShnnh45AplzOdT8od3j9Dcx928LEbzMjmadVKNoY4B4sq5Re1rXO2hA
	uoymGYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFYx-009eDM-0S;
	Tue, 24 Oct 2023 11:27:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFYu-009eCj-0t
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 11:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 87F8FB80956;
	Tue, 24 Oct 2023 11:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE02C433C8;
	Tue, 24 Oct 2023 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698146821;
	bh=2wXYMomohZtC7rIjZmL3EoEmBxPnWmSu7xQpbiuwlYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=be5rKlZgvJ4qn4V7gR3EKbnEIaCw2m2lkRJudqTOMaJg29vq4zA12+oH99P4Y/blG
	 /O3CGRXyo84eGmxPdNP0SINIFrmyhhW10TvLQtfpXXY/pnOr8G3x/nbKOe9CqRSX2v
	 iSOb+ZLVJNPUGQmxt8BlR7G5n0xzh8eJNMTzleZj5GtsXjxOaM3XRljSue589rpYBy
	 eth0s/SgLhsZyhMxKIMjnCl+mYApu9nAoigs4EBqNzGolxPVluoKPm8xyhYd6YjfTr
	 aQ0xs+jpLUZj+aFCvWhFELXZoRAqJVWDxmvOybbjyol1+s0owNspj7Pl2gTqG4f6Ix
	 TNZuF1iHATcdg==
Date: Tue, 24 Oct 2023 12:26:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, peterz@infradead.org,
	tglx@linutronix.de, Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Mathis Salmen <mathis.salmen@matsal.de>
Subject: Re: [v3, 4/5] riscv: vector: do not pass task_struct into
 riscv_v_vstate_{save,restore}()
Message-ID: <20231024-dejected-boundless-d07204fad441@spud>
References: <20231019154552.23351-1-andy.chiu@sifive.com>
 <20231019154552.23351-5-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231019154552.23351-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_042704_490146_180314A7 
X-CRM114-Status: GOOD (  10.59  )
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
Content-Type: multipart/mixed; boundary="===============0643803685859283260=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0643803685859283260==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RTOJZgpqJC0F+Spm"
Content-Disposition: inline


--RTOJZgpqJC0F+Spm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 03:45:51PM +0000, Andy Chiu wrote:
> riscv_v_vstate_{save,restore}() can operate only on the knowlege of
> struct __riscv_v_ext_state, and struct pt_regs. Let the caller decides
> which should be passed into the function. Meanwhile, the kernel-mode
> Vector is going to introduce another vstate, so this also makes functions
> potentially able to be reused.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v3:
>  - save V context after get_cpu_vector_context
> Changelog v2:
>  - fix build fail that get caught on this patch (Conor)

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--RTOJZgpqJC0F+Spm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTep/wAKCRB4tDGHoIJi
0uJCAP9g16hVYWO0PwWip0kc6O5FzPbFA0JuDN8dQcq/K95QtgEAmrLEMO30XY9t
/KCeGnzbor57W9TtowlLk/J6OcWDrwE=
=pTVP
-----END PGP SIGNATURE-----

--RTOJZgpqJC0F+Spm--


--===============0643803685859283260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0643803685859283260==--

