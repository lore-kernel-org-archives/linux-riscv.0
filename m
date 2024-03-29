Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F4CD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mE1uJzvgfTWmrfgODpCF2WhFNz+bf112D0F1bRN6PzY=; b=uwtUYxhHQ9Ue7yGly3h6smMXYn
	JhZcpn+kZ9TA+gF0yuSGGbABcDgbDDQMKJr4lE7QCHkJfKaRZhIl/fwsKOFhWFfNbXwV3KCbKicyw
	msNVcPeNd4TPlFVzyB7wT1nXHUCG1S/4kOVWMWyloaGHdcKb/tgCy9O0mPE4aThShfILljdCoaQOn
	o843X6oxX4Ci9sElhzail4BZGx3NYdNgB0Ol+09hx45F0TxG/ja8cM9ehf+RyfIskzV9Tw86385pM
	xvkfDluBLqz4SpTDdqgk6uCfUDVIYNQQMghcSzWdMkTCC1k0EEHKe98Qv3rCCige3znHNzGooD7uc
	QZrJMtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6ed-0000000HAZi-15Rp;
	Fri, 29 Mar 2024 07:27:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6dH-0000000H9ge-0pEZ
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HpMuiMtdVGcoMQe6fSGTBiX6Ovjr6rSVQlyKdjqvo3o=; b=JooEPkABxJdS+AJQLfGFGe5b9O
	DO+eX8/ppFN7QCtpE2Cn/Rp0WGO9DnwUcciRlYyPJ7wXal33JGRJaxoLRrjLwEl3qtWvxxdqOTGrM
	lCvGiqL/VYfMGrN54I1l760oX9v9xPGShXhPAxtonvhnUK+rbaZbXmPWNqwvN3W1fX48nNiKUP6u9
	73IcdV+jssgCl7MMaTd4/BKKuZELuErKIXTUYiq31YO0uGpLJ97X4ze72jH8ea6YHc6W9nfko927j
	EomgIRfhuoRjjgaQtjBn3Ntm/N/HKqA2CBY9YRkmFh9IGYOjmfJjk2dpCbjruNM2UB4YhjrmUK/w/
	MDyZYiAQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6dD-00000008HRd-258X
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711697191; x=1743233191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bInZpQe27T+FP7otvnqd8TxPV4Zh13QdnbFoeMPgJnc=;
  b=TZE2DWy4DlLprRvuSN+L/ELksuqVpUVli/2PanmK4ypqBRPfQD5rpe70
   Q9UdmP17Kn1IkBW/aZGm/4gH/bZY630nAIggawdK1UGc86oF9Gu38Ejb7
   WeaEVqf2Ow4OPFcpRnCvXmeQ64k0D5rT4RIzwbsiy7Oqnazku/xyXPPCo
   rdcwQfQI5C9TyPt+gm9qa27Aih+aJXFDdsKMvRQRK+dlUPO5XGyWrH8tQ
   bygD2A9wMaOq/us+50WIgD5QuCn7pV0n3vM6UjI+fG8nRlK2YqJjZmmYz
   3bIOsTQy4leEsC7jL1e41HojK9BsARiTOGHHftcIqwNNudVCmpqKHlsdj
   Q==;
