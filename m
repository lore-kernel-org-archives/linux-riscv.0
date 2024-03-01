Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F15C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNLWlOXmmLQmnudMr2uPyYYmNRRiOAHRgqYFIbMp5Qo=; b=uN4ugosKBXd8b0Hyh55BmOvNzf
	CWae4nFg1aKbB7WdCCVv1Q6FPE+OEe9P5JRrKRCjgbXjnoWcNSYhswc2hCWkPAeM2v+CAqMb1B9pJ
	JVH1YYolgZxhvOAYKl/1mrpZPvV7D87abYMTp7cSAQjYSOfK947Aa4glacSM2wBu0Mkqpr5eogVLd
	auvw6cCJz0DG786lrtGqvX27Jbn8aZfBiipaOgFpsnoO26DPFFZIeiYCiVm8CI0isWVPlVMPQEZ5Q
	Zi9bRryMPVeMtKrQ1q1thttIPbBlcl36BSAqWpvjASivS7qFjkOJdmqP+aahRzsfd59JNtkuCRfSr
	SXY7W8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg336-00000000Vi8-2xSV;
	Fri, 01 Mar 2024 13:35:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg2YA-00000000HHM-3kwQ
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 13:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709298222; x=1740834222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVWHgOv8IhoO1Wovn6/Qb2yGIBl4zlvLX2d0j1c6F7U=;
  b=od9DJPKgkHf6JgXlsx2hSM72wI9FzzkT92WXTyAt8cLSNVDBH6w79T8m
   GWONungnzTV1IdMMSjye9XnnVJcDpJa/DE/GFJKATsPzFTNMOt9aT4BVl
   6Qf+eg5kRtv7V0Pr4NAfMzI3YA4sDxrhzibpery+XQ66QxckPeDUyC9PO
   hTdNz/lPMf2rd4sgz+HLjeKWHwB6fpBjLCor2iP3ajPynFEA9WlSMx/H/
   hQiciA6xLU+88mSWDlI6w0S9TAZcOewX7B96AnyZD4U1VGnZpRSvNtOxB
   AzLSpDusbGD6ltlG4QstNuH4KOzZeAOX4hg+Mj7e3cNSVXD0q7h3g09Yw
   w==;
X-CSE-ConnectionGUID: B8GzHJbiTdOd45juRr3szA==
X-CSE-MsgGUID: v2RSYSlqTES/9dwmI5yorw==
X-IronPort-AV: E=Sophos;i="6.06,196,1705388400"; 
   d="asc'?scan'208";a="18677917"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Mar 2024 06:03:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 06:03:27 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 1 Mar 2024 06:03:24 -0700
Date: Fri, 1 Mar 2024 13:02:41 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: Palmer Dabbelt <palmer@dabbelt.com>, <alexghiti@rivosinc.com>,
	<andy.chiu@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, Paul Walmsley
	<paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 0/3] RISC-V: mm: do not treat hint addr on mmap as the
 upper bound to search
Message-ID: <20240301-patient-backpedal-f0e9333d3b8b@wendy>
References: <mhng-67b02dff-5423-466d-bd90-f3ad3a3ab6a9@palmer-ri-x1c9a>
 <tencent_BA062F64BB719A8F42F0435BCD3117B73F05@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_BA062F64BB719A8F42F0435BCD3117B73F05@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_050343_143225_12D9F869 
X-CRM114-Status: GOOD (  11.50  )
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
Content-Type: multipart/mixed; boundary="===============5174806971842084511=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5174806971842084511==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TtKYHipymQ1kqmeZ"
Content-Disposition: inline

--TtKYHipymQ1kqmeZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 01, 2024 at 04:54:05AM +0800, Yangyu Chen wrote:

> Another concern is that if we can't make this decision in time to catch up
> with v6.9 we don't want some bad things to happen as a large number of sv48
> machines might appear this year and they may run on the next v6.9 LTS
> kernel, Shall we change the code in the kernel to use sv48 by default right
> now?

Just pointing out that v6.9 is highly unlikely to be the next lts
kernel, depending on whether or not Linus delays some releases, it'll
most likely be either v6.11 or v6.12.


--TtKYHipymQ1kqmeZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeHR8QAKCRB4tDGHoIJi
0s8fAQDEhn3LtPgIBbJeywYsW5zoE8XHl7tmIMdJIjMWrFfPygEAiml/BgsyQQtP
+pjfl+cmRe2HDnQTEEwjNwMlo/Sz0QQ=
=1CU+
-----END PGP SIGNATURE-----

--TtKYHipymQ1kqmeZ--


--===============5174806971842084511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5174806971842084511==--

