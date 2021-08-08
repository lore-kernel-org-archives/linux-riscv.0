Return-Path: <SRS0=xysQ=M7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C5EC4338F
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 16:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3ED760EB9
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 16:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3ED760EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isu6sORHTCGrF4y/p2InSgUKKtDlKuXG3hrK0AsrAzA=; b=l6WY3bqBG5EBZJ
	3Oba9DnZEiBb+njaxEVBoIb672EOniBwDNcme7IU3qb8Cvgmmbw7hW1jbWo69xkghfP/F+C2cVCFZ
	py0wNd3t+tt7Fgiw3NIQRP58TdMK3UIcbCbM6z79POIPoL1t0/QM/pyyltHW55fVFORe6AJfYKs8a
	+TV51rSUoaObGhP7ZC/mfJvmNimxwuZfJLFXSzJNgrQ1kUpk/0kc/ePnG2bD9B/HbPfu0yKc4p0sG
	w8jETO3r0rmgH7U08YdA9klQ22hPEEsSqBWOVFtb/y4XeqruVswjBdRHql3rqWowefiBa6VNEbAdW
	GHVqB8K3EMK64mBCx3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mClnp-00G6FJ-Mt; Sun, 08 Aug 2021 16:37:33 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mClnS-00G6EJ-3Q
 for linux-riscv@lists.infradead.org; Sun, 08 Aug 2021 16:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=wGp9oslcYn/4MPbEEh0iFKyJg/ieb0O1ie
 OAiKIaJ8o=; b=uBY1PLvyiJOE6fi1IN0UXQ7jXSbwP/K2ndIOgF1zG8A7L0bkRT
 +Tcaqhh5EH8CCW7B28zlDhvnF0grM/pi6FP8negVZhf8W6563sLCIqtbDIhjpYDJ
 lKp9USkrEtCxtG9MoW0t5btxTMnJqFBgk5lqrv6L+le7KzplMqlxVjaqg=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3xjgkCBBhk60MAA--.4994S2; 
 Mon, 09 Aug 2021 00:36:54 +0800 (CST)
Date: Mon, 9 Aug 2021 00:30:44 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: add ARCH_DMA_MINALIGN support
Message-ID: <20210809003044.6692ddce@xhacker>
In-Reply-To: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
References: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3xjgkCBBhk60MAA--.4994S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw13Xr4kCw1fXw1xJF1rXrb_yoWfXwb_C3
 yxG397Wr1xXF4xAFsrJas3Jr4Y93yvvFykXr4Yyw13G3WDuw15C39Ykr17Jr4FkayYyFs7
 Ca4rt34kCryYvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU86OJ5UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_093710_843912_496B1718 
X-CRM114-Status: GOOD (  12.38  )
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

On Sat,  7 Aug 2021 22:55:37 +0800
Xianting Tian <xianting.tian@linux.alibaba.com> wrote:

> Introduce ARCH_DMA_MINALIGN to riscv arch.
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/cache.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> index 9b58b1045..2945bbe2b 100644
> --- a/arch/riscv/include/asm/cache.h
> +++ b/arch/riscv/include/asm/cache.h
> @@ -11,6 +11,8 @@
>  
>  #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
>  
> +#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES

It's not a good idea to blindly set this for all riscv. For "coherent"
platforms, this is not necessary and will waste memory.


> +
>  /*
>   * RISC-V requires the stack pointer to be 16-byte aligned, so ensure that
>   * the flat loader aligns it accordingly.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
