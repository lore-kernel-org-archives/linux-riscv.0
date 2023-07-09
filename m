Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396C8EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/XwrVRj9kV9/TLmJKpSUSMY5bgfgutecTs/ARTVvPc=; b=XzjnvjXlo302s3
	/HHyNGZNCvGwO1nsyqypnRcv8Zcuq9n/HzzmbaLv2T+p4oyq79snVoCOlRqs4BH7YDQ3yYqJGQG3J
	K7RB7H5dEvxIAQBo41no096JoFqOfGc8KekFQCiIh59lK0VZiXN5aYdi57T5Aq7fm4k+CylFS/Oep
	zlu+aIQFhpvadVo8oRDeMxhLThE5T7O0YWkLjialJmDNdWC9wGP7Ax74o3AasfWXLW1EFebhkTT1h
	WZcvVm/j6CYH5PyE9nvSBJJZqqcIVQCviaB5L/NK+8bv69JjPOyGdl4qy12gtPry93VHzBzniefJ2
	8ldeEngrtK8rxW9mn2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qISdw-0091lT-1U;
	Sun, 09 Jul 2023 11:31:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qISdu-0091ks-0t
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 11:31:55 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko.stuebner@vrull.eu>)
	id 1qISds-00021M-E1; Sun, 09 Jul 2023 13:31:52 +0200
From: Heiko Stuebner <heiko.stuebner@vrull.eu>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Samuel Ortiz <sameo@rivosinc.com>, linux@rivosinc.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
 linux-kernel@vger.kernel.org, "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 2/3] RISC-V: hwprobe: Expose Zbc and the scalar crypto
 extensions
Date: Sun, 09 Jul 2023 13:31:51 +0200
Message-ID: <3506917.iIbC2pHGDl@phil>
In-Reply-To: <20230628131442.3022772-3-sameo@rivosinc.com>
References: <20230628131442.3022772-1-sameo@rivosinc.com>
 <20230628131442.3022772-3-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_043154_321329_45706BE4 
X-CRM114-Status: UNSURE (   6.77  )
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

Am Mittwoch, 28. Juni 2023, 15:14:34 CEST schrieb Samuel Ortiz:
> Zbc was missing from a previous Bit-Manipulation extension hwprobe
> patch.
> 
> Add all scalar crypto extensions bits, and define a macro for setting
> the hwprobe key/pair in a more readable way.
> 
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
