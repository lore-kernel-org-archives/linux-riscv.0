Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE2FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INrExU06gnB64bOmSDGKIpBmawtwToOo8KxXwBeJXUU=; b=trDY5hh7WoAPm5
	iQhzHOlPZOkvjthXR0EffvTVNh/Ml12cWfbcRbHesLjfQn0sfcQ+1Bcclh4qfJwEEUhnrTjx9nsic
	Yk6YpRchX9UjWlZz9jad7xF7Zxvc1fSuDmg/0Jyv0Sna5YzAMcKd5j7g+w35KfDHmFI3c0qcEjO5U
	d1FDpnGZpn14sxQmoXGTzq+1pneac8dA2oGzq1BcNezgG2iVOviQEbr4uw25e8+puGdGpD7WVQn+M
	yHV4VlzWuUNesYZ3Oe+WajZvQYy4C4l9wID2g/W5KhlVt3yougHaQhDyTEEtW8UNvPjOxVkPWT959
	EOi0YUO40YlxGTsaCjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhcC-00GmvP-Ls; Mon, 14 Feb 2022 20:06:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhc9-00GmtW-PR
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:06:27 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJhc4-0002le-Tx; Mon, 14 Feb 2022 21:06:20 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
Date: Mon, 14 Feb 2022 21:06:20 +0100
Message-ID: <2355131.QFAWljMpKt@diego>
In-Reply-To: <20220210214018.55739-6-atishp@rivosinc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <20220210214018.55739-6-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120625_891319_E1620CDA 
X-CRM114-Status: GOOD (  10.93  )
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

Am Donnerstag, 10. Februar 2022, 22:40:17 CET schrieb Atish Patra:
> The isa string should begin with either rv64 or rv32. Otherwise, it is
> an incorrect isa string. Currently, the string parsing continues even if
> it doesnot begin with current XLEN.
> 
> Fix this by checking if it found "rv64" or "rv32" in the beginning.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Tested-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
