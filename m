Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3378C61DF7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V63pKCaN1YpTe6l2SOGXo0/JzXpEx9P+BtbkmulASaE=; b=XJuJZu6Tq7ahplmI2o7lUwZLnL
	TO4VhCppnyjlPo9pwbsZ5u1ZU+rxo+uE5Urx0CbNmiNU6ix+YkK4fIe97tf+CgFs6+r1EgJRSNVYm
	OQvO1YRlgrUBwrSCNAjVrs4SG23UQPoe+QWXZJZVsknEXvTaHqD0jluIu5WgrC/fS9lEGB135t1jJ
	DxSPfYsaSJA93uAmce0CkyU4XacsJMoootcvOj2dxrXSuCFIMI18LOo1n8oCU2bkDMzZ9/2pqbek2
	Cra25r8lwwqir+gVP8/V2QdU86QGJDNH9ytRODhM/LBEEuHBVy4y258+il/Zo4tlIN+wRFJFA0NIQ
	h7YDSM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AcX-0050LE-2S;
	Thu, 23 Nov 2023 14:23:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AcU-0050Ip-37
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 14:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700749435; x=1732285435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ohvzPpwHho+Wozsk3IfdLQvS5IQE5RYHnNIM727nKM4=;
  b=dXPEMpueraQ+nBVcBVSHQXyiaqoxpKRMlWm1TcBlfi+66gg8sHBqbapt
   0Rt6iUxqDWPqTL2+8TBvmXApTU6gAxGrAbRSLHBsDFvilR+E0igupU4X3
   Tdq1vWwRF8Dpide7yTR+t+J1LunxTdkyHPm6744XyVBq01bz9VnQpya72
   Y4rqzcuovMVVIeRXFyTCd7MxmDS5U8HDjEUw/btoaA7nORq8GyG+akifv
   Mv2iJtuGlY4PW8rd7mYbHCL80Y0aPP1cc9XT0sX112KvTo2KftVklj+/t
   hJtzZV7vdrgV1RSjelrUWBBPe8U8i/SlA0ZYzWZ7lxvmywJqGfZFzBt0d
   A==;
X-CSE-ConnectionGUID: PGZ2z8fJRMa+agPdtt+bKw==
X-CSE-MsgGUID: EwqpIQk1Qom2mh0R2QGlFQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12194934"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 07:23:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:23:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:23:29 -0700
Date: Thu, 23 Nov 2023 14:23:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Harry Wentland
	<harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
	<Rodrigo.Siqueira@amd.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, David
 Airlie <airlied@gmail.com>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Pan
 Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	<amd-gfx@lists.freedesktop.org>, <llvm@lists.linux.dev>, Nathan Chancellor
	<nathan@kernel.org>, <arnd@arndb.de>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231123-headdress-mold-0dd7a74477f7@wendy>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231122030621.3759313-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_062355_017432_A1926099 
X-CRM114-Status: UNSURE (   8.08  )
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
Content-Type: multipart/mixed; boundary="===============0448985100199494566=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0448985100199494566==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PT94HBO7SSDOZxaP"
Content-Disposition: inline

--PT94HBO7SSDOZxaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> architectures. Enabling hardware FP requires overriding the ISA string
> for the relevant compilation units.

Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]

Nathan, have you given up on these being sorted out?

Also, what on earth is that function name, it exceeds 80 characters
before even considering anything else? Actually, I don't think I want
to know.

--PT94HBO7SSDOZxaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9gRQAKCRB4tDGHoIJi
0jEnAP9OKVgfXZxGyPpXzUcsNSne5N1ezJDKqBB32TBdrtW7vQD/Sd98JmdWJ4g8
Labru0YLH7jrvDUwLAIAnldCPJQbfAw=
=HKiT
-----END PGP SIGNATURE-----

--PT94HBO7SSDOZxaP--


--===============0448985100199494566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0448985100199494566==--

