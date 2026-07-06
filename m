Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E93C43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qp9Spmzcz2uN4YpApE6EzoNt4zLkZJT9/LxPDy36/c=; b=sZdTtJqqw1kkFtBzGcQVBsqyx0
	H9GkymfGlqF+LUiTW6u96RvmgJ09+ApZZwWH5aGP1asonZ83YGS+5R8t6Gbl9DpcpT+75CzJWlNjv
	q+hVT7iS9kHRyxMbjhSgI171qhkWblcQ+Wc0XqtSn1g3aRnw6eMmQ59zc2NZQTRy5TYTEyJUkrnPA
	SVcuRL6uBICX3rxWDi9enNj/OvcCEM3v3jBqCiiLFDo9zf3sYrzWbMU6qPpSxDCphf9zPToYxwTrH
	4Mp1gEfvOkkhkj+JIpe9XX31WHgk3nB+2MhnOEXYABufCY9OdM5Jfl3KUBwh5xjgC2bDydrmK+SCa
	TaU7dgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmfj-0000000D8r7-1UOA;
	Mon, 06 Jul 2026 16:59:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmfi-0000000D8q8-04PA
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 16:59:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58F7D60098;
	Mon,  6 Jul 2026 16:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2071F000E9;
	Mon,  6 Jul 2026 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357193;
	bh=yCvrY1Qlzegussb8UyfbT2bAtd1gtr2pkvURLSHLCjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=isNEjTTR8a167Vcf7bhOm0cEoDaqZkP/TY4jerlztUHGg0IIFOX1DbHCCUiniN5ov
	 rZ7pXqfRT9DCsyvoiHNTczdG3MnQxTlBaf+MvSMit3x/xq0MKCDqxjojVvhholAOSn
	 BHSbX05rpn5HAjjOq0vTfPWQ0l3CE2pvsYu4Wv5bbHNiwzBXzs0dzwiwoENkh1ZluV
	 zCKWdrcf9q5FzQygCROw8TarLZpYd7wfvJKIm0BoQp39utWYkSVJz5u2Z/GhwhHoiy
	 mETCrnauAY7LprWptjWPd33HAk8f81O5luPxUSEqI++xcr6KZLFcW1iOxSYVVYNcM5
	 W1tK1lx3/oK8g==
Date: Mon, 6 Jul 2026 17:59:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: i2c: dw: add ESWIN EIC7700 SoC I2C
 controller
Message-ID: <20260706-shelving-dominion-2e2bfdd1dcbb@spud>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-7-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20260706081055.1126275-7-pinkesh.vaghela@einfochips.com>
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
Content-Type: multipart/mixed; boundary="===============0526417618922382248=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0526417618922382248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l9ox9MgWlzK4N9Ub"
Content-Disposition: inline

--l9ox9MgWlzK4N9Ub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l9ox9MgWlzK4N9Ub
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakvfAwAKCRB4tDGHoIJi
0tKRAQCDQ+rJRscgm58ML3Ivf1nzA/E7knQkY0nZL1PKbQIGIgD/QJ74B3qqakGq
bNq9+rE9wRWp+lBkYr5TW8Att9nN2gk=
=n4AJ
-----END PGP SIGNATURE-----

--l9ox9MgWlzK4N9Ub--


--===============0526417618922382248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0526417618922382248==--

