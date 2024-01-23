Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE62C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bu71CtmzDjs3eAKFWlUqpgCd0HgqCkrBsoHedaE0RM=; b=xgitkfBSUP9pc95+WgCHXgFQc5
	HE/XdAinP46iRoXf1WolNW2OsV+iMt3oVJXkKC/MOVpdqvng1PFyOdQ62iqCNtJExY70/hSKh9CR6
	KBnIOrtMdxp0pM2cItOOFVSQb9aeAvR+mELZxUb36FLJn7x3+G/Hq2vfvOJWQj1KmjTvNj9Xe84Mb
	XV9GJV05ebjwUjW58Qid29Qs7atBhfxp/KUs+eWlK8qrToNN3Eonqb0jMQfT9Zfjejv4FxA1CNb6N
	jAXmBYQxjNeabsulSalwy8manAP1bSU1gi/VOWytPsqyDTCFAyDzYwsoZxyEKBA+VnIZMPnQ2bm4F
	cZh5xo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIUS-00Gzx4-2B;
	Tue, 23 Jan 2024 15:15:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIUP-00GzvG-05;
	Tue, 23 Jan 2024 15:15:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 818BB61DFD;
	Tue, 23 Jan 2024 15:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5312EC43394;
	Tue, 23 Jan 2024 15:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706022900;
	bh=WHHtfD6iWrYh6lpxYrEm1LYinhY12nzjgR0YqOljmIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMkU3ziG6x0MwU9H/Ex+ucf9Z82j2HcRucb73B8HwSjLWVCzWsevuQcAmxd1hW9++
	 oiVUobDyTg8AqEgn9SHeGwLvmI8cbJuCWctYlpKqz5kRPY6YW0OfeL5kbLXGdYuBf3
	 5GR5YHeBoaHEnnuVi7c9fiylnRxX5YIwy+eM9qqHx0L4HIaS8FQ2hZ0dCvDw4uJfdq
	 9gwc6G+1K8a8O4k/5mytq/7NeRqvSJae9vejwKusCBLaRnpnXbyaLPcUsT/Gw9LS3r
	 lhuo3C5i4OvQ6q0hpfLjpfBi0M9+ePGyFe50ABVg12Sx0UqjFVf0+CU5NTUrxEuhWX
	 3cMQGaxKyKYbg==
Date: Tue, 23 Jan 2024 15:14:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com,
	lukasz.luba@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org, beata.michalska@arm.com,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v7 3/7] cpufreq/schedutil: Use a fixed reference frequency
Message-ID: <302b454c-f735-4857-8cc3-101d223139b7@sirena.org.uk>
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
 <20231211104855.558096-4-vincent.guittot@linaro.org>
 <Za8cjQXptttuyb6c@finisterre.sirena.org.uk>
 <CAKfTPtAOJpr8VbXwSY_UMTf5Y2gEHAsobjHnJXqe1K1QDGygCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKfTPtAOJpr8VbXwSY_UMTf5Y2gEHAsobjHnJXqe1K1QDGygCA@mail.gmail.com>
X-Cookie: Stay together, drag each other down.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_071501_109151_2EFAA287 
X-CRM114-Status: UNSURE (   8.20  )
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
Content-Type: multipart/mixed; boundary="===============0543768882825168508=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0543768882825168508==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M/sd+h4waIyD9cAu"
Content-Disposition: inline


--M/sd+h4waIyD9cAu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 23, 2024 at 08:24:00AM +0100, Vincent Guittot wrote:

> Could you tried this fix:
> https://lore.kernel.org/lkml/20240117190545.596057-1-vincent.guittot@linaro.org/

That seems to fix the issue, thanks.

--M/sd+h4waIyD9cAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWv1+kACgkQJNaLcl1U
h9CM9Af/ZW1jVyySIIghihHPhUaTN6VzTCwUE6KJua1dSFK4a44q9koNBXFkOHtK
l1AArHtcboHKaIpkJddeN7nof7iIXXcVQoDOhk6SNwhlwCUZdVWpL2hbHOPt1Tc6
SCGoFV5RiBIQZwzbnI1vQDaEXvtX6lPw2yRRO85i7xOUpR6YnSoPNs1dMeS3Wn4X
eYjZinuJAmmFm13ea3DcoyVT5QBhAI37b6BdhujLiyK4x+qWdGC7uRi3yn8Ehk53
aq7OW2XH8COcWnH/VmNscUgZkUQI6oPgFBMekw2QtGRNmVXWWq+vFHHK1Qp+hFBp
B0QJ8KHDYkRvNNdhwgLcxEQTasqDhw==
=/XiG
-----END PGP SIGNATURE-----

--M/sd+h4waIyD9cAu--


--===============0543768882825168508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0543768882825168508==--

