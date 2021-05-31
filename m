Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D3AC47093
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 00:17:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D08EE61222
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 00:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D08EE61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=als4UWh4yl1rRrK6SAk8hj2hXdDrETmmZKjI+ImtC3o=; b=oJKjovhvDh53Ov
	bF9TkF3CrfSqzukRPMnn6W+w2blHzFIzXbbfwWWW74o3Kn8P539VRjC8t+xJB9K3i2xxQSYADGorO
	aBbNysVuoffWYtcCqugiDFdp46bOaMeo8ecd+8CjOKu+G8u1FBTAfHHLzrisJB0je4fow+N/wuNv3
	f/QFw6AUeXJdX8a86mgl6bnny48+49Na6HKfKVqIanOPgVGS3sfO0Br6ay2+wye4IUpSMIb0qwo7y
	YogAcRyAaV1CYXS22OaSy/5ephlcv8c5AUSmgqzpVYUx00QHnG2hhTtfYIaCvTeklyauPBk8qKhlN
	2f0l/d9QX1zFvT29rwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnVcZ-00ALrn-Ry; Mon, 31 May 2021 00:17:31 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnVcX-00ALqh-4C
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 00:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=NgJURvzzOS2xRqe51UnGjyEyr6tOw1hKJK
 HelwE19vc=; b=OUZZ3Cd00XA+fAa1qvk/OZNG8wy/smj5owi93UIaDn8bOOCwwv
 VhAhl4XZxmMyFR0hSSoInCJ5tUqfURR7Bd38mLyPnv2MnsS0a8VZi+FLI+Vz8O2x
 JKskCC/ZCnS4hbKojtUZOyolcaMIb1pn3tLO8yI89qw7IUVRzMf9RBaEQ=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCH9JQFK7Rg3apCAA--.20025S2; 
 Mon, 31 May 2021 08:17:09 +0800 (CST)
Date: Mon, 31 May 2021 08:11:40 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt
 <palmerdabbelt@google.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: fix typo in init.c
Message-ID: <20210531081140.4e8b409e@xhacker>
In-Reply-To: <20210530132217.7851-1-vitaly.wool@konsulko.com>
References: <20210530132217.7851-1-vitaly.wool@konsulko.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCH9JQFK7Rg3apCAA--.20025S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWrJw4xZFW3AF1xCw48JFb_yoWkCFb_WF
 4xA348Cr4rur4ku3W29r1fXF1Iy3Z5XFZ0kr1Iqws8WFykJ39xWr95K345Z3yFgr4FkrWU
 W3Z3t3ySywnFvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbF8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUUI43ZEXa7IU86OJ5UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_171729_843042_ADE026BB 
X-CRM114-Status: GOOD (  12.23  )
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

On Sun, 30 May 2021 16:22:17 +0300
Vitaly Wool <vitaly.wool@konsulko.com> wrote:

> Commit 010623568222 introduced a typo in "__initdata" spelling
> which led to build breakage for XIP. Fix that.

oops, nice catch! Sorry for that.

> 
> Fixes: 010623568222bd144eb73aa9f3b46c79b63d7676

This "Fixes" tag seems not correct.Should be 
Fixes: 010623568222 ("riscv: mm: init: Consolidate vars, functions")

After this change, 
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ae32f78207f0..e7b136abf90c 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -451,7 +451,7 @@ static uintptr_t load_sz __initdata;
>  #endif
>  
>  #ifdef CONFIG_XIP_KERNEL
> -static uintptr_t xiprom __inidata;
> +static uintptr_t xiprom __initdata;
>  static uintptr_t xiprom_sz __initdata;
>  #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
>  #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
