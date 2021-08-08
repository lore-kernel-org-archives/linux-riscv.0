Return-Path: <SRS0=xysQ=M7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626A8C4338F
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 16:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5AD360EB5
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 16:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5AD360EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VPWvQIa+/7Vxut8lJUpztM9MDVG2gweTV25vuPu9CE=; b=3Ka80rf7r8WWhO
	dS5Z+cuIsiZSnZbRPjVtMVIfwRdupBtKJD9K8E7gmPMmVePX1AdZ2ZHPWuR7CM4GiuTh2mhLSqXbm
	xK2hCJ+S4FS4KWnvmtknJbIc/sdOzzWYggtUAnDggzrMbc7nz4A1uF/w81g8yZdi6RtTrDSqKFrtY
	HeyduzQMncqsBtJPnSbgpcp2mlhk9NbcDMcHtU1UMyQi4qQMAs/MNlzcQN5UsI7WZTe/dgAz62ped
	8IuWmGWb1R8YP8q53hzbpMGIHwD45Vf5wPAG3oCc/0iwF7xuQW1HkrOrL8ldlNGQrTi6jbeaPKoTe
	5Sz7Bk1Nzanwuw1sP1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCm3U-00G6tM-EO; Sun, 08 Aug 2021 16:53:44 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCm3R-00G6sl-TW
 for linux-riscv@lists.infradead.org; Sun, 08 Aug 2021 16:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=ZlpGlINjO738rfcPWHz16lEywLUedKd/Q7
 UOu39tLJU=; b=mntOGDXdQH5Zl8PLhIIieUroKJCSI1zLs7DO7wMTK0M6HnSQ2M
 R/n+eDm6P1zHIOs6F0AjiG9JiexZ8R0+zNsvM5qXw5L6mOJKIfhK3ovETLaskFhG
 +w5TUwyd5QzzHF7vgTyIYzmtZsUfVpwRZO1TR+DXh75B9LF8lUY+fU004=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAXHg4LDBBh3sUMAA--.2551S2; 
 Mon, 09 Aug 2021 00:53:31 +0800 (CST)
Date: Mon, 9 Aug 2021 00:47:26 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: oleg@redhat.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: Ensure the value of FP registers in the core
 dump file is up to date
Message-ID: <20210809004726.583b43db@xhacker>
In-Reply-To: <1627982871-29807-1-git-send-email-vincent.chen@sifive.com>
References: <1627982871-29807-1-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAXHg4LDBBh3sUMAA--.2551S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4rXw1xuF4DZryxuF1Utrb_yoW8Zr4fpF
 WDCa1UGa1Dur48WasFya1j9FykW3sIgrW3GFyDt3WrtF43trWrGwnrKFyDtrsruryjk3yU
 ZFWj939akw4DXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
 vaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2_HUDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_095342_443427_E658E6E1 
X-CRM114-Status: GOOD (  17.70  )
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

On Tue,  3 Aug 2021 17:27:51 +0800
Vincent Chen <vincent.chen@sifive.com> wrote:

> The value of FP registers in the core dump file comes from the
> thread.fstate. However, kernel saves the FP registers to the thread.fstate
> only before scheduling out the process. If no process switch happens
> during the exception handling process, kernel will not have a chance to
> save the latest value of FP registers to thread.fstate. It will cause the
> value of FP registers in the core dump file may be incorrect. To solve this
> problem, this patch force lets kernel save the FP register into the
> thread.fstate if the target task_struct equals the current.

Nice catch! I think there's another case too: since last kernel save, the FP
registers has been modified by the userspace, we also need to force fstate_save()
This patch fixes both cases.

> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> 
> ---
> Changes since the v1 patch
> 1. Include switch_to.h to avoid compiling error.
> 
> ---
>  arch/riscv/kernel/ptrace.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 1a85305720e8..9c0511119bad 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -10,6 +10,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/syscall.h>
>  #include <asm/thread_info.h>
> +#include <asm/switch_to.h>
>  #include <linux/audit.h>
>  #include <linux/ptrace.h>
>  #include <linux/elf.h>
> @@ -56,6 +57,9 @@ static int riscv_fpr_get(struct task_struct *target,
>  {
>  	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
>  
> +	if (target == current)
> +		fstate_save(current, task_pt_regs(current));
> +
>  	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
>  	membuf_store(&to, fstate->fcsr);
>  	return membuf_zero(&to, 4);	// explicitly pad



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
