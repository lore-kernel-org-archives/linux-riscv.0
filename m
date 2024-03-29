Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75898CD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpNioBfnXgbPnTMQgZulKIcl4eA6tVsHGVA/zoARd94=; b=v+603O6D9mo/f+3Ly7zVu7dcon
	Sz71QbxKZBpmMMzAVcYDJ94XAI3KRtcTU8V7vXpiN5rCVHEy6QGj5qQurAhAmGXaHLeAUjgTAaPS6
	y2tc6MLYVcOZzLDNmMfoslkfPpB3lnNA/nmToY2ksk7HPaTBCJMd8QY4ijiexwcdmR3Zj+K+tBBqA
	6YVeKN2/BkADLaSt3vchjIdblGl41Gld7ilMw/1Ftue3vKEIN4xCWXYlKd+yNhvTR3rnWBUSx8x4y
	apeWSXz7I4lLioKv2XwQA1BfTAglbIsCuPiTyw+wuiceGIkquu+rZy6suDTUz4kowX9JfTCeTpeSc
	nbCzmYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqALB-00000000B5k-1TJx;
	Fri, 29 Mar 2024 11:24:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqAL6-00000000B2k-1WZy
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 11:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711711445; x=1743247445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jrj6syQt8Qu+9vJQGs9hIoWtYWx8WSpMoq0M4O6W0DA=;
  b=C7mDWxjFpY8mlhEo7ty20jTXapcTZwXRYw24KPU+OMJrkHJTohF3jKMd
   hHWNP9cRXkILkLmCXVEDjyXWBe0y+cUm+GCfJj7MURCvCj5bIf/q9xujG
   s4L3UGYhacC4z7MP0F1gZ9qMvN23GCE6BPpT1bmnJpAP+w2eupcRB0TTB
   N5w7Q5aVwylxw1drHOuqL/fHBRD7HHUz5iGtoNl2WwzRzvP1UCavHFtyQ
   n1z5iF0/9ia+jrb1O1y+0+DAdk9o0AbqsdDkBoLYE7IRTJZGy//m+qRKV
   pe20mPWULhw9QiTFM2HalmJSWyBwY1HjsMECRyemXiNA936K4hRJgO9Ve
   g==;
X-CSE-ConnectionGUID: /1VBts7pSJCRmgq1ilCSXw==
X-CSE-MsgGUID: AX2flsgOTj6YYO4PNZ7U1w==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="249424125"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 04:24:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 04:23:58 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 04:23:54 -0700
Date: Fri, 29 Mar 2024 11:23:06 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Stefan O'Rear <sorear@fastmail.com>, Pu Lehui <pulehui@huaweicloud.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
	<pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Message-ID: <20240329-linguini-uncured-380cb4cff61c@wendy>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
MIME-Version: 1.0
In-Reply-To: <20240328-ferocity-repose-c554f75a676c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_042404_632810_5A1E0B6C 
X-CRM114-Status: GOOD (  22.05  )
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
Content-Type: multipart/mixed; boundary="===============1008826998815652386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1008826998815652386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3w5FiosotNHZDrPp"
Content-Disposition: inline

--3w5FiosotNHZDrPp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 10:07:23PM +0000, Conor Dooley wrote:

> As I said on IRC to you earlier, I think the Kconfig options here are in
> need of a bit of a spring cleaning - they should be modified to explain
> their individual purposes, be that enabling optimisations in the kernel
> or being required for userspace. I'll try to send a patch for that if
> I remember tomorrow.

Something like this:

-- >8 --
commit 5125504beaedd669b082bf74b02003a77360670f
Author: Conor Dooley <conor.dooley@microchip.com>
Date:   Fri Mar 29 11:13:22 2024 +0000

    RISC-V: clarify what some RISCV_ISA* config options do
   =20
    During some discussion on IRC yesterday and on Pu's bpf patch [1]
    I noticed that these RISCV_ISA* Kconfig options are not really clear
    about their implications. Many of these options have no impact on what
    userspace is allowed to do, for example an application can use Zbb
    regardless of whether or not the kernel does. Change the help text to
    try and clarify whether or not an option affects just the kernel, or
    also userspace. None of these options actually control whether or not an
    extension is detected dynamically as that's done regardless of Kconfig
    options, so drop any text that implies the option is required for
    dynamic detection, rewording them as "do x when y is detected".
   =20
    Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554=
