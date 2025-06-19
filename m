Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1177AC7115C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsCyeFyD73cYtwiAT14/6FMN/mgDE8nQToK9HYInfi0=; b=3BSxnP8xTRW4je
	RDF9tROQaDlGxgvVhqGQ536MiwlUF2qTV4aR5jX3jlxRopCtn8AWXVGsgQeMmJLqewPuGhQa23wrL
	/J6GyIHDMHWVVNcA37itq1kVi0M7fBZvbj4ifDHoXtuIU/KSDpRSlcx+j+o1VIGKTt25ISo7o/2qc
	uWeLCalHAykQMLGblc0wTazZLTSDfQapOHVMtEHvDgSKVoq+Y/Nuzuqnam8mX0uIxfYllLQRCrf8B
	WKc7JHPwBgj9JRLxuvf3IjQmNHwEHwIsL+yngW5QeF6joeypJrNM9c4O0BERtpHrlwzQ/T2PEFZ/R
	Rj8mzp1aZbwMjLkxhdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUQ-0000000DW4K-03i2;
	Thu, 19 Jun 2025 15:47:46 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEUS-0000000D4Tc-2HWM
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 12:35:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D64244A01;
	Thu, 19 Jun 2025 12:35:22 +0000 (UTC)
Message-ID: <21e7809a-ef55-4b4d-aa29-f6ef2bb429ee@ghiti.fr>
Date: Thu, 19 Jun 2025 14:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: futex(0x1ffffff81300000) on risc-v -> mm panic
To: rtm@csail.mit.edu, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
References: <77605.1750245028@localhost>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <77605.1750245028@localhost>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegstgefugemvgdvkeejmeegvddtkeemgeektdgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegstgefugemvgdvkeejmeegvddtkeemgeektdgupdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegstgefugemvgdvkeejmeegvddtkeemgeektdgungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhtmhestghsrghilhdrmhhithdrvgguuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtt
 hhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_053536_733109_D676B7B5 
X-CRM114-Status: GOOD (  12.88  )
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

On 6/18/25 12:10, rtm@csail.mit.edu wrote:
> This program on risc-v:
>
> main(){
>    futex((void*) 0x1ffffff81300000, FUTEX_WAIT, 0, 0, 0, 0);


This address is far beyond what userspace is supposed to be able to 
access, even in sv57, see Documentation/arch/riscv/vm-layout.rst.

The problem is that access_ok() lets it go through and then gup returns 
a kernel mapping, which isn't good at all.

I can't reproduce the issue, but it seems like commit ad5643cf2f69 
("riscv: Define TASK_SIZE_MAX for __access_ok()") is the culprit, can 
you try reverting it?

Thanks,

Alex


> }
>
> results in:
>
> BUG: Bad page state in process a.out  pfn:81500
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x81500
> flags: 0x2000(reserved|zone=0)
> raw: 0000000000002000 ff1c000000054008 ff1c000000054008 0000000000000000
> raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
> Modules linked in:
> CPU: 0 UID: 0 PID: 105 Comm: a.out Not tainted 6.16.0-rc2-00067-gb61aa0e0059b #566 NONE
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
> [<ffffffff80025b62>] dump_backtrace+0x1c/0x24
> [<ffffffff800023b8>] show_stack+0x28/0x34
> [<ffffffff800205d2>] dump_stack_lvl+0x48/0x66
> [<ffffffff80020604>] dump_stack+0x14/0x1c
> [<ffffffff80262098>] bad_page+0x118/0x15c
> [<ffffffff80264e96>] __free_frozen_pages+0x494/0x650
> [<ffffffff80266fe2>] free_frozen_pages+0xe/0x16
> [<ffffffff8020926c>] __folio_put+0x60/0xae
> [<ffffffff800ec23a>] get_futex_key+0x2da/0x44e
> [<ffffffff800f0474>] futex_wait_setup+0x52/0x23a
> [<ffffffff800f06da>] __futex_wait+0x7e/0xd8
> [<ffffffff800f0782>] futex_wait+0x4e/0xbc
> [<ffffffff800ed3a0>] do_futex+0x74/0x100
> [<ffffffff800ed4f4>] __riscv_sys_futex+0xc8/0x148
> [<ffffffff811e4930>] do_trap_ecall_u+0x84/0x11a
> [<ffffffff811f0b0e>] handle_exception+0x146/0x152
> Disabling lock debugging due to kernel taint
>
> and after running this program a few more times:
>
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x81500
> flags: 0x2000(reserved|zone=0)
> raw: 0000000000002000 ff1c000000054008 ff1c000000054008 0000000000000000
> raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) == 0)
> ------------[ cut here ]------------
> kernel BUG at ./include/linux/mm.h:1034!
> Kernel BUG [#1]
> Modules linked in:
> CPU: 0 UID: 0 PID: 110 Comm: a.out Tainted: G    B               6.16.0-rc2-00067-gb61aa0e0059b #566 NONE
> Tainted: [B]=BAD_PAGE
> Hardware name: riscv-virtio,qemu (DT)
> epc : get_futex_key+0x23c/0x44e
>   ra : get_futex_key+0x23c/0x44e
> ...
> [<ffffffff800ec19c>] get_futex_key+0x23c/0x44e
> [<ffffffff800f0474>] futex_wait_setup+0x52/0x23a
> [<ffffffff800f06da>] __futex_wait+0x7e/0xd8
> [<ffffffff800f0782>] futex_wait+0x4e/0xbc
> [<ffffffff800ed3a0>] do_futex+0x74/0x100
> [<ffffffff800ed4f4>] __riscv_sys_futex+0xc8/0x148
> [<ffffffff811e4930>] do_trap_ecall_u+0x84/0x11a
> [<ffffffff811f0b0e>] handle_exception+0x146/0x152
> Code: bdad a597 017c 8593 fa65 8526 7097 0014 80e7 a4a0 (9002) 8785
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Fatal exception in interrupt
>
> get_futex_key() calls get_user_pages_fast(), which returns a
> PG_reserved page in one of the reserve_bootmem_region() areas. Beyond
> that I do not understand the situation.
>
> Robert Morris
> rtm@mit.edu
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
