Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF8C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 22:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNLV4RieexZzekIEfCSGAJFx4SC6RZ9cogC1aOs15W8=; b=OzuT4xw3jEXXLh
	oLGnN8SI8JqB5+oxFfiz5OdZnDHpSDPQBSy6vHIKULLNxmzjdZEQCR63Ii0lf1N2kD2ItilyddzKI
	n/z6EdE1rfQ/tKBUCE46BJmtZNuutZKroKBK26mNPXYZLCdU171g1YOvbqdJkj/+6UPZDFfXcUffH
	iqkA4eR2OC5W2h7qYy634jPDXAUU5Nmsd1+GXfPz8xBL4JzHpvjLcm0urYdXESEJ9lNvg0cPK3G7V
	/5P8Xt2gev7LoHLnQxDoG+/OLRsi4TSHtEAHkymNaxn2T7+RLoIbQUyTxpkmJ4EOzMGio7EsSRkb7
	gqZOOmoA0BnL679FKn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q71TV-007OcU-0a;
	Wed, 07 Jun 2023 22:17:53 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q71TS-007Oay-0x
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 22:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1686176244;
	bh=cCAUrNmU+J815DYSZ5cktA1xY0j369ZobkcNeWzlNRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rpICa8dW0paV3L36PnT98YkWRgBNjRKyRngq75tXHqZJLncFlH+cGiw7N3oubG2Je
	 jjrJiVNF9CFYgAjs7POLLq4cqPA6PIoMutfpFvWDOdmfSGoC6gzn1g0tcKX1V6U6F9
	 US/OBVX6DZnFWdB/tbxsxfu8QPcmGeI744bBmMP8=
Received: from localhost ([101.224.149.128])
	by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
	id 45691E38; Thu, 08 Jun 2023 06:17:22 +0800
X-QQ-mid: xmsmtpt1686176242t9fsqhh9d
Message-ID: <tencent_79F42B5A66F98A65266F989EC9C86A69F005@qq.com>
X-QQ-XMAILINFO: M/KZc43Jb0t6fZLsxm96JoAJQZPFjaWS36XYe1dvHTvjmeJMArfgm0LyjcSCZv
	 8tsaaiZE5Jo5PKS9RiucQ2gpPFKy/mLp0dKx8/g7g1K/19jUlopw1++CeQBrCcclgcld9Hl7mEuy
	 PhLH6mWn21F4HTI1xhJa7W7kaZx6hir+HOBGvN/KulSLN118IlXeyNDBeSoufYu3FYb14aVZ4PGk
	 /TG7YB4U/aCMp36XBkhHmG+Us8HqXImvf89UwfXFJZltnvaLshq/IMtA48MmV/L31c0HizgDBjPb
	 jZnh7zgtS5wzKNg7e+l6c5DUP+jpTHlI07sd523vw76XAUgdV8VMK+0sN1YEFzHv5FHZwienqN7g
	 Pleg/QpUgsxw+5Pifczx0wBbLcg0zmHuN45rlJ9IfkGtizP5WAYYISLQ196aOy0u0muiDPnLNK2P
	 ViNFm3F87h8aUcmes9JhJK9dJkTvlBmbVe8VfATwX9KTq3oiMldHAadPlaMJsWmSCu1jnnVVf2qX
	 YRwbnC1Q0JuyH6RQ+fY58Qwa4DTSAMia6WikMwGHOz0PIffK0iEd7OlM7eLTZPg0y/juMyKBSdKw
	 ekZ+jkrM6jby/t73FKRkjTn2K8xTAy5+76GYGcclOu+XbAkUloNDDeEYUNJVNq0eAn0AWWTUXbF5
	 3mmtvOoGtMFsa0ouAZbJsmSfe8j1xZev2sR5uFrbX1gYnwhL+8WbZOeeSuK1NSAcoAzm84wZBN81
	 pea3xKqZz1MBpaHNYH2aXRDrXCyr9XzkFBkZWqcDoMGqUcWp3GJUXaEAYBkUbhZi+6W+kjjAfUDU
	 YNgBInUWA+z3osMjmocBjsLfB1i9IeUWUnKz/N0YFGYqJSkEndWh1fwFD9GdG31kMSVsmaK7B+yh
	 9xQUZTBEBCGlyfW3uX73h/BuCk8U7T1sH1+oTMG/HYJN7dlpJn6jD4duuSFQwsvSaVmPmtBtWJ8y
	 CAUc6ZUEYYDjDFGPkjgw==
