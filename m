Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA034FF510D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtQqZVGIVjXdpTwql2la3O0SARIbbbftNlHCqs12ra8=; b=VcaYQwqMxSSgdXh0ibMRYMlxnv
	X6QnLcpZq/qqjf3d6Z+QXbjui2MjivQPaZl37DRVY0laY8mJ87WFuEpPY1/J7wIOsVUU5Co4oH01K
	/KhqaOpkL11JLrdCuqMp9o6RK+kciILLdq9hRVgF0PMSkaSj1TXL9792A71xeaIqonRbMDRTgglkn
	3Tm84+/75l1xHnuYID6/IrG2GMbha/FwNlf4BoS9erCIpVvvYY9veXEjCFTzOoNHx8veWUyW59soN
	DTeynx6VPs8zzAVOkOEZnYZIjUIxG4o6AZcuy/+WSHWAdGsyy2gf4UYTvrmjVFkwE1QBHkLZ0Ddqg
	2lS/h6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8nD-00000006kSJ-4AKT;
	Tue, 07 Apr 2026 15:56:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8nD-00000006kS7-0K6M
	for linux-riscv@bombadil.infradead.org;
	Tue, 07 Apr 2026 15:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NBginxjQpY5zWOywW16W8I3akeH678SWQxBFKW44t3c=; b=n0lO5r8RRW17DVcaIUjHbZ8s3f
	CksFKWMHBuLbnNqwqM50qNeq6flIJe2/fKOZ4XFl8AY/SlShdtIf5G+sc698cb9zkzuVgJZWYJVrJ
	wHPf//y66NLIt6FKLrM6AZNX1PbX7sdoH4aJXRHJ5pT4HytSm2u4X/a5d66mBD+dcxyvqFI9D0Idn
	s4pIx3VmsJK/G44zPqlnA4BinqphFU8AWoSJ8DQmZzc8jNn55fuwedD4GQF+FZVu06oVhH+ZwvTm/
	qcsQhMsQWTnQyT9GziwpIPKYWm9H11V1MYD5XGIWPjzKaDLd9uhIlZ66H563JNpYQvtaez/LEX7Pb
	TTMq3QTg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8nA-00000008dph-0igF
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:56:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AC3241A58;
	Tue,  7 Apr 2026 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D9BC19424;
	Tue,  7 Apr 2026 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775577395;
	bh=NBginxjQpY5zWOywW16W8I3akeH678SWQxBFKW44t3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVkXUa4U7lFt4zeLG3ANfF+w3gur4pb/yogIEiFjeCCYD4dVmrzEmxAsGaTFZ3JGk
	 NajRXyoRi7hjdayzjgDqGoRmkFKSQJ4EOXCBTLnuxwLJDxEC+f5ZRqXGh9g3JvRAGW
	 42hex1F7Ts6HELPCISe8aSGBwNUa7/MDQ1uURSGydjfhBj9wqyVZ45i0fndeQ7XhJr
	 X0kN+1LgsEe3uEbK6jMkFPt2IBHLK6cnOIqZu6zpbCN/hSVYaPlKLv6i9RcZ1+UvQz
	 OssDQ38gZ48R4Mna3hmpT19yQl3AUb2xAfQm1s36eXaWckHPKwcpPO8T9+n7Xa3acI
	 bm2cmKSKYZhxA==
Date: Tue, 7 Apr 2026 16:56:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 2/5] dt-bindings: timer: Add StarFive JHB100 clint
Message-ID: <20260407-unedited-overlying-f6df47c67bb8@spud>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
 <20260402084019.440708-3-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260402084019.440708-3-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_165640_462411_71E365F1 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Hal Feng <hal.feng@starfivetech.com>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============7495698541865110605=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7495698541865110605==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kMoR5+08vDaynfqs"
Content-Disposition: inline


--kMoR5+08vDaynfqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kMoR5+08vDaynfqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUpKwAKCRB4tDGHoIJi
0nkCAQCF1trie0lGSrIHLjvIGC6J38e4uQb8ehDoLXToq1bzJwEAjZoHqYGxCsJY
AVcNOOcsfu2v3Yn73Lqb3GBFrPULrQs=
=q91Z
-----END PGP SIGNATURE-----

--kMoR5+08vDaynfqs--


--===============7495698541865110605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7495698541865110605==--

