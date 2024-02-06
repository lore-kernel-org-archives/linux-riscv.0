Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3F8C4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLN2IJzp0c1/bnXSxWXRjK6sGEnD7ThvoLci0c5adxc=; b=1eUqYKL1oQiK0rAWIRUBzZQ5Dg
	DLBgAu+2hiJGRbZFBVft4tEnzJBMKC3qAoeG3puOX/GBOTZUibFylZewfW0VxJ4BqG4PPg5DII59u
	95LQL3DTGIGmzKa4p0kf+SunvQslm6fSTbeIJYaQoH+wQX2tosQzN6GE/i7yIMtwkylLRFWDd5woo
	DFKG+3jYVmPmOJdl8W5ynZchmMD4fBVJ+Y7tGbo+Evfph1mYrpia1i1WnIyDu9pLaVRkAlJKOaNiR
	hb2VlIx1nU7NMNyAfmuTlxrdNjSiVDjefdj8ltcdobgIVySXBJswkawSQGd6Z0KbYw1YwCd10uNqT
	GCqvyJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXR4J-00000008gB8-46kf;
	Tue, 06 Feb 2024 19:25:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXR4H-00000008gAj-2IUp
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 19:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEFF8616BA;
	Tue,  6 Feb 2024 19:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CC5C433C7;
	Tue,  6 Feb 2024 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707247516;
	bh=Mu4K6W1Ehm84eYP2IsyclOUmQOj8IiBKVmzjXqzzQ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dryfk4hBPCkoHPTRg3bOk3W70RS8MbpKC1iEwwOvNetBlzd81NKnbDWZByUZFt2Kk
	 xCSY4+QuwurPs60t78WctLqClMcT0WqgN6MJPDJfbJy1nAJK9PFB/u7g7YevXeeU66
	 Oz82bqacMGrjQs8YoAnZOObRKuVMnFFiVKgVScvClx1Pw0ABQK1kJOJyv5ns+hYGi3
	 507LPYJs7O1l3UavO+3NG68bZOMB6bK5eOaZm+YUpAR6OyCJ4Bb3IRY0Y74lRxGcok
	 YjMjV232u0P1L1iEJZbNwCaEIjMnf+OpXmQ+lagpDKh2GgI6jvA39b2/UhJQxkO8qI
	 ro6dKcSZh907Q==
Date: Tue, 6 Feb 2024 19:25:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
Message-ID: <20240206-cornball-blighted-e40a9cc059cf@spud>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_112517_650478_34880189 
X-CRM114-Status: GOOD (  10.42  )
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
Content-Type: multipart/mixed; boundary="===============5481332165172766285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5481332165172766285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9SR2866Q2kC1oVMZ"
Content-Disposition: inline


--9SR2866Q2kC1oVMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 03, 2024 at 02:28:37PM +0100, Emil Renner Berthing wrote:
> This adds a pin control driver for the T-Head TH1520 RISC-V SoC used on
> the Lichee Pi 4A and BeagleV Ahead boards and updates the device trees
> to make use of it.

I'm gonna mark the bits of this that apply to me as "superseded", albeit
somewhat preemptive, since you'll need to resubmit the bindings patch.

Cheers,
Conor.

--9SR2866Q2kC1oVMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcKHlwAKCRB4tDGHoIJi
0jngAQC/9KRmKdjlujY+RbvfKLmq782PlybcZHEB0rVLPFyb/wEA7SN2iJajXSPV
T3vr7u9GNYAvcAHAcDhp3/esony+yQ0=
=3Hcg
-----END PGP SIGNATURE-----

--9SR2866Q2kC1oVMZ--


--===============5481332165172766285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5481332165172766285==--

