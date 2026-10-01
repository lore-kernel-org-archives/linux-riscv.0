Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DECA5FCE
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 19:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xzm8Ek3BBaHfJAj/vaAklDlE7oA5r7UP/r66hMkRIiI=; b=0phbNyVDMj8bwWvT80d+mPS0LV
	THYlkOOtBc9sc50gIgNFuR6QAygwfAUwvX8rrs2hg8WmFoTElrFPqVlWj5m1GVyPltWHoBV2ix0pi
	Tlq4I6n7vY2iXar5wJ4RHg2BHUV4lrJIM+4meRYayRWRXJVu7Uv2u0bWBbspvPWcz/oxbNN/zp49L
	vC7ApaU89eKAh//l6c+ft5GSxnBnpUviW1HDqYxid+lSreepJNoo7/SvziqlHFp0p9UBTG6F4WIlM
	d7hcaNB99nbs9nYNiyDn+Mr8E6V78vOH8PAUaLTedy/4UUFiNv1d8QMENDyQEdBXQUaSmtNrTivpi
	+e7L4BDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCM5v-0000000A3dt-28Xs;
	Thu, 01 Oct 2026 19:05:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCM5t-0000000A3dm-3SgY
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 19:05:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48FE9416F2;
	Thu,  1 Oct 2026 19:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED311F000FF;
	Thu,  1 Oct 2026 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790881525;
	bh=ULCZAzF92W8cEvDNkN3v/J39kTcuPaGZ1ayWcAVrL3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fNG08HIzd0qOlvTEdrlqYniMi9MIpteftz45mB3SZCFivt8xql9vG1H9buYgyYJg5
	 UrhCoiCMnFIFF8PHMz8XPJHxKI61rUiIFSAMBmllmPj98EPMnKjdGCQjwI+gdD0Gxz
	 bxcjB82PIty0Y1hP+esfph7qtC2FV+bW55/ULvcem9AOtgZgend9DFn44ZnRbTOqNh
	 hsDloVizJxP1HYWKfnZHwa18ZRAj7p5QzxE5dwIBeb4+xNVhr4TtTPv1g6PGy9CFbq
	 qE24Eu7/nt11ZrPjJY0iYOvy9+cZHiwWbNSprldoXF/sRZc9zyv84XGDTHqr2VB7Y/
	 fUJ2vSVMk2d2g==
Date: Thu, 1 Oct 2026 20:05:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <20261001-lunchbox-armadillo-e0bd59798ec7@spud>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
 <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============7026180314425458774=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7026180314425458774==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jvPau8PB/4zi0Dsp"
Content-Disposition: inline

--jvPau8PB/4zi0Dsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jvPau8PB/4zi0Dsp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar6u8AAKCRB4tDGHoIJi
0l40AP93RodilJvAshZjnXeYrB6Og2MzSO222vPE0Q+9zK/+uQEAt/wiz75UQUMN
Isxpxgc63CkaXiIZxfCyoqkNiZ0+/gE=
=gxed
-----END PGP SIGNATURE-----

--jvPau8PB/4zi0Dsp--


--===============7026180314425458774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7026180314425458774==--

