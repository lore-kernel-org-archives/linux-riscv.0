Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8150CC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN5k9I5RCDyagLmzDhPWRfeeyt8n4FE+ZCa8CiOOFKI=; b=1SqQgygquru1rk2gFTRk2aawSF
	rK9ybFtEM8NGqz+oTIKmrWSHrKojYARkd6uRB8NfMFvyi2pS/GZ2PgCHrce023QHZlEAfAY6TQ7FB
	1pmlpDlnSjUwiHVBmIAkoTUj3DR+gPRJ+p4RO+pFKlXA2WWgZGpkp9W/3NGmBd9RIsbX+Fh18lmE0
	jzWjCEumt0GcMoMN1CHhEm8ZEcnFCTF/OBYj+3zyeSG3f1mMtyvYU7pjRXgR/X/hn9xaUQHyfNMM+
	mussegl8KltqN/ez9R0bNqia+S3uYMuKibWdixW33D+o5NbI7Ys23EOSq4FFRl2w2zeecqw5MlGgW
	/qbGOhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXrI-00Fd0u-Ov; Thu, 02 Feb 2023 11:34:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXrC-00Fd00-Jo; Thu, 02 Feb 2023 11:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675337662; x=1706873662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qTJGm0+3lSL7Eg3SsTrKOebqIYkNSjfdxlEJ+ZGPA8w=;
  b=xAU46JIupX/0UlkiT6/tjrP6u7tFwJjO1FKTKCvWUD28ntNkGYJ60Zhz
   75bkyTTd8ePOSSF6u+vmIXM9CIBQ8UQMbUcm2eGmnLknR1/SiLTEd+H6N
   TnJg7b5lEu5Kus2EyD+sTdUnkRB2bqghzG8kl3BQShY2DVyFDYfutrAU8
   66fsfhzhInrkGLRg20IDFaP2y75LjqVLNds5qDRkBfOJTVJN+1dOOeYLJ
   M+3yXwd2My/fpgmRmCMjop0gnLhh1/7e1txos+2vGNqUdzZvONWypmn9g
   6dbEvTr1MaKIGR8XEjvMtmpKw6Y/XuVDLEDq4HiNEMaupOdriF/B50ETs
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,267,1669100400"; 
   d="asc'?scan'208";a="199301901"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 04:34:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 04:34:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 2 Feb 2023 04:34:17 -0700
Date: Thu, 2 Feb 2023 11:33:53 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
CC: <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Andrew
 Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, Atish
 Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>, Guo Ren
	<guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
Message-ID: <Y9ufoeZ/4obZDJz6@wendy>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-8-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230201231250.3806412-8-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_033422_721387_E2ADC429 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: multipart/mixed; boundary="===============8734694873089827863=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8734694873089827863==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oYelnov9+3SzjngH"
Content-Disposition: inline

--oYelnov9+3SzjngH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
> This patch only adds barebone structure of perf implementation. Most of
> the function returns zero at this point and will be implemented
> fully in the future.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> +/* Per virtual pmu counter data */
> +struct kvm_pmc {
> +	u8 idx;
> +	struct perf_event *perf_event;
> +	uint64_t counter_val;

CI also complained that here, and elsewhere, you used uint64_t rather
than u64. Am I missing a reason for not using the regular types?

Thanks,
Conor.

> +	union sbi_pmu_ctr_info cinfo;
> +	/* Event monitoring status */
> +	bool started;

--oYelnov9+3SzjngH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9ufoQAKCRB4tDGHoIJi
0kf/AQCm19aDqW1X5Lc6vESz6aB/eF/+kPgo7u2mGJcop7tftgEAtJiiKgtviPjo
RITcuT0ZpQ5HmhOW5orv0qV/m2UzhAA=
=ZjQN
-----END PGP SIGNATURE-----

--oYelnov9+3SzjngH--


--===============8734694873089827863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8734694873089827863==--

