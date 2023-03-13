Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442EDC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 20:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ons7dcPlngOt+lwUs66wVHR2Sr6faRo7iEKiZqa9Gec=; b=1YB6UszzE9RebqLlBRdE6+hkAX
	cDHaNpt9dkwEeJzBQTbN5UcX3L24YYWodB9QUuWGRvwlk8m1fqmeWvCknaDAun9ZZJLmKzo26mg+J
	dlyRzfHmioVhX0AsjDofCE5i495KyVZkETTjd+7Ld/ONtRojpE+XiVDHDYxlqZ+y4R59mQ6VBqXV2
	G4CyBSL6lC5709JVxFOpP1avf3fk0+aV3UL7WSchtEy4JO6NJW0pO10unUo16wHygeJeLouiMhs81
	8M53n6b+20Ps7pFS8fL5K6Ybj9Gzk48z/00YyXlK1uHYQJwLhcHv1zXgmX8x00+tUeGonLvpz4sNc
	+JolYTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbofZ-007fug-IW; Mon, 13 Mar 2023 20:21:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbofW-007fsh-5Y
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 20:21:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8216C614B6;
	Mon, 13 Mar 2023 20:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A95BC433EF;
	Mon, 13 Mar 2023 20:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678738876;
	bh=w2c/7n/ZoAl+p0Uo7jveovPwHe4Aq5dpA5N/WHL1AUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXC82vRkaVviiDEHK5QmlkvLY39qBwpBMBm0xhASGgVyCBluwlUxNFANYUH3UqmkU
	 XJbolWZDaqwECABdRaM+LnJZVs7Uryd+XiqpzytGLXjHvmrBeQRPaYwWGGZy9gX1GB
	 /u7H2QxfcbUXbqT3k29BVRvQtxlz3BNR1Al2voddkVt7FUCukTjEOM5b3vxXIb0Jyk
	 2OvUQWJNGiSSpT9h7/ke8jG32R7l0yLUN7WzKAJg7ELXSz9oFpQE3GoDnUgoWygMTB
	 pWB4QoxCaYGhQFexw3KrG08LRvJSAcpeQQp1DEpDuAmaPeQ+CGCi6bL/VByf75ID63
	 /BXcvvWOQSC/A==
Date: Mon, 13 Mar 2023 20:21:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Paran Lee <p4ranlee@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] perf tools riscv: Add support for riscv
 lookup_binutils_path
Message-ID: <c47e371a-ea90-41f2-81e1-8e09f7524c42@spud>
References: <20230311112122.28894-1-p4ranlee@gmail.com>
 <CAP-5=fWkAqX+Uy_XhXHjEx6sj-wpOJ+WQf=vMtRzRBS-0Kj32Q@mail.gmail.com>
 <09d44d74-f3c9-cf99-8d14-74499485e956@gmail.com>
 <CAP-5=fUqLdCD_Ks2WQxjyRoNO53PxzDv_P7GJuY320+gKF=vEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP-5=fUqLdCD_Ks2WQxjyRoNO53PxzDv_P7GJuY320+gKF=vEw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_132118_288413_A742AF8C 
X-CRM114-Status: UNSURE (   9.24  )
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
Content-Type: multipart/mixed; boundary="===============6109346496519963716=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6109346496519963716==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iGjqrgvJjsqzLcOI"
Content-Disposition: inline


--iGjqrgvJjsqzLcOI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 13, 2023 at 09:27:35AM -0700, Ian Rogers wrote:

> Wrt the patch, could you reply to Conor's response.

Apologies if I asked something silly, I've been ill and kinda out of it,
just noticed it as I tried to keep up with mail and was curious...

--iGjqrgvJjsqzLcOI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZA+FuAAKCRB4tDGHoIJi
0v2DAPwNPwOTfYPSnx7Lb8DJXWaULL6Gd4dGKFzc/FHRMu995gEAoC/kPFb+do9W
xTAs/uTGGEdCihXSG+5nD0dXjIWJmgQ=
=eC1+
-----END PGP SIGNATURE-----

--iGjqrgvJjsqzLcOI--


--===============6109346496519963716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6109346496519963716==--

