Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF180C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W40GxqRXQSpjTZPbs9rM/7/rqZcR3JhI+tLaItBwdsQ=; b=se/FPQZHnml3lZQ48iuVBNrFWv
	yPtCPqRNImJtH2/3Nh9RKn0MvrtqhuYEVZbp72zAwPM3TdyEGrQ5xnj89xnm3qnFtHQNI7+dFWKdh
	0bY5vpZmAKuBxCAF3/aFyfBRQq42+DrJjGP+5n7uzvlIUZLkoctx/ImI31G9ykd0mAx0KMHAvpQCI
	hxhOE1p+bagXpA1VcSWFRvkvH7jwy7ESUVw53Pr3aJw3ySCt78WRxIWBLCfhZSuvbRJw/w7XjGCZq
	c65kL6JrUQDxldaWpn0YTiCR1YrRS3u2Q/GzmLLcR1kPYzeR0PCzjS7wS8jAxtM5Yf1vu4DIU2w8g
	0Zm5j+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4feC-0000000EcCV-1GW5;
	Thu, 10 Sep 2026 14:21:04 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fe0-0000000Ec1A-3Zqf
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 14:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789050006;
	bh=3nZLJvFkotIH0hkZxh4gNEbBhFHsxNJJz5gCcWVLrcQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=KTN31E0LzJqJ5+n6sdnQ3saxk21R5q3x8bRi4eaOvbKPNfj0ij7i1LCyn37otAv2z
	 ptYKJ8ojNky2OY505bbcz0sK5mjUtnBtgRfm3pjYWLyEAX6L6ZNWtUZ5qpb0bm8lVC
	 v15smPAg+Wx+zyJ3epWSUqIndOgYjVr5jSe92fGQ=
X-QQ-mid: zesmtpgz7t1789049999t835cac00
X-QQ-Originating-IP: LvFWhnr8GQtHVtD5AxbXjVM2HEzA8EvNtZbuG/ISU7U=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 22:19:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14213851598178055219
EX-QQ-RecipientCnt: 13
Mime-Version: 1.0
Date: Thu, 10 Sep 2026 22:19:54 +0800
Message-Id: <DLBPALH9J84H.6CTB8GOVYSZ@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Yao Zi" <me@ziyao.cc>
Subject: Re: [PATCH 2/5] clk: spacemit: make MIX rate selection consistent
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Yixun Lan" <dlan@kernel.org>, "Alex Elder" <elder@riscstar.com>, "Inochi
 Amaoto" <inochiama@outlook.com>, "Haylen Chu" <heylenay@4d2.org>
In-Reply-To: <aqKqKkXbTkcS-pnY@pie>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
	<20260909-spacemit-pll-init-v1-2-b3065ad5a4ac@linux.spacemit.com>
	<aqKqKkXbTkcS-pnY@pie>
