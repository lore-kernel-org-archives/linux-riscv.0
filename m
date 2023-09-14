Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC6BCA553C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqD9VQl2rPWYUFaPw2yGmVdKWRoonbcUeDgvNw+BD1g=; b=JtqEa6QdgX8k4AXOMVXhf/wG5Q
	dQShyDnh4hHgDqdXf4ONlGEVsm/UK6qZPLYwQvpUAREmInCOz4v36/4wCtU3q4f8ApzbkfVIIPyER
	GPbuiJFzce2KX20bWauiPv2cgwGIo/Y5AjFnbVWRuk57MVxt4NR+8FAi8qf/3gCNNFLUjNjg/pVzu
	pJ531bY6SpVKR8rS8l6GWY0F0wJZS/CojtG15t3w+cVGey+KyR/4HOKaTFDnHM/FyF6YJpebMlf6R
	N0F0qQO2tvXUFNtynwv+PvC5ZdbP3F1Z/zSQyf5p/6swsEOOnrMpgAKJDvwS7oCyQaHD0choDBPmX
	0M3IKRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qglzN-008OnG-2e;
	Thu, 14 Sep 2023 13:02:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglzK-008Omf-37
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 13:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694696551; x=1726232551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FKfzwEgabNmnr7ctogDVTVjqR+tQlE/LAJw2UQIySqk=;
  b=jhbdWVQ19qavqMA4H9fIuBcZl/kUaaACDRlWQFzQRHhV4AVG5IZsS+Nf
   63kSTBR3XnJ7Nj3oqoJII1N9IyOXkkIHyIH9M2OzmZhtoqkKFJISVGmyE
   IWKji3fy9XxRWzaGHqkLzC4Rw4xAKkdNmYFbDeRDKbfWOKJjsdDKFTAyP
   5+NnWW9ikCqUEgkqepK3tcJkJwxYB0hBIyrYovaP5QCa2WwnZQYV1AOFy
   VRA1s+uTN80UGwHvTjDKrxaNZiBPJwlGCC0eEFaG+enQquwCwf1D7J8+S
   OXY/v4neco/9GZNdAud71Wsw7vA+E9MebU4bHnHJQicOzQm8a4Kc+qcnj
   Q==;
X-CSE-ConnectionGUID: AFW5LNIURoy9wLgAfO/wEA==
X-CSE-MsgGUID: MPvWWLIsRTuZD0YJFcDjng==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="asc'?scan'208";a="235193637"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2023 06:02:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 14 Sep 2023 06:02:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 14 Sep 2023 06:02:20 -0700
Date: Thu, 14 Sep 2023 14:02:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Pu Lehui <pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, Pu
 Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 4/6] riscv, bpf: Add necessary Zbb instructions
Message-ID: <20230914-ought-hypnotize-64cee0e27ed2@wendy>
References: <20230913153413.1446068-1-pulehui@huaweicloud.com>
 <20230913153413.1446068-5-pulehui@huaweicloud.com>
 <20230913-granny-heat-35d70b49ac85@spud>
MIME-Version: 1.0
In-Reply-To: <20230913-granny-heat-35d70b49ac85@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_060231_009398_EA5FA52D 
X-CRM114-Status: GOOD (  24.44  )
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
Content-Type: multipart/mixed; boundary="===============1335930525939705546=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1335930525939705546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UdjAGp0Chm4M5aeN"
Content-Disposition: inline

--UdjAGp0Chm4M5aeN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 05:23:48PM +0100, Conor Dooley wrote:
> On Wed, Sep 13, 2023 at 11:34:11PM +0800, Pu Lehui wrote:
> > From: Pu Lehui <pulehui@huawei.com>
> >=20
> > Add necessary Zbb instructions introduced by [0] to reduce code size and
> > improve performance of RV64 JIT. At the same time, a helper is added to
> > check whether the CPU supports Zbb instructions.
> >=20
> > [0] https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bit=
manip-1.0.0-38-g865e7a7.pdf
> >=20
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >  arch/riscv/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >=20
> > diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> > index 8e0ef4d08..7ee59d1f6 100644
> > --- a/arch/riscv/net/bpf_jit.h
> > +++ b/arch/riscv/net/bpf_jit.h
> > @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
> >  	return IS_ENABLED(CONFIG_RISCV_ISA_C);
> >  }
> > =20
> > +static inline bool rvzbb_enabled(void)
> > +{
> > +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB);
> > +}
>=20
> I dunno much about bpf, so passing question that may be a bit obvious:
> Is this meant to be a test as to whether the kernel binary is built with
> support for the extension, or whether the underlying platform is capable
> of executing zbb instructions.
>=20
> Sorry if that would be obvious to a bpf aficionado, context I have here
> is the later user and the above rvc_enabled() test, which functions
> differently to Zbb and so doesn't really help me.

FTR, I got an off-list reply about this & it is meant to be a check as
to whether the underlying platform supports the extension. The current
test here is insufficient for that.

Thanks,
Conor.

--UdjAGp0Chm4M5aeN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQMETAAKCRB4tDGHoIJi
0r2GAP9G/Tqz8CZj+46l3JPNeu10+ifMteg0qvwIC0WpXczpbAEAoZJnprYePgJx
FLwHEzyRTZklaezLKQvJLVjjuM4DjQ8=
=qF/h
-----END PGP SIGNATURE-----

--UdjAGp0Chm4M5aeN--


--===============1335930525939705546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1335930525939705546==--

