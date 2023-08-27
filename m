Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BC4C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZUeWEi1JXJWdP4Il5y3/6opU+nSnbq8OiancKerMO8=; b=zZHSmtF99m4eMi
	OeOa3UM3T9NFad9At6UTS+lvlNeFyYGdeikcO4ga8kskpeLbPp5ppd5wOL65d76ABgMuIUIif4KJz
	P42d+WFKQYCTi1enTkdGmUZXPf+nH4N9ADHyzoJjRrsc11RUwcFIKnvJDuvgKgZ2W4HoZ+3vGp7K+
	8jaROOF8osdZfodt5UUPJ3Wdu06pKePCIauBJG+WRTQLp0xiUIlHg2LNZGizcOXQWEgmEnCeFx+3y
	xOfXGf9cuYtoaB/pRkZSecpfxplrFnjzIk9vK3HKtpu4LuM+IKPTpHLZMUL2QIINH0XKCQ1SV8x2T
	d0gS40YL4U3MgV4711Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaE1b-007z59-0b;
	Sun, 27 Aug 2023 11:33:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaE1X-007z4o-25
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 11:33:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 968CE612A8;
	Sun, 27 Aug 2023 11:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4260C433C8;
	Sun, 27 Aug 2023 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693136022;
	bh=dn+6Ju7C1qSnnp4Ka6O4z8Z2HJccKQcgqygWMKBW1Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/0ddGtyG7ooqoZlO8Bzd5esdF/lIhLdB04VnSQ5/bLQHEtPvB4IFwIiPnmncVtkS
	 JyggTk0o0FpbRNblVCr28OGp3bOqCERqTlTym1ly75A9rYbmr1d0J7DlowM2M3aeOg
	 0pJmIXr4N8NPBIjXeMHBnee5kPG0avFbZbuzCFAaZrg7ASh05RWdW4kLUX2P6nMnfO
	 FwBZYmhqj/WzmxAvjQ10L86FnuWV3+jJIYyIrI6xPH4PyaZCVHhQihbGOk7Sx4XBl1
	 JdGRgILuZ4BgBygQ+1reBdQMrUnO81J8CjOzA1Vh4+B2q6Q3bdWES9QrGbeYt6ko28
	 tK0gL0QKpWMFA==
Date: Sun, 27 Aug 2023 19:21:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: errata: improve T-Head CMO
Message-ID: <ZOsxzuABhEnAZXHE@xhacker>
References: <20230827090813.1353-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827090813.1353-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_043343_731378_04F8FB6E 
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

On Sun, Aug 27, 2023 at 05:08:11PM +0800, Jisheng Zhang wrote:
> This is a renew of Icenowy patch series[1], patch1 is necessary to
> make T-Head C910 powered SoCs CMO work correctly. patch2 is to name
> those instructions following thead-extension-spec.

Original series:
https://lore.kernel.org/linux-riscv/20230103062610.69704-1-uwu@icenowy.me/

> 
> Icenowy Zheng (2):
>   riscv: errata: fix T-Head dcache.cva encoding
>   riscv: errata: prefix T-Head mnemonics with th.
> 
>  arch/riscv/include/asm/errata_list.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> -- 
> 2.40.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
