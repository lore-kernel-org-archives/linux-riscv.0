Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1EEC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 15 May 2022 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2dR1nLbhMN5d0vY52jD/BLFodnyL+RdRGRb+NVtteI=; b=skL70/U4exlNKx
	PrixmlV4tD0OBjC7XL6GVrguWLWPLtP5gWjpA+dFJY92kgm2Hg2MIDuJz6U2maSmuekCbpiMLgor6
	BiykJydPGFL/+UISjA+TQtwBROGjwhkLy2jIBaaJ6Zd9kjtSN3nC32OzfgYvhNYQvXIqS0Isyq3cs
	LQXhOswB6D1JnkStHZ4Y43w/rNKmiDHVXZbfIcyZxJ9SFGjBIPYgPt6NQFi87aCIzEog2r8OtoddC
	yv8Jh9GzsMNtIU3UPxisXT/R54xFkmuSaS0n2KcdLGuOsXujPHqUw4jIiBreosCmyXTcgxPPh/NCR
	1jTgQe54LvjVNo6ZkVdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqKHE-004r0Y-2I; Sun, 15 May 2022 19:51:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqKHB-004r09-OS
 for linux-riscv@lists.infradead.org; Sun, 15 May 2022 19:51:38 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nqKH5-00065g-Ta; Sun, 15 May 2022 21:51:31 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 10/10] riscv: dts: icicle: sort nodes alphabetically
Date: Sun, 15 May 2022 21:51:31 +0200
Message-ID: <4406307.LvFx2qVVIh@diego>
In-Reply-To: <20220509142610.128590-11-conor.dooley@microchip.com>
References: <20220509142610.128590-1-conor.dooley@microchip.com>
 <20220509142610.128590-11-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_125137_842266_4A390097 
X-CRM114-Status: UNSURE (   9.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 9. Mai 2022, 16:26:11 CEST schrieb Conor Dooley:
> The icicle device tree is in a "random" order, so clean it up and sort
> its elements alphabetically to match the newly added PolarBerry dts.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
