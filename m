Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC20DC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwOunhuuQaUqS3RDeZnO6GckSvvERW2iLbwhoJJC+lA=; b=ASmRGBUkR3WPe7O+QxPUaBD5U4
	3wlleRko6fiRuC843YhtFi7xu1n0IQ88CI2lrMvgWK8641lr6Ao7LhisCbRyKyJSgazpGyItOsPBF
	uP/GEQ6BvkZfx/XQQCOATlI0uLuLWZtSu6IeP98C3jHY+1BLkdNbeN21+rVAr7J2Jg0bZJgkZeqJs
	ShpUYiiU6nlyBB2mfOHqwzfD7FeeOXaX/WFEHaouNG1I72CUgC1XcF5kGEaOpJ0R6H/dwf3pXtnxE
	+17jTQ5ZnMAMpwSTcC6Uf3aE80BS5PrmWmnlk9PxE1PaL9d3kj/srlCcgUTshmz0ufd/lRvYfwhI7
	jPo8wyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny6vV-00HTzm-GO; Mon, 06 Jun 2022 07:13:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny6vS-00HTyc-6e
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 07:13:24 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LGl5k2LY8zgYp0;
	Mon,  6 Jun 2022 15:11:22 +0800 (CST)
Received: from [10.67.111.227] (10.67.111.227) by
 kwepemi500014.china.huawei.com (7.221.188.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 6 Jun 2022 15:13:08 +0800
Subject: Re: [PATCH] riscv: kexec: build
 {kexec_relocate,crash_save_regs,machine_kexec}.c as kexec core files
To: Changbin Du <changbin.du@huawei.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Changbin Du <changbin.du@gmail.com>, Hui Wang <hw.huiwang@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220606035635.o52ja3bjpru3fqcf@M910t>
From: "lizhengyu (E)" <lizhengyu3@huawei.com>
Message-ID: <56da43f4-605f-4d89-af7a-cdc7bc429f94@huawei.com>
Date: Mon, 6 Jun 2022 15:13:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220606035635.o52ja3bjpru3fqcf@M910t>
X-Originating-IP: [10.67.111.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_001322_474258_9D4C8E23 
X-CRM114-Status: GOOD (  11.45  )
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

Thanks, but it has a solution already. See 
https://lore.kernel.org/all/20220601070204.26882-1-lizhengyu3@huawei.com/ .

On Mon, 06 Jun 2022 11:56:35 +0800, Changbin Du <changbin.du@huawei.com> 
wrote:
> This fixes below linking errors when building with CONFIG_KEXEC_FILE=y &&
> CONFIG_KEXEC=n. The {kexec_relocate,crash_save_regs,machine_kexec}.c should
> be core kexec source files.
>
> riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `kimage_free':
> /home/changbin/work/linux-riscv/kernel/kexec_core.c:651: undefined reference to `machine_kexec_cleanup'
> riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `__crash_kexec':
> /home/changbin/work/linux-riscv/kernel/kexec_core.c:981: undefined reference to `machine_crash_shutdown'
> riscv64-linux-gnu-ld: /home/changbin/work/linux-riscv/kernel/kexec_core.c:982: undefined reference to `machine_kexec'
> riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `crash_setup_regs':
> /home/changbin/work/linux-riscv/./arch/riscv/include/asm/kexec.h:35: undefined reference to `riscv_crash_save_regs'
> riscv64-linux-gnu-ld: kernel/kexec_core.o: in function `kernel_kexec':
> /home/changbin/work/linux-riscv/kernel/kexec_core.c:1200: undefined reference to `machine_shutdown'
> riscv64-linux-gnu-ld: /home/changbin/work/linux-riscv/kernel/kexec_core.c:1204: undefined reference to `machine_kexec'
> riscv64-linux-gnu-ld: kernel/kexec_file.o: in function `__do_sys_kexec_file_load':
> /home/changbin/work/linux-riscv/kernel/kexec_file.c:363: undefined reference to `machine_kexec_prepare'
> riscv64-linux-gnu-ld: /home/changbin/work/linux-riscv/kernel/kexec_file.c:363: undefined reference to `machine_kexec_prepare'
> make: *** [Makefile:1160: vmlinux] Error 1
>
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>   arch/riscv/kernel/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index c71d6591d539..33bb60a354cd 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -78,7 +78,7 @@ obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>   endif
>   obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>   obj-$(CONFIG_KGDB)		+= kgdb.o
> -obj-$(CONFIG_KEXEC)		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
> +obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
>   obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
>   obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
