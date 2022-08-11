Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842AC25B07
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=l9FI/2p/mrFY5b3Zkliad95fSs+9l2UVpPks0u0i8Pw=; b=t4Z1DQHa0Yhbq1joBq7MNZ1yjH
	+LwIb+LaOj4oVBHMSZ2a3JYW9pZLnQHO75Co6x/E1xME4AP6q3xTwDAPBRE/I5kM3y+8zR12dsrfh
	C3uMTdq5dnkxlJtbZoNGkCl7hGGKOqyG0lIDRExPaNLV9go6JD2YdW5gjiUw7Fh4mSQsHKCNux9YQ
	d+q17nCGhpb2hNlukYZeFXFZqsCJk+0zf1d3RQWqe3zqpBE04WHiH/HkGOZIy1fG/y+sjbsAqocI/
	q/+z5GHkzy5XVbEvKMwLbUoc4LFgjR46H5tRN1sJAAFcHOgx1cADdEIuTxH/CNnqiRuhkfgRc0Xfk
	V/fV1OOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMG3w-005o8H-6B; Thu, 11 Aug 2022 21:49:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMG3r-005o4c-Ll
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:49:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id p8so17995706plq.13
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=INwC/ZxYjgEo52Q2Pg1ee1AN4T0Zn+PUGThlCNO5CP8=;
        b=AFv7NN6x3wDKSuF+l+O/0oTtjeqdnkphV/p2FY9khtx2aC2wSujyDjIF1Auz25BtTo
         DtJ6xFPJhiXmlywp9M953eEyGkimY/pGGf7DmhvKhKIxU//6zPYGlDUiEYDHUPjvqeuC
         pbpSYWt9oVWjqix0cGiVSUKJMFK2TO9YjIdCmNwBlbxchjuw7xppSVECtfoOKXRDglOo
         Rm66jKKKPSUsWf4o7RhF2nhiVQE6HefZPYtS6j5NG2pPGdDTS8wv4VixmMz2N+ePwslY
         83zGmz6m4x2WT9vmW4KLfi2WWc0epRNCp4XyEzyTv4Gd01ubM4leNiscAtC5ryOYYMZo
         7GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=INwC/ZxYjgEo52Q2Pg1ee1AN4T0Zn+PUGThlCNO5CP8=;
        b=KPsM1GSrmHLE90MHcpu5yvhlp0y3YA4kjqytViYuiWhODpta+2OP/VQ+Wthg0lc4tL
         N/OZrMNvdHNOohYroxdenXHeM5V2Day78ecFXrKtgP7V2V0hsFGtno7Ep9prxSM08K2J
         nt37kt+bmB0GjrrEy3U/YgXnAayZp11PtOamcKnBL5hIcw77WF/l1uMnEMhS6dpeKjtU
         zcwCkE47SQ1Txmh7qqVnEi2hLY8mAEQo0/psiBpdpY4ZbVgHF9QApQSy1b09s7qst8YW
         ycLpG4Oh2WxSsZkUTO1JWSkXYUx7Jr3Yte8L9ej7v1ZNgFNt/lcZKr9gfUbt+lt9zMDk
         ytVw==
X-Gm-Message-State: ACgBeo3cWOqKbEYtETvvDfAieqPGitBtax5FcNh7W1Mwdj/j2c3eX2fJ
	yoCegcwapsiO5i2E+irwDzN5mmrjoWns6zOV
X-Google-Smtp-Source: AA6agR6iMqNSQuylUmra+omyTyvV0IztnoH0kX7QRhURBqt0u0AOTlCaptbdQQIQ+l9VQUrrRXGFwg==
X-Received: by 2002:a17:903:324f:b0:171:3bc1:ccf5 with SMTP id ji15-20020a170903324f00b001713bc1ccf5mr1047961plb.148.1660254589568;
        Thu, 11 Aug 2022 14:49:49 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id n5-20020a622705000000b0052ea306a1e8sm151019pfn.210.2022.08.11.14.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:49:49 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:49:49 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 14:31:44 PDT (-0700)
Subject: Re: [PATCH v4] riscv:uprobe fix SR_SPIE set/clear handling
In-Reply-To: <20220721065820.245755-1-zouyipeng@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, guoren@kernel.org, penberg@kernel.org, zouyipeng@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zouyipeng@huawei.com
Message-ID: <mhng-01d4b462-bf0a-4182-bb49-248db4cf0f8e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_144951_736826_0BD035BA 
X-CRM114-Status: GOOD (  17.45  )
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

On Wed, 20 Jul 2022 23:58:20 PDT (-0700), zouyipeng@huawei.com wrote:
> In riscv the process of uprobe going to clear spie before exec
> the origin insn,and set spie after that.But When access the page
> which origin insn has been placed a page fault may happen and
> irq was disabled in arch_uprobe_pre_xol function,It cause a WARN
> as follows.
> There is no need to clear/set spie in arch_uprobe_pre/post/abort_xol.
> We can just remove it.
>
> [   31.684157] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1488
> [   31.684677] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 76, name: work
> [   31.684929] preempt_count: 0, expected: 0
> [   31.685969] CPU: 2 PID: 76 Comm: work Tainted: G
> [   31.686542] Hardware name: riscv-virtio,qemu (DT)
> [   31.686797] Call Trace:
> [   31.687053] [<ffffffff80006442>] dump_backtrace+0x30/0x38
> [   31.687699] [<ffffffff80812118>] show_stack+0x40/0x4c
> [   31.688141] [<ffffffff8081817a>] dump_stack_lvl+0x44/0x5c
> [   31.688396] [<ffffffff808181aa>] dump_stack+0x18/0x20
> [   31.688653] [<ffffffff8003e454>] __might_resched+0x114/0x122
> [   31.688948] [<ffffffff8003e4b2>] __might_sleep+0x50/0x7a
> [   31.689435] [<ffffffff80822676>] down_read+0x30/0x130
> [   31.689728] [<ffffffff8000b650>] do_page_fault+0x166/x446
> [   31.689997] [<ffffffff80003c0c>] ret_from_exception+0x0/0xc
>
> Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> v2: Add Fixes tag
> v3: Rename Subject
> v4: Add Reviewed-by tags
>
>  arch/riscv/kernel/probes/uprobes.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> index 7a057b5f0adc..c976a21cd4bd 100644
> --- a/arch/riscv/kernel/probes/uprobes.c
> +++ b/arch/riscv/kernel/probes/uprobes.c
> @@ -59,8 +59,6 @@ int arch_uprobe_pre_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>
>  	instruction_pointer_set(regs, utask->xol_vaddr);
>
> -	regs->status &= ~SR_SPIE;
> -
>  	return 0;
>  }
>
> @@ -72,8 +70,6 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>
>  	instruction_pointer_set(regs, utask->vaddr + auprobe->insn_size);
>
> -	regs->status |= SR_SPIE;
> -
>  	return 0;
>  }
>
> @@ -111,8 +107,6 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>  	 * address.
>  	 */
>  	instruction_pointer_set(regs, utask->vaddr);
> -
> -	regs->status &= ~SR_SPIE;
>  }
>
>  bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx,

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
