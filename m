Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E165C2B9F4
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9071A6197C
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9071A6197C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTTPtB/lwaAXTx7iAs5XyNsscBOjTmcQYwbhvI0P5uY=; b=E7gBGLjVEJ0VhR
	+eBNWrcTSUKsDZm3PMI/wdAbYwEEtpv8zdRrsTGoTQZPxYPE9MCwJMsq0Z1E3v9dIaqRPiUCrMvM3
	fSJLZyGcZxeHf4eSOQ3peMKO3VyTdky9JGsqw1YGDSjCJzkT1wYS6svSvgCtlT7e7OXmLKguGYrQG
	pdXfZqNN0yjT7Tk0bt0F2gTL7YIR7vRuZ2CBd894cD1q7mF/XgSDNpwh6Ysoww8jv1mYbtDW/cTJE
	DKDZy3MFI+EOfzYb/e+E60FmX+/b8OnyU8BsJHCurXFpcgcyQNCcUGsKZB1HYj3tGwe9P8sCwMHoE
	sUww1inj1C5qHsfPm39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwm0p-001iGh-Kj; Fri, 25 Jun 2021 13:36:51 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwm0m-001iF8-4u
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 13:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=V/Pda2TGK88NZgYN0v2vuctHbNL3/pWKOS
 4YEYben7Y=; b=yBCujCdEENyRlL5Ag7328rzO/xHR8FXbiKBut08Aok9qwoIfcN
 2Gamw2lAF6wKdnl6uHwqyCZW3TJm5Zc8/Stsgq8qHTTSqt9XIoRanjB/zGSjtIf2
 nOek42UVJKOfhLAVVP9Z3/NdMHDpoLdgU6PP/ordJY6iq+h5gHuWGvNYA=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDn6YHq29VgDxI0AQ--.11530S2; 
 Fri, 25 Jun 2021 21:36:42 +0800 (CST)
Date: Fri, 25 Jun 2021 21:31:04 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang
 <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix PTDUMP output now BPF region moved
 back to module region
Message-ID: <20210625213104.1e48d544@xhacker>
In-Reply-To: <20210624121721.2828421-1-alex@ghiti.fr>
References: <20210624121721.2828421-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDn6YHq29VgDxI0AQ--.11530S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWrCFWkCw4DAryrWF17ZFb_yoWDXFX_Kw
 18Gas3XrW7tw1F9F4fCFs3urnay34vqFZ3Gw10q3s7A3yrCFnxKa1xtF15XrnxZrZ3GFWr
 Jr97XrWIqr42vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbrkYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
 4j6FyUMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
 YxBIdaVFxhVjvjDU0xZFpf9x07j1VbkUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_063648_684104_DDFF0B7C 
X-CRM114-Status: GOOD (  12.37  )
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

On Thu, 24 Jun 2021 14:17:21 +0200
Alexandre Ghiti <alex@ghiti.fr> wrote:

> BPF region was moved back to the region below the kernel at the end of the
> module region in commit 3a02764c372c ("riscv: Ensure BPF_JIT_REGION_START
> aligned with PMD size"), so reflect this change in kernel page table
> output.

Nice catch!

> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/mm/ptdump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 0536ac84b730..22d6555d89dc 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -98,8 +98,8 @@ static struct addr_marker address_markers[] = {
>  	{0, "vmalloc() end"},
>  	{0, "Linear mapping"},
>  #ifdef CONFIG_64BIT
> -	{0, "Modules mapping"},
> -	{0, "Kernel mapping (kernel, BPF)"},
> +	{0, "Modules/BPF mapping"},
> +	{0, "Kernel mapping"},
>  #endif
>  	{-1, NULL},
>  };



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
