Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2345C87FCB
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 02:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9rRvQOn0s8g8gGw7/hsW2kcrVxAsnkCN1YWzOvs7po=; b=0K8Y1+quas/TEI
	U+M5zM8TQ7P8MIo1ui31wraYRC89Togq0vLI3fS6jJkwR8XWA2SjNjMIuYIzcFhUOd5XwOx74ZkvU
	VllN8V4mZteYt+rDCKRqbXrGSn8IKkXGPNpkM8UcaN6piNw8HWS6y0tdndu9Ndsi7FExaPi+1Q224
	h++HoyNovrXhHR+/y3ZrUTa6Jh/rd8WlL7PYBaiZ3XzuuFEJB0xpbbb1YEylcfi4wpm6LStmEVVah
	tnJ/l9DrioPowahaDpE17NqIMaCAuapAQCKEV7uz6eDmqwCwJi8g8V4/gE/fI0T1YrVjw8YRrtiw2
	xxwinVlzdpuUQ7Nn/RqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhIqz-00000002l5w-2qVg;
	Thu, 31 Jul 2025 02:17:09 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhIqv-00000002l59-3hn8
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 02:17:08 +0000
Received: from [192.168.0.108] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAXqloX0opoTRRbCA--.23220S2;
	Thu, 31 Jul 2025 10:16:57 +0800 (CST)
Message-ID: <ff3efc05-3d16-4720-9bc1-19cb9dc16bc9@iscas.ac.cn>
Date: Thu, 31 Jul 2025 10:16:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about earlier dynamic ftrace implementation with
 interrupt
To: Juhan Jin <juhan.jin@foxmail.com>, linux-riscv@lists.infradead.org
References: <tencent_4331B2435AFC202B9D529EAA195549C84907@qq.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <tencent_4331B2435AFC202B9D529EAA195549C84907@qq.com>
X-CM-TRANSID: zQCowAAXqloX0opoTRRbCA--.23220S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1rKF1xtr4fArWUWrW3Jrb_yoW8AFyfpa
	yvkw1q9r4DXFWUKr17Zw48GFy2vws8Xay5CrykC3yfXanFkFyvgF4xta1jq3W8Gr1Uu34I
	vF4vvrn8u395Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
	GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5r7UUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_191706_292686_22D8180D 
X-CRM114-Status: GOOD (  12.89  )
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

On 7/31/25 08:57, Juhan Jin wrote:

> I was looking at earlier dynamic ftrace implementation which used 
> stop_machine for text patching, and I have a question about interrupt
> occurred between patched instructions.
>
> Let's use commit 6724a76cff85 (riscv: ftrace: Reduce the detour code 
> size to half, 2023-01-12) as code base. This commit places 2 4-byte
> NOPs at the start of each function. These NOPs can be patched to 
> AUIPC t0, imm and JALR t0, t0(imm) to enable function tracer.
>
> Say we want to enable function tracer for kernel function `func`.
> Consider the following scenario: 
>
> - Before enabling `func` for function tracer, its first 2 instructions
>   are NOP and NOP. 
>
> - After hart A executes the first NOP at the start of `func`, an 
>   interrupt occurs and hart A handles it.
>
> - While hart A is handling this interrupt, hart B enables function 
>   tracer for `func` and stop_machine is called. IPI to hart A is 
>   pending.
>
> - After hart A handles this interrupt and sret, the pending IPI is 
>   serviced. So instead of executing the second NOP, hart A executes
>   IPI handler for stop_machine and enter quiescent state.
>
> - Hart B patches the 2 NOPs at the start of `func` to AUIPC and JALR
>
> - Hart A is released from quiescent state and resumes execution.
>   However, hart A will now execute JALR instead of NOP.
>
> - NOP plus JALR leads to illegal jump target
>
> Is this scenario possible or did I just overlook something?

The old ftrace implementation did not support CONFIG_PREEMPTION=y

select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION

Therefore, it is not possible for a stop_machine to hit between the two
instructions at the start of a function, because stop_machine will not
interrupt while preemption is disabled.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
