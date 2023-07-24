Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74453C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7exLxeoj3syWnLKsObOFZupkJNo7q1GXSQ3nX888efM=; b=wO4bt8Y63SE0qivqsES9V4ORw1
	Jwwg00wF9uDGCwLdHzP2L/Bj8+dHUC+KBz3LjyfsmLtk1Tm3dpCt7r+yoiMr6SZAZxiGUX5WX3Xi/
	Ig4peEu4MMF5uTW8AoSfJpOI+pyuwApvYud+gRIts7hZnC+sTfIr7HgVO4cUAPY5hN3DSFszx+6vv
	ICUZYRmcJPesYHKaU0GylyybGNp91/uvyonvNMcwmZMitTKQlm3P9CgS/QVUcHs++IxXTqHgPxhL+
	f40CXAzwuPFao9BI52NXvFP/LFAdkUKJWCvYLwy0bvR+bIKSYWuvOTZbqciyM2VBmA9U6tCH+Wk3j
	oVz7XW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqHV-0038Bu-1l;
	Mon, 24 Jul 2023 07:47:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqHT-0038BP-1l
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 07:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690184819; x=1721720819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WzzWzxRZEWi4NlHzgReqT/THYQBX4Y5rgyq6qdtTy3M=;
  b=0wlUqKrHBO4OvqMCSSpmz1gc+ptk61Kk2EU8Gg+VISA5KbOAVuMbiRJ1
   iAyJ65qF/L6mnmtRSa11sZN5z+D1GTQayJvO7vIakn1DdkIYCtYeggLu8
   AnKE5KkJWUAn5LkUzuDJgNMUde4hIRf4DhD0Nv8KVDQMvJGrI3LwY1ZZ2
   D5JVbVtpjX7KI+iQPxbfckB1uL3qTmWVdjczoinlbkShMzh66NtJ3A7cB
   Q4q3vgpDcVanVc/8EOB6hQWPHI725DrJhQZ4VcOSKbm0yOUcR1dqOn105
   /BODuTld8XH9S+EG02p8DiQ2qwsED+15TF/tdhplDb4evIZb9x9RROoqx
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="224719718"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 00:46:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 00:46:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 00:46:56 -0700
Date: Mon, 24 Jul 2023 08:46:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yuan Tan <tanyuan@tinylab.org>
CC: <palmer@dabbelt.com>, <vincent.chen@sifive.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<falcon@tinylab.org>
Subject: Re: [PATCH] riscv: alternatives: fix a typo in comment
Message-ID: <20230724-stegosaur-outtakes-0ea4ff740080@wendy>
References: <20230723165155.4896-1-tanyuan@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230723165155.4896-1-tanyuan@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_004659_591790_D07F31BC 
X-CRM114-Status: UNSURE (   7.02  )
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
Content-Type: multipart/mixed; boundary="===============3775192202686785274=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3775192202686785274==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IsUXUH9IpPy2edZ3"
Content-Disposition: inline

--IsUXUH9IpPy2edZ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 12:51:55AM +0800, Yuan Tan wrote:
> In the usage of ALTERNATIVE, "always" is misspelled as "alwyas".
>=20
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--IsUXUH9IpPy2edZ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL4sTgAKCRB4tDGHoIJi
0kgRAP4q71Pyz7QgJzZHSva3JyBY/cP8KT+YthQI9nYwQdnHYQD9HLanh7VBwu5R
nXz3sjGRiJ508KlDmgmMthP3mIsBVQs=
=XsAI
-----END PGP SIGNATURE-----

--IsUXUH9IpPy2edZ3--


--===============3775192202686785274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3775192202686785274==--

