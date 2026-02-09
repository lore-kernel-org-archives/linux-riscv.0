Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC76BE78D44
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bybKN++bUvT15t8SeZ5QyHJjTXc4Ynm19uBUUiw3FdE=; b=FEP2PKxohrc9gV
	BJT3mLrXemwhuMcWFvNplJroC0cP/lakYQ2Ip/Y8uVkGBH8UkHNXvILxxzaVazrcB5Bddr9+XxVV3
	tBBrwUX/csSA6CIn3qBjIQ+NpZaTdN6KjjG16gMlckHU55S3n8mj/6F89vhg8jW+vkv5VdN6ZRizh
	3DIqToE/gi2BVfXDKWpwFxHYaSvWytLOH4djmQO5fobEZZeKGTQNX0RLyVSwfNFY4zMGv2pDmmY9f
	IghPf4SBwZUAGQwfNNjOC6CIIHW6f1tE2+zbky9c1Xik9dDQppkZXezkcpOhEYpyjLnWwDcT2n5Vh
	lXdepY/1AW+jam9StaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMjG-0000000F2mM-0CaB;
	Mon, 09 Feb 2026 08:34:46 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpMjC-0000000F2lv-0X86
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 08:34:44 +0000
Received: from [10.213.19.201] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAB3CAwWnIlpVc3gBw--.42006S2;
	Mon, 09 Feb 2026 16:34:31 +0800 (CST)
Message-ID: <3ed8b576-723f-4c3b-8394-cd9255c2b63c@iscas.ac.cn>
Date: Mon, 9 Feb 2026 16:34:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: fpu: refine FPU save flow
To: Hui Min Mina Chou <minachou@andestech.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tim609@andestech.com, ben717@andestech.com, az70021@gmail.com,
 Charles Ci-Jyun Wu <dminus@andestech.com>
References: <20260205055342.572379-1-minachou@andestech.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260205055342.572379-1-minachou@andestech.com>
X-CM-TRANSID: zQCowAB3CAwWnIlpVc3gBw--.42006S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyxCrWDuF1rtry5Ar1fZwb_yoWDCwc_uF
	s3Kr92yrWfK3Z8Ka1jg397Jr92yw1rWryxXw4DZF9Fv3s8JF93XF4q9r1Sq39rGanYgF9x
	Crs8A34xua4fZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jrCzZUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_003442_546523_F6304F84 
X-CRM114-Status: UNSURE (   7.45  )
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

On 2/5/26 13:53, Hui Min Mina Chou wrote:
> From: Charles Ci-Jyun Wu <dminus@andestech.com>
>
> When Kernel first time run to arch_dup_task_struct(),
> it will check if sstatus.FS is dirty. If it is dirty,
> then it will do FPU save flow. But this field is
> floating currently. Meanwhile if the combination between
> platform(HW) and Kernel(SW) about FPU configuration
> is mismatch. eq: The platform is without FPU and Kernel
> is with FPU. Then Kernel may trigger illegal instruction
> here.

This doesn't really make sense. fstate_save checks for ((regs->status &
SR_FS) == SR_FS_DIRTY). Do you mean that a platform can be !has_fpu(),
yet come up with a task_pt_regs(...)->status that's SR_FS?

Do you have some reproduction steps on how this bug can be triggered?
QEMU should support disabling F/D.

If by "floating" you mean task_pt_regs(src)->status is uninitialized
somehow, that's the bug that needs to be fixed. Adding a band-aid here
just confuses everyone without addressing the problem.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
