Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0FEE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URq+VdQVSwq+dpDVwpLNz2v6Vji9PryEG/JT8Crd2DY=; b=c2F1JRz36yENhFh6pIvSK5OyW6
	Nlm/smznHWQAC1jz1t0+8KPuVrGbNBnK/fvyMJEvrXZwEizF03lC0wPnteBWzyZ8SEo9ju3Gi+WA1
	9ovdbgizfLVr9fYJoIk/KexpsfBzPOtDeoXHIH2IR4rf2hvGoU+Y27ecZZN79CWx7twBoMT9D6hvs
	D29m2sG6ZpYayXvJWtzKmTqgBHrdsB9RKMVYe3CDTyEJlPk6rJT/dQDcypfSWeejkF9h1WBiTZBW1
	YCsAfOgYJA7OLCRfIF5CPedmGo5JVXRszf+/CSpH1bclR9QdnQ4uk5VJ8CECG57nKbJifdfvQJ8Aa
	AUyq+1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfg96-000UnA-0F;
	Mon, 11 Sep 2023 12:36:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfg92-000UmF-0s;
	Mon, 11 Sep 2023 12:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694435760; x=1725971760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nJFDCSCYRu6WgqpO0P8o9k8Fk7g2YG2V+UabQjK1F0I=;
  b=b/XfjxknNkRml+6PzoYBZU7Y4KFpjU2gdnJzfRt5XibPYnvBbbNE3foa
   4e2Q/pHpVHUZLitJ7rDtYRPdpjpTDthzE8CzdEl74tg/avU1uQd7P8IC7
   iTKzou99bsxJlgddIDtqkkJ5Ge+J/+vG/FcXroo7hfmmZ/vg/9Z1Zg6OV
   gy5uhSXXB8zqh83uHUV9B/VewL8qSULBxwNBZfa4mCkeZlHsN0CXJ1rUu
   gDuhU1dOruhwU5ZHoMN+3KVLu/bxgAEz/H6WkG9mlZLapp42LuDzbysBR
   Icdk2+wdHlmHyMEoTobP77/iTXr265oiWZLpxEYDOkstdpuuTV3XGuiHz
   w==;
X-CSE-ConnectionGUID: 6ljN90N3QJ+9ydbJ9OLrug==
X-CSE-MsgGUID: K4MjJXbnQt6wrUlyUlkyaw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="asc'?scan'208";a="3976159"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2023 05:35:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 11 Sep 2023 05:35:40 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 11 Sep 2023 05:35:36 -0700
Date: Mon, 11 Sep 2023 13:35:21 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <atishp@atishpatra.org>,
	<anup@brainfault.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<ajones@ventanamicro.com>, <heiko@sntech.de>, <samuel@sholland.org>,
	<geert+renesas@glider.be>, <n.shubin@yadro.com>, <dminus@andestech.com>,
	<ycliang@andestech.com>, <tim609@andestech.com>, <locus84@andestech.com>,
	<dylan@andestech.com>
Subject: Re: [PATCH 3/4] riscv: errata: Add Andes PMU errata
Message-ID: <20230911-worry-reformat-fbb5c473085d@wendy>
References: <20230907021635.1002738-1-peterlin@andestech.com>
 <20230907021635.1002738-4-peterlin@andestech.com>
 <20230907-158e1f7e1e866d8c02726c9c@fedora>
 <20230907-7bc08398d2f95c14e1c0bc76@fedora>
 <ZP6ADIAqZn0kkxwB@APC323>
MIME-Version: 1.0
In-Reply-To: <ZP6ADIAqZn0kkxwB@APC323>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_053600_418328_554DD0BE 
X-CRM114-Status: GOOD (  44.17  )
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
Content-Type: multipart/mixed; boundary="===============9092412296236603923=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9092412296236603923==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+9uiuXeVPrdkDknr"
Content-Disposition: inline

--+9uiuXeVPrdkDknr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 10:48:44AM +0800, Yu-Chien Peter Lin wrote:
> On Thu, Sep 07, 2023 at 12:02:46PM +0100, Conor Dooley wrote:
> > On Thu, Sep 07, 2023 at 10:27:03AM +0100, Conor Dooley wrote:
> > > Hey,
> > >=20
> > > On Thu, Sep 07, 2023 at 10:16:34AM +0800, Yu Chien Peter Lin wrote:
> > > > Before the ratification of Sscofpmf, the Andes PMU extension
> > > > implements the same mechanism and is compatible with existing
> > > > SBI PMU driver of perf to support event sampling and mode
> > > > filtering with programmable hardware performance counters.
> > >=20
> > > If it actually was, you'd not need to modify the driver ;)
> > >=20
> > > > This patch adds PMU support for Andes 45-series CPUs by
> > > > introducing a CPU errata.
> > >=20
> > > I don't really understand this in all honesty. You don't have Sscofpmf
> > > support with a bug, you have something that is Sscofpmf-adjactent that
> > > predates it. Why claim to support an extension that you do not, only =
to
> > > have to come along and try to clean things up afterwards, instead of
> > > accurately declaring what you do support from the outset?
> >=20
> > Reading this again, I don't think that I have been particularly clear,
> > sorry. My point is that this is not a fix for a bug in your
> > implementation of Sscofpmf, but rather adding probing for what is
> > effectively a custom ISA extension that happens to be very similar to
> > the standard one. As it is not an implementation bug, errata should
> > not be abused to support vendor extensions, and either DT or ACPI should
> > be used to inform the operating system about its presence.
> >=20
> > Cheers,
> > Conor.
> >=20
> > >=20
> > > (and just because someone already got away with it, doesn't mean that
> > > you get a free pass on it, sorry)
>=20
> Apologize for any confusion caused by the name. I thought it would make it
> easier to find the related functions and files in OpenSBI, didn't expect
> that it may have misled people to abuse the use of errata, you are right,
> I should have chosen my words more carefully.

I'm not sure what you mean here. The commit message is not the problem,
nor is the comparison in it to Sscofpmf - my issue is with pretending
that things like this are errata and using mvendorid etc to probe them.

> In my opinion, this is simply a pre-sepc solution to enable missing perf
> features before the standard is finalized.

Right, I don't think there's any disagreement about that. What I am
objecting to is adding more cases of pretending that something never
intended to be the standard extension is the standard extension with an
erratum. I know the T-Head stuff does do exactly this, but I don't think
we should continue to allow feature probing using the errata framework,
but instead communicate supported features via DT or ACPI. (If I could
re-review the T-Head PMU patch now, I'd say the same thing there).
Maybe Palmer et al disagree & there is some extenuating circumstance
that applies here.

> The underlying logic remains the
> same, so we can still use the errata to patch a few lines of CSR accesses
> and align with other vendors. This way, we can make minimal changes and
> avoid performance overhead to the driver.

I think you're conflating errata with alternatives. I have no problem
with the use of alternatives for this purpose & the perf parts of the
patch are okay to me, if the overhead of having a platform specific ops
struct is unacceptable.

Thanks,
Conor.

--+9uiuXeVPrdkDknr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP8JiQAKCRB4tDGHoIJi
0sHNAP90SbNP+JXIdUjtQoulfh1Ab/AVAk4Yd7SL2NtaDT8a/gD+NOzFbAhx9vMW
gJg2KArKlDrcTTo/q2pWYEbItZdvowc=
=k83d
-----END PGP SIGNATURE-----

--+9uiuXeVPrdkDknr--


--===============9092412296236603923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9092412296236603923==--

