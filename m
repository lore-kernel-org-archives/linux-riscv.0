Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94340EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/onwTek7TaCd+VD3uJbGhRdGxyzr0jCWO7/I6pCaWw=; b=OI6zpw0vDiKRWj
	F98q07Zz0537jw50kPnXEl1yIqjmioK33Ad4HlEiRcjN6ntmH3rkJAK302CEtldxyHySQdeVfz9Hs
	346t+MXuOsQmcdVEKqSRINdw3Smf0HkVdV1r0QdyliCaFlHogP7MhWVONbwz5EF/CMdg32bgiHZD5
	t95Qd9tSf62+kgSNAnX4eWAku9F7NFje6gZ46LCqd011bQLt2FjuoqgDWMI2KGRIRhkgDEO+kleEm
	NPYTv/ls6c6XPioqi5Bl6R9nuzo0zgR21r7mlX9z5YiAoUgkZksSVHfMe6AOIMcgimbMkc2gCdjpG
	3dVOyK8uH5ljMGi7dycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIUPg-0099rv-1z;
	Sun, 09 Jul 2023 13:25:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIUPe-0099rP-0R
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 13:25:19 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko.stuebner@vrull.eu>)
	id 1qIUPc-0002R7-5C; Sun, 09 Jul 2023 15:25:16 +0200
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
 Evan Green <evan@rivosinc.com>, devicetree@vger.kernel.org,
 Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: riscv: Document the 1.0 scalar cryptography
 extensions
Date: Sun, 09 Jul 2023 15:25:14 +0200
Message-ID: <1764085.VLH7GnMWUR@phil>
In-Reply-To: <20230709115549.2666557-3-sameo@rivosinc.com>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-3-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_062518_176539_02C5C933 
X-CRM114-Status: UNSURE (   7.33  )
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

Am Sonntag, 9. Juli 2023, 13:55:44 CEST schrieb Samuel Ortiz:
> The RISC-V cryptography extensions define a set of instructions, CSR
> definitions, architectural interfaces and also extension shorthands for
> running scalar and vector based cryptography operations on RISC-V
> systems.
> 
> This documents all the dt-bindings for the scalar cryptography
> extensions, including the Zk, Zkn and Zks shorthands.
> 
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
