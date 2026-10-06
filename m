Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F8CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cHokTEzncOOrnP0UsAV3Mz7I57TAsCl2iQvQlzF2aE8=; b=YVs
	VKKs6yjGRnJQHVfCMua9fdTlHowEoVRJOVv8L1U+f197xpmPQHYirawYnIwFlnZymQ8hTkFA3io/3
	o5+Yth8U9WM9tHkYDuhmP8ius9TQIlSy/WYOXgG1OvzyOKsxsjokTMp/LTQOHXAD85fSWGMGVR8XA
	WubTFGpFvIse+eKiZbFWsQxpYFpAo7BKprNYmAzt/H0I9l2xe17b/l/XdgQYPbkryYJzxzbTvVngR
	xOWFcKTqj5Z91qKnRWYPB/Un4zpdUbHbE4VpmWM9JDTtyM1ZeMAtp6E8mlGgpoczXrjP28IyfQflx
	WjE3YU0ZUtYDa33l5W6TL4kvYSOnqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7aD-000000015Wn-2WfN;
	Tue, 06 Oct 2026 16:00:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Zy-000000015Vk-2fts
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 15:59:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0A1D601E4
	for <linux-riscv@lists.infradead.org>; Tue,  6 Oct 2026 15:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186E81F0089B
	for <linux-riscv@lists.infradead.org>; Tue,  6 Oct 2026 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791302385;
	bh=uH+KzaSGvEG+L2yGAC4cOYtVbh6K6BXkEAK4wW0c+R0=;
	h=Date:From:To:Subject;
	b=HfAsfo7FQbZdte3OrPUhGFkJspsWWAE9ODofgBUA/jZo2316pcqVei1ga6S9GeFR2
	 wBmvE94xX2lIQwvg/13yONd7oG1lA5aFW2JfUGOfDT7FzljHRYoy7zUj6sejrl/kjK
	 j5jvGY2hjEBPON1VVWMYxYhU43shCbL7sHt47iIhhwUJcyOfWV0mGssThR2DB7dleD
	 YKiddCeyZtZ1+XsSeKxop87K5jrlSsu82nN33/oSctEU4OmKMJIjtIhLujS4c2HvvX
	 httKLpk89BAMRKTOhAGRap4nI8FbNEABruJwUWc35Q/j8ok6jKpDLQTV4JT1E9tB4i
	 WUYkVbO3Z4C7A==
Date: Tue, 6 Oct 2026 16:59:42 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [RFC] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
Message-ID: <asUa6pJVpXb2EadB@squawk>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============7052520818980707245=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7052520818980707245==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M9vKIaw9Eu9bGPqc"
Content-Disposition: inline

--M9vKIaw9Eu9bGPqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Conor Dooley <conor@kernel.org>

RISCV_ISA_EXT_BUNDLE actually made sense when it was originally added,
since it presented a simple interface where users (be that in kernel or
userspace via things they are presented by the kernel) would check the
exact extension needed for a feature, rather than muddying the water
with parent extensions. As a result, the kernel does not track the
status of the parent extension in the bundle, nor expose it to
userspace.

This is in comparison to RISCV_ISA_EXT_SUPERSET,
where the parent extension provided some explicit value, and would have
to be checked for itself for some potential feature, and therefore we
actually track the status of both child and parent extensions, and let
userspace detect them independently.

Since we added this stuff, there's been some retroactive extension
releases by RVI that have made previous monolithic extensions into pure
wrappers that we intended using RISCV_ISA_EXT_BUNDLE for. Since we
previously tracked that as one extension, and exported it to users as
one extension, we can't just use RISCV_ISA_EXT_BUNDLE, and have to use
RISCV_ISA_EXT_SUPERSET instead and nobody seems to know what to use each
actually for anymore.

Just delete RISCV_ISA_EXT_BUNDLE for the sake of consistency between
things that were always a bundle from ratification and for those
retroactively made into bundles, with the side benefit of being less
confusing for those adding extensions to the kernel.

Signed-off-by: Conor Dooley <conor@kernel.org>

---

No idea if this works properly, I wrote it in the middle of a talk on a
laptop that has nothing needed to do the testing on it.
I brought this up during some view the other day, dunno if people
actually latched onto what I was getting at, so just posting it to see
what folks think.

Not 100% on if my comments on the initial rationale are right, they're
just my recollection...

