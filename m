Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BC7C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEGLJ91likW7nGX2ZlMjdV6qtlSHS8248VSUFQlTgks=; b=jI+VyDtt3KGnZ3WC+u2iO29UT/
	SvZ7Vbz4/jRMqf0fRTrWauVIVp4Gp4eElFvu/tGDPExDmmrwPFAdSUo74MMxICSkcJ5NqDq4gWzLn
	yOQKA15UUO0Ut0QE4MCQp+uthxwRWNU23BYAr99JdIlPvsyZewoNqeJPFSkEwZqK7nQpdnvISVWQ2
	q0u8RyvvgSH6srHxdXYkWr2IZ+VP4o6rahDQ8lC2qS+mxXeiSHQyg42iPyRvVnaMK5ZOgUebS8iYP
	AV7b9CeA0Dby0V3CtEO/MuatMb/FJ6EiG9xlEeSyeFFfpeQMKaac6eQJ50E8Wc2HV550nfpTpd2b7
	iJib/71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqSi-003AKV-11;
	Mon, 24 Jul 2023 07:58:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqSg-003AJe-0u
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 07:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690185513; x=1721721513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hmt7xfiPyvJaMa3R9zRjqxN8rPCKuTvVzkvbII4D/lI=;
  b=FILKkpvl+R7i8mARU62ucMQl39C1Xr5sPbDi62PoGzSMsPNKz1AvFFaB
   rvx5kOCTtMZaw2g3LGFG+UzbEUFVTKAfEKQzrlEzdvQELK4pFdbO67rKl
   gGvhlZnlcbqweyJj/JAGD2ONfmgoBpCE8hJ1WlQ8SBRGugLJzJC+1bj6s
   phD4NhObhfOHJgxcII3ZJa2P8un1tjm9bZ/vTSs+7WHlBZnq/E4deB8Nw
   PWq8L0yglSRQRIq+pf0mk2l7reiIK4sSLQiccZ8+g67HWLYXFKE37fRUj
   9xvwarkjoUUPE9k1EMvwIWGTvTyZzxK/xLxTT/dc/C3XuogQWp3jqzmt6
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="162821140"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 00:58:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 00:58:07 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 00:58:05 -0700
Date: Mon, 24 Jul 2023 08:57:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Mina HuiMin-Chou <minachou@andestech.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <chenhuang5@huawei.com>,
	<tim609@andestech.com>, <dylan@andestech.com>, <az70021@gmail.com>,
	<alex@ghiti.fr>
Subject: Re: [PATCH] riscv: Move the "Call Trace" to dump_backrace().
Message-ID: <20230724-guzzler-affair-48c4d77d7fd2@wendy>
References: <20230718023201.16018-1-minachou@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20230718023201.16018-1-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_005834_382661_0B3CDEBB 
X-CRM114-Status: GOOD (  19.77  )
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
Content-Type: multipart/mixed; boundary="===============0456277678548879385=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0456277678548879385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VkBnadg6bT6+Jehs"
Content-Disposition: inline

--VkBnadg6bT6+Jehs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 10:32:01AM +0800, Mina HuiMin-Chou wrote:
> From: Hui Min Mina Chou <minachou@andestech.com>
>=20
> It would be appropriate to show "Call Trace" within the dump_backtrace
> function to ensure that some kernel dumps include this information.
>=20
> This patch is based on Chen Huang's comment [1] and Palmer Dabbelt's
> patch [2].
>=20
> [1] https://lore.kernel.org/lkml/mhng-75c14e1e-a23c-404b-a1f6-235e53bdb6f=
3@palmerdabbelt-glaptop/
> [2] https://lore.kernel.org/lkml/20220419174842.488-1-palmer@rivosinc.com/

Is this change still appropriate? It was cited as a fix for syzkaller
but a year has passed since then and it may not be required.

Alex, do you know?

>=20
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  arch/riscv/kernel/stacktrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrac=
e.c
> index 64a9c093aef9..ff136031a592 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -118,12 +118,12 @@ static bool print_trace_address(void *arg, unsigned=
 long pc)
>  noinline void dump_backtrace(struct pt_regs *regs, struct task_struct *t=
ask,
>  		    const char *loglvl)
>  {
> +	pr_cont("%sCall Trace:\n", loglvl);
>  	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
>  }
> =20
>  void show_stack(struct task_struct *task, unsigned long *sp, const char =
*loglvl)
>  {
> -	pr_cont("%sCall Trace:\n", loglvl);
>  	dump_backtrace(NULL, task, loglvl);
>  }
> =20
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--VkBnadg6bT6+Jehs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL4u6gAKCRB4tDGHoIJi
0odTAP9nPoMEdYQFNTVQBPn3RVUJmgiVEG56XDvWHRxYCH3XWwD/a+jZyyuw6zt8
88mZOPaOy4qZA4aJ78CHvcHA4norTgc=
=1Oxx
-----END PGP SIGNATURE-----

--VkBnadg6bT6+Jehs--


--===============0456277678548879385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0456277678548879385==--

