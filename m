Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6DCC5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqwG4WbcBQQDNY8TwhoEnk8qkzPFrk4KMD/9xWnlAk0=; b=e+Q7yugU1VyvD8KACe1h079Fai
	gnubToeaNPitmIZR/G/eoEojtK+tnQ1Ij2ahvL/Ve5lUn2A1Dq1hcipPef0d3xVcvQmfvZ8+Bl0PX
	nNOq9wsbga3rQ3aQOw82wY4WciRQBI+nW58iwsUIpf9cqjorKGyQjCCJxFsuONiE3SkblTVmHCY9F
	Gb6XSmHxMAHb6J8VPYQ9fAYPGOTUh9K+pAZnmv+0jWWdvBi+sEa76kv5GqzQQaf6VwMi0YCrtQxDv
	Vy/NIw1zU224b/WzEhONrSlL44tVjOpweYGQgXSNnTsC7NesgDN9ulxqINPgp0jiHI/eO/kT9JpXk
	9VcwO/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6BBC-0055an-31;
	Thu, 23 Nov 2023 14:59:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6BBA-0055aM-1u;
	Thu, 23 Nov 2023 14:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700751584; x=1732287584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EbumtQAp61xxtl1wFucMhCk0s7eSuM0PDcdqsk0vVXY=;
  b=obSJa5VoOIud2t1a1f3MKpv08+Ly8SjUSJ8d2VAfEy46y7XRUHkXzfz4
   hj1UwfrsUHyue0awmNsN8V3mnG2SCv27GCKA8zCZsGuAZGwMjcyoX++Uw
   pf/PAkEpruBu4XJbCgZdv3Q4a5zHSfLimE923xQQbkdEeUfyyjj0Kf+6z
   Ve2i4I5DqQ6OHlNykkAHgad7c3dnutImNvimxUwM5g+fgVtkoO43Vlro0
   KCrgf2WKuNqxDMZm0k07/39It7BEpR2Uec3n/xic/qXeZ28OMXxbu/bpg
   RFMjk/959mBSZ+HSfDfy71yUOmwRJqnNjx0DGXB99AUKb+USkV9leEMmm
   g==;
X-CSE-ConnectionGUID: dphmfmJ6QC2EtHTlf6BQfw==
X-CSE-MsgGUID: yYZjdC/+SzKEzWIlmXahFg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="asc'?scan'208";a="12119561"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:59:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:59:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:59:23 -0700
Date: Thu, 23 Nov 2023 14:58:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v4 11/13] riscv: dts: allwinner: Add T-Head PMU extension
Message-ID: <20231123-coping-revenue-be284a351c9d@wendy>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-12-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231122121235.827122-12-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_065944_698863_E936CA6C 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============8899550848103943142=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8899550848103943142==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/5s3BqTCv3O//+Ke"
Content-Disposition: inline

--/5s3BqTCv3O//+Ke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2023 at 08:12:33PM +0800, Yu Chien Peter Lin wrote:
> xtheadpmu stands for T-Head Performance Monitor Unit extension.
> Based on the added T-Head PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.

Allwinner aren't the only ones using T-Head CPUs that the previous
m*id pmu detection code would have matched on. I think the first three
files below will also need to be updated:

rg -l "thead,c[0-9]*\b[^-]" arch/riscv/boot/dts/
arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
arch/riscv/boot/dts/sophgo/cv1800b.dtsi
arch/riscv/boot/dts/thead/th1520.dtsi
arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi

Cheers,
Conor.

--/5s3BqTCv3O//+Ke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9orwAKCRB4tDGHoIJi
0mywAQDLiZ7Dv/EbYy9xnbLn22k0W8jszlQjb/0c3Uj362SnMAD+NfU0XmNTf1e8
tbN33jbWPlia/s7ecfUt/OgqNf7XxAY=
=CJRs
-----END PGP SIGNATURE-----

--/5s3BqTCv3O//+Ke--


--===============8899550848103943142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8899550848103943142==--

