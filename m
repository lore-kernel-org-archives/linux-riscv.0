Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF9C7EE2F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 12:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gthgHqHXv8EZBqyjOqq3ckOHeJ0mjQwz1u8cCCWeivU=; b=zBBJ1fkcaet4s8DTFV/uXnu96t
	dJM2JegirpVghllPhLkPgDeh63b8Zc/UfPFm40m6A0+4NN+LvEP/5QZWrD+KZsBVygx6tIkuqeDtd
	Afq3Dxj3QSdGGIrGAbZXsxSz3UoIXJTU0GB//THzSRMFWzEjxdbeh1THazSmxpxg6k5jpkdr0EQet
	XWmHpXjYIeUWNpej6I9Js20Hs7ewkBjkKDsgJ17BHnmjk51KwZZhMEtRsFdRKmtIlZDTT4UVXocn9
	PVsc3EPfmxan2/OrNoW9+rjZfbHNoBAjZvS9gUejJCW30ky5mm0Ufkj8jzL6QuWFEZDzZg8tep2Fl
	tj52GNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2AVt-00GfKL-2V;
	Thu, 25 May 2023 12:56:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2AVr-00GfJM-0o
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 12:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685019375; x=1716555375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dCZ7qHilHCnoBJIJpLO6SCWRxEDx/w1XHLVY79Vbh/c=;
  b=wR8NTZ/Mz/kss142oltWjv/grwX39Bt2v5IYbfYsh5j7zcapL4hkUyvd
   tlEUnIIgpjSGyj3fnQSXP9zVg5IgBBzT5m2infYXqHvN6QPYVY8aEImvp
   zpA0kUem1pA7x0vIGx+xiP59opk7sEYOHlvhhcmTt5Ja/pXmI1b1W+7Ks
   KQXNyq/HPhWy9keWWjwkluKOBMRMgi0GF/KyyrcVEAaDNMCpNZ20RvOOj
   zCH95hDluMHB9j1ekZmADEBbZS5U9sOjA1mYBYGJzQZit5sD7Q+gLa1r5
   uokKlejNiUcwELLRs4T/4STH1+iyZNgE9Cz/DwzWz4KbtxRcPX9254UWw
   g==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="217254719"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 05:56:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 05:56:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 05:55:59 -0700
Date: Thu, 25 May 2023 13:55:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@atishpatra.org>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Song Shuai <suagrfillet@gmail.com>, <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>, <palmer@rivosinc.com>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo
 Ren <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230525-geologist-cottage-a51fa889a3d0@wendy>
References: <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy>
 <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <20230518-mobilize-dipper-051dfbc41971@wendy>
 <CAHVXubhpkkC_1sYkHJvjuHB24YhmHJJ_ZvjRhzaqvygCvfbRnw@mail.gmail.com>
 <20230518-cauterize-game-636a6aac4871@wendy>
 <CAHVXubgsHKfNaRgvXT0A=7cnnCMrZMrpvxEGrGobcytuFCsLKQ@mail.gmail.com>
 <CAOnJCUJQdZZ3kT099Z6gcj+A4fP7ste3dC9QZ8G-2XH7x8DL7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJQdZZ3kT099Z6gcj+A4fP7ste3dC9QZ8G-2XH7x8DL7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_055615_399890_C4C3F364 
X-CRM114-Status: GOOD (  14.36  )
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
Content-Type: multipart/mixed; boundary="===============8293241769577987285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8293241769577987285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EuBXBxH8HufsmTdu"
Content-Disposition: inline

--EuBXBxH8HufsmTdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 04:53:59PM -0700, Atish Patra wrote:

> We can also just revert the commit
> 3335068 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
> until a proper solution is available.

I'm actually inclined to go the other day. If hibernation never works
in a released kernel we can't regress it & since we have not settled on
a fix for this yet we don't know whether the fix would then remove
support for hibernation where it used to work.

> IIRC, Alex also suggested the same as there is no measured benefit
> with this patch.
> It is good to have 1GB huge page mappings but it can be delayed until
> we have the fix
> for the hibernation issue.

IIRC it was the 1 GiB hugepages that Alex said were ~worthless.

--EuBXBxH8HufsmTdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9ayQAKCRB4tDGHoIJi
0omaAQCH/7SukuDl3+/+zFpazVIYawnJQLDQEWojXquLnpT64wEAkbYHuYdzDL6j
tQEJ/P7KA9+4KSfH/xw6FR5eL0MWowg=
=00Gl
-----END PGP SIGNATURE-----

--EuBXBxH8HufsmTdu--


--===============8293241769577987285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8293241769577987285==--

