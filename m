Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34A1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O/k2GEH9+0bJd7gHiwLnpq1XKe4nC613nVNaao8WW2w=; b=LoyRR6tY0IRRtC
	KBb30jqF0alNoo0G18rwReYP0Cbaiwk/vQePJalLpqoQIFec9NGLWMxRtN2CAaJqy7KZjUui0rrZn
	hF9DWPm9xOfpYBVe3owLECH5aZVamJTg7AwsS9aYHNirhKNn6T2hCkgvBgEhIFwohQ25WQPFnvT/D
	/Lp3wOdHAcH/R2q76UvspJCll/6t4KlSLnoXC9S8CYghnU/P4J8z3h84skRPih5n49ynpIdqpjJIH
	MwImpON8OoP0bYfykmmo3rs921hiV50PFKyKozwFlL/le86fg82SrATWXaYkoaTBpy3yvsJdFsG2c
	rbscmdIsZCx61GZ6zu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8l4R-00A2qF-4O; Fri, 23 Dec 2022 16:38:55 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8l4N-00A2nW-DS
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 16:38:53 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1p8l4J-00AbY9-Em; Fri, 23 Dec 2022 16:38:47 +0000
Message-ID: <6a1d6ad7-89b6-8d67-ffcb-fc1a4a1033ee@codethink.co.uk>
Date: Fri, 23 Dec 2022 16:38:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: linux-riscv <linux-riscv@lists.infradead.org>,
 Jisheng Zhang <jszhang@kernel.org>, "Emil Renner Berthing <kernel"@esmil.dk
From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: undefined symbol in modpost "zero"
Organization: Codethink Limited.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_083851_567077_E7550537 
X-CRM114-Status: UNSURE (   8.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I'm getting the following error from modpost:

ERROR: modpost: "zero" [arch/riscv/kvm/kvm.ko] undefined!
ERROR: modpost: "zero" [drivers/gpu/drm/drm.ko] undefined!
ERROR: modpost: "zero" [drivers/nvme/host/nvme.ko] undefined!
ERROR: modpost: "zero" [drivers/i2c/algos/i2c-algo-bit.ko] undefined!

This seems to be coming from arch/riscv/include/asm/jump_label.h
with the arch_static_branch_jump() assembling some code:

>     40  {
>     41          asm_volatile_goto(
>     42                  "       .option push                            \n\t"
>     43                  "       .option norelax                         \n\t"
>     44                  "       .option norvc                           \n\t"
>     45                  "1:     jal             zero, %l[label]         \n\t"
>     46                  "       .option pop                             \n\t"
>     47                  "       .pushsection    __jump_table, \"aw\"    \n\t"
>     48                  "       .align          " RISCV_LGPTR "         \n\t"
>     49                  "       .long           1b - ., %l[label] - .   \n\t"
>     50                  "       " RISCV_PTR "   %0 - .                  \n\t"
>     51                  "       .popsection                             \n\t"
>     52                  :  :  "i"(&((char *)key)[branch]) :  : label);
>     53
>     54          return false;
>     55  label:
>     56          return true;
>     57  }
> 

Changing the jal zero to jal x0 doesn't fix it, it just comes up with
"x0" being undefined.

gcc version 12.2.0 (Debian 12.2.0-9)
GNU assembler version 2.39.50 (riscv64-linux-gnu) using BFD version (GNU 
Binutils for Debian) 2.39.50.20221208

I suspect this is a gas bug where it means to assemble a J instruction
to the label without outputting the unused symbol "zero" into the symbol
table. Is the right thing to fix gas, or can the kernel be changed?

FYI:

tmp.s:
      1          .text
      2
      3  1:
      4          jal zero, 1b


produces:

0000000000000000 <.L1^B1>:
    0:   0000006f                j       0 <.L1^B1>
                         0: R_RISCV_JAL  .L1^B1

and

$ riscv64-linux-gnu-nm -a tmp.o
0000000000000000 b .bss
0000000000000000 d .data
0000000000000000 n .riscv.attributes
0000000000000000 t .text
                  U zero

Current fix is to:


diff --git a/arch/riscv/include/asm/jump_label.h 
b/arch/riscv/include/asm/jump_label.h
index 6d58bbb5da46..a4abbacd0b62 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -42,7 +42,7 @@ static __always_inline bool 
arch_static_branch_jump(struct static_key * const ke
                 "       .option push                            \n\t"
                 "       .option norelax                         \n\t"
                 "       .option norvc                           \n\t"
-               "1:     jal             zero, %l[label]         \n\t"
+               "1:     j               %l[label]               \n\t"
                 "       .option pop                             \n\t"
                 "       .pushsection    __jump_table, \"aw\"    \n\t"
                 "       .align          " RISCV_LGPTR "         \n\t"


This fixes modpost, not sure if this should be applied or not.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