X-CSE-ConnectionGUID: 15IXURycT2uyFkZ6j12usw==
X-CSE-MsgGUID: 3NX0TeF6T2SxAshBbDmoVA==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="18569006"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 00:26:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 00:25:57 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 00:25:45 -0700
Date: Fri, 29 Mar 2024 07:24:57 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Deepak Gupta <debug@rivosinc.com>
CC: <paul.walmsley@sifive.com>, <rick.p.edgecombe@intel.com>,
	<broonie@kernel.org>, <Szabolcs.Nagy@arm.com>, <kito.cheng@sifive.com>,
	<keescook@chromium.org>, <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
	<atishp@atishpatra.org>, <alex@ghiti.fr>, <bjorn@rivosinc.com>,
	<alexghiti@rivosinc.com>, <samuel.holland@sifive.com>, <palmer@sifive.com>,
	<conor@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-arch@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<corbet@lwn.net>, <tech-j-ext@lists.risc-v.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <oleg@redhat.com>,
	<akpm@linux-foundation.org>, <arnd@arndb.de>, <ebiederm@xmission.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <lstoakes@gmail.com>,
	<shuah@kernel.org>, <brauner@kernel.org>, <andy.chiu@sifive.com>,
	<jerry.shih@sifive.com>, <hankuan.chen@sifive.com>,
	<greentime.hu@sifive.com>, <evan@rivosinc.com>, <xiao.w.wang@intel.com>,
	<charlie@rivosinc.com>, <apatel@ventanamicro.com>,
	<mchitale@ventanamicro.com>, <dbarboza@ventanamicro.com>,
	<sameo@rivosinc.com>, <shikemeng@huaweicloud.com>, <willy@infradead.org>,
	<vincent.chen@sifive.com>, <guoren@kernel.org>, <samitolvanen@google.com>,
	<songshuaishuai@tinylab.org>, <gerg@kernel.org>, <heiko@sntech.de>,
	<bhe@redhat.com>, <jeeheng.sia@starfivetech.com>, <cyy@cyyself.name>,
	<maskray@google.com>, <ancientmodern4@gmail.com>, <mathis.salmen@matsal.de>,
	<cuiyunhui@bytedance.com>, <bgray@linux.ibm.com>, <mpe@ellerman.id.au>,
	<baruch@tkos.co.il>, <alx@kernel.org>, <david@redhat.com>,
	<catalin.marinas@arm.com>, <revest@chromium.org>, <josh@joshtriplett.org>,
	<shr@devkernel.io>, <deller@gmx.de>, <omosnace@redhat.com>,
	<ojeda@kernel.org>, <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 04/27] riscv: zicfiss/zicfilp enumeration
Message-ID: <20240329-condition-morse-c3d02720853a@wendy>
References: <20240329044459.3990638-1-debug@rivosinc.com>
 <20240329044459.3990638-5-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240329044459.3990638-5-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072632_016844_4F141373 
X-CRM114-Status: GOOD (  11.87  )
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
Content-Type: multipart/mixed; boundary="===============4933426713818164607=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4933426713818164607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kiXl0dlDZ9ZIiu8P"
Content-Disposition: inline

--kiXl0dlDZ9ZIiu8P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 09:44:36PM -0700, Deepak Gupta wrote:
> Adds description in dt-bindings (extensions.yaml)
>=20
> This patch adds support for detecting zicfiss and zicfilp. zicfiss and zi=
cfilp
> stands for unprivleged integer spec extension for shadow stack and branch
> tracking on indirect branches, respectively.
>=20
> This patch looks for zicfiss and zicfilp in device tree and accordinlgy l=
ights
> up bit in cpu feature bitmap. Furthermore this patch adds detection utili=
ty
> functions to return whether shadow stack or landing pads are supported by
> cpu.
>=20
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---

>  .../devicetree/bindings/riscv/extensions.yaml       | 10 ++++++++++

Checkpatch should have told you that bindings changes need to be in
separate patches.

Thanks,
Conor.

>  arch/riscv/include/asm/cpufeature.h                 | 13 +++++++++++++
>  arch/riscv/include/asm/hwcap.h                      |  2 ++
>  arch/riscv/include/asm/processor.h                  |  1 +
>  arch/riscv/kernel/cpufeature.c                      |  2 ++

--kiXl0dlDZ9ZIiu8P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgZsvgAKCRB4tDGHoIJi
0iYTAQD/x2jCSMw3PvwFsNJ6v7adg+YdWitg5NvBburVYvIikAEA0Qu7dWdDtcJk
H0K8lWXiWqqumgSgXhcWgk/Gp2U1igQ=
=0twh
-----END PGP SIGNATURE-----

--kiXl0dlDZ9ZIiu8P--


--===============4933426713818164607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4933426713818164607==--

