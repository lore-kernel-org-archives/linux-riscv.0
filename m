Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93806EE4993
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhDWAAuJ6J7rUzIAYv/M+1rTwvjBY5rgtpirq9i8+zc=; b=UP7NV/6t4KKZsd
	OBdIxG81cA8HqFY6OZ5ijyMcIrdImF9tjOj7rArQzshwdVBFyW9R3JAQIdNdwKhMGWtdVX33R9otW
	6JBvmCUeemQVlizGNdrucdSt0rkCa8dRKfzdBhAFSGYq3gEyrMjg7Y033NkBTdY7BGfzYkByTLtGp
	TdhszMkc38bcmTDuFrLcl0t/BuH6Un4WrmjajO0X+X61otR8IfQhgibHMexJIlpE5i3+0j9OACBiM
	RmNT+VVxDWWDDPQbFvrvstt7YsDWxu32jvpvu4zj3l7VCpsDy2/9u+QOs51TZeYVxDvjeH6AAE6Ya
	UshbW7zo62khlhI9kp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYAOI-00EZtM-0h;
	Mon, 21 Aug 2023 19:16:42 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qYAOG-00EZtD-2B;
	Mon, 21 Aug 2023 19:16:40 +0000
Message-ID: <5ebf04f8-0cf6-d2b4-fb73-f51fff421b3a@infradead.org>
Date: Mon, 21 Aug 2023 12:16:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: linux-next: Tree for Aug 21 (riscv-64 asm)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20230821164605.7bac05f1@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230821164605.7bac05f1@canb.auug.org.au>
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



On 8/20/23 23:46, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230818:
> 

../arch/riscv/kernel/traps.c: In function 'do_irq':
../arch/riscv/kernel/traps.c:384:1: error: s0 cannot be used in 'asm' here
  384 | }
      | ^
../arch/riscv/kernel/irq.c: In function 'do_softirq_own_stack':
../arch/riscv/kernel/irq.c:94:1: error: s0 cannot be used in 'asm' here
   94 | }
      | ^


2 out of 10 risc-v 64-bit builds failed with these errors.

Is this a toolchain problem or something else?

Thanks.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
