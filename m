Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F48DC982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwsVdLEw9dwWanDxUZFwzyUhRiZiajIf2GzCLD3Q+ZM=; b=EiMGScfI6ETQXfs1CPDg7B02ji
	/m/ylV3s1h10SUusL8RYQoWr7IexbBBKS/JdfMohJk5KajYFLljmOl3muIggx7+ZneaDQltC7KMt4
	ezpLzVGA/XShDe/YYOZwWHlX28d8017YBVs7R3gN6/o66tOKzI4adDX1htlSgvTUoVVCwgHYvLrv0
	4y9GFfglKiEah3s9SPkBkxNjfv+J3VsBisLWXHNyZOSA8o3iy4r/7vQgZhT/ED0G+ks/phG0e4oUG
	c7P2Q6wgfMjVMZmy/heeCbzA4jvRvJ5xXa7bQmY8pVZLk60QxlMaPXhrnfoSN+lI83tWG+OfCYe1C
	2eZywFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wlK-00000004uhM-1L8d;
	Tue, 22 Sep 2026 09:26:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wlI-00000004ugl-2sNP
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:
	Content-Transfer-Encoding:To:From:Subject:Cc:Message-Id:Date:Content-Type:
	Mime-Version:Sender:Reply-To:Content-ID:Content-Description;
	bh=MqF3JT5Ag+/84VYxDV0JRl7knayiQkoPpeM2DvkLl/0=; b=X8i0TeYTu4DxztIZAhg2QpxMMg
	Y7lOpc7vdiyyfmm1D0B8V1ADopo5YIuEzaeAreoQwn5VyULGgZVhmKeRXq/2UP0TqfKnLEnO2V9f5
	jGUhk9tdJXMNSWnHip2dVEyFZkLi5pecAy/YEu7Ayt6y96dMWjWnNYjhoUzeLg7Fv+3Ab2wCurfb3
	IcDLC116+g5j2uE+YuUbuer/W6bDqBCr/PUF4dQ0KGis45lECvllrTAgMdIf15bm/IMIxJX3Qd8xq
	hMFQ7VwF9W2wOxN0ZAysJaWs4jZHOBMEIsjdNKuHeZsk0Xo6MX3h1DWMsKviCLioJIiKnqB6w4uLJ
	scBfRXqg==;
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wlB-0000000DMTi-4BqH
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 09:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790069116;
	bh=MqF3JT5Ag+/84VYxDV0JRl7knayiQkoPpeM2DvkLl/0=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=yF1dkCxcmEM+uf2mx/nkBm1nIE85t0VniLdhcXqvPs9NDNv6IUVQQfbvRMjhfwNUN
	 F77q4rNEuK/ApEUW8mUa75Vb9A7XSL2JW5tstv4gt4LFHlKsFBsEWESt/8nMgdnXCj
	 foRNl0ValeXXn1fnSYAwlAYsK+eexLPeRIc/XNuw=
X-QQ-mid: esmtpgz10t1790069108teb6a8f46
X-QQ-Originating-IP: X3aDg93GYWSWkmWKw2TeisR1sv3OIpjcWXfaT9hhycM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Sep 2026 17:25:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18293615287119513376
EX-QQ-RecipientCnt: 23
Mime-Version: 1.0
Date: Tue, 22 Sep 2026 17:25:03 +0800
Message-Id: <DLLQJDEA91FU.18Q1TSX09AUR3@linux.spacemit.com>
Cc: "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Aurelien Jarno"
 <aurelien@aurel32.net>, "Jennifer Berringer" <jberring@redhat.com>,
 <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v6 2/2] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Avri Altman" <avri.altman@sandisk.com>, "Bart Van Assche"
 <bvanassche@acm.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc2
References: <20260921-08-k3-ufs-support-v6-0-3479768a2299@kernel.org>
 <20260921-08-k3-ufs-support-v6-2-3479768a2299@kernel.org>
