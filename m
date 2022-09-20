Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92997C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 21:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzH4njz1j5/d7yKAOzuLUc4cyacUGN9DgKnjhaLC7fw=; b=aUSlDzHiKgSVMU
	kck2sF42s9MPoiHuBqJYcY3Nd8946lyRTnAuSAbcDRYdi5w+ocadXHt7tQHREQiT5UpnNCp3FcYTU
	uK1i/NIwG2BJeAQrPgRVXlcNpq4HCtMFFheL60IbMEyhVkPCFG+0tbWV0tkxH9ZsTpX01cFXpi1kZ
	49oVO7Uo2E7dloRS038EsLEJ+7DmoRjP4tBxdKaj13t65SBBLiCAEfZli1joj6sbNVRiWwjCLdRaD
	4YDvld91CMDnaCCUCFMRcqcvkNikZrBCY8QJ8sJ+M+IjkWXClGxLn7HXo09oq93so73Ywy3prMxSa
	HOZbDY9u6IEAdvRcfK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakVy-006etw-Ib; Tue, 20 Sep 2022 21:10:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakVs-006eko-S1
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 21:10:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A08862DE4;
	Tue, 20 Sep 2022 21:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2BBC433D6;
	Tue, 20 Sep 2022 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663708237;
	bh=z6WUEQNYA+xcjFnfjJj5+YD85z46eUMoe3zhy3oMjac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=War/wuH6pmHKZbfFqZaZmGvi22WMrZXc0KzzKsVMGCrXgmdOW3vFx1OWwP9zwhi47
	 9Z4+vIp0R0uSscynuVcKZYt+QQpU1+OHt2F2n0gbSwtGyEiXZWbftJ0ipsLYvKaBsJ
	 DVEGg+e6PQ7IhI7nPCpoAVlwi7Rc93PKpnZBOiJw6vj9JFH6/19yyvHoOYu1aPsvWK
	 ZABIWJeyZRwszmU6lwg05+fM0XqO8ZeXEigyytutQH5jhP5DhVmXD06OtYKI2ZXwqn
	 WiNp6KzTr7UC7lL4ilRYbP4D44Mz0MsmMtpBCOQQu79Hg1KSVXassSSKQjeh8LQxWH
	 kEMMfNZuLEJwA==
Date: Tue, 20 Sep 2022 22:10:31 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 05/10] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig
 option
Message-ID: <YyosR4jNFeY/YRaU@spud>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220920184904.90495-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YyoOv9Jx+h0JzfX0@spud>
 <CA+V-a8s8Nr-RUabiLA5PhHLVQQxsBPpjX_7f7ANZoGGFfOGJVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8s8Nr-RUabiLA5PhHLVQQxsBPpjX_7f7ANZoGGFfOGJVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_141041_059468_60520EB0 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 20, 2022 at 10:04:06PM +0100, Lad, Prabhakar wrote:
> To clarify, shall I add ARCH_RENESAS to the beginning of the file or
> after the SOC_MICROCHIP_POLARFIRE config?
> 
> As rest of the configs start with SOC and for Renesas it starts with
> ARCH, so to avoid another re-spin hence this query.

I'd say sort it based on Renesas so that everything else can be swapped
over in place. I don't care that much to be honest, was just an "if
you're already respinning" kind of thing.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
