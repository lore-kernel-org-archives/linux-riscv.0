Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B0FC61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRKD25PM4zmshCA5ScLLwZJRwV3ndP2lQfnBpE0YxmU=; b=N1diO3kSwhRkYHpAxve1ujnA5z
	lQKOYByo5CmR4r4meuz2JjU1Wa0DdziZ95/QisHOl8Tj87uD8yt49Hu/LGCtSfm3btdwgj0ubPVES
	Bsk9/RL03L1Wwp9OX0UwhuUI/MtX6V0HSW/OJUjAUQIHmjHncXtpy5GqGu43HWleu7JWkkNzwhMyb
	gOwf8mh37Dq8q05FXrmUQRO5MggkxxipieCkSuj2jrro38S0A9R37J2VC1OH1Rkv/Oogfyx9/dGkH
	yL1GumoiWLkKOwQAL3ri+yJ/Pm9K6AVQxZcbcJD9CcS0tPd7c+cf0/vkx7ckEQdd8QjOgebIFqwAt
	oKelr/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OC7-0000000C9kd-2Z2Q;
	Tue, 01 Sep 2026 13:06:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OC6-0000000C9kQ-2ObW
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 13:06:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36E624188E;
	Tue,  1 Sep 2026 13:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5036C1F000E9;
	Tue,  1 Sep 2026 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788267990;
	bh=xGV+Gv1zqRvGD2mfuz0yHeN5wqnyyMJk9ADt/XAWP1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCrrYGa39iPIIdxeOK9RNW4H55Nix7jC+fAqlBKusODxqlo8yjWO2ezNKOIlCtAdS
	 duh/h3NnMTx4S+3L00YK6grOMqgUmjCa1ARbu9CchYUDeCG//aaZKtkOxyVqsZUMWb
	 FRIqT/5NrRpxVHr8nk6+qqpqtNVrvuNeTtSV76MJqOwitI5s8qq4CLUyYNyfciD4KH
	 F+DtrWcmH+s86qIfiAsNqUu1EU+mrAP1wQOJzxlwe4hPPuH/3qT7hC1Zp0drULU/2h
	 mvhJa82F80jvg4KAJTCTD8Gs2ViyboO2V/hCOsRcb/RWTpJFhM841ePQ4KXNu+qXlg
	 yP53i7JuWAi5A==
Date: Tue, 1 Sep 2026 14:06:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, conor.dooley@microchip.com, schwab@suse.de,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: simplify has_fpu() to check D extension
 only
Message-ID: <20260901-overdrive-footgear-e4c373d3f6f4@spud>
References: <20260901013746.19386-1-skunkolee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260901013746.19386-1-skunkolee@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3825094032614163986=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3825094032614163986==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knxIKpuYmzosOGQq"
Content-Disposition: inline

--knxIKpuYmzosOGQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 07:37:46PM -0600, Ivy Lopez wrote:
> The kernel never supports D without F, since D depends on F. The
> D-extension flag is cleared during devicetree/ACPI parsing whenever
> F is not present, so has_fpu() checking either extension with '||'
> never actually produces a different result than checking D alone -
> F without D cannot occur in practice, and there is no observable
> impact on RISCV_HWPROBE_IMA_FD or userspace.
>=20
> Simplify has_fpu() to check D only, matching the expectations set
> elsewhere in the kernel for this dependency, rather than relying on
> a redundant OR condition.
>=20
> sys_hwprobe.c already calls has_fpu() and needs no changes.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221874
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Andreas Schwab <schwab@suse.de>
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--knxIKpuYmzosOGQq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapbNsAAKCRB4tDGHoIJi
0vmnAQC3aA3ZnZrnrjHLb5s6jto2jc8fG9Lqg5JDTbNtC8E2wQD+L/FINBB28A16
APxL1qmL1nuayot1JWJ3Bft5qlsKjAM=
=OOzQ
-----END PGP SIGNATURE-----

--knxIKpuYmzosOGQq--


--===============3825094032614163986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3825094032614163986==--

