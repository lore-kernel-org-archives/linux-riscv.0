Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A3606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2K1nuCP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKfasLxJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0KPBRho72OTKdCxCP7Eb7XM0+HAyyyuMIyrYSy78btM=; b=J2K1nuCP0m/cDsk0zffHdAQPxo
	WnHFpDo/BBHy6BLrXUcDnOweAA6l6EvDchq6dmEbdPXZzz6xS/P/QBoi2MF5OhNEf4rhdOrZGT5HY
	Q0xN54W17rYEAKbP4rdPThFPinOfvetLNDUEMGeU7n8TSa8udo9zqKdJIXgCuCEBvZp0By3/5l/P5
	hmqc9/1sLIQEb/leVRNMy4yv816JHiAwe1qEkeq5lsmv+vNS+d2pKdrgYpHZf7jI81jGsvOLa3Nrl
	7N1KlPkVBg5JRfPApO5eBFPsNfGIDOH2KOo0kz1uvVGK0PQ/sXma9KXQXV/yQsiSPT7zR0ZleYE6u
	1M8FoJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Vu-0000000CYeV-2csX;
	Thu, 19 Nov 2026 15:57:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Vp-0000000CYbg-1xhp
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 15:57:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E86BE45AAF;
	Thu, 19 Nov 2026 15:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120ED1F000C5;
	Thu, 19 Nov 2026 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103844;
	bh=gHSpicP6AXFH7Eu6+1T0bXY5QULxN/p2WvEf/j9QhZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FKfasLxJ2K3Ih6qLEsySOLePVg5YZLK07DInZ1YwZ4gLik0V9ZbaMeCr0IT0LFL0A
	 03jp2D4uQ7p9ljlD4guOcB3NHk56jxD0YjqFuapwYGcQbyxPBxecNLv6NeR5Uzxcw7
	 wTq1bozLgO5RoxQ/d2PTjHSCaYTwrFBhoEgxqaveOzpH04HitUVolZ9JUrZ9Fu10E3
	 fqP2ex60h47uU7XPJg8GNB5MQO322GsDn6rQ/hzN63Yt55vTD/5NIFzz4GzxD0ZDaF
	 DvQhNJt2ZgxtOOZEHq/Yhjldj07FD+dwhQewiYmxb2XHVfrpJi5Dp2BeZ0bwxJmsWu
	 0J02TDPiVRpcA==
Date: Thu, 19 Nov 2026 15:57:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Zhouqi Jiang <luojia@rustsbi.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dongliang Mu <dzm91@hust.edu.cn>, Anup Patel <anup@brainfault.org>,
	Andrew Davis <afd@ti.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Alejandro Colomar <alx@kernel.org>, contact@rustsbi.com
Subject: Re: [RFC PATCH RESEND] riscv: sbi: expose firmware identity in sysfs
Message-ID: <20261119-borough-flap-6481c20b3013@spud>
References: <A039A2DE1DF8F274+20261119130356.1537-1-luojia@rustsbi.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <A039A2DE1DF8F274+20261119130356.1537-1-luojia@rustsbi.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6614756465126462983=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6614756465126462983==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kRq95MxRn1fQKyba"
Content-Disposition: inline

--kRq95MxRn1fQKyba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 09:03:56PM +0800, Zhouqi Jiang wrote:
> Linux queries the SBI specification and implementation identity during
> boot. It caches the specification version, but discards the
> implementation ID and version after logging them. Userspace therefore
> has no structured interface for this immutable firmware metadata.
>=20
> Cache the implementation ID and version and expose the available values
> as read-only attributes under /sys/firmware/sbi:
>=20
>   spec_version
>   impl_id
>   impl_version
>=20
> SBI v0.1 systems expose only spec_version because the implementation
> fields were introduced by the SBI Base extension in v0.2.
>=20
> This gives tools such as lssbi a native source for basic SBI identity
> information and starts moving those queries away from out-of-tree
> kernel modules.
>=20
> Codex was prompted to research lssbi's out-of-tree SBI probe and design
> a minimal in-kernel replacement. It assisted with the sysfs interface,
> implementation, ABI documentation, changelog, and QEMU test setup. The
> result was built with a RISC-V defconfig and boot-tested under QEMU
> virt with:
>=20
>   OpenSBI v1.3
>   RustSBI v0.4.1

I like this idea.

> Assisted-by: Codex:GPT-5

FYI, these tags are now deprecated.

> +static ssize_t impl_id_show(struct kobject *kobj,
> +			    struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "0x%lx\n", sbi_impl_id);
> +}

Should this actually be printed as a decimal? It's a minor thing, but
the numbers in the spec are defined that way (see 4.9 SBI Implementation
IDs in the 3.0 spec).

> +
> +static ssize_t impl_version_show(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "0x%lx\n", sbi_impl_version);
> +}

--kRq95MxRn1fQKyba
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav8cMAAKCRB4tDGHoIJi
0ixDAP4xbETFFphxxj7syOcQqDBHdnUywbHbdu7xa5QQttMYlwEAob6rN4M0Q0hu
vxb7dZm+8Dj0REZDMf4Xsse5UfaHcQ4=
=bSG9
-----END PGP SIGNATURE-----

--kRq95MxRn1fQKyba--


--===============6614756465126462983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6614756465126462983==--

