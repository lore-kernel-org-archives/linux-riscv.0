Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCD2C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VIhq+1LeMf8lkp6JNGd9KH9BhNjbmf5m25r/CIA10A=; b=NISuXQYP6kTNaMztdhclYmv3hr
	qSgCl5XcQ+Ggbz2CKjKFh+JSSczntoeZWwNKWhuSdpt8vxLR2CdTRTHiDzlVPjdvUqxtffDt5osnW
	2zTwlsXhTwB5zsW83V/grQUzaFvJjPgosy4Z11szjWnDw46av1ExKhXA3rTRe9LRMI4IcUY6oVhMA
	rTIlGwsf2gr7mXMWnJ6eYUwnf2GStuICcLnBgU0lFK+X12Oc5gzqAGDOXv04RlCHaMF6MVVap5EMM
	DriBHrt6yGdFf8myyzjQ1SU+TrBnnfyipwqmC/wybBMiwHXxo8cSrRuQGuINtVr00SwUCgBpvEE3e
	ImOmIN8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WOZ-00000007Uvt-2rOs;
	Tue, 15 Sep 2026 16:52:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WOW-00000007Uv2-0Ypz
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 16:52:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F152602BA;
	Tue, 15 Sep 2026 16:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB07D1F000FF;
	Tue, 15 Sep 2026 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491151;
	bh=ypzeoRTb6xYEsb/0WCuvTZKzTa2DaEvHlXj54ddwHQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cuDOM1nNDsxtF7PlFuKdms5h3NHvIeOPwqUQNtOl5kbk9O5dbaHIR/RrEzZUyG/3i
	 qSeL1n5WZRN1ll37KYIKax7VZLddYiaN5mCgEA+o5Jyf4GNB5aC/E77HsxtUsnI0Nl
	 TizghtMccZece/nmMV3joeDyInkBxIB4OBAn5L2KplAWNR6bK5s1N1tafFN5vdesA0
	 mzBUc/1bIzzXDMQsb27ampVmHD+ZSaxXeuOhxBtBRcKTAhYKq3nIPvhi6hW3nkeHk/
	 x8tY7cksKZJULwkgj3LWM16v3X62dPLE/HyWNWZe9O8tqegycyv7ZTSrdYI+6t4ilu
	 /oyUBJKLv7xuw==
Date: Tue, 15 Sep 2026 17:52:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>,
	Andy Chiu <tchiu@tenstorrent.com>,
	Florian Weimer <fweimer@redhat.com>,
	Peter Bergner <bergner@oss.tenstorrent.com>,
	Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
	Mark Harris <mark.hsj@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/11] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <20260915-widget-defiling-e22497c228cc@spud>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
 <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
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
Content-Type: multipart/mixed; boundary="===============1279572502035014031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1279572502035014031==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HzK562KHekWwgPYZ"
Content-Disposition: inline

--HzK562KHekWwgPYZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 03:15:35AM -0400, Guodong Xu wrote:
> Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
> (named profile-class sets such as IMA and RVA23U64), computed at init
> time by riscv_init_isa_bases().
>=20
> Register riscv_init_isa_bases() as an arch_initcall. That is late
> enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
> populated have_user_pmlen_*; without that ordering,
> riscv_have_user_pmlen(7) would still return its default false and the
> RVA23U64 detection path would always bail. It is also early enough that
> arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
> when it snapshots the hwprobe values into the vDSO data page.
>=20
> Consider this as the cache that subsequent consumers (hwprobe's
> RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
> can read without recomputing, which keeps them consistent with
> each other.
>=20
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>

Something is wrong here with the signoffs here, Drew's probably missing
either authorship or a Co-developed-by tag?

--HzK562KHekWwgPYZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql3xwAKCRB4tDGHoIJi
0j7yAP91eT382HzKXLp423gHB51yfWxN+iAs4R+MhBlF05j5GwEA5GjMcnOJVD8Y
sEFBqUBTL8evUR1CilJLWuZxaN1wQAU=
=myHc
-----END PGP SIGNATURE-----

--HzK562KHekWwgPYZ--


--===============1279572502035014031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1279572502035014031==--

