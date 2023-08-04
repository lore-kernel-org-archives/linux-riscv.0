Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC81C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogGY45YbuexfqnS9ZV079f1S81XpEvUPP3H2T6sAenQ=; b=iNFzjZBSSNQXrNEPfkVGXdjSIn
	KfGishd20ioLvCo3FLtoqWP7r5rzHmQo5ycF098GwvCoSEzeHy+2ZSPQczAFuf0kARZIxnVPWJZaM
	5dI7xoG9VQuFRAWY8tHX+qZQAFvKbIUsEywPU21TFHM0NqEjKe6J0JtCYiK+cNvCp3NimgLSTnGoo
	TJMn/Vxj2E7CCMMMAeSpOVI+X8D6BMuIo4aX7dGhSkEEA2/1EMdbwG+k3KpO1cMNisfkEwDk1CgpS
	XrCVcQgNj0BlUvzUGdMrQI+SqZLesPqNTyPXtGI16rv3VhJyfrjfWYA5czaN9s9/eoUp8IxKQcpzi
	xKbJ1pcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqlE-00Bxrf-2h;
	Fri, 04 Aug 2023 09:06:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqlC-00Bxqt-0L
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691139973; x=1722675973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HRKkBCsgZa2tr3CPFdaWMT/tn1Xo0mpaNu//7DKF8jQ=;
  b=CEdvuyCbk3712IcfORiXBwDCZ/RE6Bd+pjhf1Oe4T07EhheBKNHT1ZU1
   h2Nn1kW757SkCwSNh/7tdxIxDdJdAbOToTo/DKAnIN0+pNDWpKTrAiPiH
   vZl0x9cMT8TAv9qzoWphH0SVylh7uV5IYrzOR9YDWlyi36u6gHTRAeBeC
   8N1gWNFxychRxH2SD5pwgcYHCdP/B5nudUE9ZdhP01xVRDHQQPziA/epa
   4KUITGR2FZPcTs4qNiIF/GqKBrLf/+G82dB9cRlIWmBGnq8CiyP3RVtku
   bXX6H+7RHuOWmFi2nay64b6BErjC66e/AkHM2hkYtczCCVQWCrgVhVGXe
   w==;
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="asc'?scan'208";a="239780302"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2023 02:06:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 4 Aug 2023 02:06:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 4 Aug 2023 02:06:01 -0700
Date: Fri, 4 Aug 2023 10:05:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <guoren@kernel.org>
CC: <paul.walmsley@sifive.com>, <anup@brainfault.org>, <peterz@infradead.org>,
	<mingo@redhat.com>, <will@kernel.org>, <palmer@rivosinc.com>,
	<longman@redhat.com>, <boqun.feng@gmail.com>, <tglx@linutronix.de>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <rdunlap@infradead.org>,
	<catalin.marinas@arm.com>, <xiaoguang.xing@sophgo.com>, <bjorn@rivosinc.com>,
	<alexghiti@rivosinc.com>, <keescook@chromium.org>, <greentime.hu@sifive.com>,
	<ajones@ventanamicro.com>, <jszhang@kernel.org>, <wefu@redhat.com>,
	<wuwei2016@iscas.ac.cn>, <linux-arch@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<kvm@vger.kernel.org>, <virtualization@lists.linux-foundation.org>,
	<linux-csky@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V10 07/19] riscv: qspinlock: errata: Introduce
 ERRATA_THEAD_QSPINLOCK
Message-ID: <20230804-refract-avalanche-9adb6b4b74e9@wendy>
References: <20230802164701.192791-1-guoren@kernel.org>
 <20230802164701.192791-8-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230802164701.192791-8-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_020614_260679_07B8F092 
X-CRM114-Status: GOOD (  28.24  )
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
Content-Type: multipart/mixed; boundary="===============0592387340423948914=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0592387340423948914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ElWjm7UHbiNPE9YP"
Content-Disposition: inline

--ElWjm7UHbiNPE9YP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Guo Ren,

On Wed, Aug 02, 2023 at 12:46:49PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> According to qspinlock requirements, RISC-V gives out a weak LR/SC
> forward progress guarantee which does not satisfy qspinlock. But
> many vendors could produce stronger forward guarantee LR/SC to
> ensure the xchg_tail could be finished in time on any kind of
> hart. T-HEAD is the vendor which implements strong forward
> guarantee LR/SC instruction pairs, so enable qspinlock for T-HEAD
> with errata help.
>=20
> T-HEAD early version of processors has the merge buffer delay
> problem, so we need ERRATA_WRITEONCE to support qspinlock.
>=20
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig.errata              | 13 +++++++++++++
>  arch/riscv/errata/thead/errata.c       | 24 ++++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h   | 20 ++++++++++++++++++++
>  arch/riscv/include/asm/vendorid_list.h |  3 ++-
>  arch/riscv/kernel/cpufeature.c         |  3 ++-
>  5 files changed, 61 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 4745a5c57e7c..eb43677b13cc 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -96,4 +96,17 @@ config ERRATA_THEAD_WRITE_ONCE
> =20
>  	  If you don't know what to do here, say "Y".
> =20
> +config ERRATA_THEAD_QSPINLOCK
> +	bool "Apply T-Head queued spinlock errata"
> +	depends on ERRATA_THEAD
> +	default y
> +	help
> +	  The T-HEAD C9xx processors implement strong fwd guarantee LR/SC to
> +	  match the xchg_tail requirement of qspinlock.
> +
> +	  This will apply the QSPINLOCK errata to handle the non-standard
> +	  behavior via using qspinlock instead of ticket_lock.

Whatever about the acceptability of anything else in this series,
having _stronger_ guarantees is not an erratum, is it? We should not
abuse the errata stuff for this IMO.

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index f8dbbe1bbd34..d9694fe40a9a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -342,7 +342,8 @@ void __init riscv_fill_hwcap(void)
>  		 * spinlock value, the only way is to change from queued_spinlock to
>  		 * ticket_spinlock, but can not be vice.
>  		 */
> -		if (!force_qspinlock) {
> +		if (!force_qspinlock &&
> +		    !riscv_has_errata_thead_qspinlock()) {
>  			set_bit(RISCV_ISA_EXT_XTICKETLOCK, isainfo->isa);

Is this a generic vendor extension (lol @ that misnomer) or is it an
erratum? Make your mind up please. As has been said on other series, NAK
to using march/vendor/imp IDs for feature probing.

I've got some thoughts on other parts of this series too, but I'm not
going to spend time on it unless the locking people and Palmer ascent
to this series.

Cheers,
Conor.

--ElWjm7UHbiNPE9YP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMy/VQAKCRB4tDGHoIJi
0i4WAQCzkmqln57/kLaRZPtx560Zn+aRbe3oPrmbNsnASM/znAEAsOJHnqt7ygoV
utG4AXklmHWnwsLM0Qs5463EGKimzwY=
=9hTn
-----END PGP SIGNATURE-----

--ElWjm7UHbiNPE9YP--


--===============0592387340423948914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0592387340423948914==--