Cheers,
Conor
---
 arch/riscv/include/asm/cpufeature.h |  8 ---
 arch/riscv/include/asm/hwcap.h      | 10 +++
 arch/riscv/kernel/cpufeature.c      | 97 ++++++++++++++++-------------
 3 files changed, 63 insertions(+), 52 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/c=
pufeature.h
index 739fcc84b..74b3e34b5 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -54,14 +54,6 @@ void __init riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
 			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
=20
-/* Used to declare pure "lasso" extension (Zk for instance) */
-#define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
-	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
-			    ARRAY_SIZE(_bundled_exts), NULL)
-#define __RISCV_ISA_EXT_BUNDLE_VALIDATE(_name, _bundled_exts, _validate) \
-	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
-			    ARRAY_SIZE(_bundled_exts), _validate)
-
 /* Used to declare extensions that are a superset of other extensions (Zvb=
b for instance) */
 #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), NULL)
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2..823e8506c 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -122,6 +122,16 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZK		116
+#define RISCV_ISA_EXT_ZKN		117
+#define RISCV_ISA_EXT_ZKS		118
+#define RISCV_ISA_EXT_ZVKN		119
+#define RISCV_ISA_EXT_ZVKNC		120
+#define RISCV_ISA_EXT_ZVKNG		121
+#define RISCV_ISA_EXT_ZVKS		122
+#define RISCV_ISA_EXT_ZVKSC		123
+#define RISCV_ISA_EXT_ZVKSG		124
+
=20
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
=20
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 61d21f714..b1f2a9626 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -322,14 +322,6 @@ static const unsigned int riscv_a_exts[] =3D {
 	RISCV_ISA_EXT_ZALRSC,
 };
=20
-#define RISCV_ISA_EXT_ZKN	\
-	RISCV_ISA_EXT_ZBKB,	\
-	RISCV_ISA_EXT_ZBKC,	\
-	RISCV_ISA_EXT_ZBKX,	\
-	RISCV_ISA_EXT_ZKND,	\
-	RISCV_ISA_EXT_ZKNE,	\
-	RISCV_ISA_EXT_ZKNH
-
 static int riscv_ext_smcdeleg_validate(const struct riscv_isa_ext_data *da=
ta,
 				       const unsigned long *isa_bitmap)
 {
@@ -351,60 +343,77 @@ static int riscv_ext_ssccfg_validate(const struct ris=
cv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
=20
-static const unsigned int riscv_zk_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZKN,
+static const unsigned int riscv_zk_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZBKB,
+	RISCV_ISA_EXT_ZBKC,
+	RISCV_ISA_EXT_ZBKX,
+	RISCV_ISA_EXT_ZKND,
+	RISCV_ISA_EXT_ZKNE,
+	RISCV_ISA_EXT_ZKNH,
 	RISCV_ISA_EXT_ZKR,
 	RISCV_ISA_EXT_ZKT
 };
=20
-static const unsigned int riscv_zkn_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZKN
+static const unsigned int riscv_zkn_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZBKB,
+	RISCV_ISA_EXT_ZBKC,
+	RISCV_ISA_EXT_ZBKX,
+	RISCV_ISA_EXT_ZKND,
+	RISCV_ISA_EXT_ZKNE,
+	RISCV_ISA_EXT_ZKNH
 };
=20
-static const unsigned int riscv_zks_bundled_exts[] =3D {
+static const unsigned int riscv_zks_sub_exts[] =3D {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZBKC,
 	RISCV_ISA_EXT_ZKSED,
 	RISCV_ISA_EXT_ZKSH
 };
=20
-#define RISCV_ISA_EXT_ZVKN	\
-	RISCV_ISA_EXT_ZVKNED,	\
-	RISCV_ISA_EXT_ZVKNHB,	\
-	RISCV_ISA_EXT_ZVKB,	\
-	RISCV_ISA_EXT_ZVKT
=20
-static const unsigned int riscv_zvkn_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZVKN
+static const unsigned int riscv_zvkn_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZVKNED,
+	RISCV_ISA_EXT_ZVKNHB,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT
 };
=20
-static const unsigned int riscv_zvknc_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZVKN,
+static const unsigned int riscv_zvknc_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZVKNED,
+	RISCV_ISA_EXT_ZVKNHB,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVBC
 };
=20
-static const unsigned int riscv_zvkng_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZVKN,
+static const unsigned int riscv_zvkng_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZVKNED,
+	RISCV_ISA_EXT_ZVKNHB,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVKG
 };
