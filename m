Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6511FC5913
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAknyOeB0EBPgte0a0bpTgRfrjhD5NeIVkdnTGNYp2U=; b=i8tCe2Oq2zT1MdP0OnoNKMGeKW
	WoG/97c6ejGLFRqqaly7supGgkiMz0SlNhH4aH+7s6u/sknSs6S+cL376h1GuXj7ayUH983BHk3cq
	uk6JrwMtkXbi0q76Adijl564TcHlwECYcC76UGSyC2tEYKXCl81lZwOqptRQCsa1tiKoUNZfjV7G0
	dN+N3houAHDIO3GfV6b2KN1jaBGjwofNbclEHzrfe1/oSRLWfwSAsM8yqOeE4nQeLBYzL4FygocHu
	6OrLWLxmXXIkSmepfaeX/vrvV2eW3yJOgUqEk9ek/YidUsLvWDBKYk3u/Z/cQ4Il+1xX1JuSqumj+
	5lHSqrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX6f-00000005i5c-4B5o;
	Thu, 26 Feb 2026 08:52:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX6e-00000005i5V-1G07
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 08:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 633D060097;
	Thu, 26 Feb 2026 08:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C776C19422;
	Thu, 26 Feb 2026 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095943;
	bh=/QP/ifJFBVBr5gtAkpDepNA418WX/ZbmVBZRLYhC1Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBNos0PMs0bQ3OcawkwD3VT+nkeHCrlfX7VuxrMfuOI5dT1rmtAC7D5jEGOocvmFJ
	 BhE6vYXh6py4wkthaDRZEoie3OLQKZeYe7F2p6czow1yw4gom/hOQStCL/3/pZZNQA
	 3LfiVteH3m25NuEYEH56ewlIeBeZOrpNX2lFsnPBmcNnn8a1XXVIREWpMAYDpFXA9N
	 tbo6q/h7hyvKAd6vB+ZISfJSjIj7kRo2bcCHIQg8zoM9xQKnUxSYRk+zki/x4R94mF
	 H6m7gwLN0Mf+VQEaGVgNB4Uh15jglEOz/BwDjuiVflCL4LeSoWkFULn7sfjYoT2eWn
	 yog6tiAws8aVw==
Date: Thu, 26 Feb 2026 08:52:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260226-lagging-showplace-5931d23fe69a@spud>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
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
Content-Type: multipart/mixed; boundary="===============2020780621893986063=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2020780621893986063==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s+XNTX+MEfdZnmZG"
Content-Disposition: inline


--s+XNTX+MEfdZnmZG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrote:

> +static int rv_init_mcontrol_trigger(const struct perf_event_attr *attr,
> +static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,

Another minor thing in passing, can you do s/rv/riscv/ here? rv is
actual subsystem and riscv arch code is almost exclusively using riscv
as a prefix.

Cheers,
Conor.

--s+XNTX+MEfdZnmZG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaAJwwAKCRB4tDGHoIJi
0gWpAP0W/THm8GnjU1SKWk5Z8tBo0z/SDG+Dt67x4kVg/6GsnwEAyaGHS/5zq+ux
XnpMXWRkLdrIDduRQnb68tV5f/sa5Ac=
=iYLY
-----END PGP SIGNATURE-----

--s+XNTX+MEfdZnmZG--


--===============2020780621893986063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2020780621893986063==--