X-Unsent: 1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzr9mYlDMBxYvGYaH25O3d4qbQeIVx9zCjRu1bKRQCQPQYr
	9ThwbJ+HvmAa6+6QdJSCYZlE3A0Vw/IqS7JGGSDIDm0K0coYKWJy+xHRKmChsnJHWMY+7/x
	vrl+V+YvkOjsd7lSIQtsBaB12FwJo4xB+283/kqP+3Zub1l0VFR2HZHVMdj9PJfZ1kV+DRW
	XD3Q1f8Zs2lxtIjIh2C+zMb+snzW8OfbH9soHjShJ5/N3F5X6sntm3FW3kVQ2pCHkokBNad
	wwvFe07YHxecDTIiTTBAj3OtVrXJ6be3eivV32C8rGqj7PTUJzBHmXVQ95PLKRTH+XdgqO5
	BX3qVAoz/5+QGl9cEHk7oMIyv23CNPSa8ocmeqgCqKw9DAGkhgn4LZJpz6ENby7tLuhUzX4
	nhNXrVzMGBBcQSOWbhLEDhQkra/SGTgoBzarMBEi1fzsDkzDdEaA1F+sQu2wCph5zs6d6xB
	4vtgSdraQNI+oB7HC0heXTlnOWdetGfKjaTdkSJ+FWvTHIQPdd5KnwzYhpWFX1QRXgsYats
	h8bywgGre1aks4Pya2pWDKeJ+r8CV1O8mfVh1X0ZUhH8lBCAfFhpCxEjyWClEGe7FRJpzuh
	lRVG6vmqyJu8l5QKz3Tx/BAfRe9dUDPN8mggEILq3w4VIdSuRQz+3+x76SxHMdL3xvDV9uu
	mzd6aOiSgMhu7sEQtaqgGNfvTfdT5R3JLbVxJ3L07kzHtreKObfusuFqTSFJ7WKafEFHeXe
	kGTmTXx6W2z0rpxZIXQnlgTiRUTTnpDZDz8SBQEbJIqCq1CKUTsu2iBBLYjKWVdheq9EPuf
	m9KqrZ8gUbrv1XxmNlujbRqELUCQDK1TEtf2cVP+sfD72p/vsVNXcGGX21Y41O7GanwpT6R
	mHkQAKxSUvJUzGRWgECmfBzqKXHDeKSLUUh9dfJzJKyX74Hqhk66JyMtSt15L4Tmpdi2hmC
	+GFV6JK+lOfY1ZsacL2Pt6YIfEcke6IlhkJJ34isheh06xxc0WTInU48jRdAzGI/5E0Eqsm
	qIxUULVab5U1XrXshKACUatSqIA+wDO0WenEMpFg22CJAzm8+86Z2Pyl1YSND1rxJRFxsXG
	PGw6F/iXUfWl1isEGEQbT8=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_072055_443544_4E38E2AC 
X-CRM114-Status: GOOD (  12.73  )
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
Content-Type: multipart/mixed; boundary="===============4475984162747898457=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4475984162747898457==
Content-Type: multipart/signed;
 boundary=9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2026 at 01:01:30PM +0000, Yao Zi wrote:
> [...]
>
> > @@ -107,22 +107,27 @@ ccu_mix_calc_best_rate(struct clk_hw *hw, unsigne=
d long rate,
> >  	struct ccu_mix *mix =3D hw_to_ccu_mix(hw);
> >  	unsigned int parent_num =3D clk_hw_get_num_parents(hw);
> >  	struct ccu_div_config *div =3D &mix->div;
> > -	u32 div_max =3D 1 << div->width;
> >  	unsigned long best_rate =3D 0;
> > +	unsigned long best_delta =3D ULONG_MAX;
> > =20
> >  	for (int i =3D 0; i < parent_num; i++) {
> >  		struct clk_hw *parent =3D clk_hw_get_parent_by_index(hw, i);
> >  		unsigned long parent_rate;
> > +		u32 div_max =3D 1 << div->width;
>
> div_max should be invariant across iterations. Is there a reason moving
> it inside the loop?

It is invariant in this patch. Moving the declaration was preparation
for patch 3, which makes the limit depend on the parent being considered:

    u32 div_max =3D div->bypass & BIT(i) ? 1 : 1 << div->width;

K3 bypasses the divider for some parents, so those parents must only be
considered with a divisor of one.

I will keep the declaration outside the loop in patch 2 and move it
inside when introducing the bypass handling in patch 3. This does not
change the final code.

                                            - Troy

--9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqK8ig0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv5x4A/RFh51fufb9FcP636XKBGlniVIj2vsG1LHuvGbJC
puCPAQDyBV2iTGZVCeXgQSOrvUYtmMpWmDu+kDhEiAGV7O8ZCQ==
=jX00
-----END PGP SIGNATURE-----

--9670b8df4f3eb1168009e4f7bd72c141133c505de3412c738ef408f1deee--


--===============4475984162747898457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4475984162747898457==--

