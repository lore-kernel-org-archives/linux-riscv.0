Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC7EC77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykLFkPczODB/6CxOSvzvapuGY3FxxDaI8aH10Az6EvA=; b=ReUw76bHw2z84a
	e45Wa30KbaYY8BYpZq9ltj4JBWDcaQWWa6PZcoYRm9DUII4j9jg4eeghao8T5LAZEleI32Eluycd7
	asbDA6BdPsdy0BuVkWI0JsPczjuM5BdP0oAJXJXsEWsZVMJpW+BxZyGENDWkTDgUZvN9YNrka0HR/
	Nu5Pt0Q3NNajkeOQ3oUjfR32gt/fxistAFc0hVp/KAWI4HkUg6u5KnuRfr5qy9YXhxKqiLCaO2sC9
	DJuKWcFBO9a8LieVnEyJFEhAHWxBcORXfxDvVWCzRUmmH8+lJxPaS+87yc4+PDBxx4sLL1cWYrqa+
	ipDbDYm26yJ7YwuZIEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRCO-00Gy1I-1h;
	Mon, 17 Apr 2023 15:55:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRCM-00Gy02-1t;
	Mon, 17 Apr 2023 15:55:23 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1poRCK-0004yb-Ky; Mon, 17 Apr 2023 17:55:20 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v18 06/20] riscv: Introduce Vector enable/disable helpers
Date: Mon, 17 Apr 2023 17:55:19 +0200
Message-ID: <5885295.29KlJPOoH8@diego>
In-Reply-To: <20230414155843.12963-7-andy.chiu@sifive.com>
References:  <20230414155843.12963-1-andy.chiu@sifive.com>
 <20230414155843.12963-7-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_085522_625249_2AEEC84D 
X-CRM114-Status: UNSURE (   6.72  )
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

Am Freitag, 14. April 2023, 17:58:29 CEST schrieb Andy Chiu:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> These are small and likely to be frequently called so implement as
> inline routines (vs. function call).
> 
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
