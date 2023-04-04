Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D4FC761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBlrwR+pf2us5jGEI6gOSWxPhdARC1DYDsbErs9p/i0=; b=CRZxFjsgz9s1RCmdJdirXSavgX
	ZlH8PSIlXskzumH/6WmIEeoeW8hfbPjX2/3Z3jL+yc8aab2YJ6F9iW3uoJOK8f6TJJ3GV8bd0ruzI
	ui54uspJr1pLxzl1t+8HYBKTim8JJH5UhXl4WclLorWuOxnIKMwwZWtM5s16Ln7k58JgfNJi0NTzu
	gKaVCCWzrRy1CdsmmZ6NyMsSMUxN2S5RB+MLYkl9hrFStWIxk2+EnGlsizEufPV+OSszcYW3pSvx+
	L4b6Y4d9jP31PFeUuwsfm0uOw9p6+8L5ubW+fZ/4HJkSIhiBQ2ZONUmWGfZqirAaXFAxbQb6vmkzF
	/rXtIeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjny-002GHJ-2N;
	Tue, 04 Apr 2023 16:46:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjnw-002GGm-05;
	Tue, 04 Apr 2023 16:46:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54804636FF;
	Tue,  4 Apr 2023 16:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A65CC433EF;
	Tue,  4 Apr 2023 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680626802;
	bh=EOynIrMe4icDg+MA2Rcia/HiUrf33I33TA7StNPiBIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcMQoxexEFGKw823dUQ0DXje5S8P4gWt/XM+l1CwqRBWpU/+PfsrdEIXJUj3oKaAX
	 xJXVvlfESDScv2bwz+tmUg92jDon22E204DzabM7ZOk+7MoMVI3C4fZqAZpB4gzGu/
	 a6RbTXgzRmIFvMzLhDWkkzEDXqHW5ezdTj4x1xQ5vZBzdcULzR20GmvG+poIBROMjJ
	 fznTMFVJMQtM9S9Z0NWbA+86yUYQ3lYsixpySxWdk/AhqD9z+h+4fFCSo/WF3BNev3
	 fsz11Wnc8X0orn7Pe8XVmgdM0lburhJTjmAtSKl2LEcF+nG6AL1TzvcvofAUiz1SQP
	 N2iua/noEMuoQ==
Date: Tue, 4 Apr 2023 17:46:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 2/9] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <20230404-facecloth-curdle-f2d5d46e1375@spud>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-3-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230404153452.2405681-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_094644_126308_2F8E477F 
X-CRM114-Status: UNSURE (   7.87  )
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
Content-Type: multipart/mixed; boundary="===============3018173613309669492=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3018173613309669492==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y+UmWbrC7kSZZPyg"
Content-Disposition: inline


--Y+UmWbrC7kSZZPyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for fixing up the order Anup.

--Y+UmWbrC7kSZZPyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCxUWgAKCRB4tDGHoIJi
0lq2AP9V7qRL9e4htc1SIvwLo8GdgdrsRvqOb05PBMTv8maS1wEApsDgm01rwMwv
g3teQBkWZLDsAZADrY9kH1KQi72E/AM=
=wrvU
-----END PGP SIGNATURE-----

--Y+UmWbrC7kSZZPyg--


--===============3018173613309669492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3018173613309669492==--

