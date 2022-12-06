Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E73BC4708C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xYzFR6k9/2QNDa/49ndwvYGpVHlLzjiSBQm3q8QfXY=; b=piJ4TTenPKvyG87qGSo2/IpMlO
	D6fNdFmbGJt7rg87y4oRgkhAB98GvSg7T2XFaDmQgfFmAOpVgQu4ED42VLUuycKc2K0pIkpflzwAA
	LMelcGQBU1WREDUBXXn+z/tZKt9RL9VoLtFm+ShMIwbJoJ53a35yS/1uBYeX7UF9RPzvjCOWtvKXX
	6qAGNJ/1ZSMRYeTFoWhWldzdd/xzsD9AED74jRu4NDj8C1Q4LSxA1chcLudxf2pNl1ANmyAdWwXHz
	P4mvRBPglNi+6Cm3ZRLDRYuIgQ+kjOvF1aUuXlqAGu0Qra5sxiMV2sa3rtMR34GLOve5fdpLXfosr
	1ukAAuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ac3-00ETlb-Iw; Tue, 06 Dec 2022 16:16:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2abx-00ETjw-PI
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 16:16:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 102D5616D0;
	Tue,  6 Dec 2022 16:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5658C433C1;
	Tue,  6 Dec 2022 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670343360;
	bh=Ke9Es9vSZpyqQkkD0xDtUqrPPPHQ+QXHuO92AWRtX1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUXtY072QKTqR8dVGI+9RxyL8a/07FbLRZKpQFkI2akpBJwWtmuuHo/zeS78ST/Qf
	 wP2/KK2eINwmdiPfNITsaR9WfOhcSYz6y5s2nm4bmhqoBREpfZbf1B9hxAPsj47EjF
	 ZJUBaQdtleCUphhzQsxxXtoWNCJ1pu/pLZ/g5he8AgCtJ+TzSqoKVjhuHFSYhiN9oA
	 tZqWfbaK/RrAATh9ob6ayzFEHtCOCvp5TOAS+gijQdU6SKKmQIJc+0kvbBhRw1eQ6g
	 zFFOcpW5WnJtDw8agTkOQgjbJhfIrC+hGE1UdG7xj9WalzmiA6wS3uu0itEMVJlJAi
	 3lR8mjTR8oeIA==
Date: Tue, 6 Dec 2022 16:15:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Changbin Du <changbin.du@intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: stacktrace: Fix missing the first frame
Message-ID: <Y49qvHb3LVas1cvO@spud>
References: <20221205132936.493245-1-liushixin2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20221205132936.493245-1-liushixin2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_081601_916582_BBEDBA77 
X-CRM114-Status: GOOD (  23.34  )
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
Content-Type: multipart/mixed; boundary="===============3778646798378298064=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3778646798378298064==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/esEgmKIgx6lEmfS"
Content-Disposition: inline


--/esEgmKIgx6lEmfS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 09:29:36PM +0800, Liu Shixin wrote:
> When running kfence_test, I found some testcases failed like this:
>=20
>  # test_out_of_bounds_read: EXPECTATION FAILED at mm/kfence/kfence_test.c=
:346
>  Expected report_matches(&expect) to be true, but is false
>  not ok 1 - test_out_of_bounds_read
>=20
> The corresponding call-trace is:
>=20
>  BUG: KFENCE: out-of-bounds read in kunit_try_run_case+0x38/0x84
>=20
>  Out-of-bounds read at 0x(____ptrval____) (32B right of kfence-#10):
>   kunit_try_run_case+0x38/0x84
>   kunit_generic_run_threadfn_adapter+0x12/0x1e
>   kthread+0xc8/0xde
>   ret_from_exception+0x0/0xc
>=20
> The kfence_test using the first frame of call trace to check whether the
> testcase is succeed or not. Patch a7c5c7e8ff78 skip first frame for all
> case, which results the kfence_test failed. Indeed, we only need to skip
> the first frame for case (task=3D=3DNULL || task=3D=3Dcurrent).
>=20
> With this patch, the call-trace will be:
>=20
>  BUG: KFENCE: out-of-bounds read in test_out_of_bounds_read+0x88/0x19e
>=20
>  Out-of-bounds read at 0x(____ptrval____) (1B left of kfence-#7):
>   test_out_of_bounds_read+0x88/0x19e
>   kunit_try_run_case+0x38/0x84
>   kunit_generic_run_threadfn_adapter+0x12/0x1e
>   kthread+0xc8/0xde
>   ret_from_exception+0x0/0xc
>=20
> Fixes: a7c5c7e8ff78 ("riscv: eliminate unreliable __builtin_frame_address=
(1)")

This fixes tag is not right, did checkpatch not warn about it?

The correct fixes tag would be:
Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1=
)")

Maybe consider automating the creation of fixes tags, like so:
git log -1 --format=3D'Fixes: %h (\"%s\")'

Thanks,
Conor.

> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  arch/riscv/kernel/stacktrace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrac=
e.c
> index 08d11a53f39e..5fe2ae4cf135 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -30,6 +30,7 @@ void notrace walk_stackframe(struct task_struct *task, =
struct pt_regs *regs,
>  		fp =3D (unsigned long)__builtin_frame_address(0);
>  		sp =3D current_stack_pointer;
>  		pc =3D (unsigned long)walk_stackframe;
> +		level =3D -1;
>  	} else {
>  		/* task blocked in __switch_to */
>  		fp =3D task->thread.s[0];
> @@ -41,7 +42,7 @@ void notrace walk_stackframe(struct task_struct *task, =
struct pt_regs *regs,
>  		unsigned long low, high;
>  		struct stackframe *frame;
> =20
> -		if (unlikely(!__kernel_text_address(pc) || (level++ >=3D 1 && !fn(arg,=
 pc))))
> +		if (unlikely(!__kernel_text_address(pc) || (level++ >=3D 0 && !fn(arg,=
 pc))))
>  			break;
> =20
>  		/* Validate frame pointer */
> --=20
> 2.25.1
>=20

--/esEgmKIgx6lEmfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY49qvAAKCRB4tDGHoIJi
0kI7AP9Wd277d8/BzwLH9y34IUIT/97w2cZ2oh4ldowck5Y9bQD+I+ltzljWIlqI
5d5NHjHdSGLSMbBS/qCnorTUjpi+tgE=
=l4hT
-----END PGP SIGNATURE-----

--/esEgmKIgx6lEmfS--


--===============3778646798378298064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3778646798378298064==--

