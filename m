Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E942FF510C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptGQySRAG14gI2A1B+ET4LyNsEazWTZyoHzTe//x0xc=; b=AlRGQ6tQHbVljWIiWXZOThwEXb
	waqxPBk2Z+/Th5XA+AoUFLqs7qo+6nJPmHK8nMMsOZbz+3OZ1phbVyXXkn0zmJ/1iTFudvEplDcCd
	wJXL07a/GUDvdp6L0I8D7t+wujP2+K42or3jq4UtDgA5bxZacpeYHv7v189DYDX4BesXgLGswK02O
	pLASAGGvPjPJCQ6jh8eS6KNSqJ7kzhahCPq4VXj45jL7bPu+n9xKYRu97hzxGjFpG4w6tqJMs/AhF
	jDgMQjA1XTeg5Uw1aRUgtMMAqOqo2wI13L/BEleXiWVr6psKkDGV3OLb+LeTETPxNCVKQezUx7Aow
	nnbgswWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8mm-00000006kPe-2r6Y;
	Tue, 07 Apr 2026 15:56:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8mm-00000006kPY-0FzX
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AC7A60123;
	Tue,  7 Apr 2026 15:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA43C116C6;
	Tue,  7 Apr 2026 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775577374;
	bh=kKVaSD68I82lrf7EdLaozoBbTRiXgOxzcIxlQDL2K7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pV8qL3ajZHsm2r5R4szem/dgFPmkoe7AJ3g1+duiZ+fe+ptJLVtyz43rhDX9KVXZz
	 fuHpW+vqsY7s3VfsONbRWyM+J7qxnZbNE4yi7jj+T0Hkgz5e1bbSth3lmlWnym0Ljx
	 S6bNdwgi2g+SvowNsf47knFhymCeff9k/PGP6q3T87SPmeiDCqobz/GB/yRFBM8g2K
	 cfdVQ6WMTEBalAe1K33Lkc3T6+Lwo9/lfet05DADZm1lPy9htz6Q/y9HBwmfVXjhH7
	 b/FqNA65lrFaM0bnwvz7WWs45qLfeT5UhTsI6LIejlyi1u2xwJ2jgtHTsIoVGL+TQL
	 PCfcqF7cY6naQ==
Date: Tue, 7 Apr 2026 16:56:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: interrupt-controller: Add StarFive
 JHB100 plic
Message-ID: <20260407-profanity-immovable-8831ce85c92c@spud>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
 <20260402084019.440708-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260402084019.440708-4-changhuang.liang@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Hal Feng <hal.feng@starfivetech.com>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============6464631964091676086=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6464631964091676086==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="217orH3naVFNgJh5"
Content-Disposition: inline


--217orH3naVFNgJh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--217orH3naVFNgJh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUpFwAKCRB4tDGHoIJi
0nbNAP4kJZeFXD2T2VobaPVjr05AVbsKND5OjDdmel49DW/IegD/akLREK7WuFJj
/VLoORSCc2fpVmR7BTd0U5IA6gXhhgg=
=h6oR
-----END PGP SIGNATURE-----

--217orH3naVFNgJh5--


--===============6464631964091676086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6464631964091676086==--

