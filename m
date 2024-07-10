Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA75C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnyhD0n1bhmGUyClYAFzkgXQmh8loiKfXrPPx/deqJA=; b=B7XrJflMQxZr7qKkvlypPcIPRq
	QsCLrlGZadntlk1rKgc3fN4/htFHBpQv5VIAxykC1OWj0ljmXb0CnmdvOCRMsHQ8Pd8QboxuRPxCl
	bJ+prcEo95jmofN89B9w1Gz7QZErCk9e2XAbKRFGzEGXNwJ8UZgs4SHf7GShvNd6ZcB67YmfVj1ss
	h8F8VbPGrbsijdS1LGVb3XuQnJXlGrMMkOdRHQWatJ9FMiWhgdal5u7Fm26GHKqXBNE2eReZ9qGJR
	h618ICLN32nt9P61ufBGagkjI72n79LSifZoekWh80csamLtTYOU9KINZCYjia1H3B42f3cAuhg6E
	N4cdETqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRawI-0000000BHOg-1Hft;
	Wed, 10 Jul 2024 17:17:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRavz-0000000BHIW-2x9n;
	Wed, 10 Jul 2024 17:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49F8E6190C;
	Wed, 10 Jul 2024 17:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AEFC32781;
	Wed, 10 Jul 2024 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720631810;
	bh=gbQbaUuiVBZ3rY0fazMfEsDsmp1EJvBByE9rwhcqv1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gj3wTGeGvkQA66hJtscYz2CdurW/XaWmXT1LUad7xHcQlV6bJlMPYB6BYkarkGJzM
	 qb1fJH/GWYe++EsAN1YPqxKxmTx70mi2pArTryxpc+tBbCuVT8RugoF5J51N45APGN
	 x+ezB+0+cMxlPHdLjUWzayfTJu8mxxY70OY7vRayQ0pqy+eEScxUw5lPNBlw9PM4pl
	 gHRJ2FF3NJhmef1/MM9944Z03bUSEMfjwNa8lSQVOBXi6SLTpzX79Nj4r2tZ5j+E5e
	 PNrecmTOcerZ2rr+jDaPAfXGPZUcWnJiE7MQ+AaJcdd8y8iMm1ukZWkjVH5FmwuAtd
	 4eGDODAKNmXiA==
Date: Wed, 10 Jul 2024 18:16:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 13/39] KVM: arm64: Manage GCS registers for guests
Message-ID: <Zo7B_sRyUyxv7xmO@finisterre.sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-13-0f634469b8f0@kernel.org>
 <86v81d2s5t.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <86v81d2s5t.wl-maz@kernel.org>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_101651_867289_16FF01E6 
X-CRM114-Status: GOOD (  30.56  )
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
Content-Type: multipart/mixed; boundary="===============2920746553728632346=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2920746553728632346==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsBiN+tG2JsDrdFj"
Content-Disposition: inline


