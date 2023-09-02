Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE93C71153
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIdVjfi5HYa6sihxw4YR8fM52aoowCgy8pJHvuW1RDs=; b=EEHBoFqSbigy0UoAXoURdIVT3Y
	Tuj8Zo3QTIuUenPj56NSZnnbUJJf/yoXGKhPxt/ovxsWy9jRTPEnvdXlNLDM0d44dxR+OKE947znO
	1aLA/txIScjm6BFYaLglnsIe7MWUaTe1E8vuYZb7r3bHnunFoTVz+uyyfU4wcxUqJjKBJkBj28mq5
	YFRWvJIG+V6mVtfjbQflhyMk3X6Fc5CTn1p6TrXzS8+2nTO9TBTMpMSb55lnoN/r+0FFyS7suuQCI
	5lNU5DCKOQ+814Ns0o0dMFD+KmxjO1bStAmqWue+u83PuQf56maVLKzc/khX1yK7rbVbJ9InLuJMp
	I4NstMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcOK2-001MjR-2Q;
	Sat, 02 Sep 2023 10:57:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcOK0-001Mil-0Y;
	Sat, 02 Sep 2023 10:57:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31F8A60B35;
	Sat,  2 Sep 2023 10:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679D7C433C8;
	Sat,  2 Sep 2023 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693652262;
	bh=bT880HRAHTg093m0k1X5BqXi6ae7927qarFE1Li5t5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1zpkGPZJlfWzBR4wRPRsxyVY9nodEIBmcgwz3iARi5Gu7fHg8PZhO5wrqSvRAdVt
	 1a0BzQgWyArN64ZyWPwFl2enpzrWkVwUTuk9VMRkfMTIfwp4wVo4qJWPEPD1yCmPaJ
	 qAr6qTKhEPlE1WmNm3yoRpRld96MWxWXHnrzwKL5DupCd8S5UDlbFL/dktEPhI2Ou5
	 kXFwFM/db6YEmoD22jP5t+6YVhz60B57OGItix1du61I7pu0PnXTrjyWw2rHDIXUoD
	 BhsAeqM0gX7nprsS1Z8RdpZZfwpsoY8YMAW70bI5CPT/mfWZDjYeF6yJ8GxRbDuDvM
	 xnp1BD4/4JmFQ==
Date: Sat, 2 Sep 2023 11:57:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH 3/4] cpufreq/schedutil: use a fixed reference frequency
Message-ID: <20230902-clip-shortly-c9af45460915@spud>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-4-vincent.guittot@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230901130312.247719-4-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_035744_256135_46353AC8 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: multipart/mixed; boundary="===============4103543687839263677=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4103543687839263677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hbuDC/hObmFDzy3k"
Content-Disposition: inline


--hbuDC/hObmFDzy3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 01, 2023 at 03:03:11PM +0200, Vincent Guittot wrote:

> +#ifdef arch_scale_freq_ref
> +/**
> + * arch_scale_freq_ref_policy - get the reference frequency of a given CPU that
> + * has been used to correlate frequency and compute capacity.
> + * @cpu: the CPU in question.

Copy-pasting fail? That's not what your parameter is called.

> + *
> + * Return: the reference CPU frequency.
> + */
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)

--hbuDC/hObmFDzy3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPMVHgAKCRB4tDGHoIJi
0s6XAP4jMpeTFFLjakOgVS/UBIHhbCJsiwI5gp2cw9MfBFMfYAD/ZhOUlbrUT4gF
FxgcXOif8c9nBARo6fmstL6oTNc/3gk=
=C74W
-----END PGP SIGNATURE-----

--hbuDC/hObmFDzy3k--


--===============4103543687839263677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4103543687839263677==--

