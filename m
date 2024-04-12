Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B956C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 07:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUaRbsoJWdLkCI6FkaaczzGFuZU7CKx2s2T5RK3QqJ0=; b=3xquRJSdlViV59ktzUKfztsgpb
	jw5uqF9s6eGdariTe+ycACSra0ZV1KGl+PS1XSjnpcrxg9aBuwZAElYKVniFYmS3HLYGqFFpWPnKQ
	dZja2ZBHU1/cL36O6H0TrBlwm6Vegv8yuQ1XP5TM0K0gAxeWpZ8WMBOtfZklW/D6x+vSNrXN88+w2
	gPxESzoVdGsp32PuWwf2X3ERlBJRxIsGw7wzpUab4CWpKcbtZY+0PXj44o/UzuBuYD2YQvIyRUXtW
	CdXzZ16j7plCeKBQovxCFDtWaJW0tMoEqlHn4WdQIt3qhabALJUrhgTrBxoGmqDroi8ae7pLocVpM
	p+lrXwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBXr-0000000FtYz-1CdA;
	Fri, 12 Apr 2024 07:42:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBXl-0000000FtWA-1CQj;
	Fri, 12 Apr 2024 07:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712907712; x=1744443712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vRauUdjmEXaNb3aJ9t3FYkcm7oavR/ToqvPX7bbz4uw=;
  b=VZmxKJc6KU9L2/4yPJjJCBAP5JJZuXN8E+DOPvmWjuUFUwr/bH58bDev
   NwM42irkn87h4in7I+qrjwiciPB+6PHvbd5aYt7HmmwgZ1+lw9ossHH4m
   m2Kbl2JV/E232LFuFlU6GtQKCzlWxpm78nw97mJ62PpjmOZecbWdUvLJC
   W+3GTntAmhA4QEBOQjyjd3egDcme2/DpK/nWxikMWutMTcvgz9atQvNSu
   TXgZhSAnKMA8lZJqoSmAGEQxwTNYgZeV5e2x1ppXNnvaQszZ9gcASuzVd
   Vs//kJWbsR1Zu6tMMutAw3Ibb0VN2JYdtOKU4K0f34+gYnhlBpmNVAUMG
   Q==;
X-CSE-ConnectionGUID: E4sSRy7HTmSlkU9T5OWDeg==
X-CSE-MsgGUID: KFqPtSAzSbOvrsO8JAXZEw==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="20655805"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 00:41:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 00:41:40 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 00:41:37 -0700
Date: Fri, 12 Apr 2024 08:40:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: <conor@kernel.org>, <ajones@ventanamicro.com>, <anup@brainfault.org>,
	<aou@eecs.berkeley.edu>, <atishp@atishpatra.org>, <dqfext@gmail.com>,
	<guoren@kernel.org>, <heiko@sntech.de>, <inochiama@outlook.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <mark.rutland@arm.com>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <will@kernel.org>
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <20240412-ivy-excitable-b740ff80c0d1@wendy>
References: <20240314-pep-announcer-2d7f10ff8b65@spud>
 <tencent_49E156C63C84E435E6F16509D6699339520A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_49E156C63C84E435E6F16509D6699339520A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_004153_748071_D0D8AEF6 
X-CRM114-Status: GOOD (  19.02  )
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
Content-Type: multipart/mixed; boundary="===============6219831476048100700=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6219831476048100700==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YcE8yn2YH89m/k/Y"
Content-Disposition: inline

--YcE8yn2YH89m/k/Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:27:28PM +0800, Yangyu Chen wrote:
> >> IMHO, it may be better to use a new DT property like "riscv,cpu-errata=
" or
> >> "<vendor>,cpu-errata". It can achieve almost everything like using pse=
udo
> >> isa. And the only cost I think is a small amount code to parse this.
> >=20
> > I suppose we could do that, but accounting for vendor specifics was one
> > of the goals for the property I only just added and that I am suggesting
> > to use here.
>=20
> I think there is a simpler way to do that. We use T-Head PMU by default
> for All T-Head CPUs (from mvendor id). Then, to test there is sscofpmf in
> the ISA string being probed by the kernel. If yes, then use scofpmf.
> Otherwise, use T-Head PMU.

I am strongly opposed to doing something like this. Firstly, making it
unconditional is a time-bomb as if T-Head ever ship something without
support then we'll be broken on that platform and have to return to
conditional behaviour. Secondly, we are taking agency away from
hypervisors etc that may not want a guest to use the PMU.

Cheers,
Conor.

--YcE8yn2YH89m/k/Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhjlaAAKCRB4tDGHoIJi
0vdsAP9wMESP3pjIW4X/gjaZdmF9qSoS1iPGX2xdeWah9RffBAD+J5sImHAkYWje
UrhSTPIfH7O2esfADX2481ITlcF4LwY=
=eWjq
-----END PGP SIGNATURE-----

--YcE8yn2YH89m/k/Y--


--===============6219831476048100700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6219831476048100700==--