--tsBiN+tG2JsDrdFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 10, 2024 at 04:17:02PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > +	if (ctxt_has_gcs(ctxt)) {

> Since this is conditioned on S1PIE, it should be only be evaluated
> when PIE is enabled in the guest.

So make ctxt_has_gcs() embed a check of ctxt_has_s1pie()?

> > +		ctxt_sys_reg(ctxt, GCSPR_EL1)	= read_sysreg_el1(SYS_GCSPR);
> > +		ctxt_sys_reg(ctxt, GCSCR_EL1)	= read_sysreg_el1(SYS_GCSCR);
> > +		ctxt_sys_reg(ctxt, GCSCRE0_EL1)	= read_sysreg_s(SYS_GCSCRE0_EL1);

> Why is this part of the EL1 context? It clearly only matters to EL0
> execution, so it could be switched in load/put on nVHE as well. And
> actually, given that the whole thing is strictly for userspace, why do
> we switch *anything* eagerly at all?

GCS can also be used independently at EL1 (and EL2 for that matter),
it's not purely for userspace even though this series only implements
use in userspace.  GCSPR_EL1 and GCSCR_EL1 control the use of GCS at
EL1, not EL0, and the guest might be using GCS at EL1 even if the host
doesn't.

GCSCRE0_EL1 is for EL0 though, it ended up here mainly because it's an
_EL1 register and we are already context switching PIRE0_EL1 in the EL1
functions so it seemed consistent to follow the same approach for GCS.
The _el1 and _user save/restore functions are called from the same place
for both VHE and nVHE so the practical impact of the placement should be
minimal AFAICT.  Unlike PIRE0_EL1 GCSCRE0_EL1 only has an impact for
code runnning at EL0 so I can move it to the _user functions.

TBH I'm not following your comments about switching eagerly too here at
all, where would you expect to see the switching done?  You've said
something along these lines before which prompted me to send a patch to
only save the S1PIE registers if they'd been written to which you were
quite reasonably not happy with given the extra traps it would cause:

   https://lore.kernel.org/r/20240301-kvm-arm64-defer-regs-v1-1-401e3de92e97@kernel.org

but I'm at a loss as to how to make things less eager otherwise.

> > @@ -2306,7 +2323,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
> >  		   ID_AA64PFR0_EL1_GIC |
> >  		   ID_AA64PFR0_EL1_AdvSIMD |
> >  		   ID_AA64PFR0_EL1_FP), },
> > -	ID_SANITISED(ID_AA64PFR1_EL1),
> > +	ID_WRITABLE(ID_AA64PFR1_EL1, ~(ID_AA64PFR1_EL1_RES0 |
> > +				       ID_AA64PFR1_EL1_BT)),

> I don't know what you're trying to do here, but that's not right. If
> you want to make this register writable, here's the shopping list:

> https://lore.kernel.org/all/87ikxsi0v9.wl-maz@kernel.org/

Yes, trying to make things writable.  I do see we need to exclude more
bits there and I'm not clear why I excluded BTI, looks like I forgot to
add a TODO comment at some point and finish that off.  Sorry about that.

In the linked mail you say you want to see all fields explicitly
handled, could you be more direct about what such explicit handling
would look like?  I see a number of examples in the existing code like:

	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),

	ID_WRITABLE(ID_AA64ISAR0_EL1, ~ID_AA64ISAR0_EL1_RES0),
	ID_WRITABLE(ID_AA64ISAR1_EL1, ~(ID_AA64ISAR1_EL1_GPI |
					ID_AA64ISAR1_EL1_GPA |
					ID_AA64ISAR1_EL1_API |
					ID_AA64ISAR1_EL1_APA)),

which look to my eye very similar to the above, they do not visibliy
explictly enumerate every field in the registers and given that there's
a single mask specified it's not clear how that would look.  If
ID_WRITABLE() took separate read/write masks and combined them it'd be
more obvious but it's just not written that way.

--tsBiN+tG2JsDrdFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaOwf0ACgkQJNaLcl1U
h9BiTwgAhG9qd8c+aLOWRDYY+jgC3wxTF25VtO52AztM2Y4fyGfPMHg+GgALH/zW
kZPNqJcbu5fDOfkUg3obwE/dUqdlZDlbmmJBnaP1E9p3sXWuQ9sedlO17lyf3w8h
mzzFxLDCS0j01M5YNj4ql9LmC4sTOWyuzvzKDzDnLfM93Jdj6nhT4S0si+iQdBB8
PFhjdtH6qVUmQNG3ik40q/IPe+nA4u0mgs7XpKj8PuPtVDxe4SNhB8cZ8R+pEJBZ
f3EHvbndiotEBkFARu84AC/F3XfNhGNYlaZg/fwr2yfpfpFV/1Cz0LABhH9WojA0
z7VzLkWe/+pqYeMUNAJY6H+YDudaLA==
=InCr
-----END PGP SIGNATURE-----

--tsBiN+tG2JsDrdFj--


--===============2920746553728632346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2920746553728632346==--

