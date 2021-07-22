Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFE6C63793
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 15:36:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 217CD610D2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 15:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 217CD610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lb9HB9KDD8wuYD7PH6gYx/MFytpaA1zyCTkIEMpm3lQ=; b=dRNQvfFkX1z0a6
	6Um1n50NZvrAYwUC06q9Rsvz47p0P50gjhQq6k7D55r8mVQLBEQM3VYvQMIN2kuUxKmuR4NSwnxtb
	TVdjel65AHsGZxs2wasiWsovxehtv5wAWRbsJqN/UA0RxdSI6Okeh6YMYkz+HqkZHQW7AE17mumpv
	YqztZGsDnsgkKcifuKbxfaLUsRPfXKkSYUqDujXaYhmjRjxDThHwVlVve8NRZDZctLa2/Unf5H1Di
	oOwTnQK65B+GlavQ18H6M8PsAmfQDZqfyhrTN7h4PPTlW8tK9fuJ7iAEdKbUHfkNAap7oPGyCE1jm
	0nL5/7dmq6ZWHZb2icTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ajd-001zsI-SS; Thu, 22 Jul 2021 15:35:41 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ajT-001zrJ-1s
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 15:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=8mGNEtej5Km8xU2wjprdiKPrHelNnd1RaT
 +aFgBrUL0=; b=l8rvOHag8XjdDctGhiTTgdn2WsyswSKywIcQnddFrCXF1pkM5a
 L1hfM2PsgjWYsgUuQzU7WyJDA9rGVfqx8OvRoiRNXETCloqXe5EYOiJjW1Jphf0s
 xN1WW3uQOohSMXu+AXcy96ujjVL2s1JQA28BHUZMlENa88TIU19FSHOFk=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3jFc1kPlgWmYoAA--.610S2; 
 Thu, 22 Jul 2021 23:35:17 +0800 (CST)
Date: Thu, 22 Jul 2021 23:29:23 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes 0/3] Fixes regarding CONFIG_PHYS_RAM_BASE
Message-ID: <20210722232923.73d65d6b@xhacker>
In-Reply-To: <20210721075937.696811-1-alex@ghiti.fr>
References: <20210721075937.696811-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3jFc1kPlgWmYoAA--.610S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GFyDCF15Kw15KFyDuFWUCFg_yoW8JF1xpr
 48Gan5uFyrt34fWFZI9wsrWFW5J3Z7Ja4agrnrX3y0gF10qa1jyF92qw17Zry2g3W8ZF4x
 tFy8Wryru3WjywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
 Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_083531_790493_8AAAFC03 
X-CRM114-Status: GOOD (  13.41  )
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

On Wed, 21 Jul 2021 09:59:34 +0200
Alexandre Ghiti <alex@ghiti.fr> wrote:

> The following commits: 
> 
> 7094e6acaf7a ("riscv: Simplify xip and !xip kernel address conversion macros")
> 9b79878ced8f ("riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED")
> 
> expose CONFIG_PHYS_RAM_BASE for all kernel types whereas this value is
> implementation-specific, so that breaks the kernel genericity.
> 
> The first patch in this patchset removes the usage of CONFIG_PHYS_RAM_BASE
> by introducing a new global variable that holds this value.
> 
> The second patch reverts 9b79878ced8f ("riscv: Remove 
> CONFIG_PHYS_RAM_BASE_FIXED").
> 
> The last patch is an optimization 'symmetrical' to the one introduced in
> the first patch: this is not a fix, then it is not necessary to pull
> this into -fixes.
> 

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> Alexandre Ghiti (3):
>   riscv: Get rid of CONFIG_PHYS_RAM_BASE in kernel physical address
>     conversion
>   Revert "riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED"
>   riscv: Optimize kernel virtual address conversion macro
> 
>  arch/riscv/Kconfig            |  6 ++++++
>  arch/riscv/include/asm/page.h |  9 +++++----
>  arch/riscv/mm/init.c          | 17 ++++++++++++-----
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