=20
-#define RISCV_ISA_EXT_ZVKS	\
-	RISCV_ISA_EXT_ZVKSED,	\
-	RISCV_ISA_EXT_ZVKSH,	\
-	RISCV_ISA_EXT_ZVKB,	\
+static const unsigned int riscv_zvks_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZVKSED,
+	RISCV_ISA_EXT_ZVKSH,
+	RISCV_ISA_EXT_ZVKB,
 	RISCV_ISA_EXT_ZVKT
-
-static const unsigned int riscv_zvks_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZVKS
 };
=20
-static const unsigned int riscv_zvksc_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZVKS,
+static const unsigned int riscv_zvksc_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZVKSED,
+	RISCV_ISA_EXT_ZVKSH,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVBC
 };
=20
-static const unsigned int riscv_zvksg_bundled_exts[] =3D {
-	RISCV_ISA_EXT_ZVKS,
+static const unsigned int riscv_zvksg_sub_exts[] =3D {
+	RISCV_ISA_EXT_ZVKSED,
+	RISCV_ISA_EXT_ZVKSH,
+	RISCV_ISA_EXT_ZVKB,
+	RISCV_ISA_EXT_ZVKT,
 	RISCV_ISA_EXT_ZVKG
 };
=20
@@ -580,13 +589,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
 	__RISCV_ISA_EXT_DATA(zbkc, RISCV_ISA_EXT_ZBKC),
 	__RISCV_ISA_EXT_DATA(zbkx, RISCV_ISA_EXT_ZBKX),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
-	__RISCV_ISA_EXT_BUNDLE(zk, riscv_zk_bundled_exts),
-	__RISCV_ISA_EXT_BUNDLE(zkn, riscv_zkn_bundled_exts),
+	__RISCV_ISA_EXT_SUPERSET(zk, RISCV_ISA_EXT_ZK, riscv_zk_sub_exts),
+	__RISCV_ISA_EXT_SUPERSET(zkn, RISCV_ISA_EXT_ZKN, riscv_zkn_sub_exts),
 	__RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
 	__RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
 	__RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
 	__RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
-	__RISCV_ISA_EXT_BUNDLE(zks, riscv_zks_bundled_exts),
+	__RISCV_ISA_EXT_SUPERSET(zks, RISCV_ISA_EXT_ZKS, riscv_zks_sub_exts),
 	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
@@ -606,17 +615,17 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_=
crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_=
crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkn, riscv_zvkn_bundled_exts, riscv_ext_=
vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvknc, riscv_zvknc_bundled_exts, riscv_ex=
t_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvkn, RISCV_ISA_EXT_ZVKN, riscv_zvkn_su=
b_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvknc, RISCV_ISA_EXT_ZVKNC, riscv_zvknc=
_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkned, RISCV_ISA_EXT_ZVKNED, riscv_ext_vec=
tor_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkng, riscv_zvkng_bundled_exts, riscv_ex=
t_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvkng, RISCV_ISA_EXT_ZVKNG, riscv_zvkng=
_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvknha, RISCV_ISA_EXT_ZVKNHA, riscv_ext_vec=
tor_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_ext_vec=
tor_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvks, riscv_zvks_bundled_exts, riscv_ext_=
vector_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksc, riscv_zvksc_bundled_exts, riscv_ex=
t_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvks, RISCV_ISA_EXT_ZVKS, riscv_zvks_su=
b_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvksc, RISCV_ISA_EXT_ZVKSC, riscv_zvksc=
_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvksed, RISCV_ISA_EXT_ZVKSED, riscv_ext_vec=
tor_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vecto=
r_crypto_validate),
-	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ex=
t_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvksg, RISCV_ISA_EXT_ZVKSG, riscv_zvksg=
_sub_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_=
crypto_validate),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(smcdeleg, RISCV_ISA_EXT_SMCDELEG,
--=20
2.55.0


--M9vKIaw9Eu9bGPqc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasUa6gAKCRB4tDGHoIJi
0jYRAQCN0jUKlrYvuvc99HfHeg9EeGbuki+c5h3QI8t6KVsb2AEAr3Z+6fsznegt
Vlc9o2mw/TJxiAvPQsacnFpLwKABlQQ=
=jCKf
-----END PGP SIGNATURE-----

--M9vKIaw9Eu9bGPqc--


--===============7052520818980707245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7052520818980707245==--

