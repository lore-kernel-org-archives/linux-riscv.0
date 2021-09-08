Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB5FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 15:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D2661051
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 15:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0D2661051
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xnv8MUefSjHAGYsP03HcOeufpIrRiFTpJKs9xuw+Kho=; b=csuf3KZvMvovka
	yPy45wmHe4XUo/NJqjlufvkLHsdb9DdZgvBfP/SLYActEon4SwtQokYdvosnYAU1mq6B9uUSujkVw
	pi4j2EIrM489+tuyTTpZwvxqbjCcfbHV70Nectf8aLX8SoIfVtXPuf/nsJFOOTb8sLnYGlWO0nO6u
	RMaUssZnPhWr9DdnAIwrKTUwcIqA+ggv2n8jj8clysBQYHOgVLZl7pDuIcmKuK9nISUjkA1oXKJy/
	2eTwZrVVh3cawVLgDKcUZ8QRfzRXfYX1TOXGcKHCom9CZNxVkVz+qNrMk/9D+D0EAsNk095mdlAQ/
	ki7asZSjUxUj/Ht4qVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNzEF-0071e3-G9; Wed, 08 Sep 2021 15:11:11 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNzEB-0071bd-5w
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 15:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=0C3YBGnfpbG9UOTagLlfTYYKY8tokMJAvI
 Ql9p4G3lI=; b=gT8DVp8CbcFATMUBS9fwOB0WS36+q/qdnpW8Hy5wjuZJZ/lTuM
 TPNZ/tUrqqulOn9moSy17+wIG+I5hJKVxIoeEqI9KMf9UWu6OMtZ/p/dGH7b91lr
 9DFaPbVSbmqGqCNXsGByk514vPeG7aHtAJEMBdsBixqxj7rRL5H8Q5jLs=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAnL0t+0jhh3cACAA--.2155S2; 
 Wed, 08 Sep 2021 23:10:54 +0800 (CST)
Date: Wed, 8 Sep 2021 23:04:27 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: enable GENERIC_FIND_FIRST_BIT
Message-ID: <20210908230427.3a92fb87@xhacker>
In-Reply-To: <20210718001423.6b8e1d23@xhacker>
References: <20210718001423.6b8e1d23@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAnL0t+0jhh3cACAA--.2155S2
X-Coremail-Antispam: 1UD129KBjvJXoWrKrW8Zr1UXF15ur17XrWxCrg_yoW8JrWfpr
 45CF1Fgr45JFyrWF1fKFy7u34xWa1fG393Kr95t3W5Xry3urZ5urn3Kr13W34UCrs5Wryf
 JFyfC34UAayYyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_081107_919631_6CC258DB 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Palmer,

On Sun, 18 Jul 2021 00:14:23 +0800
Jisheng Zhang wrote:

> From: Jisheng Zhang <jszhang@kernel.org>
> 
> riscv doesn't implement architecture-optimized bitsearching functions
> such as find_first_{zero}_bit() etc.
> 
> When GENERIC_FIND_FIRST_BIT=n, find_first_bit() is implemented with
> find_next_bit() which is less efficient. Enable GENERIC_FIND_FIRST_BIT
> for riscv to get more optimized find_first_bit() implementation, an
> initial test(lib/find_bit_benchmark) shows find_first_bit() performance
> is improved by nearly 32%.

It seems this patch is missed. Is it possible to pick it up for 2nd 5.15-rc1 PR?

Thanks

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8fcceb8eda07..7ebc54c5c245 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -47,6 +47,7 @@ config RISCV
>  	select GENERIC_ATOMIC64 if !64BIT
>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>  	select GENERIC_EARLY_IOREMAP
> +	select GENERIC_FIND_FIRST_BIT
>  	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
>  	select GENERIC_IOREMAP
>  	select GENERIC_IRQ_MULTI_HANDLER



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
