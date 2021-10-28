Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3861BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C1C60C40
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 21:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8C1C60C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdpXbWO3YE4okuLIJB35jBengXbtrsdryMEGHYdonnM=; b=TaF6yPrib3SV61UjBSQhUBjx0E
	c6NC7uhnpNLjV7JSClywKkUwP4GviDm5N+6VsCbbXMLKZ/MupKBtZCVEyrZxKleZw8psJa33oRG5u
	B+5RYOFJvpYOjpws88SLJkPLZh9CAfix71kbqe2uOIZTPRzZrfFm8p80ovfknfiP/kngDThRuHPmN
	LXok9Q+mQgjC0GD7eZH1+VT0cpKqX2hc6f0kdNczOqEwAfr+NMoKR8DmuTt5TjK0orfTRZ6YK8eVw
	LBb7LCqrlPoJWAa5N4vVAMOEpyXbjuAxDw6IXg9y5IQwR5gJlYsYwXGoup6ldXxOaNJpOyBOCMSSd
	ruBnOBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgClq-0097A5-Cn; Thu, 28 Oct 2021 21:17:10 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgClm-00978z-Oz
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 21:17:08 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgJKQ2sdcz4xZ1;
 Fri, 29 Oct 2021 08:16:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635455820;
 bh=77b6Wqpi5myKp7cmYqHYaq9WuF85O34cJH2RaLKBxUM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uyiUdjfjUiWv6vLY7jPJidnMGI3NSeDl4eLBuV23oGFhYPyvu2bFtGHGd5UjDCyvS
 EPcs0FJpU+zeV3rnXH3I1HRdkP1sa1PH9STvSu4HVtdqDpeaumLWwwRBuztVCLcqsV
 eyCKH3SnBnLFlEXJQKdh55UPr8M/NLZw37ofcK6RjzeRpGG2s9OSGO6s8pYe+gPZ8X
 rn9NfJgV83EAWJ+AfigdvyXIZUkNIbJ//Pf9iM8LgXUxuAldqRI71V4L/h/xqpsdB7
 knZKi/BNR7Qx679v7CqtWxPnHmNpD1/M+V08cW1VCJawFa4xLSI6USj2MDgcunhbO8
 XJs60vWbZwvzw==
Date: Fri, 29 Oct 2021 08:16:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, Linux-Next Mailing List
 <linux-next@vger.kernel.org>, <lkft-triage@lists.linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: riscv: delay.c:77:17: error: implicit declaration of function
 'cpu_relax' [-Werror=implicit-function-declaration]
Message-ID: <20211029081656.29a66889@canb.auug.org.au>
In-Reply-To: <3555118a-914f-8c21-d5c9-7f3d969d357e@huawei.com>
References: <CA+G9fYs6X5ce1BhynpivZLU7MvPq+vkrJCM7oSJf8GJBApCqZg@mail.gmail.com>
 <3555118a-914f-8c21-d5c9-7f3d969d357e@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_141706_991867_49066669 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: multipart/mixed; boundary="===============7999268577201509915=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7999268577201509915==
Content-Type: multipart/signed; boundary="Sig_/A+1lE0AWxzXcwYX7hLCIbyc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A+1lE0AWxzXcwYX7hLCIbyc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[cc'ing Andy and Andrew]

On Thu, 28 Oct 2021 22:57:02 +0800 Kefeng Wang <wangkefeng.wang@huawei.com>=
 wrote:
>
>  From c83a7b83ff96ba77a7c26090ccdd42aa7722788f Mon Sep 17 00:00:00 2001
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
> Date: Thu, 28 Oct 2021 23:03:13 +0800
> Subject: [PATCH] riscv: Fix implicit declaration of function 'cpu_relax'
>=20
> Including <asm/processor.h> to fix the implicit declaration of function
> 'cpu_relax'.
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> After  "include/linux/delay.h: replace kernel.h with the necessary inclus=
ions", we need this include.
>=20
>   arch/riscv/lib/delay.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
> index f51c9a03bca1..8148dcdee894 100644
> --- a/arch/riscv/lib/delay.c
> +++ b/arch/riscv/lib/delay.c
> @@ -8,6 +8,8 @@
>   #include <linux/timex.h>
>   #include <linux/export.h>
>=20
> +#include <asm/processor.h>
> +
>   /*
>    * This is copies from arch/arm/include/asm/delay.h
>    *
> --=20
> 2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/A+1lE0AWxzXcwYX7hLCIbyc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7E0gACgkQAVBC80lX
0GzREQf/Q4E7qFg/IApEKzU4bhquoI5QuysvDZvnFl9WK9ha8r+sAN0ZBIeODfa4
bmeKbb8JRfhdWbOzIyOIKAgF6lEawqDCxvSnX/muItuBCAsYK2wFe8ZfbKwTTsGt
vxADZEg9unMeiTH5BTlPGEpoCZFzMjha2eImRnLhysGjGa3jM9kUv+La24HizMmg
Hc/9t/qaJ0SmPL90kNbkqen1/546aKjG3wi0tvm+WPRWFPY/FFrJEz9ipf/mR5cx
yo09wZj7Rd5MQkI/VjGpRhsXsVltP4kWp2v4ZMBu+NnLB73ZzRaGuxWZsVNxuytr
N8yX9UabqHI0m57sW2UfWozd5ApNsw==
=ZeJi
-----END PGP SIGNATURE-----

--Sig_/A+1lE0AWxzXcwYX7hLCIbyc--


--===============7999268577201509915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7999268577201509915==--

