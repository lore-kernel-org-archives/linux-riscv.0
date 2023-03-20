Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83932C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQspTWdlI6ltIkIZArDmwvVjCq4pGuqAh50oNABFlIs=; b=Wt4DU+D7IXDQsWIcmbhcyAI5m/
	WBWsIiBzzqsEE9ZrPCwINwltDINigW/b5wLUgTh8LDPa6FpoxieytmgJ0tK7vsbCILn7PFtC9hDQS
	gA2/sB3bL5whDbkGwudzyuJBOEVO426r6zFgwAN5s+mdhxKFu379GWpJvf6MJBkjB0WPe2nRaOhFC
	oAFxyD0BfrU69yp4092oVOxZRuLDuXaGa02CugjN/6dPHh1JSHqx8P96s5ZHVwgZs6eqvHHA+LW8K
	HxFK5ERwRxDvUvj8MmfIRkPVqkDeXtOfej0AwBjRZyNrOxke8yV+3JJQED0Fyly7lEjom4Wv0WdKg
	C6jWbgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFEs-0093W2-0X;
	Mon, 20 Mar 2023 13:07:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFEo-0093Ud-1Q;
	Mon, 20 Mar 2023 13:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679317666; x=1710853666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7w0/Fv7Y6Ejl6TmQJMw+6C+2veIfg3OxJTIOTANspNQ=;
  b=f/3DoExI40U1J+1JCUqGunpVytezRVNjjkjGqrkm5Ejb9blrPfquThyS
   wihIW545CWHMboSClJ6Vi9xLmGjTtP72RlnuRldqCS63jsH/7BPJH0bY6
   xSSx/+/y9j8E0Tp245aQczly4MvSQB+JAdL4fYPEJLi8DMlaMRJ3md40X
   K3mUuTqZF+v7EdzZoRn2zfyNzjjbWuuOJS1Y85c7npp0NEp1mSuIjaIY8
   y7G1uOHkwACn2siQh50KRvXL1jSw2G8lxxgThI7Q/qEOC3Dd3G6wv9cns
   lMnlTbyghT4DfPUjl+KFdRKMup3GyffGado3UctmiDooIp100pAe26NnM
   A==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="217103041"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 06:07:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 06:07:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 06:07:41 -0700
Date: Mon, 20 Mar 2023 13:07:11 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v15 09/19] riscv: Add task switch support for vector
Message-ID: <38d91df7-1a94-4e55-acff-fa74899091d3@spud>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-10-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230317113538.10878-10-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_060746_525137_93573387 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, atishp@atishpatra.org, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Nick Knight <nick.knight@sifive.com>, anup@brainfault.org, Ruinland Tsai <ruinland.tsai@sifive.com>, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Dmitry Vyukov <dvyukov@google.com>, Vincent Chen <vincent.chen@sifive.com>, palmer@dabbelt.com, "Eric W.
 Biederman" <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6731562495114321774=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6731562495114321774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DAVGBkmh26aPh/E2"
Content-Disposition: inline

--DAVGBkmh26aPh/E2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 11:35:28AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch adds task switch support for vector. It also supports all
> lengths of vlen.
>=20
> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Nick Knight <nick.knight@sifive.com>
> Signed-off-by: Nick Knight <nick.knight@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

> @@ -131,6 +166,9 @@ static __always_inline bool has_vector(void) { return=
 false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return f=
alse; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_setup_vsize()	 		do {} while (0)
                                        ^
vim complains that you added a space here, between the first and second
tabs.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +#define riscv_v_vstate_save(task, regs)		do {} while (0)
> +#define riscv_v_vstate_restore(task, regs)	do {} while (0)
> +#define __switch_to_vector(__prev, __next)	do {} while (0)
>  #define riscv_v_vstate_off(regs)		do {} while (0)
>  #define riscv_v_vstate_on(regs)			do {} while (0)

--DAVGBkmh26aPh/E2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhafwAKCRB4tDGHoIJi
0kjXAQD5Exvw6yVA+/p+41zcBfq0O+x3U+OW1HdH9H8D9oznigEA7MUhkJdXlA+j
w8tQBq4mmlJuAbuBaJPiL4SFfayTYgo=
=j0ZU
-----END PGP SIGNATURE-----

--DAVGBkmh26aPh/E2--


--===============6731562495114321774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6731562495114321774==--

