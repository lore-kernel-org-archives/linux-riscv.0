Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD43C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:53:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51911613CC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51911613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zw5VKUfqC5Op/7PaUJfDgPox5RxF75tKU34RP17toXg=; b=BJh8jWiPQDuOIt/YHQngdXwMc
	XtQ5ludJ7HgkCAz25QZQD08Lm7gdlfnJV8xrCKAD5HzfZqmasM+PB8S6vmPaYAADt9zaSttfC2bmI
	bd1gtSQ/TxT4FzA/nAbXAi59BgQwlECcEZ2GIlTPC/Au3uCvyAkvDIvVfZHrQreRbIBnf3PoIoucz
	WhFiIybjDBqIuKHPSST9ATvdvE9Qfq/h9ChpSEnnrff3rcy1DdTK5Xhytam4xWQLF8h2p4UTsYQlF
	OkIZOBgk6OhOlCAlGTRHIHovm6IsDj/OThCabJ7DWbVjT7dbIUQXvKlkCqBz1tUSP5O1++HSlYBz0
	NGpkrYdWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZkzl-000Jjf-TI; Fri, 23 Apr 2021 01:52:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkzP-000JiA-8a
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 01:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=AiHVqz2ZM9GbopK8GrCcTF54E/i2NQ9u5jilhDOJuRE=; b=Wp2ySQ9fj9BMyWG8w9tXnKvg8l
 I567rSnU2rtxCXuGFwd3aFjhj1IRVJo2WzZOZzy9UGxs92p6BAO5Z64bXE323dCZQt3rd19kILNBo
 xuHbdabA3Dq9bEcmKs9vYXdgLFmcSYYHiKUXUy4jnpVFMQvT0vFGk5xQQwDMrCUBi3ZMVIlMprJe5
 b02KMlTrGq2qyW8BOI8burz6SKwn4M/YmLzNgS2R5hu9L0+uq7JISLnJr/Mv3X/Y9Rqw3UFk2YU94
 F2XbTHiZUYxuT9PI3PoOKmCAhI4cLS6mqbG4mI2l0wtJ3Cxf6fEEk69hcWPKRCNJIeELu2SDZ036J
 aFAOcXCQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkzL-00E5hq-B4
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 01:52:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso346513pjb.4
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 18:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=AiHVqz2ZM9GbopK8GrCcTF54E/i2NQ9u5jilhDOJuRE=;
 b=W4gJKQ4ZMAf5rIX7i7nyhW5N2PmY2iiejKjAVEp70tzVSI/RmgXSp/HT2gimvD3Ftu
 5+yKrBJdDjE+bh2zAcMwDnbWKidg2+MRCwuaH+ualj+q0dbbEn7LtvtQht3oGskDk6s6
 eYZeAUistrNjrhqj4EwYSh5WHL5myCvjDA9oUlsTFRy7p5Ckte+91Kf0cdba6KgjanKy
 7QAp97UCxnoL61onek3F2WTfuHhSCsz9Y8GmKFzSIwHRhj8CDf1pRNsQuFprZOJwxFIh
 esReJ7f7pRXzefJ3LZv4um9Ao8qt4IBxBQ9AzbbWJTNYdtFRqYWuCygCkcWWy2HpdqSj
 /pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=AiHVqz2ZM9GbopK8GrCcTF54E/i2NQ9u5jilhDOJuRE=;
 b=lyiwRvwssHwX2bB1Fmeu2BrQYiNpQ9wTm+3J5rItVbgYCKAWs/eqH0tcpBMR9kiRsT
 gzr+P6YsuAgSvrAjjC8LxfVH5tT5/+Tgu7CIkegrLriRbXKJtrx5JuwZotm5tlKjuSsn
 QsgyOeRijqsHDGvbGOJozWpHZcb7712Qdq9lvCZ1Ml1QfkHpymvBUcbWuca4MY2lNPXf
 ipw3WD69QvIfUfCK5OVyeM/pHdnb00tjl7GTXXTSWN2fjUfWVNh0eErzwTpqKu96EToj
 sbC79Fez8K9v1AO60zKXqQri6ntFCkqWFGY0Mws57N+UIm1hs6ACCvoJ3KxyYroT6piz
 YE1g==
