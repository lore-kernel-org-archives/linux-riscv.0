Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3732AC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDD+PKDG0fmhQcZ1JbLSqDd7hbxTRfjg/kbMYuv+w04=; b=eGkQEWHxDhnWuiQx1dm64HjNFv
	lNcicqcljzPTl8fEvKrSPFehZ5Vwn8zdi3WMJFtdAgyDcn3GsPifZ3QAqZjGVCLK/5wEwhke3T9bW
	QYn6mpRTyCmlSEcNjMjJPe4pDDohO5nGixtyKeRUko6Rq5coJCpf3cg56ClTx72FuSkoBqEDvs2Df
	XWCbqS56VdFCDbP6WA68rgf2MqUqnnnPolFOAILjfB9KcD5eC9WClpSFkeu1U42uNrK0BGTsj11Jh
	LW1TIWzUCCx6pBWyHel2SCRaNk+U0OcwQtRHFJAEbAZj5vExzsyqAaquV813Bb70dswpF9MFgV9lP
	mlFrMLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pysyh-005b52-2m;
	Tue, 16 May 2023 11:36:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pysyd-005b3G-1K
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 11:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684236983; x=1715772983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTuARb/YrAFoLf//M9oeOcM9jK+YYhZvEJI0/BqCYLc=;
  b=MAoXWayKtnHhSVap9pCnZYGWhqKYMM/QEUL6VPuIhk0xwI47cr65cavR
   CtJIK308y+MA8ttO+HDYnPkmt45/6wmvdmG7fq7NeJUnDXF8qQMvH+A2L
   0yczJh/OW9hDb+ouT0jdkQLJH1Wr7fUmGilU/WvyH7DmM/IGd2zo/Pyl+
   bqYISFGSfQ1K0lALtm/69amORhh6PYyIAZUZPadc69puwPvXy8TSPHMuX
   ZD02t2bFhEWukV+CQynV/6ZW0GwS7eQJLn3/EDGd9dAM4zDQ7KSY2nYfw
   UhQ9neqMbOgEVTVXTM1KJNQF7X99XcQvoAIdq9vF1ZMDV+mC7Q10bM2kF
   w==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677567600"; 
   d="asc'?scan'208";a="213509855"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 May 2023 04:36:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 16 May 2023 04:36:18 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 16 May 2023 04:36:16 -0700
Date: Tue, 16 May 2023 12:35:55 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
CC: <alexghiti@rivosinc.com>, <robh@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, <anup@brainfault.org>, <palmer@rivosinc.com>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo
 Ren <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230516-figure-vanity-d8b671ca1aa0@wendy>
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_043623_582838_9F21BA33 
X-CRM114-Status: UNSURE (   8.07  )
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
Content-Type: multipart/mixed; boundary="===============6939871989552745039=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6939871989552745039==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Thw0RZ3mGVPR1apd"
Content-Disposition: inline

--Thw0RZ3mGVPR1apd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 09:24:07AM +0000, Song Shuai wrote:
> Description of problem:
>=20
> The latest hibernation support[1] of RISC-V Linux produced a kernel panic.
> The entire log has been posted at this link: https://termbin.com/sphl .

Since the reporting is a bit scattered between here and the sw-dev list:

#regzbot introduced: v6.4-rc1.. ^
#regzbot title: kernel accessing opensbi reserved memory

--Thw0RZ3mGVPR1apd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGNqiwAKCRB4tDGHoIJi
0kCaAQCKg2EPoULgExcqaStj6FVDGF8glj2Zx8FXdFbroDJd1AD/YDqMn5PkGi/W
MVkHIVMQ0QwpL9sXst2NadGypRkw7Ao=
=QQ5L
-----END PGP SIGNATURE-----

--Thw0RZ3mGVPR1apd--


--===============6939871989552745039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6939871989552745039==--

