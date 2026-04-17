Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5BF8E499
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 02:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rzuhgdg3FcuQdv/bmc9BV4BXYynVTAcH17j6FX3sCgs=; b=A3mPCmlhBPfhCk
	+K7Qt8mIs+pCilFko+aVJ+F9fkBHeyTQoIr1/TprhHAd9FSSwxS3TzxHCIbv7s+SUSgL+P/KsI0qS
	IEzDu+Ys/vE8WjNjGZP+D6JU5J80MfoncAztFNVijURZeft9nyXdhetJjx/5Q+1kGYHzvxdEqTNBa
	2tmmNMRraHEQ/KteGcuy82NPyLANIYv+rSNdlB3DztHKVI8NtjdVY7WQVvqTR76Y2fx5Bt5k7TFSe
	jJIdSg5p2cnOVHzscwahkupkh6huT8Gu5QPtU/b9WxtlrfxvmunQiP2CQN6rOHCtMU2CTAzYkIful
	g99FSHQRYx6TSr2LwBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYiy-00000003JlX-3RQJ;
	Fri, 17 Apr 2026 02:14:28 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYiu-00000003Jjo-1mvb
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 02:14:27 +0000
Received: from [10.213.21.49] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3CAx3l+FpiTPQDQ--.39611S2;
	Fri, 17 Apr 2026 10:14:15 +0800 (CST)
Message-ID: <57c53629-6e30-4a43-8d42-4c47ad965d5d@iscas.ac.cn>
Date: Fri, 17 Apr 2026 10:14:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: mm: Implement arch_within_stack_frames() for
 HARDENED_USERCOPY
To: cp0613@linux.alibaba.com, pjw@kernel.org, alex@ghiti.fr,
 cleger@rivosinc.com, alexghiti@rivosinc.com, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260414100111.99567-1-cp0613@linux.alibaba.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260414100111.99567-1-cp0613@linux.alibaba.com>
X-CM-TRANSID: zQCowAB3CAx3l+FpiTPQDQ--.39611S2
X-Coremail-Antispam: 1UD129KBjvJXoWruF1xWw13KF43uw1DuF1rZwb_yoW8JF45pF
	Z7Cwn3KFW5Cr1I9rZrAFykuF1rtwnY9a45Kr95Ja409r4ftrWjqr1kt345Cr98WF4DWw1I
	kF429wnxGa1DKaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU89Z23UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_191424_868187_F9A4E4DB 
X-CRM114-Status: UNSURE (   8.66  )
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

Hi Chen Pei,

Thanks for the patch.

On 4/14/26 18:01, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> Implement arch_within_stack_frames() to enable precise per-frame stack
> object validation for CONFIG_HARDENED_USERCOPY on RISC-V.

[...]

> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 36918c9200c9..5899877c2a49 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -101,6 +101,74 @@ struct thread_info {
>  void arch_release_task_struct(struct task_struct *tsk);
>  int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>  
> +/*
> + * RISC-V stack frame layout (with frame pointer enabled).
> + *
> + * Reference: RISC-V ELF psABI, Frame Pointer Convention
> + *   https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/
> + *   riscv-cc.adoc#frame-pointer-convention
> + *

I don't know what the maintainers would prefer, but I would personally
prefer to break the line "limit" here and put the URL in one line, so
that it's clickable in editors.

Otherwise:

Reviewed-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
