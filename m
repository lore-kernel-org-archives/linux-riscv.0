Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C725C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jikVFQsiYZxooo2MqBRE5Xhc+xcA7aNfyjCeG+Tfc/I=; b=Vv6U+8RZGRGMfcO0+niR/RjKBF
	kEyylZMAOwR2g+t5B35zJ8xZqvZ5rCXcwn/A339Dp5KJ0nw9y+BS2B3wQrZ/zcqIRA/Vj3X/1ETtx
	iGfUPVOTTXoO0zpKrcBERnuHqOY0w4B+BbBHVQtu/rRNXm7y+y79GngvH8UM5NA1MHG1Kg7FXiTWN
	KlJe44a8LpqRHzB/Me5fZ4HUjZBVlCZghSb4rgfHFzmJIYe6PQ36q/UKReUnlknlBaW5/uNrDm+3N
	is5jlodCSIMyeS4kXxrt0Q8ZZ+qBkhSgg3rmuk8g4DHXiDE0ys2LxrdHvEvrVyf9Ul+lSExt6fVOA
	cG7/oM8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZQo-0000000DJZu-22Gu;
	Thu, 02 May 2024 16:37:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZQl-0000000DJY4-0AqZ
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 16:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 973C2CE1767;
	Thu,  2 May 2024 16:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D95DC4AF18;
	Thu,  2 May 2024 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714667825;
	bh=elIj2maOPCIQ9r6zUCBezHlRHkxdKHhoo2W0GlqZyBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxRP799+NKBOnBmJSVVkzJV2QPQxCkVIYNJcjkfAJ75fLz2G/4x69DOChbxxDKWu0
	 phwy483uBgXYWJ2E22vdf7f1iwHB799cpMVZmS7PJVmR3Z9Zm7SEKPh1aZYmCBcjxw
	 AoYPhvEL47d/IquhZvRLTpsWUxzgzjZYTG0XC5T7UEPncG37oy7HWEP8uXsv+QTVaq
	 qf8/7iUARN3BKNveOCo34fVoY/zqHyrN0J0yYiNIy4uxUEOMcdnCDiqCKe0dGIbBrn
	 j1rxYOE+TyDcrsUhK1wqTh1kCbY96IoasRh/WYKZNkxMrtg0LrKkF2q0Ih0OoZIDO6
	 4y9PT+rJxos9w==
Date: Thu, 2 May 2024 17:37:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com,
	john.garry@huawei.com, Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com, sudeep.holla@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH v4 2/3] riscv: cacheinfo: initialize cacheinfo's level
 and type from ACPI PPTT
Message-ID: <20240502-herald-catty-a03eafc4e6b1@spud>
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20240418034330.84721-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_093711_278772_B03A5E22 
X-CRM114-Status: GOOD (  11.61  )
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
Content-Type: multipart/mixed; boundary="===============4330347421122318981=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4330347421122318981==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yO7HUsK9PhhdPt6D"
Content-Disposition: inline


--yO7HUsK9PhhdPt6D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 11:43:29AM +0800, Yunhui Cui wrote:
> Before cacheinfo can be built correctly, we need to initialize level
> and type. Since RSIC-V currently does not have a register group that
> describes cache-related attributes like ARM64, we cannot obtain them
> directly, so now we obtain cache leaves from the ACPI PPTT table
> (acpi_get_cache_info()) and set the cache type through split_levels.
>=20
> Suggested-by: Jeremy Linton <jeremy.linton@arm.com>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
: Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

I'm not an ACPI head, so whether or not the table is valid on RISC-V or
w/e I do not know, but the code here looks sane to me, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--yO7HUsK9PhhdPt6D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjPBLAAKCRB4tDGHoIJi
0u7BAQDbJjVUjdxBuIPXpCPVp0rGN0S1orbltdlb/onG2hq2YgD+PpvigMyAnAWw
3yi6hMJHbgpBnXDIv2UKS2a6xsBjxAI=
=LkPp
-----END PGP SIGNATURE-----

--yO7HUsK9PhhdPt6D--


--===============4330347421122318981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4330347421122318981==--

