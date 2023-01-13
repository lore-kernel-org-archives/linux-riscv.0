Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D77C54EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEeHheNk02hUu4njK2TLbkV6DI07NEukdJFAQzKIZ3o=; b=d7XYd1JxQI2X6ZJnh31xMuS7Jr
	BvgyA+ZmVIez+WAhYF2QxlXaJ6A3oy11OJbKzAYCMlHzvR/iLTug67hhd/7Co6Bf/YD8wusE7pm+P
	CaHJKinoECkzKonfAXpCaERPjXcqgOWLHfN7BL1Aw71pkmbQ/O8wuwr/biuY0ht7cQpSmkzvMzVCo
	G6jRgB9bJVMOX/X9gdaxlEBVAaD4WbBuEXfJOXGFuyuCJ3BYEmavRPoSFVloEL1dd5Icmc9tXPlT5
	dneuagUbRn8uqrVunio9Tk6lNyAPXo3xIijS+Zi2WmPxr64DA9j3US+J7DrCQol3r8jDm2ijVDAMd
	yMVVYy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGJ4-001SIY-PU; Fri, 13 Jan 2023 09:25:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGHq-001RUQ-VU
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 09:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673601826; x=1705137826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/xAKBZhyJ8HlMGnG8R+tnMoMY4Yw1acK1pUdd5RRh4A=;
  b=Lm7bQG3GmgIRLecTTfxE4CDOrqAHXdvmQ4tJf7ZxgcSnFcFsXJ1geN3g
   E/Y0hbzmffAVEWVjbbrVORXnz03t6D8OZM8nOM3KYsDENtvkERKL7aI6+
   iTRlMdnZdDN9cMYyn9uLhX9WbCSBXi+wEa+385hnyThpOnDA/hOcH/bYi
   NCbBkllFP3wHEOnrckbh+cEGXmm8DVzcjG+k9F2TbZWEOIiktudfnkvms
   KYAyFp12v3xOe5EMiBwOADgx6a/y7e8ycU+phoBjlN0JupdiPzkZ5yAJo
   U92WDA98cSzEXFHPUN9UlHjPoCE8lE/IcSIERcneku93+8VMtqfA3uQ0x
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,213,1669100400"; 
   d="asc'?scan'208";a="195624611"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jan 2023 02:23:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 02:23:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 13 Jan 2023 02:23:36 -0700
Date: Fri, 13 Jan 2023 09:23:14 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <guoren@kernel.org>
CC: <arnd@arndb.de>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <heiko@sntech.de>,
	<jszhang@kernel.org>, <lazyparser@gmail.com>, <falcon@tinylab.org>,
	<chenhuacai@kernel.org>, <apatel@ventanamicro.com>, <atishp@atishpatra.org>,
	<mark.rutland@arm.com>, <ben@decadent.org.uk>, <bjorn@kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Yipeng Zou
	<zouyipeng@huawei.com>
Subject: Re: [PATCH -next V14 4/7] riscv: entry: Convert to generic entry
Message-ID: <Y8EjAt3DC4WC062n@wendy>
References: <20230112095848.1464404-1-guoren@kernel.org>
 <20230112095848.1464404-5-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230112095848.1464404-5-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_012347_159065_8C44D799 
X-CRM114-Status: GOOD (  12.05  )
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
Content-Type: multipart/mixed; boundary="===============8985828396741322108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8985828396741322108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tn016RnVhEUTOGe2"
Content-Disposition: inline

--Tn016RnVhEUTOGe2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Guo Ren,

On Thu, Jan 12, 2023 at 04:58:45AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> This patch converts riscv to use the generic entry infrastructure from
> kernel/entry/*. The generic entry makes maintainers' work easier and
> codes more elegant. Here are the changes:
>=20
>  - More clear entry.S with handle_exception and ret_from_exception
>  - Get rid of complex custom signal implementation
>  - Move syscall procedure from assembly to C, which is much more
>    readable.
>  - Connect ret_from_fork & ret_from_kernel_thread to generic entry.
>  - Wrap with irqentry_enter/exit and syscall_enter/exit_from_user_mode
>  - Use the standard preemption code instead of custom
>=20
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Tested-by: Yipeng Zou <zouyipeng@huawei.com>
> Tested-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Ben Hutchings <ben@decadent.org.uk>

Unfortunately from this patch onwards, the !MMU build is broken.
Should be able to reproduce it with nommu_virt_defconfig.

Thanks,
Conor.


--Tn016RnVhEUTOGe2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8Ei5AAKCRB4tDGHoIJi
0hgHAP4zxYtVsZMV6BCEppbmfxRxpMW9oFKnWUOgUmHwNcSrhwD9Ff6CTDLxoiy3
sCNkTcezQudksEUbdB5Noc0qY6RioA0=
=OVvh
-----END PGP SIGNATURE-----

--Tn016RnVhEUTOGe2--


--===============8985828396741322108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8985828396741322108==--

