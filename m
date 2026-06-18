Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F599CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8TCK1P4eqo0aF+j9qXp0VkCWJEu2zgQKg+Hust8l60=; b=dNUn9XtLf5T79gnYcRgNClTyyh
	5hsJKU0/tfAuV3vu+NAUa9MGdwcFKVerVuyKo4o/Ap1ohJOy/FXrgdBDKcJL+tlou7V7j4xyhJ/S0
	1TffUbm4jJAA3N/RAGSHjbjdWepM6c4360CFSIdpbN3Hztl8BLLFHsmOY4V1FQVbNwp7NF4LvoRrL
	rtRGzkuYC91q2uaAaZSjbBnsVwgppTFN3LU1TfvHeF43BBBq8ZILYKCTt0d4HEEjxNlr9Bd5jdCJo
	tuOD5qupGWybX5ivk36punI0YyP5JbtU6r0a53auJ9SvJ6sl2qdaOA7GC5+KL0iVd4Fge4AGsXnW7
	O9gnVyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFjw-00000001akn-0Nrb;
	Thu, 18 Jun 2026 16:37:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waFju-00000001akZ-3d7O
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 16:37:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4012443723;
	Thu, 18 Jun 2026 16:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90271F000E9;
	Thu, 18 Jun 2026 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781800634;
	bh=oajZpRtz0vnN8OojIIQbyoFX95fGy1vCqCja4AlWHUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAqjQOXjcwFJnK8pqaAAg/LX+UsndmvjZc7y9BbHoeGDX2eZslJoZYAfeDwHW+0Ia
	 UslfEKQGD6FTKk9bPUvQkpYaZozmVbpgDEoY8NYyFOyzcxzMhMdmrzSGDYJDUE3xsh
	 wnZ2bNA/ubucrG2G0kE9LNXKd1SlC/+X0woew/4/qm0hD90T+MAQQPZF4NjJiLSOND
	 RtYlzAj+Q0vwdzDK7IsqgoWIl4qEpBb/rSsriQEFBgEylCDSvbrCfOcveMk+wVw1wP
	 yErT6nBaP+Eulnfj2UpuAcK23f+Z0pGNP5eSx1Z2UYjRLXtumDBncYtX0EObsrx65o
	 PL0C/LzIyENIg==
Date: Thu, 18 Jun 2026 17:37:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu, apatel@ventanamicro.com, apopple@nvidia.com,
	atishp@rivosinc.com, baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com, conor+dt@kernel.org, debug@rivosinc.com,
	devicetree@vger.kernel.org, guodong@riscstar.com,
	hui.wang@canonical.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn, namcao@linutronix.de, nick.hu@sifive.com,
	palmer@dabbelt.com, pincheng.plct@isrc.iscas.ac.cn, pjw@kernel.org,
	qingwei.hu@bytedance.com, ritesh.list@gmail.com,
	rmclure@linux.ibm.com, robh@kernel.org, wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn, zong.li@sifive.com
Subject: Re: [PATCH v4 1/3] dt-bindings: riscv: describe Svadu as disabled at
 boot
Message-ID: <20260618-speech-whacking-852cd7142f3d@spud>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
 <20260618064406.14508-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20260618064406.14508-2-cuiyunhui@bytedance.com>
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
Content-Type: multipart/mixed; boundary="===============6994990357633461649=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6994990357633461649==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAAXcFZyWuXw/ru/"
Content-Disposition: inline


--QAAXcFZyWuXw/ru/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QAAXcFZyWuXw/ru/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajQesgAKCRB4tDGHoIJi
0rMwAQDhYQHwC9LRxR8M1J79bOJrhiCLaKNDrpaYF5AlboExiAD9G3JaxJCxfcVJ
BwGh/jevK0xl5noJFNI4xGP2pUHdkA4=
=e/WI
-----END PGP SIGNATURE-----

--QAAXcFZyWuXw/ru/--


--===============6994990357633461649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6994990357633461649==--

