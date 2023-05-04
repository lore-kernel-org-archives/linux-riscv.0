Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408E2C77B75
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 02:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6RX5eP+P0BIwpjR2h5cKG7MAvWa8MiLIK2ohznLIDs=; b=TGcYXyK+z3LhGv
	4ro+Usb17p96bcuUqsl/sGC+IitpQUnSJ9Ccaq1dZaJsWc++bO0BPmk7mymmUMqTF0IE6qx1iWI7c
	tcyyk5mPb56FSnfNz3Eh/3zMYj7+D3iBLUXp4obIlkwTtS35P00LdPFEuZ18/NGgv8F313LN/VTvl
	PsPzpCtGhB5MAU4Shn+9SPECN78RSlSm6jBO6IjAtpoH7bPxFRWwC8E+ymurJEv1cjqtCs//RPcmJ
	YWa+zNzzsrxirIU6vDiHz6f/bBwqUDuZ1MIXmr7O74C/4whtDbVL2R6Srip+hBw63brKkP52IfqT6
	Bec/zMyx2Da27fAquoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puOVO-006MLa-2v;
	Thu, 04 May 2023 02:15:38 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puNLH-006FYX-19
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 01:01:09 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QBb7j3gBJzkXtx;
	Thu,  4 May 2023 08:59:45 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 09:00:51 +0800
Message-ID: <071ab5f1-6d6a-ab1f-6bf1-f5a18c1307e0@huawei.com>
Date: Thu, 4 May 2023 09:00:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] riscv: fix kprobe __user string arg print fault issue
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230423091235.968980-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230423091235.968980-1-ruanjinjie@huawei.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_180107_580262_69CB8780 
X-CRM114-Status: GOOD (  12.05  )
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

Ping.

On 2023/4/23 17:12, ruanjinjie wrote:
> On riscv qemu platform, when add kprobe event on do_sys_open() to show
> filename string arg, it just print fault as follow:
> 
> echo 'p:myprobe do_sys_open dfd=$arg1 filename=+0($arg2):string flags=$arg3
> mode=$arg4' > kprobe_events
> 
> bash-166     [000] ...1.   360.195367: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6
> 
> bash-166     [000] ...1.   360.219369: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6
> 
> bash-191     [000] ...1.   360.378827: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename=(fault) flags=0x98800 mode=0x0
> 
> As riscv do not select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE,
> the +0($arg2) addr is processed as a kernel address though it is a
> userspace address, cause the above filename=(fault) print. So select
> ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE to avoid the issue, after that the
> kprobe trace is ok as below:
> 
> bash-166     [000] ...1.    96.767641: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename="/dev/null" flags=0x8241 mode=0x1b6
> 
> bash-166     [000] ...1.    96.793751: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename="/dev/null" flags=0x8241 mode=0x1b6
> 
> bash-177     [000] ...1.    96.962354: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename="/sys/kernel/debug/tracing/events/kprobes/"
> flags=0x98800 mode=0x0
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> ---
> v2:
> - add the config in alphabetical order
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index eb7f29a412f8..b462ed7d41fe 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -25,6 +25,7 @@ config RISCV
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_MMIOWB
> +	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_PMEM_API
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_SET_DIRECT_MAP if MMU

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
