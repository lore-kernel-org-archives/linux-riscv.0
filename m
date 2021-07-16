Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776FCC07E95
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 13:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C32B613E9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 13:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C32B613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZL/cNv5WKub9EMJyZJZX8gSD3OOqRioV3XHcICkwkaE=; b=BvGwqcXWdEai+H
	dW5XtE3KSS4E1zPw1M1yKodsziytFAlcSIsg9VQvOPSsLWZ84yiII0T1bE8JBy450rG9vkDt6dwvT
	pO9tI9kq20RsOaq0dZNNtSoWddYOiaY5QDKe2BucLP5uYcbniM8SOD7vNXFiWL0YEw9nXN+wAwOQ1
	aG4HWGKCzxE/4xcOVPqvrqsXLDyGaYcwS03F0dJ2Pu/nmNFoecO072LwNVZJY78jFmw6r6Cq0k/1a
	HhFpxVIANaf6besPtLtNslC9ZBEIxFZHB5UoQaVpDW2iORg50oaq40Mk5KA+f5OeSahqVDQHz3b6N
	vBWyeRDj9LWoH9MZPlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4NRU-004Pkp-SJ; Fri, 16 Jul 2021 12:59:48 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4NRR-004Pk5-On
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 12:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=gJp4uhng6XGVh1uI3SPMRc8jBI7zlJyUgu
 K1yat+0f0=; b=ozyYhWN6GNm0z7GokalWRwG7MuILvu2vif8zkh6MgHQOnB1dql
 l/1zhj9SIQ8sq2cAr0wmNfAOPhCXwWjMia+eA1A16PfkW4AVzrOnm8E0iLIvJfPC
 PyUsiT6J6bUCRlxVSaLCRlGzUKo6Wf2usLIFhKWaRq/lJDvENHrt8zOZY=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygA3t2CwgvFg14l7AA--.1243S2; 
 Fri, 16 Jul 2021 20:59:28 +0800 (CST)
Date: Fri, 16 Jul 2021 20:53:32 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Tong Tiangen <tongtiangen@huawei.com>, <palmerdabbelt@google.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
Message-ID: <20210716205332.5856df78@xhacker>
In-Reply-To: <87pmvjtumc.fsf@igel.home>
References: <20210621032855.130650-1-tongtiangen@huawei.com>
 <87pmvjtumc.fsf@igel.home>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygA3t2CwgvFg14l7AA--.1243S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1fAr4xXw4fZw15Jr47urg_yoW5Xw1fpr
 yUXr1UCa10vr17Ar1rAr1rJr1UXry7Aa4UJr1xJr15CF1Uuw1kXrykJa1xGr1DZw1rAF17
 Jr1DXws7Kr47Gw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8fwIDUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_055946_527152_30763F35 
X-CRM114-Status: UNSURE (   8.04  )
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

Hi Andreas,

On Thu, 15 Jul 2021 18:22:19 +0200
Andreas Schwab <schwab@linux-m68k.org> wrote:

> On Jun 21 2021, Tong Tiangen wrote:
> 
> > This patch adds stack overflow detection to riscv, usable when
> > CONFIG_VMAP_STACK=y.  
> 
> This breaks get_wchan:

I can't reproduce the panic error. Mind to share your .config?

Thanks in advance

> 
> [   65.609696] Unable to handle kernel paging request at virtual address ffffffd0003bbde8
> [   65.610460] Oops [#1]
> [   65.610626] Modules linked in: virtio_blk virtio_mmio rtc_goldfish btrfs blake2b_generic libcrc32c xor raid6_pq sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
> [   65.611670] CPU: 2 PID: 1 Comm: systemd Not tainted 5.14.0-rc1-1.g34fe32a-default #1 openSUSE Tumbleweed (unreleased) c62f7109153e5a0897ee58ba52393ad99b070fd2
> [   65.612334] Hardware name: riscv-virtio,qemu (DT)
> [   65.613008] epc : get_wchan+0x5c/0x88
> [   65.613334]  ra : get_wchan+0x42/0x88
> [   65.613625] epc : ffffffff800048a4 ra : ffffffff8000488a sp : ffffffd00021bb90
> [   65.614008]  gp : ffffffff817709f8 tp : ffffffe07fe91b80 t0 : 00000000000001f8
> [   65.614411]  t1 : 0000000000020000 t2 : 0000000000000000 s0 : ffffffd00021bbd0
> [   65.614818]  s1 : ffffffd0003bbdf0 a0 : 0000000000000001 a1 : 0000000000000002
> [   65.615237]  a2 : ffffffff81618008 a3 : 0000000000000000 a4 : 0000000000000000
> [   65.615637]  a5 : ffffffd0003bc000 a6 : 0000000000000002 a7 : ffffffe27d370000
> [   65.616022]  s2 : ffffffd0003bbd90 s3 : ffffffff8071a81e s4 : 0000000000003fff
> [   65.616407]  s5 : ffffffffffffc000 s6 : 0000000000000000 s7 : ffffffff81618008
> [   65.616845]  s8 : 0000000000000001 s9 : 0000000180000040 s10: 0000000000000000
> [   65.617248]  s11: 000000000000016b t3 : 000000ff00000000 t4 : 0c6aec92de5e3fd7
> [   65.617672]  t5 : fff78f60608fcfff t6 : 0000000000000078
> [   65.618088] status: 0000000000000120 badaddr: ffffffd0003bbde8 cause: 000000000000000d
> [   65.618621] [<ffffffff800048a4>] get_wchan+0x5c/0x88
> [   65.619008] [<ffffffff8022da88>] do_task_stat+0x7a2/0xa46
> [   65.619325] [<ffffffff8022e87e>] proc_tgid_stat+0xe/0x16
> [   65.619637] [<ffffffff80227dd6>] proc_single_show+0x46/0x96
> [   65.619979] [<ffffffff801ccb1e>] seq_read_iter+0x190/0x31e
> [   65.620341] [<ffffffff801ccd70>] seq_read+0xc4/0x104
> [   65.620633] [<ffffffff801a6bfe>] vfs_read+0x6a/0x112
> [   65.620922] [<ffffffff801a701c>] ksys_read+0x54/0xbe
> [   65.621206] [<ffffffff801a7094>] sys_read+0xe/0x16
> [   65.621474] [<ffffffff8000303e>] ret_from_syscall+0x0/0x2
> [   65.622169] ---[ end trace f24856ed2b8789c5 ]---
> [   65.622832] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> Andreas.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
