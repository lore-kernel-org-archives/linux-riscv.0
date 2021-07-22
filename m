Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385CFC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 00:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E637E60EB6
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 00:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E637E60EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q2VIn2JQ9Gxh0hcIppFZBLBEXts2/GGo9SNysJvK5o=; b=HYce+TuKIJlP2T
	Z+zHAzMXu850IW8d7w8+H3Psnrmnexkcanpap2AWRU7JzdcP5BImK/BRt/OyYvMPaQfzr4ooVwG/t
	9ObxE4TvvTZvCZZyHDoAk6MT4b4/ACsq7v8og1sLdGPIUcdxtyT+LRXXu29cRRYHckl1W2/r+Oi1u
	lCBqxW8m3ruz0EJa4zZyBcVxvUJOhXI0FIrtTkNT5rrt9h/pNogag+M/gckM0Akc4qEAyWxKpL49u
	jyJf5cgumR5eN9M/jNqcJqCsmF18BiU0BjJ4Ue2G5kJpt3ktdrhJdx15qC2w6QenhCVbllW3onfdC
	U3KyMRj5QcJ0oMgf7O0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6icN-002yLW-Qr; Fri, 23 Jul 2021 00:00:43 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6icK-002yL3-5M
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 00:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=yUfE01syks9KMUP1WZewBPR3Ce93PpQgYz
 2u0Qf4kxE=; b=jO9pRCzZna0F5kbbYf3mJWRud3oABY3Kw/caD3ePYSzhQXExcP
 2uZEjm9gQm/4VMuekv/CilumiGy7sK0Gc5H3p46XaJCFAOpQjqnFZ7uMbWRy3BfM
 iGEfulV+slHfGMDtpOHXNO/pkEnalXzMZd4HXKrEZqilo0jOhM/EjSL/4=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCn2VWaBvpg4JUuAA--.7569S2; 
 Fri, 23 Jul 2021 08:00:27 +0800 (CST)
Date: Fri, 23 Jul 2021 07:54:32 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, tongtiangen@huawei.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
Message-ID: <20210723075432.098634a2@xhacker>
In-Reply-To: <87zguexslf.fsf@igel.home>
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
 <20210722213724.1f12a0e7@xhacker> <87zguexslf.fsf@igel.home>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCn2VWaBvpg4JUuAA--.7569S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5Z7k0a2IF6F4UM7kC6x804xWl14x267AK
 xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
 6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr
 1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY
 62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7V
 C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
 87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j189NUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_170040_922114_A6A2B5E6 
X-CRM114-Status: UNSURE (   6.86  )
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

On Thu, 22 Jul 2021 17:42:52 +0200
Andreas Schwab <schwab@linux-m68k.org> wrote:

> On Jul 22 2021, Jisheng Zhang wrote:
> 
> > I think we need to pin the stack before calling get_wchan(), could you please
> > try below patch?  
> 
> Thanks, this fixes the crash for me.
> 
> Andreas.
> 

Thanks for testing. I will send out formal patch later

Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
