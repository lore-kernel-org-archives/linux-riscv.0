Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B6DC54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7u5kBU50IbTZ++kNRE/my7nbYquqpihlqHXsZsivBw=; b=VVirIzElz5NXMSJga38tCB6f87
	SfC/oRU5mF2l6VwcK77SkErp64PmtU6HV98cFbOBLAd9QOm72gWnI+R61mbSeq93yHAmWhpNYQIyw
	TOglHwd1bKJQnWReAFKe++5DQsVPpfFmrgrfEpx+dKucdojMTS48/1wJerthqW/HLlIHZc3f02Jzf
	S6EQzC5Vz/p1ib4x+EPMmtg3sCMnMGy4hbeBIDDdcpdf1M3YRHkcEdzV1YnuUeoIGp546Z0miglVe
	c8pnjQPiOJ26ha3KDKegVp+1206uKtPTh/FAwMXFhGWLmfHhwLG0gSEc7kJEe+B61wyioDZwDhczZ
	acxQW6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuOx-00000004ez7-3ikK;
	Tue, 27 Feb 2024 10:09:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuOu-00000004exF-0VCS
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 10:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709028568; x=1740564568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hvfreTcuHcxoFQ0KJA1kYkXp7+c+Esbac0GIM/2ZX8c=;
  b=qViWuo1wgFxLGST5pYE3Pviv2EuaiRiAe+8guKLXgrcj6lc/roYVhy9e
   kQrLRRLSPW+tZT9msX5iDPkYpHr8fAekK75+LjCJOScVuEOlukRp4JEgU
   VlqP2h37FLmD2w2MOqf3i5/dGb506aYEZ6l0DTrxjQUCrz2HW66C2Uf4R
   sKMDExgDJnxMXlIIU1NjODaF6if83I/ITx70N9NgC5oyy/yTSNzc4xN1t
   ZkKw+ihgaxSfm6ab8VQ5jhq6/R1SSKqsqBZtgCOLkp9xBmCRhDOPz23cl
   ebIqpOeqend4oz0WyUcb9K6cK32XK0ZxEmJqddzZYHYKILpG3a3fOKQ2q
   Q==;
X-CSE-ConnectionGUID: SBLw0WqLRt+rblbhvO8YGw==
X-CSE-MsgGUID: z7auoLxmSJeEZY5hePRAFg==
X-IronPort-AV: E=Sophos;i="6.06,187,1705388400"; 
   d="asc'?scan'208";a="184152299"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2024 03:09:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 03:09:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 03:09:00 -0700
Date: Tue, 27 Feb 2024 10:08:18 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>,
	<linux-riscv@lists.infradead.org>, Green Wan <green.wan@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update SiFive driver maintainers
Message-ID: <20240227-serrated-oyster-552459d0fd5b@wendy>
References: <20240215234941.1663791-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240215234941.1663791-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_020928_413469_CD0EBC40 
X-CRM114-Status: GOOD (  11.96  )
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
Content-Type: multipart/mixed; boundary="===============2669768177114883062=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2669768177114883062==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBC0JjNyRNyQOcrm"
Content-Disposition: inline

--SBC0JjNyRNyQOcrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Palmer,

On Thu, Feb 15, 2024 at 03:49:11PM -0800, Samuel Holland wrote:
> Add myself as a maintainer for the various SiFive drivers, since I have
> been performing cleanup activity on these drivers and reviewing patches
> to them for a while now. Remove Palmer as a maintainer, as he is focused
> on overall RISC-V architecture support.
>=20
> Collapse some duplicate entries into the main SiFive drivers entry:
>  - Conor is already maintainer of standalone cache drivers as a whole,
>    and these files are also covered by the "sifive" file name regex.
>  - Paul's git tree has not been updated since 2018, and all file names
>    matching the "fu540" pattern also match the "sifive" pattern.
>  - Green has not been active on the LKML for a couple of years.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Can you take this please?

Thanks,
Conor.

--SBC0JjNyRNyQOcrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd20kQAKCRB4tDGHoIJi
0rJpAQDmB+X3sH1dX2qB3MVFD0cMSzwbYZyArsjbCPMjRzjZ/gEAh6EQ75gAuT1R
TSHM+vKfGb5UkWJtMQTn+gzQUlFHIQ8=
=dCM9
-----END PGP SIGNATURE-----

--SBC0JjNyRNyQOcrm--


--===============2669768177114883062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2669768177114883062==--

