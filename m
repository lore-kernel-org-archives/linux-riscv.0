Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5461DC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 15:09:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4725611BF
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 15:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4725611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+YM5FWZp4s28NFmUPaiovbo8t7EUfoun84FfBJCMJRY=; b=hU5oPkJ4YJ8AVzQZaC5OfXfUD
	lHU//4ITolJ37dXMLl4jTx/DvXR700K8ypGLpBErRRUsJXdFMC9QMDqG+CZQDCiognB4Z4QAbSYc5
	BLf41xLgKG2ersqr2oGFtEQN5XvHwB6belQTQIrU4rDIA75g0msq++cYwK+hv+NtTCrdoTc2AwXdd
	DQYxMxEZwhmaQVsUYWs51pc7cImU2KzNmuRuipxx0ZyHY3mDBtCkNmt06APRRTl+Fa0izto2cZVEm
	weLFVz883WXcEbA3Wv1VVHuSL2dsrYqyUY5+i2Qwr0jGGFz36J4QAG6PQvGFsXks9HOmSP+fJUz4L
	FwSoszspQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQ65-002Yq1-Uw; Fri, 16 Apr 2021 15:09:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQ5x-002YpC-Sq
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 15:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=PQKLE0KT2gEBK1n1CR6Z4UmhBGwSLr1Jxbkws95SNZA=; b=JxBDqE6/U8wH6VkR4tfTDkqkIe
 lk2q7f8mFL3E6gpUaCMOJDzdfQFTUy1uka0n5ushW+2sQsl3HGBWz2GA74zP0Mgoj7adhauHSppWW
 4rVa3nOrRzJ7v3htb1d7Xu1gAgJ5cEr5AOW5VCIAhEyaZT2nk16kTp79J7NLbfnzUrkJbkublQKMX
 sbwossBq2Y5qKEF6ibFBsWTPR1Vc1tfGNW3hRK+P2Kdhxin5RnoZW561GJzdhZCbQHzNrx+wMMqg0
 lPkYvchYxztEJMUdPPqb4m5UCrGUVDG1U5NOzToHw0uchZnTRg9xpkVyzl3oqCXgQVYJS+1uzE3ea
 wQi9CRjQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQ5v-009URL-6i
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 15:09:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49E12611AC;
 Fri, 16 Apr 2021 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618585758;
 bh=0lwA78bwOOLororPTUfb9Az/ZjZWPhB4o/0hGsLbbyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uj0SaYrvIPMuw5EoBDejmNorFVvc23RF5L413bNKlJhBfRgjEt4J+//0E3o+rN1Xu
 yaMPGNyY9ZGDhGPBIJrBWnu0P+Unwu+zpF4ICrMQlWmYRSweOSSMRIz46K4GE1KLls
 Vr4Z5QdfgCB3Q6JLg5N/vVxjLoX6M8djZCBbjBU0/nVEALylDxMYfL48xj/Jn6+9yb
 2AQ6XXju9PLtrAy7Q9xoHUKNFXyi0EwfvzlCMYUWwNVkUFRNl+J9avtxwh72yY+QDl
 aMZV4+PNgrlXcM3qMKS5g/caahn+Pw988SPSEnfFGmCPmGEntW8q+la8zyuWd6iG/g
 XboLAzZWA1EoA==
Date: Sat, 17 Apr 2021 00:09:14 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: <Jisheng.Zhang@synaptics.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <guoren@linux.alibaba.com>,
 <penberg@kernel.org>, <mingo@kernel.org>, <lkp@intel.com>, <me@packi.ch>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv/kprobe: Restore local irqflag if kprobe is
 cancelled
Message-Id: <20210417000914.f4e181ca4710f9d39fdd31f8@kernel.org>
In-Reply-To: <20210416082731.121494-1-liaochang1@huawei.com>
References: <20210416082731.121494-1-liaochang1@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_080919_338954_3D4A080A 
X-CRM114-Status: GOOD (  22.19  )
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

On Fri, 16 Apr 2021 16:27:31 +0800
Liao Chang <liaochang1@huawei.com> wrote:

> The execution of sys_read end up hitting a BUG_ON() in __find_get_block after
> installing probe at sys_read via kprobe, the BUG message like the following:
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
> 	cat trace
> 
> Here's what happens to hit that BUG_ON():
> 
> If instruction being single stepped caused page fault, the
> kprobe is cancelled to let the page fault handler continues
> as normal page fault. But the local irqflags are disabled,
> so CPU will restore 'sstatus' with 'SIE' masked. After page
> fault is serviced, the kprobe is triggered again, we overwrite
> the saved irqflag by calling kprobe_save_local_irqflag(). Note,
> 'SIE' is masked in this new saved irqflag. After kprobe is
> serviced, the CPU 'sstatus' is restored with 'SIE' masked.
> This overwritten 'sstatus' cause BUG_ON() in __find_get_block.
> 
> This bug is already fixed on arm64 by Jisheng Zhang.
> 
> Fixes: c22b0bcb1dd02 ("riscv: Add kprobes supported")
> Signed-off-by: Liao Chang <liaochang1@huawei.com>

Looks good to me.

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> ---
> 
> Changes in v2:
> - Reorganize commit message.
> 
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
> -- 
> 2.17.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