X-Gm-Message-State: AOAM530A4WM4/ywo9zQegkZGLHgmlXacTlOFX8sa12H0nVEYYQX5GviD
 l/ji1C+4smFsWfhRPtKn/vuO2g==
X-Google-Smtp-Source: ABdhPJyzRjdUJ0WNvSFPxEBrMRrXaH9r1e4asketjQTy1cc9hCIxWZ0pZ59ybpNxlodmeH4lUjmJeA==
X-Received: by 2002:a17:90a:4d8a:: with SMTP id
 m10mr1707999pjh.42.1619142729330; 
 Thu, 22 Apr 2021 18:52:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v8sm3059263pfm.128.2021.04.22.18.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 18:52:08 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:52:08 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 18:51:40 PDT (-0700)
Subject: Re: [PATCH] riscv/kprobe: fix kernel panic when invoking sys_read
 traced by kprobe
In-Reply-To: <20210330081848.14043-1-liaochang1@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 guoren@linux.alibaba.com, mhiramat@kernel.org, penberg@kernel.org,
 lkp@intel.com, me@packi.ch, 
 liaochang1@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liaochang1@huawei.com
Message-ID: <mhng-afc94428-3903-4949-8d3e-f7a081886e38@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_185211_406595_C9EED8B7 
X-CRM114-Status: GOOD (  31.25  )
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

