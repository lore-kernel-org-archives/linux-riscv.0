Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49827C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/jFbfCAayRxKDkneEphjuBO1+a3QymzzO7MCDio40Q=; b=nrCcS+/ppBQ0f1
	V1qgIVg12wTiXHOeZyyv3HJRoLHJ/uikr94RwSI7m5z00s5n11FZjVr/5I8KJztOQgPRiueZRycoy
	faZ9ES//pCvMTxskCcpzDjplnnyp5jNrXIQ+Yw8wMLMyQnxYQlbiUGg6tLBDaoGnBL2mWSPsJb1JC
	wlVnfUL9nQhjCBLXITyoRZ3HAx/AkN8NUTL+sFCHZJt/8aJih0BKoSoVLv3N54toEdbOFsiNjLE9Z
	ISXyO1nY3eHfWa/p0g6xKXCc/JCGiB4VX6iwxQa8PIMrrpJ3ST4WlKosv/GId5gHpXj6XWzzmIPoQ
	KD1Isd5RCAh+lCEwp6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Esh-009LtG-03;
	Thu, 08 Jun 2023 12:36:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ese-009Lqw-0z;
	Thu, 08 Jun 2023 12:36:45 +0000
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q7EsV-0005ph-Mx; Thu, 08 Jun 2023 14:36:35 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Celeste Liu <coelacanthus@outlook.com>,
 Andrew Bresticker <abrestic@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v21 03/27] riscv: hwprobe: Add support for probing V in
 RISCV_HWPROBE_KEY_IMA_EXT_0
Date: Thu, 08 Jun 2023 14:36:34 +0200
Message-ID: <2012080.usQuhbGJ8B@diego>
In-Reply-To: <20230605110724.21391-4-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-4-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_053644_350144_8D3FB3E9 
X-CRM114-Status: UNSURE (   8.09  )
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

Am Montag, 5. Juni 2023, 13:07:00 CEST schrieb Andy Chiu:
> Probing kernel support for Vector extension is available now. This only
> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
