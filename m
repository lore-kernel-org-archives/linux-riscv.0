Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0693C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zp+HZRBURVqCnswnOCufarUStWeYdcRGxcNHtsZSx3A=; b=VReYqGrHk29kWY
	JFI4GqkvJHplGSuLiYJPw8VZsmSMa24DDzam1YQZ4kk5jg0a+uo0SXHLkR3DOr48RPukT5RhxNQ8J
	MPUXWT0DiDdRw/mWG39d3OhnTNc/19jXA16Cj72oRcDdgTZXXLIPOjhKmfyQgQt3h/3GR2I9jO/rD
	Tol7BlLr+wDI7agCkCzpMzDE09EhQrq3nYwBEyf7XnlIkRSpEzDhZqp0iOCuctCJCqZqVCSDjZcWd
	U+NvFkyqo0KeviJcHZ7FS6SgDPbm8qmejT7ZafX0fKsPeelnTwUvY5UiOCZ/MJM1OYOIJ8k5WJ2bu
	LmAy2e3jOyOk59Ni77YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRCM-00Gy0G-2A;
	Mon, 17 Apr 2023 15:55:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRCK-00Gxz9-1g;
	Mon, 17 Apr 2023 15:55:22 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1poRC4-0004yF-Lf; Mon, 17 Apr 2023 17:55:04 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: guoren@linux.alibaba.com, Jisheng Zhang <jszhang@kernel.org>,
 Xianting Tian <xianting.tian@linux.alibaba.com>,
 Liao Chang <liaochang1@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>,
 vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vincent Chen <vincent.chen@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, greentime.hu@sifive.com,
 Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v18 07/20] riscv: Introduce riscv_v_vsize to record size of
 Vector context
Date: Mon, 17 Apr 2023 17:55:03 +0200
Message-ID: <2456518.jZfb76A358@diego>
In-Reply-To: <20230414155843.12963-8-andy.chiu@sifive.com>
References:  <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-8-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_085520_553896_2648E07E 
X-CRM114-Status: GOOD (  10.53  )
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

Am Freitag, 14. April 2023, 17:58:30 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system. If a core detects VLENB
> that is different from the boot core, then it warns and turns off V
> support for user space.
> 
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
