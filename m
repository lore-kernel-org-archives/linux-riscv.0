Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398B1C53210
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 18:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnUDLJKq+Kcx2l95/+GdyLfk9eI0V8p/JuechVdUC1Q=; b=kW8oZalI0aC4Tb1DeU6ICjq9Vx
	OWaGhzHzRv4BxEXq3oOD1xUJohPp18uw48XHypVSpdWoqjuQ/CQRfS3Vt+tNUGZNHYyIA2s+uiq4c
	4vhj9XdCpq7n2nEsAsNElnrO+D0fhonGhYePyIMK0ZOux+51xBlPL534BT9B0lMX2GJKZvd++67eP
	2NSpzszLi3uIg/RcrK5ud8cG2vqwjjQpIQpd3namn3jyj+O1JRw0TcRERcv4H1uhPZ9jHnwE8ctJX
	yjh1bzOiPFANNsZw+YrNjD5unJ90Q2qSUdmaynFV/lNEfkzGPS9SEWmjCjZnMjXdv8gATmMgCdDr7
	yNrk2kRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmPD-0045bY-T0; Tue, 03 Jan 2023 18:52:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCklS-003FFb-V6
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 17:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E8ED9B81047;
	Tue,  3 Jan 2023 17:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDCCC433D2;
	Tue,  3 Jan 2023 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672765663;
	bh=UGU0wQk5Rz5vpjfRCrgvNQs/jjE9iD1PMT5uCeHYMMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0uNLLry+2HwoJmCXdR6Z42NvUWGrrgkKdsrP2OJcwlJE512QrP/hlGqRBc+QjhZH
	 q6plqSawA0hKQwDKO4I2qVkuAcgltCtbGFpzU4UzZb7gAcUq5ubJ/xZGpnWdiSptvj
	 WTdrFwfe4dIe+FzDvqhA/cyZLegojGc1AO/pA0DiLz2stvw6nPQ5rhYRtkkbkba6yq
	 9YXeqVeC3Mkmy7BrnA5OknE/j8z8TxYvZzUFu8Cis+ypV93aWDzTMlvpOo1KS5ktvj
	 GLL2oAElQ41l6ziZ2+FdLLjmtXOD1bCjPqh6SndEfkNRc/YR+sTUaD8FsLmiLFA8BN
	 4AHJU6bxU/r+g==
Date: Tue, 3 Jan 2023 17:07:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ley Foon Tan <lftan.linux@gmail.com>
Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Message-ID: <Y7Rg28suWh1RUbkU@spud>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
 <20230103065411.2l7k6r57v4phrnos@orel>
 <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_090752_615838_1F169413 
X-CRM114-Status: GOOD (  30.93  )
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
Content-Type: multipart/mixed; boundary="===============0308217207739986338=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0308217207739986338==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bFhWM6tuHAs59VuW"
Content-Disposition: inline


--bFhWM6tuHAs59VuW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

Couple comments for you.

+CC Sudeep: I've got a question for you below.

On Tue, Jan 03, 2023 at 07:53:38AM +0000, Leyfoon Tan wrote:
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
> > initialization stage
> > On Tue, Jan 03, 2023 at 11:53:16AM +0800, Ley Foon Tan wrote:
> > > topology_parse_cpu_capacity() is failed to allocate memory with
> > > kcalloc() after read "capacity-dmips-mhz" DT parameter in CPU DT

Uhh, so where did this "capacity-dmips-mhz" property actually come from?
I had a quick check of qemu with grep & I don't see anything there that
would add this property.
This property should not be valid on anything other than arm AFAICT.

> > > nodes. This
> > > topology_parse_cpu_capacity() is called from init_cpu_topology(), move
> > > call to init_cpu_topology() to later initialization  stage (after
> > > memory allocation is available).
> > >
> > > Note, this refers to ARM64 implementation, call init_cpu_topology() in
> > > smp_prepare_cpus().
> > >
> > > Tested on Qemu platform.
> >=20
> > Hi Ley,
> >=20
> > Can you provide the topologies (command lines) tested?
> 2 clusters with 2 CPU cores each.

What's the actual commandline for this? I'm not the best with QEMU, so
it'd really be appreciated, given the above.

> > > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >=20
> > Fixes tag?
> Okay, will send out next revision with Fixes tag.

Please don't just send versions to add tags, Palmer can pick them up
if/when he applies the patch.

> Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot. ")

> > >  arch/riscv/kernel/smpboot.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > > index 3373df413c88..ddb2afba6d25 100644
> > > --- a/arch/riscv/kernel/smpboot.c
> > > +++ b/arch/riscv/kernel/smpboot.c
> > > @@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
> > >
> > >  void __init smp_prepare_boot_cpu(void)  {
> > > -	init_cpu_topology();
> > >  }
> > >
> > >  void __init smp_prepare_cpus(unsigned int max_cpus) @@ -48,6 +47,8
> > @@
> > > void __init smp_prepare_cpus(unsigned int max_cpus)
> > >  	int ret;
> > >  	unsigned int curr_cpuid;
> > >
> > > +	init_cpu_topology();

I know arm64 does this, but there is any real reason for us to do so?
@Sudeep, do you know why arm64 calls that each time?
Or if it is worth "saving" that call on riscv, since arm64 is clearly
happily calling it for many years & calling it later would likely head
off a good few allocation issues (like the one we saw with the topology
reworking a few months ago).

Thanks,
Conor.

> > > +
> > >  	curr_cpuid =3D smp_processor_id();
> > >  	store_cpu_topology(curr_cpuid);
> > >  	numa_store_cpu_info(curr_cpuid);
> > > --
> > > 2.25.1
> > >
> >=20
> > Otherwise,
> >=20
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


--bFhWM6tuHAs59VuW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7RgvQAKCRB4tDGHoIJi
0jhvAPwPJ7Hk0k4PcWgouMMd1dWjyjc6Brvu/ySku6YDn2yYQQD/d1s8Kfw0bmSy
Gly1ylo9G9DKJfyp8U6AnamulIqamQI=
=5tyW
-----END PGP SIGNATURE-----

--bFhWM6tuHAs59VuW--


--===============0308217207739986338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0308217207739986338==--