Date: Thu, 8 Jun 2023 06:17:22 +0800
From: Woody Zhang <woodylab@foxmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
X-OQ-MSGID: <ZIEB8ur8gRUcOmkF@dev>
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com>
 <20230607-jogging-grudging-70dede86bc53@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-jogging-grudging-70dede86bc53@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_151750_812261_8DC46BA8 
X-CRM114-Status: GOOD (  17.99  )
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

Hi, Conor

On Wed, Jun 07, 2023 at 07:17:28PM +0100, Conor Dooley wrote:
>+CC Alex, you should take a look at this patch.
>
>On Wed, Jun 07, 2023 at 09:35:19PM +0800, Woody Zhang wrote:
>> It's possible that early_init_fdt_scan_reserved_mem() allocates memory
>> from memblock for dynamic reserved memory in `/reserved-memory` node.
>> Any fixed reservation must be done before that to avoid potential
>> conflicts.
>> 
>> Reserve the DTB in memblock just after early scanning it.
>
>The rationale makes sense to me, I am just wondering what compelling
>reason there is to move it away from the memblock_reserve()s for the
>initd and vmlinux? Moving it above early_init_fdt_scan_reserved_mem()
>should be the sufficient minimum & would keep things together.

IMO, moving it to parse_dtb() is more reasonable as early scanning and
reservation are both subject to DTB. It can also lower the risk to
mess up the sequence in the future. BTW, it's also invoked in
setup_machine_fdt() in arm64.

Thanks,
Woody

>
>Cheers,
>Conor.
>
>> 
>> Signed-off-by: Woody Zhang <woodylab@foxmail.com>
>> ---
>>  arch/riscv/kernel/setup.c | 10 ++++++++++
>>  arch/riscv/mm/init.c      |  9 ---------
>>  2 files changed, 10 insertions(+), 9 deletions(-)
>> 
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 36b026057503..c147fa8da929 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/console.h>
>>  #include <linux/screen_info.h>
>>  #include <linux/of_fdt.h>
>> +#include <linux/libfdt.h>
>>  #include <linux/sched/task.h>
>>  #include <linux/smp.h>
>>  #include <linux/efi.h>
>> @@ -256,6 +257,15 @@ static void __init parse_dtb(void)
>>  		pr_err("No DTB passed to the kernel\n");
>>  	}
>>  
>> +	/*
>> +	 * If DTB is built in, no need to reserve its memblock.
>> +	 * Otherwise, do reserve it but avoid using
>> +	 * early_init_fdt_reserve_self() since __pa() does
>> +	 * not work for DTB pointers that are fixmap addresses
>> +	 */
>> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
>> +		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>> +
>>  #ifdef CONFIG_CMDLINE_FORCE
>>  	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>>  	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index c6bb966e4123..f8c9a79acd94 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -254,15 +254,6 @@ static void __init setup_bootmem(void)
>>  	 */
>>  	early_init_fdt_scan_reserved_mem();
>>  
>> -	/*
>> -	 * If DTB is built in, no need to reserve its memblock.
>> -	 * Otherwise, do reserve it but avoid using
>> -	 * early_init_fdt_reserve_self() since __pa() does
>> -	 * not work for DTB pointers that are fixmap addresses
>> -	 */
>> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
>> -		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>> -
>>  	dma_contiguous_reserve(dma32_phys_limit);
>>  	if (IS_ENABLED(CONFIG_64BIT))
>>  		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
>> -- 
>> 2.39.2
>> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
