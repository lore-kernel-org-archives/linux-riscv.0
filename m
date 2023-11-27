Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DB0C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsY8np7j+rA3dYuGqz9rKu6SJgbhM1mzvICV7Asw+ag=; b=RTwx5qe1wPXBFee7kAj1nzfIUm
	4Y8meLa1JW2k1EBn03Suouc4CFHUGEzYHq5e24S9CP0zNkR2Jd2rY84nb152PZDKyRZsvsxBgxefW
	GHtIbBeNnOFArESOl67DOv8eZje8ROA4+N6dnJ8dt09m5BM83EqtcMYDUJ3F3RZJopDe8RYpeuyBK
	YWsWrEALyLiC1JrMg6k8FwDr80RAbBrEjyOtRk07DBbf2HDG5A4i+GL7Jdnc3j+8KMf8+zm930Eni
	XLYJ+4pU2X8CN3awCI4IltAxb/wb9Qn/nVuxg5RTZyqh6zTg8Gz3jFmBB2v6aXrvTo3zG9qimEYJg
	Ph2J/LDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z7T-0028Kj-2H;
	Mon, 27 Nov 2023 10:45:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Z7R-0028KH-1A
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701081937; x=1732617937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XsgutPECrC8l5gZt5+iuVfsFhO1Zmfqw++3pChr2uHc=;
  b=FiellOGQdftvFEwCR4O59j/e4q+mLg7Z+3hI9Y0Momg8HJsFXF9aeGRM
   NXnuXKhwhU/zZ9rC3aKwUGm5poDIH39cVM1lfolH/SsnpnTNtAiAWNpb0
   PocZqdvxVAH+VxGoh6VxEwem0drA7ns4RQfErp/s4vYTc50K5D1UkAC4X
   RLU/P0fsvrwfneomLHJOjnd/y2o/qRd65LaRlJJNXJUuGUZGNm3DAKRS5
   k75G7/6hBmyHbnUkU+xmI0x4Pf9jDCgTfoO3OpEl8jIrTcdytgbGwFHwv
   TvUd7kRhsIW+6Z7g9NpgLwd3gHbL2YR9ridm6tcOxDl22EczxsrHmCeLz
   Q==;
X-CSE-ConnectionGUID: rYZD7AvDRIS8Nns1pfsCSg==
X-CSE-MsgGUID: ITAVCmDsQuKHnJuT89msKA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="asc'?scan'208";a="12250830"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2023 03:45:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Nov 2023 03:45:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Nov 2023 03:45:23 -0700
Date: Mon, 27 Nov 2023 10:44:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet
	<corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <20231127-epilogue-frying-4d5ba926617c@wendy>
References: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
 <20231122-fencei-v1-1-bec0811cb212@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231122-fencei-v1-1-bec0811cb212@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_024537_464857_E1591816 
X-CRM114-Status: GOOD (  13.77  )
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
Content-Type: multipart/mixed; boundary="===============4827005917808711694=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4827005917808711694==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2dabZgh7yH7Wi+77"
Content-Disposition: inline

--2dabZgh7yH7Wi+77
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2023 at 05:03:20PM -0800, Charlie Jenkins wrote:
> +
> +/**
> + * Enable userspace to emit icache flushing instructions.
> + *
> + * When in per-process context, there may be multiple threads using the same mm.
> + * Therefore, the icache can never be assumed clean when. Multiple threads in
> + * the process may modify instructions in the mm concurrently.
> + *
> + * In per-thread context, it can be assumed that all modifications to
> + * instructions in memory will be performed by this thread. When the thread is
> + * migrated the icache will be flushed.
> + *
> + * @arg arg: Sets the type of context
> + *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.i will
> + *			      emitted on thread/process migration.
> + * @arg per_thread: When set to 0, will use the default behavior of setting the
> + *  icache flush context per process. When set to 1, will use a per thread
> + *  context.
> + */

FYI, this is not valid kerneldoc and breaks allmodconfig builds:
 arch/riscv/mm/cacheflush.c:159: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

> +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)


Cheers,
Conor.

--2dabZgh7yH7Wi+77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWRzJgAKCRB4tDGHoIJi
0oqZAP44BpqU7jjixzWH8EBV8qfD5EEkTbqtGTccnCfX4BmMOgEA+me3rwJrd9e/
7h830aetbBTs0XpjcvFkekSOcjjKfwg=
=GeQD
-----END PGP SIGNATURE-----

--2dabZgh7yH7Wi+77--


--===============4827005917808711694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4827005917808711694==--

