Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1515C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnpqaV+O1vUHvb6oMbfi9jdrL6VUbdm8cfQGQdn2Yu0=; b=w0+Th3qviIu8f7
	dgOvSgsn/9mSX1z+pPPTOeHwtcT35PO5NnLgEcOfBmNLOIeEHwbm2CXYD0HohECipFWcMX+jSwu81
	3RyEWoqayyIVdm4hrAvDv/basv4w9bpZ0LnuWa6FybFGZnI4XfsMmZUM2w0IAUWh6GZsfclqId0MH
	GDeOgmxym1XMFpkZ+lkzeyQ8qK50X0XJIUSNPpMmoSKbxaomDCbri9u/fjLcYRJvG95u6HaKF2IrS
	xrU2oBgTjlIUVFe2nZOmuful035MGmnUF01fnkf8ZuBh/6vpy1sWmv7fo8qkVvxht2yJ216X+kOYe
	OtTaeWaoPrvOAMgiq8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwl4z-006Oef-3B;
	Wed, 10 May 2023 14:46:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwl4x-006Od3-36
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 14:46:09 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pwl4m-0006Rz-8B; Wed, 10 May 2023 16:45:56 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Add Zba, Zbs extension probing
Date: Wed, 10 May 2023 16:45:50 +0200
Message-ID: <23717157.ouqheUzb2q@diego>
In-Reply-To: <20230509182504.2997252-2-evan@rivosinc.com>
References:  <20230509182504.2997252-1-evan@rivosinc.com>
 <20230509182504.2997252-2-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_074607_993270_84A3B5A6 
X-CRM114-Status: UNSURE (   7.77  )
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

Am Dienstag, 9. Mai 2023, 20:25:01 CEST schrieb Evan Green:
> Add the Zba address bit manipulation extension and Zbs single bit
> instructions extension into those the kernel is aware of and maintains
> in its riscv_isa bitmap.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