In-Reply-To: <20260921-08-k3-ufs-support-v6-2-3479768a2299@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NuVTqMOgygVl/uH81H+rVPO7vXO6xh+Apb8/ViQcPw/mkBtiIQd1SNCZ
	gV3uU/ypbb3edu1s3/5peU+5QsbkRZSYtwyiDwn2QiVchGqQAlTRHehuD7yYQXIVYp/Kl3z
	Mrx8SWZZrAi+qQcuPbtg05BeprJtJWKt7HDcS930sdhtvcd674pkWpJxZ5jS89kdQPT/gSt
	KGZX4yP6hXPSR+nxCUegByxf07SZkBQECclubyM4JEYJmecQ20LrAVqcLPU+FkQ1P7HAU4d
	/IKT2vLybwwSPswWamH7eSdFVve9cquIiH27jD/Cq8Y3e2+gAwnsnYw9Ru3BT+gYh62fYwt
	XDXGx/C+FsD1smTdKKY+wYV8VJunhxLlvV5nzoAQp9zcUSrj1Q/oPbU9iNo4lmkJ0s9CzGC
	C9NBCy3EBdwMjumbKLCTYsyEJKFTQf4T9/23IvVz2yTksf9pTTNr+WLiZ698kdtzCTDibde
	+Q4jhX5vmvq2KsEk85aclslrCw2Kack4j1PJt55AKGOkwlMvD9P5KusBkLmQ5u35zIZxaRr
	R286ODEl3voJxA8nLZww4i5klTy8YumkZzdyQCpvwaKBxaEepBWqB4Bag6QjYfCQn4lrNgi
	luB3MeeMu9WMYRWePBOTBHgBO7WbzImIzqwE1/OQF7NmDQah/vLan1AyKx6i//2zCICyW25
	DoSNhzFkn3L//u+Bo26s/+DnKRkJcqzftSgpVVw2MfskUEJEWA1F1Nr9edfUzUZrZppJR5Z
	X6d01RPjVFrXcmGjNcoF2EwUtqDsSKo4qxE2bWSLRqJIgtKyDQnn6xN7KsyU6sAgkyObfuC
	9bLgdxJiI+nWdVV/aPbmQefURgBW/RPFEVI8TkCwRTHrwnNDH92oG2Vq97JKpF0mGs56aHu
	sVjiAUetKomJ7zf4EE9p80UxPu+zaDfT7W5qgdu1NhhlHFBQJ95udvvj9hZvQQYqJpJ9cRP
	V6TqR4CyJ0kYq7+242PxoSeCcoMZxMykjlyhG/QYTpLhvlr88vinCoCp6F94HVFHep4fZ7H
	uDkTJycLl+t0hYRIGjg8RHO70iBiNIcmiij0H+JDAMQFdMYQxPthEzgDzju3ddZuwr4VAq4
	5hhOSoqTN0HXJVdzpAF9tCeMd+08jwwuQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_102600_047430_7B4EA378 
X-CRM114-Status: GOOD (  10.13  )
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
Content-Type: multipart/mixed; boundary="===============0021484925369850986=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0021484925369850986==
Content-Type: multipart/signed;
 boundary=c50080b08dfc874b0cb25ecf11d489b0d1e616c2128732cb9c89443b278c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--c50080b08dfc874b0cb25ecf11d489b0d1e616c2128732cb9c89443b278c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 21, 2026 at 8:36 PM +08, Yixun Lan wrote:
> [...]
>
> +static int ufs_spacemit_link_startup_pre_change(struct ufs_hba *hba)
> +{
> +	u32 value, sys1clk_1us;
> +	int err;
> +
> +	err =3D ufs_spacemit_mphy_init(hba);
> +	if (err < 0)
> +		return err;
> +
> +	err =3D ufs_spacemit_uniprov1p6_init(hba);
> +	if (err < 0)
> +		return err;
> +

Should this be `if (err)`? The call chain is:

  ufs_spacemit_uniprov1p6_init()
    -> ufs_spacemit_dme_set()
      -> ufshcd_dme_set()
        -> ufshcd_dme_set_attr()

ufshcd_dme_set_attr() returns 0 on success and non-zero on failure,
including positive UIC error codes. The current check misses those.

Also, ufshcd_link_startup() ignores the PRE_CHANGE return value in this
series' base, so returning an error here alone will not abort startup.

> [...]
>
> +static int ufs_spacemit_apply_dev_quirks(struct ufs_hba *hba)
> +{
> [...]
> +	err =3D ufs_spacemit_dme_set(hba, setup_attrs, ARRAY_SIZE(setup_attrs))=
;
> +	if (err < 0)
> +		return err;
The same `if (err)` check is needed here for positive DME errors.

> +
> +	return ufs_spacemit_wait_mphy_pll_lock(hba);
> +}
> +
> [...]
>
> +static int ufs_spacemit_init(struct ufs_hba *hba)
> +{
> [...]
> +	hba->caps |=3D UFSHCD_CAP_RPM_AUTOSUSPEND;
> +
> +	return 0;
> +}
> +

--=20
Troy Mitchell

--c50080b08dfc874b0cb25ecf11d489b0d1e616c2128732cb9c89443b278c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarJJbw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvJ1gA/22uBA65WxxSQ+7npmcBkm5HKq8LkzpjDIOXS2jr
brfJAQCOnLcMv4qGA1z+Oh4psRDSDEz61/5c2j+bZNBXkVZIDw==
=l/Ay
-----END PGP SIGNATURE-----

--c50080b08dfc874b0cb25ecf11d489b0d1e616c2128732cb9c89443b278c--


--===============0021484925369850986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0021484925369850986==--

