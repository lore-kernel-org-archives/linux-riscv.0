Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A892C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8KA/3PbhPczKN7GuxSSL2FVRMtiB/vQQFQkTksbQK8=; b=JC9SdAt4ngQRHaT57E5ziSN7D2
	Gq/xNjRSRy/stn3Gq7NNXS9vsYKgWJ3xKH+RRIdx2kXgISbFl9i05UqNRqZ4nVJawS5BPZnrnHQa5
	eCf5ru2d7l8FX03ZbJJwxyKjK6ljIqxkDV+JL0kElXIxKTZqemxlLbzgYUdnokMZ6W6wbbSB0VowU
	HxcEkzrvfrCtw99zoHRFxGVz3xrw6D871jK6juFZfTJdJl2RaW3FwdYbWIMxUFstpFXRI1BDXapYo
	58xXW6awCZYdf5D5OsElpgVbl7xGSbwjOGxh4DqKuOPZ8+e+QfMs4+Vm3TRxpaLK2nLE2v0z62e9A
	t5mPL2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaDe-00000003lko-1BuV;
	Wed, 24 Apr 2024 10:51:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaDa-00000003liJ-2T13
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:51:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CFC39CE139F;
	Wed, 24 Apr 2024 10:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FA2C2BD10;
	Wed, 24 Apr 2024 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713955871;
	bh=obSGRI92SvTZ9PO94qPHWzuYNKWRL1pDAIG/iGUyOTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmQj/zooWZ3PBfCr/1PBC1YPwq9c0rnN0W2XFl9j/zySAGvGQpdlq9r69sPyzHzYn
	 xlmKYW1J/nLcItRS5T8Xe1TPuP4PHkYQW9MPzvA5Llt6ZBDLxwxwEp26o7WNdrUI3c
	 oHmolzPn72EBmNKFsdU3v2+hfUxVJzNiE+SvMziHdVWOWP9bjC8GYl0CgDyHubp4ke
	 tojqxBdUeAIMQE2CowL6ilXQKFC4E9NL+53jt2KMfLn5HdOL7RT9d/v4YvgTbp4aGD
	 bT/xE6XjUMqOBYYqOZbe58ri4VvMKtF0B7gsAX+jZD9voORGTI6YYYDD9ujLARuUjg
	 yhUlSvLz2skZw==
Date: Wed, 24 Apr 2024 11:51:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] riscv: Use offset_in_page() in text patching
 functions
Message-ID: <20240424-unthread-pelican-93629280bf14@spud>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
 <20240327160520.791322-7-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240327160520.791322-7-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_035114_836168_5EA71512 
X-CRM114-Status: UNSURE (   8.33  )
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
Content-Type: multipart/mixed; boundary="===============5651647736110717450=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5651647736110717450==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x/oSwXS7Hv3e0hQM"
Content-Disposition: inline


--x/oSwXS7Hv3e0hQM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 27, 2024 at 09:04:45AM -0700, Samuel Holland wrote:
> This is a bit easier to parse than the equivalent bit manipulation.

And it is used elsewhere in patch.c too, so makes things more consistent
to boot.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--x/oSwXS7Hv3e0hQM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijkHAAKCRB4tDGHoIJi
0jqeAP9xB3Z24T1JfUA6sc27uXaYJ+OXu4Vo19lKXI8bvBIi+wD/ZuREtm4j6NZz
VPyLYewtekIG4sVePf3T4wcv4gmxkwM=
=YSu0
-----END PGP SIGNATURE-----

--x/oSwXS7Hv3e0hQM--


--===============5651647736110717450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5651647736110717450==--

