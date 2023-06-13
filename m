Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB2EB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lo8qBRrCE91JGMILhDRA9gv6Mx0x1bxInQZm5V+TlFw=; b=dLExwuAymMCSfmCdLOrnuDwxLK
	Sx8KBxr/UTJO1gAwL2wHDXKnw52UPg9EYkJRxDs9KT+SVFsp0YLTIwhN0ChacvKKVM2Me9qeXvYJI
	4mpVoPUOUG+kek2daHLp4uSGnFU+3ceTcNQ9JO805GVyqgRryMmb6bV5257Qj8TkODKLT98KUWXGj
	yUfZmPBEvGnwE4z0M8+xLE5GcRpLWju1o5Na1PcHcjiuI1xo52YDHfU++1j6XV9uGuAZuVj2sxtkM
	5C0LfNIgkEJ3NSh4BOR/g8ftlOL7E4zB1WfM6F2IZveEKTlzS2J3G1v8z9PwIMdo7oiXjR99SHeCN
	e7VBwv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q97E8-008dWX-0f;
	Tue, 13 Jun 2023 16:50:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q97E1-008dVB-1E
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 16:50:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 888F562AD9;
	Tue, 13 Jun 2023 16:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A759C433F0;
	Tue, 13 Jun 2023 16:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686675031;
	bh=Nv1pXyuTqEu6mOHPgx8NQsMlkyzGVtvusfjtLrcedoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wmp6ZRO0Qu+0rQJ0/0qe3l7hbvU5M1ltWeIjgpcgqbmyAKZRUiYH0sA6M7b8VPl2D
	 9apYHFu4qbMH8R/ZBJQf0Spwff/twYMbFF8zluCYSm46KR1n2r6+lZtytQoA3Hfql3
	 Z5zApMApymCOxfUY0+lAfEKPF5ltFqXiCUBSN8i2lWPT0kHCSDyiQ7hU+vFZW2r487
	 OXZIPpxC06ZWfNOYmIaWwytWoW80ouCQ+1NBnthlRlJWyZjYDD6/j5eSVnLjT1nZvD
	 ATeOwDF4pZwM8DlpfYTE2EOr6yW12Lq7ozwGC22lXmm4C2QHSjSawRtGB6GxD6IWQv
	 AlPVN+PRZBO3A==
Date: Tue, 13 Jun 2023 17:50:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	jszhang@kernel.org, conor.dooley@microchip.com,
	ajones@ventanamicro.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH] RISC-V: Support 32_PCREL relocation type in kernel module
Message-ID: <20230613-geologist-rasping-e3ff17bf3906@spud>
References: <20230613072644.10487-1-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230613072644.10487-1-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_095033_571349_B20C831B 
X-CRM114-Status: UNSURE (   9.21  )
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
Content-Type: multipart/mixed; boundary="===============3135352021167864622=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3135352021167864622==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xYzP2JSiD7E4tKSI"
Content-Disposition: inline


--xYzP2JSiD7E4tKSI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 03:26:44PM +0800, Nylon Chen wrote:
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>

You need to write a commit message chief :/
E.g., explain wasn't this needed before and is now.

Cheers,
Conor.

--xYzP2JSiD7E4tKSI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIieUQAKCRB4tDGHoIJi
0gLpAQDPRjGUMu1+/upVQjqGeEGrhPoeaMmtMSIOV4D8fcCa6QD/VP9jfr4RQo7S
sVUkaur7Pm2HtETlRNbQRwBAQ1NH2go=
=8bSn
-----END PGP SIGNATURE-----

--xYzP2JSiD7E4tKSI--


--===============3135352021167864622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3135352021167864622==--

