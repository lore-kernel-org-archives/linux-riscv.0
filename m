Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50904CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kf7NE4RI1Hyxp/pzdPPiSivNgybdYz2yBIFpXIq7VwI=; b=omWbyehTIV+3+oh6cmgk3vG6fB
	KSh+Okr1bDlth59i0qmjgZTWUh93dCBpXzWXin2HpFG5s/+74tcZSKgnvngeehtDzC5mdrPo4+Szb
	bFOkmBloC4rP3BXtM/dwnCKYSV+9/E3RU6CQ+oRNwZRGNtx5J2+Ws12lMYYQLfFDZ+2QsXpFW+s7f
	uSzURsIU/EKfDoj7vyGqhsBz/1PNvdQP8dK9bDW0BeVTVgNTnfPbzTir9kMpX1G1tV8I/kPnIs+Kj
	ZI3M+//zOk/RGrJtuUKR9bBWaqYGWeZXfM8vWC5Dn6nQRQX9TdELKZmhkeSi3Fhql2kJzuLsG9fkh
	GSWeVSXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbv4-00000006Rj2-1jg2;
	Thu, 14 May 2026 19:40:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbv1-00000006RiN-0ovh
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 19:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DE7143AFB;
	Thu, 14 May 2026 19:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA71DC2BCB3;
	Thu, 14 May 2026 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778787626;
	bh=/AKTU/4pX4ZFrjy08RCybTCXeS6AqYE/Ebr99UngWAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD0cTR28EicyCk7ne4IgVTPWfLOqPzEERrrv7DRXmhbsOoqLCZk5Q/sfyjUxt75rE
	 F6d2kNg/YXFm5h6t43SzvF17jxO3UStL5wMg0L5bYCsL+mjgA6xIXPVjAwByH/CRMr
	 aHA3fIVuGusuat+/Y7waKPYerkA7ST9ujppHO1u1wtC2eP8XB5ioZfXJG5lfaUAkPA
	 RVY8UzaX+ppajOtBzF4p+ETXVu5mpyZdw5zDTlA56/iePLQbCuMgByNPrnIAqR3YLQ
	 GIIV9zORiR4P7Px0eh0UEDd0vTpjwwBwZaXP+IbQzyqvXEtYmzKf66Vp+70TZ6KoG0
	 Rw1UJ1ZF4JQCw==
Date: Thu, 14 May 2026 20:40:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
Message-ID: <20260514-afterglow-overlabor-bc483b2a8b35@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
 <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
 <20260514-used-revival-306ddced4ab8@spud>
MIME-Version: 1.0
In-Reply-To: <20260514-used-revival-306ddced4ab8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_124027_280202_0128F32D 
X-CRM114-Status: GOOD (  39.10  )
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
Content-Type: multipart/mixed; boundary="===============3596482625752269584=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3596482625752269584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yat47aogx/LrUfFI"
Content-Disposition: inline


--Yat47aogx/LrUfFI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 07:57:46PM +0100, Conor Dooley wrote:
> On Mon, May 11, 2026 at 10:23:16PM +0200, Linus Walleij wrote:
> > On Wed, May 6, 2026 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> >=20
> > > Whipped this up last week, at to a first glance it appears to work,
> > > although the spacemit platform I've used to implement this has very
> > > limited in-tree use of pinctrl so it is hard to be sure.
> >=20
> > I like it, if it wasn't RFC I would merge it.
>=20
> Half the reason that it is RFC is that I knew dlan wanted to take a look
> but told me they weren't available, so I said I'd send it on the list in
> the interim.
>=20
> > > What I don't love though is how similar the functions
> > > pinctrl_generic_pins_function_dt_node_to_map() and
> > > pinctrl_generic_pinmux_dt_node_to_map() are - essentially identical
> > > other than which function they in turn call.
> >=20
> > Hm we can maybe think of something more descriptive
> > to the first one?
>=20
> I think the name is actually okay, it was the similarity of the code
> that I don't like. There's a fair bit of duplication.
>=20
> > I think the new function is very much to the point. That's what
> > it does. pinctrl_generic_pins_function_dt_node_to_map() could
> > perhaps be names something that make it evident what is
> > special about it. Not that I have a good idea.
> >=20
> > > Basically, I wanna know if you think that that is acceptable,
> >=20
> > Looks Good To Me (TM) no-one else is helping out with pin
> > control core work so I'm happy for everything I get.
>=20
> Right, well I'll go clean it up I suppose. I might send a rfc v2 with an
> extra patch that tries to get rid of some of the code duplication and
> you can tell me which version you prefer?

Actually, no need for rfc v2, can just paste here:

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-ge=
neric.c
index d1365acfd1f8c..9759b0186bcc2 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -119,92 +119,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to=
_map(struct pinctrl_dev *p
 				      functions, pins, npins);
 }