f75a676c@spud/ [1]
    Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
    ---
    I did this based on top of Samuel's changes dropping the MMU
    requurements just in case, but I don't think there's a conflict:
    https://lore.kernel.org/linux-riscv/20240227003630.3634533-4-samuel.hol=
land@sifive.com/

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d8a777f59402..f327a8ac648f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -501,8 +501,8 @@ config RISCV_ISA_SVNAPOT
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
-	  time and enable its usage.
+	  Add support for the Svnapot ISA-extension when it is detected by
+	  the kernel at boot.
=20
 	  The Svnapot extension is used to mark contiguous PTEs as a range
 	  of contiguous virtual-to-physical translations for a naturally
@@ -520,9 +520,9 @@ config RISCV_ISA_SVPBMT
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	   Adds support to dynamically detect the presence of the Svpbmt
-	   ISA-extension (Supervisor-mode: page-based memory types) and
-	   enable its usage.
+	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
+	   page-based memory types) when it is detected by the kernel at
+	   boot.
=20
 	   The memory type for a page contains a combination of attributes
 	   that indicate the cacheability, idempotency, and ordering
@@ -541,14 +541,15 @@ config TOOLCHAIN_HAS_V
 	depends on AS_HAS_OPTION_ARCH
=20
 config RISCV_ISA_V
-	bool "VECTOR extension support"
+	bool "Vector extension support"
 	depends on TOOLCHAIN_HAS_V
 	depends on FPU
 	select DYNAMIC_SIGFRAME
 	default y
 	help
 	  Say N here if you want to disable all vector related procedure
-	  in the kernel.
+	  in the kernel. Without this option enabled, neither the kernel nor
+	  userspace may use vector.
=20
 	  If you don't know what to do here, say Y.
=20
@@ -606,8 +607,8 @@ config RISCV_ISA_ZBB
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	   Adds support to dynamically detect the presence of the ZBB
-	   extension (basic bit manipulation) and enable its usage.
+	   Add support for enabling optimisations in the kernel when the
+	   Zbb extension is detected at boot.
=20
 	   The Zbb extension provides instructions to accelerate a number
 	   of bit-specific operations (count bit population, sign extending,
@@ -623,9 +624,9 @@ config RISCV_ISA_ZICBOM
 	select RISCV_DMA_NONCOHERENT
 	select DMA_DIRECT_REMAP
 	help
-	   Adds support to dynamically detect the presence of the ZICBOM
-	   extension (Cache Block Management Operations) and enable its
-	   usage.
+	   Add support for the Zicbom extension (Cache Block Management
+	   Operations) and enable its use in the kernel when it is detected
+	   at boot.
=20
 	   The Zicbom extension can be used to handle for example
 	   non-coherent DMA support on devices that need it.
@@ -684,7 +685,8 @@ config FPU
 	default y
 	help
 	  Say N here if you want to disable all floating-point related procedure
-	  in the kernel.
+	  in the kernel. Without this option enabled, neither the kernel nor
+	  userspace may use vector.
=20
 	  If you don't know what to do here, say Y.
=20


--3w5FiosotNHZDrPp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgakmgAKCRB4tDGHoIJi
0i5uAQDpfKrD3sCVEMzQmkCAyMoGFe2KN23qp4Qq8wsF4GUwWAEAolnPKacUQiAa
bHyHhXo7v4OmhrqQ8dWqPmvM5Fqb4Q8=
=a121
-----END PGP SIGNATURE-----

--3w5FiosotNHZDrPp--


--===============1008826998815652386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1008826998815652386==--

