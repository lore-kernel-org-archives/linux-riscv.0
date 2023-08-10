Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D628C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdzSErCGWBz7NGurGH+QjetI9RoVYXz2mh0QX4Gd03Y=; b=YHBFHEs1szcdpN24LinCNvnAKM
	e8fK7HhySQy8X4YIoZUkgC+bauSbGUpNSqkIOZAwv6xH4f+D74OT1CdIhbEVW73jxnZ2ICbf/GhYf
	ypRwfG/4cl91UTiAFKYhLi5NbsIps7o9pnxPpgBHOWOF+N8NZtHmgDQxscWAixVtwtg6y/DpXIgJR
	gGvao6IseO66iM5AECrC5UJr9pXlBFJDIXN/gHXv0oVjmC6XwTkbg6hZORBpyZiPCVbvwdaS0MUEW
	0T3uhU65wngdKdS9SBEFSK63FA6EbEqxuqFWQqPgcsyaSRjPkISn/fs+P4OMx6tMIZCZvg24dpIRA
	mB3rH5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5dp-007ijR-10;
	Thu, 10 Aug 2023 13:23:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5dn-007iir-06
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 13:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691673830; x=1723209830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r/2rEs6sk4n8Afm08j77d/A2HeG2HqeLY2UlP52R7eI=;
  b=CU/kIpjJL/hnpCNArpBsMQyNcJu+4f85kMMU/7cetZpIeuh3Pu60m6uS
   ykKB7v0mdk5F3rVGzFtgG0kBV5/DRCZi3zjwizzb/F/uEOZVOHbQ2rjp+
   krDqa6FCrG4Eu99ATUB8PDXzzBHLjvTgcqYEuNKKFMRjX6kyRUFqqKwle
   F6p/wIpsJrCcnlfZAXE4Wxsi2tyoO+geOgnJz0WSjGnIigeGI7aTsXIB6
   w9B+Y9Wg0eKOTTHr0S/R/AAvVsHh09Vema9GSZC1tkSvqtRhzCCvP0oaM
   Yje29/1C19K1u/1hQn+1AgLniObjvUqmiVQ6z7VqAQHK7bHp7kYevb0bY
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="asc'?scan'208";a="229177352"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 06:23:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 06:23:49 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 06:23:48 -0700
Date: Thu, 10 Aug 2023 14:23:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230810-gem-exes-f579746ecd1c@wendy>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-10-ajones@ventanamicro.com>
 <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
 <20230809-7aa41e2dd2fd2909f1266a20@orel>
 <20230809-disrupt-jersey-f2545c5903fe@spud>
 <20230810-30583d716fb7652e22c868ee@orel>
 <20230810-caution-rise-a12e7210c670@wendy>
 <20230810-87ec8c9c6bac02f5513c9f78@orel>
MIME-Version: 1.0
In-Reply-To: <20230810-87ec8c9c6bac02f5513c9f78@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_062351_228714_45BBF241 
X-CRM114-Status: GOOD (  11.97  )
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
Content-Type: multipart/mixed; boundary="===============8085989492371548576=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8085989492371548576==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bw9XzXXcASP/XuzE"
Content-Disposition: inline

--Bw9XzXXcASP/XuzE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 12:54:56PM +0200, Andrew Jones wrote:
> On Thu, Aug 10, 2023 at 10:34:33AM +0100, Conor Dooley wrote:


> > I figure said change should be independent of what's going on in this
> > series?
>=20
> Yeah, I considered doing it as part of this series, but then decided to
> only start down the path with two new wrappers, which, for v2, I'll
> change to the cpu parameter taking variant. The rest of the rework
> would probably be best to do as a separate series, which I can start
> soon.

If you're offering, who am I to refuse!

--Bw9XzXXcASP/XuzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNTkvgAKCRB4tDGHoIJi
0p6KAP4ykHSbROV468x0KcqTvXt9NAHhuXqhH4IsMP0xwJZ1RQEA+bbKdMxwdCX+
DhP7yEwL3tcZq36lEJhXR0Bd+p3f/QQ=
=t0cC
-----END PGP SIGNATURE-----

--Bw9XzXXcASP/XuzE--


--===============8085989492371548576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8085989492371548576==--