=20
-/*
- * For platforms that do not define groups or functions in the driver, but
- * instead use the devicetree to describe them. This function will, unlike
- * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
- * and functions, create them in addition to parsing pinconf properties and
- * adding mappings.
- */
-int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctld=
ev,
-						 struct device_node *np,
-						 struct pinctrl_map **maps,
-						 unsigned int *num_maps)
-{
-	struct device *dev =3D pctldev->dev;
-	struct device_node *child_np;
-	const char **group_names;
-	unsigned int num_reserved_maps =3D 0;
-	int ngroups =3D 0;
-	int ret;
-
-	*maps =3D NULL;
-	*num_maps =3D 0;
-
-	/*
-	 * Check if this is actually the pins node, or a parent containing
-	 * multiple pins nodes.
-	 */
-	if (!of_property_present(np, "pins"))
-		goto parent;
-
-	group_names =3D devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
-	if (!group_names)
-		return -ENOMEM;
-
-	ret =3D pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, np,
-							      maps, num_maps,
-							      &num_reserved_maps,
-							      group_names,
-							      ngroups);
-	if (ret) {
-		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", n=
p->name);
-	}
-
-	ret =3D pinmux_generic_add_function(pctldev, np->name, group_names, 1, NU=
LL);
-	if (ret < 0) {
-		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
-	}
-
-	return 0;
-
-parent:
-	for_each_available_child_of_node(np, child_np)
-		ngroups +=3D 1;
-
-	group_names =3D devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERN=
EL);
-	if (!group_names)
-		return -ENOMEM;
-
-	ngroups =3D 0;
-	for_each_available_child_of_node_scoped(np, child_np) {
-		ret =3D pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, chi=
ld_np,
-								      maps, num_maps,
-								      &num_reserved_maps,
-								      group_names,
-								      ngroups);
-		if (ret) {
-			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
-					     np->name);
-		}
-
-		ngroups++;
-	}
-
-	ret =3D pinmux_generic_add_function(pctldev, np->name, group_names, ngrou=
ps, NULL);
-	if (ret < 0) {
-		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
-
-
 static int pinctrl_generic_pinmux_dt_subnode_to_map(struct pinctrl_dev *pc=
tldev,
 						    struct device_node *parent,
 						    struct device_node *np,
@@ -250,20 +164,19 @@ static int pinctrl_generic_pinmux_dt_subnode_to_map(s=
truct pinctrl_dev *pctldev,
 				      muxes, pins, npins);
 }
=20
-/*
- * For platforms that do not define groups or functions in the driver, but
- * instead use the devicetree to describe them. This function will, unlike
- * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
- * and functions, create them in addition to parsing pinconf properties and
- * adding mappings.
- *
- * It assumes that the upper 16 bits of the pinmux items contain the pin
- * and the lower 16 the mux setting.
- */
-int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+static int pinctrl_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 					  struct device_node *np,
 					  struct pinctrl_map **maps,
-					  unsigned int *num_maps)
+					  unsigned int *num_maps,
+					  int (dt_subnode_to_map)(
+						  struct pinctrl_dev *,
+						  struct device_node *,
+						  struct device_node *,
+						  struct pinctrl_map **,
+						  unsigned int *,
+						  unsigned int *,
+						  const char **,
+						  unsigned int))
 {
 	struct device *dev =3D pctldev->dev;
 	struct device_node *child_np;
@@ -276,21 +189,18 @@ int pinctrl_generic_pinmux_dt_node_to_map(struct pinc=
trl_dev *pctldev,
 	*num_maps =3D 0;
=20
 	/*
-	 * Check if this is actually the pinmux node, or a parent containing
-	 * multiple pinmux nodes.
+	 * Check if this is actually the pins node, or a parent containing
+	 * multiple pins nodes.
 	 */
-	if (!of_property_present(np, "pinmux"))
+	if (!of_property_present(np, "pins"))
 		goto parent;
=20
 	group_names =3D devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
=20
-	ret =3D pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, np,
-						       maps, num_maps,
-						       &num_reserved_maps,
-						       group_names,
-						       ngroups);
+	ret =3D dt_subnode_to_map(pctldev, np, np, maps, num_maps,
+				&num_reserved_maps, group_names, ngroups);
 	if (ret) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", n=
p->name);
@@ -314,11 +224,8 @@ int pinctrl_generic_pinmux_dt_node_to_map(struct pinct=
rl_dev *pctldev,
=20
 	ngroups =3D 0;
 	for_each_available_child_of_node_scoped(np, child_np) {
-		ret =3D pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, child_np,
-							       maps, num_maps,
-							       &num_reserved_maps,
-							       group_names,
-							       ngroups);
+		ret =3D dt_subnode_to_map(pctldev, np, child_np, maps, num_maps,
+					&num_reserved_maps, group_names, ngroups);
 		if (ret) {
 			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
@@ -336,4 +243,40 @@ int pinctrl_generic_pinmux_dt_node_to_map(struct pinct=
rl_dev *pctldev,
=20
 	return 0;
 }
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ */
+int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctld=
ev,
+						 struct device_node *np,
+						 struct pinctrl_map **maps,
+						 unsigned int *num_maps)
+{
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pins_function_dt_subnode_to_map);
+}
+EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ *
+ * It assumes that the upper 16 bits of the pinmux items contain the pin
+ * and the lower 16 the mux setting.
+ */
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps)
+{
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pinmux_dt_subnode_to_map);
+};
 EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);


--Yat47aogx/LrUfFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYlJgAKCRB4tDGHoIJi
0oQoAP48vMRu/kfGiS/RrfiiMgWW8boOp9U3c4wQY1MmeZTQvQEA9QNJR63VyECY
gCqrJaYSueEBY2GU+tAzszoLF1szQQU=
=RNRT
-----END PGP SIGNATURE-----

--Yat47aogx/LrUfFI--


--===============3596482625752269584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3596482625752269584==--

