Return-Path: <SRS0=ZUll=KM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720C7C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 14:45:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE7AE61455
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 14:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE7AE61455
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x83zKLlP2mwJ79X2CEcwOWFIPE41VMetZtG3WHJ3DK8=; b=jNe2FbtbsODOsvRU+D4k52Xfg
	RF0BKI5WZVgfAl7BRIJtfNxGyvsE9vOdjf83MmfqcOGjrFI4Z0gVPgsWv8fzpDSxNQNi2g4cX9UBx
	b9Fau6CWEEmGiITG2F+4Uvl/LnnjHsNBmDPHSAmDJwKekEkvJJhD/K2gJ2mKwpsZ8oj9ssb4ca1dB
	O8M8lecXN3tut2X/B5FcLKATSkbeXsx6EXy9NugVAyclcCCTtkoNoW7SjVf3GgzvMZc0Cd/RyoJfJ
	XXiPkhqTKWQ4/c/18K1BaMOdfMIprIL3bJ0ql34kxqfWSY8sUBbYnx2HZ+QKcV9Vx6cxnxcKAZ0Oa
	F0VNTD/CA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lieV1-00FIgz-TK; Mon, 17 May 2021 14:45:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lieUw-00FIfy-UE
 for linux-riscv@desiato.infradead.org; Mon, 17 May 2021 14:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZXsRNWguWbVa0PtAmixG+uiM2qAEjYWOfHSwLuA4TyE=; b=On0qalxwxdjrqjaj+7u9M6M/9X
 wBRyQ3MBH8Tluti4h2oJYR/50V+yMgTMkRShJixzJlXnQU0G1faZX65VqgYmQZIjtsAG02yxafFT5
 z4XYVWmsxWp04YhBoZb68FlsmU+6BpDSNpTl38xKSJtRLyCV6D8kq9QfujSuSF+m0v0Ru6BxtrAal
 Aw1zWOt4+XHRZMts1YfYz9E4a7iaPwFU8XnmLre6fZvTSb/l1XLLKGrmvpoalXM3CKsTn1xny6lxS
 AUWPXPriel7yKx17LXJACeCx5v4nMaV8m92QZpSV6+wtsh1tSzI6K5+pSvhKD8jxtwv8EATsCtJ6d
 K860DT/g==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lieUq-00DsVf-Ph
 for linux-riscv@lists.infradead.org; Mon, 17 May 2021 14:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=ZXsRNWguWbVa0PtAmixG+uiM2qAEjYWOfH
 SwLuA4TyE=; b=EqztZO8DWB8gA3sQFNBpU6PwbOgqEpdc/bTPL2yVNn47iZdzWK
 6sUMGqvRSLsBbD3AJgkf9TbgcKVCzR5I7nqvqX4RUW6zShDmnorVMGrB5FceKPwd
 03Xr7hymxSFVdqRy+q73W9cmxguTaVMm1fghbdBRHhLgd6qSfiDsfGVCk=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygB3f0d+gaJgnBTyAA--.22620S2; 
 Mon, 17 May 2021 22:45:18 +0800 (CST)
Date: Mon, 17 May 2021 22:40:01 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: init: Consolidate vars, functions
Message-ID: <20210517224001.42424097@xhacker>
In-Reply-To: <66c8965d-494f-6c2f-0739-9bee13fc507c@ghiti.fr>
References: <20210516211556.43c00055@xhacker> <20210516211922.2110232e@xhacker>
 <66c8965d-494f-6c2f-0739-9bee13fc507c@ghiti.fr>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygB3f0d+gaJgnBTyAA--.22620S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW8XF1fJw4ktw4kuw43Awb_yoW8JFWrpr
 4FqFW5Ja1kArW7CasFqr4IgFyj9Fn3WFyrJw1UKr1fuFn8Grn8Xw4UWrW5u39FgrWxuF4Y
 vr4jy34qgw4jv37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
 0_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
 Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5BMNUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_074529_298905_D8BC9832 
X-CRM114-Status: GOOD (  16.50  )
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

On Sun, 16 May 2021 21:10:48 +0200
Alex Ghiti <alex@ghiti.fr> wrote:

> Hi Jisheng,
> 
> On 16/05/2021 15:19, Jisheng Zhang wrote:
> > On Sun, 16 May 2021 21:15:56 +0800 Jisheng Zhang  wrote:
> >   
> >> From: Jisheng Zhang <jszhang@kernel.org>
> >>
> >> Consolidate the following items in init.c
> >>
> >> Staticize global vars as much as possible;
> >> Add __initdata mark if the global var isn't needed after init
> >> Add __init mark if the func isn't needed after init
> >> Add __ro_after_init if the global var is read only after init  
> > 
> > Hi Alexandre,
> > 
> > I think kernel_virt_addr can be removed, users can directly use
> > the KERNEL_LINK_ADDR MACRO. Maybe I miss the reason of intrducing
> > it in commit 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of
> > linear mapping"), could you please comment?
> > 
> > Thanks in advance  
> 
> kernel_virt_addr will be used when I push my relocatable series since 
> then, the kernel virtual address will be different from 
> KERNEL_LINK_ADDR. I agree this was not needed in 2bfc6cd81bd17e43 
> ("riscv: Move kernel mapping outside of linear mapping"), I'm a bit late 
> in pushing the relocatable series.
> 

Thanks for your information. I think kernel_virt_addr could be __ro_after_init
But I will keep it unchanged until your relocatable series.

thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