On Tue, 30 Mar 2021 01:18:48 PDT (-0700), liaochang1@huawei.com wrote:
> The execution of sys_read end up hitting a BUG_ON() in __find_get_block
> after installing kprobe at sys_read, the BUG message like the following:
>
> [   65.708663] ------------[ cut here ]------------
> [   65.709987] kernel BUG at fs/buffer.c:1251!
> [   65.711283] Kernel BUG [#1]
> [   65.712032] Modules linked in:
> [   65.712925] CPU: 0 PID: 51 Comm: sh Not tainted 5.12.0-rc4 #1
> [   65.714407] Hardware name: riscv-virtio,qemu (DT)
> [   65.715696] epc : __find_get_block+0x218/0x2c8
> [   65.716835]  ra : __getblk_gfp+0x1c/0x4a
> [   65.717831] epc : ffffffe00019f11e ra : ffffffe00019f56a sp : ffffffe002437930
> [   65.719553]  gp : ffffffe000f06030 tp : ffffffe0015abc00 t0 : ffffffe00191e038
> [   65.721290]  t1 : ffffffe00191e038 t2 : 000000000000000a s0 : ffffffe002437960
> [   65.723051]  s1 : ffffffe00160ad00 a0 : ffffffe00160ad00 a1 : 000000000000012a
> [   65.724772]  a2 : 0000000000000400 a3 : 0000000000000008 a4 : 0000000000000040
> [   65.726545]  a5 : 0000000000000000 a6 : ffffffe00191e000 a7 : 0000000000000000
> [   65.728308]  s2 : 000000000000012a s3 : 0000000000000400 s4 : 0000000000000008
> [   65.730049]  s5 : 000000000000006c s6 : ffffffe00240f800 s7 : ffffffe000f080a8
> [   65.731802]  s8 : 0000000000000001 s9 : 000000000000012a s10: 0000000000000008
> [   65.733516]  s11: 0000000000000008 t3 : 00000000000003ff t4 : 000000000000000f
> [   65.734434]  t5 : 00000000000003ff t6 : 0000000000040000
> [   65.734613] status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
> [   65.734901] Call Trace:
> [   65.735076] [<ffffffe00019f11e>] __find_get_block+0x218/0x2c8
> [   65.735417] [<ffffffe00020017a>] __ext4_get_inode_loc+0xb2/0x2f6
> [   65.735618] [<ffffffe000201b6c>] ext4_get_inode_loc+0x3a/0x8a
> [   65.735802] [<ffffffe000203380>] ext4_reserve_inode_write+0x2e/0x8c
> [   65.735999] [<ffffffe00020357a>] __ext4_mark_inode_dirty+0x4c/0x18e
> [   65.736208] [<ffffffe000206bb0>] ext4_dirty_inode+0x46/0x66
> [   65.736387] [<ffffffe000192914>] __mark_inode_dirty+0x12c/0x3da
> [   65.736576] [<ffffffe000180dd2>] touch_atime+0x146/0x150
> [   65.736748] [<ffffffe00010d762>] filemap_read+0x234/0x246
> [   65.736920] [<ffffffe00010d834>] generic_file_read_iter+0xc0/0x114
> [   65.737114] [<ffffffe0001f5d7a>] ext4_file_read_iter+0x42/0xea
> [   65.737310] [<ffffffe000163f2c>] new_sync_read+0xe2/0x15a
> [   65.737483] [<ffffffe000165814>] vfs_read+0xca/0xf2
> [   65.737641] [<ffffffe000165bae>] ksys_read+0x5e/0xc8
> [   65.737816] [<ffffffe000165c26>] sys_read+0xe/0x16
> [   65.737973] [<ffffffe000003972>] ret_from_syscall+0x0/0x2
> [   65.738858] ---[ end trace fe93f985456c935d ]---
>
> A simple reproducer looks like:
> 	echo 'p:myprobe sys_read fd=%a0 buf=%a1 count=%a2' > /sys/kernel/debug/tracing/kprobe_events
> 	echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe/enable
> 	cat /sys/kernel/debug/tracing/trace
>
> Here's what happens to hit that BUG_ON():
>
> 1) After installing kprobe at entry of sys_read, the first instruction
>    is replaced by 'ebreak' instruction on riscv64 platform.
>
> 2) Once kernel reach the 'ebreak' instruction at the entry of sys_read,
>    it trap into the riscv breakpoint handler, where it do something to
>    setup for coming single-step of origin instruction, including backup
>    the 'sstatus' in pt_regs, followed by disable interrupt during single
>    stepping via clear 'SIE' bit of 'sstatus' in pt_regs.
>
> 3) Then kernel restore to the instruction slot contains two instructions,
>    one is original instruction at entry of sys_read, the other is 'ebreak'.
>    Here it trigger a 'Instruction page fault' exception (value at 'scause'
>    is '0xc'), if PF is not filled into PageTabe for that slot yet.
>
> 4) Again kernel trap into page fault exception handler, where it choose
>    different policy according to the state of running kprobe. Because
>    afte 2) the state is KPROBE_HIT_SS, so kernel reset the current kprobe
>    and 'pc' points back to the probe address.
>
> 5) Because 'epc' point back to 'ebreak' instrution at sys_read probe,
>    kernel trap into breakpoint handler again, and repeat the operations
>    at 2), however 'sstatus' without 'SIE' is keep at 4), it cause the
>    real 'sstatus' saved at 2) is overwritten by the one withou 'SIE'.
>
> 6) When kernel cross the probe the 'sstatus' CSR restore with value
>    without 'SIE', and reach __find_get_block where it requires the
>    interrupt must be enabled.
>
> Fix this is very trivial, just restore the value of 'sstatus' in pt_regs
> with backup one at 2) when the instruction being single stepped cause a
> page fault.
>
> Fixes: c22b0bcb1dd02 ("riscv: Add kprobes supported")
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/kernel/probes/kprobes.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 7e2c78e2ca6b..d71f7c49a721 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -260,8 +260,10 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int trapnr)
>
>  		if (kcb->kprobe_status == KPROBE_REENTER)
>  			restore_previous_kprobe(kcb);
> -		else
> +		else {
> +			kprobes_restore_local_irqflag(kcb, regs);
>  			reset_current_kprobe();
> +		}
>
>  		break;
>  	case KPROBE_HIT_ACTIVE:

Sorry, I missed this when going through everything for fixes.  I've just 
put it on for next, as I don't really want te send along anything this 
late.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
