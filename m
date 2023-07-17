Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB193EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfsS5G8mFb432sWxzLt3gwYuo8a+EvJDvgQGloZmj3E=; b=yPAyaHandvTAkQ4QZ9xQo+frm6
	VDexSV+fuMY4S5iD7N/ecEthz5qw1lrGXLtQK4xc+TgeSNwPPIV45P/tQYtDM8WxM2tfgrdwhElkj
	0otNcBU+GubIlN+8w97RdwmOwqsUQONHYavi+xrB1cZ3aAVQ9TWRunHdGsGa6FLpxGPEQBzYsTdY8
	pyPaDO9ZCNPS8gYc/9o5FpjSKwRV1nA+lHrlPAzdQcQ9ca90G3V0cRmVzZqNrBzjniBmfc0rwONlR
	6QVm1wpI76ZMirrIgFIGaNaSedUjQaex8c5Xvvi9VQdCwePw8z2kXO/QQ1t4ngxNG4vhciK0gQ2mN
	pmnG4rgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLKpV-003gA2-0y;
	Mon, 17 Jul 2023 09:47:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLKpH-003g4R-0G
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 09:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689587251; x=1721123251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wTSUEg7WMy5pZZw6QuTkLvX4QcoSQM8WPMiVZCviRA=;
  b=DqIojCTAAiu7T+7+jAsyS990IKSZH7lcha2mEpDUMu0a5OGeInrL1Wp6
   VF5RgUEA+lEbLvkgNyXsTEJzQaIVW2561Rs33wimCUcJcnA2P9ZGwFLPS
   kHALU8Ky2DWgV6hy289WGKLekcFy6vT6JcMc3st1uTdBmONhL5lKeqOad
   Tr5kmqbPAW0ZP/aaEzR68RUzTzmvCaMVW43uSXp4GHG1gfFbG4S5wvn2u
   C3Ei4ecyOfBnL8kA07gDQ8yzA+7mmk0rIutGVj3/+tT6JTTHiFcx3I6aj
   pb/1dE97pLkqr3gDboHeSzKNqyWmxbAzWqEpGEadAOJnLtDFBf6LfVS2f
   w==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="224171288"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 02:47:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 02:47:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 02:47:19 -0700
Date: Mon, 17 Jul 2023 10:46:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<vineetg@rivosinc.com>, <bjorn@kernel.org>, <greentime.hu@sifive.com>,
	<paul.walmsley@sifive.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Jisheng Zhang
	<jszhang@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Vincent Chen
	<vincent.chen@sifive.com>, Peter Zijlstra <peterz@infradead.org>, Andrew
 Bresticker <abrestic@rivosinc.com>
Subject: Re: [v1, 1/6] riscv: sched: defer restoring Vector context for user
Message-ID: <20230717-rearview-rural-2bafe2536270@wendy>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
 <20230715150032.6917-2-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230715150032.6917-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_024731_322448_12D5071A 
X-CRM114-Status: GOOD (  15.23  )
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
Content-Type: multipart/mixed; boundary="===============3863756550896520610=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3863756550896520610==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="thIv0f1zri0Eny+o"
Content-Disposition: inline

--thIv0f1zri0Eny+o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,
Small bit of minor nitpickery..

On Sat, Jul 15, 2023 at 03:00:27PM +0000, Andy Chiu wrote:
> User's will use its Vector registers only after the kernel really

Looks like the ' here can be removed.

> returns to the userspace. So we can delay restoring Vector registers as
> long as we are still running in kernel mode. So, add a thread flag to
> indicates the need of restoring Vector and do the restore at the last
> arch-specific exit-to-user hook. This save the context restoring cost
> when we switch over multiple processes that run V in kernel mode. For
> example, if the kernel performs context swicth from A->B->C, and returns

"a context switch"

> to C's userspace, then there is no need for restoring B's V-register.

"to restore"

>=20
> Besides, this also prevents us from repeatedly restoring V context when
> executing kernel-mode Vector multiple times for the upcoming kenel-mode
> Vector patches.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/as=
m/thread_info.h
> index 97e6f65ec176..d83975efe866 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -101,12 +101,14 @@ int arch_dup_task_struct(struct task_struct *dst, s=
truct task_struct *src);
>  #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
>  #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
>  #define TIF_32BIT		11	/* compat-mode 32bit process */
> +#define TIF_RISCV_V_DEFER_RESTORE	12

The rest of these have a comment, should the new addition?

Anyway, no meaningful comments from me here Andy,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--thIv0f1zri0Eny+o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLUOBgAKCRB4tDGHoIJi
0ilHAQDulE3wMoJbKqdZYd4ykGS7IqkE3U0ZALcbwO6agUsubQD+J+hNTYBTDTwm
BuzVF9Dtzn4peJzTMQiqEQ7xZdkMAwo=
=6Lob
-----END PGP SIGNATURE-----

--thIv0f1zri0Eny+o--


--===============3863756550896520610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3863756550896520610==--

