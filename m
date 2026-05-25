Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D57CD4F54
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKqxn/XRDAot5ySkGR1kGiHAqitV+QUE+iBSAZ2VjGo=; b=ye7if38e41oYnH
	xOtEH0/F5IPxf3MKcFa7ig0k7Nz8q1QgtPlo9RcsK7z2XvYggRQjaMPqgeSsTVj2dDGZ+Py4cmpBp
	tG+dTOjNm/sBKe2azjuitnwY1MTcXlOCCdbT73wJdQCdtF03jxvV+WlkIaGCfVpqrJU7F4r/uUe7U
	1cZwcHLpX4Mn0PiTl7sLch3dWTvH9FihXA+nbp0IQL7n8fMRHy4GoEL9X8OKlMyj/haCoJGsbm7Y+
	stdx1Vp2f9Sm8C3ouBq7PKNEV9XuYFDi7IzhN3zi5TXiji3tzFhc0w1u8eNAAOpaR6abzBmrcxFGn
	ZWFu2OnYCJJggtGncqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRK90-0000000G0ni-3uRp;
	Mon, 25 May 2026 01:30:14 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRK8w-0000000G0mR-0PFY;
	Mon, 25 May 2026 01:30:12 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHLOMSphNqWbc8Eg--.11616S2;
	Mon, 25 May 2026 09:29:55 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	jiakaiPeanut@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	xujiakai2025@iscas.ac.cn
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend handler
Date: Mon, 25 May 2026 01:29:54 +0000
Message-Id: <20260525012954.981933-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <y5hmqjrtgeby3amnlfycifpfm2dc3oaj5eebgvdu3tgjjgohvx@kw3a7xpxqrbt>
References: <y5hmqjrtgeby3amnlfycifpfm2dc3oaj5eebgvdu3tgjjgohvx@kw3a7xpxqrbt>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHLOMSphNqWbc8Eg--.11616S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr48JrWxWF47Xw4xCw4UArb_yoW8AryUpr
	WaqFnakF47tr4Sk3s2kF1xXryF9w4fZF4UGr98KrWrJ345Ar1xtF4xKa1jya4UuFZ7A3W0
	qFs7trZ8AryUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAq
	YI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCQ8SCWoTokcOowAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183010_518858_C98534C3 
X-CRM114-Status: GOOD (  20.09  )
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

Hi, drew!

Thanks for your review and patience in discussing this issue with me.

> > > But... before we get too carried away. Unless I'm missing something, this
> > > race really looks too theoretical to justify any change at all. Do you
> > > have a test case in mind that could force it?
> > 
> > Unfortunately, I don't have a reproducer or test case that can reliably
> > trigger this race. 
> > 
> > But as we saw earlier, this is a real bug, and we can tell that just by 
> > analyzing the code.
> > 
> > The real environment is complex and unpredictable, and such races are 
> > possible. Wouldn't it be nice if we found it and fixed it now?
> >
> 
> I assume the scenario we're trying to fix is:
> 
>  HART-x                                                 HART-z
>  ------                                                 ------
>  SUSP()
>    Check HART-y is stopped
>                                                         HART_START(HART-y)
>                                                         HART_STOP()
>    Check HART-z is stopped
>    Determine all HARTs are stopped and exit to userspace

Yes, this is exactly the scenario we discussed earlier.

> 
> Besides the fact that the race seems quite unlikely (only a pathological
> guest would try to force it), userspace can/should still double check that
> all HARTs are stopped before proceeding with its system suspend
> implementation. So, since we would need to introduce a new lock to resolve
> this very unlikely issue, then I'm not 100% convinced we should. I would
> be more willing to fix it if I thought the host was at any risk, but I
> think this is "only" a guest corruption issue. If the guest does wild
> things like this during a system suspend, then it can keep all its pieces.
> I would agree that we should add a comment about this choice, though.

I agree with you. I'll send a v2 that replaces the fix with a comment 
documenting the race and our decision.

Thanks for the thorough review again!

Regards,
Jiakai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
