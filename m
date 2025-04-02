Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8649C28B20
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJsHxbNhuJc/UsOpj12/aZjGUBJ0dJgSD/kUuLAMR+M=; b=DM5apFy6jPjali
	N65r6RFDqyHf3BIhAKhn5PyENW1L6hur3xk8tuRGWTWg2FqX2bzdenBfUxGe/tf4E06Jui/ksZwZQ
	3X630KXMAo4al6OtddUmEyFNEH0ND34UV1OKffETUN8zDa2pu6c77CRNcTGZyTqLxhV1dOxw/dPUD
	zQX3unoSHBPNXIZY9Co4O2VPfjTaUY4mL13J+RgepinsatYmoh54lbAb4Ig+RG1qfYDI6/tge1sLJ
	syCQSSlIDEhK/uAvNS8Rtn1yI6p4JRZaaC9BH2AeoTzrmE3PGw480YlP5WG6w8D+sgMxnpLZSGOnB
	I9353R0vvNsGVfi1KfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsd5-00000005Oh0-3Y2e;
	Wed, 02 Apr 2025 07:35:19 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsd3-00000005Ofx-3PSX
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 07:35:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9B57442AD;
	Wed,  2 Apr 2025 07:35:12 +0000 (UTC)
Message-ID: <0c89da8c-10e5-42d2-99cd-557b25a8e91c@ghiti.fr>
Date: Wed, 2 Apr 2025 09:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] riscv: mm: Add page fault trace points
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Gabriele Monaco <gmonaco@redhat.com>, john.ogness@linutronix.de,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
References: <cover.1741708239.git.namcao@linutronix.de>
 <672e2bed604c307c807f546627ba5a9454ef10eb.1741708239.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <672e2bed604c307c807f546627ba5a9454ef10eb.1741708239.git.namcao@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepfedurdefvddrkedurddukeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfedurdefvddrkedurddukeejpdhhvghloheplgduledvrdduieekrddvuddrfedungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnrghmtggroheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepghhmohhnrggtohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhhohhhnrdhoghhnvghssheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhtrhgrtggvqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnu
 higqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_003518_005721_573897B0 
X-CRM114-Status: GOOD (  11.89  )
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

Hi Nam,

On 11/03/2025 18:05, Nam Cao wrote:
> Add page fault trace points, which are useful to implement RV monitor that
> watches page faults.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-riscv@lists.infradead.org
> ---
>   arch/riscv/mm/fault.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 0194324a0c50..04ed6f8acae4 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -20,6 +20,9 @@
>   #include <asm/ptrace.h>
>   #include <asm/tlbflush.h>
>   
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/exceptions.h>
> +
>   #include "../kernel/head.h"
>   
>   static void show_pte(unsigned long addr)
> @@ -291,6 +294,11 @@ void handle_page_fault(struct pt_regs *regs)
>   	if (kprobe_page_fault(regs, cause))
>   		return;
>   
> +	if (user_mode(regs))
> +		trace_page_fault_user(addr, regs, cause);
> +	else
> +		trace_page_fault_kernel(addr, regs, cause);
> +
>   	/*
>   	 * Fault-in kernel-space virtual memory on-demand.
>   	 * The 'reference' page table is init_mm.pgd.


For this riscv part, you can add:

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
