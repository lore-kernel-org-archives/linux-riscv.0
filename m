Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DB5ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZubcgfvUtmRRvv08yh1dueCtGfpkUx5jiPirjFefgGA=; b=bHCqnqR2mXtM1r
	ubJ7xj56i5/OwxMAYyamQi/5qBy77ZwLoY0620wPU7ErvW/8fPGlOc4dBUjjNiTJE8e7sDAA+WRpk
	61O8b/wRaFltF7chF94YHcnRYOJq7de5Oq+5n9jGwsRlb/baMeIQoEcNrNzbjgNAV3HD4kklyAEnS
	VSsPYSBwKpmTp9XLHWUWBh3UWj7Ou5Wsmuv1Wv1WSNAmFgrrqle3TA2FDe0V/xb5GmxfLviVRVCpk
	Un0h4wmUTmmuHMJ20rI2y1AXD/5bco9UtNGn+9GlhAtNUnwbyKorXuIoF3E7xCN/Kzj329YpwUAn/
	0NWAOmO+Yd56JEdDnkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavJQ-00A3Vi-6M; Wed, 21 Sep 2022 08:42:32 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavC5-00A0BP-T4
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 08:34:59 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MXWnH3N6hzMn6D;
	Wed, 21 Sep 2022 16:30:11 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 16:34:53 +0800
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 16:34:52 +0800
Message-ID: <afa17bdd-2d11-4015-6e2a-7a39db931d09@huawei.com>
Date: Wed, 21 Sep 2022 16:34:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH V5 08/11] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Content-Language: en-US
To: <guoren@kernel.org>, <arnd@arndb.de>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<conor.dooley@microchip.com>, <heiko@sntech.de>, <jszhang@kernel.org>,
	<lazyparser@gmail.com>, <falcon@tinylab.org>, <chenhuacai@kernel.org>,
	<apatel@ventanamicro.com>, <atishp@atishpatra.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <mark.rutland@arm.com>, <zouyipeng@huawei.com>,
	<bigeasy@linutronix.de>, <David.Laight@aculab.com>
CC: <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>
References: <20220918155246.1203293-1-guoren@kernel.org>
 <20220918155246.1203293-9-guoren@kernel.org>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <20220918155246.1203293-9-guoren@kernel.org>
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_013458_156389_6A0DB9C7 
X-CRM114-Status: UNSURE (   7.72  )
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

Hi,

On 2022/9/18 23:52, guoren@kernel.org wrote:
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 5f49517cd3a2..426529b84db0 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -332,6 +332,33 @@ ENTRY(ret_from_kernel_thread)
>   	tail syscall_exit_to_user_mode
>   ENDPROC(ret_from_kernel_thread)
>   
> +#ifdef CONFIG_IRQ_STACKS
> +ENTRY(call_on_stack)
> +	/* Create a frame record to save our ra and fp */
> +	addi	sp, sp, -RISCV_SZPTR
> +	REG_S	ra, (sp)
> +	addi	sp, sp, -RISCV_SZPTR
> +	REG_S	fp, (sp)
> +
> +	/* Save sp in fp */
> +	move	fp, sp
> +
> +	/* Move to the new stack and call the function there */
> +	li	a3, IRQ_STACK_SIZE
> +	add	sp, a1, a3
> +	jalr	a2
> +
> +	/*
> +	 * Restore sp from prev fp, and fp, ra from the frame
> +	 */
> +	move	sp, fp
> +	REG_L	fp, (sp)
> +	addi	sp, sp, RISCV_SZPTR
> +	REG_L	ra, (sp)
> +	addi	sp, sp, RISCV_SZPTR
> +	ret
> +ENDPROC(call_on_stack)
> +#endif

Seems my compiler (riscv64-linux-gnu-gcc 8.4.0, cross compiling from 
x86) cannot recognize the register `fp`.

After I changed it to `s0` this can pass compiling.


Seems there is nowhere else using `fp`, can this just using `s0` instead?

Best,

Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
