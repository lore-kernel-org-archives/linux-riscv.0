Return-Path: <SRS0=UIeb=74=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81162C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2020 07:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57DC320738
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2020 07:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHny3cMC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="axkMGOdv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57DC320738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ToGcomrsNJ5IsfmhCaE8bj4p8OLeJAdAKZdbE/NfmE=; b=LHny3cMCMHr9of+VrVA9tOFOqJ
	Ij45NjLctvpcEA4D5ctuLQL17d/qOIrq2nGUHIHm9H7s4GAg+8mBGEGjHPF+dwQhKi1I5TINhyAXO
	Vn0Zy/bVbY6EWSVq1KpBEqct30rTgYdhvXtlQLeWZ2Boc6aj2mNtwvL2W7BfIuuP/YbABKsH6DwQG
	1LC8cpqi+orgSTfIuRH8MWACVmw9AVtvcEVZWp8XD/IBzisYYVYG7LevJPExs2QQdeyEnvgDjhQ3Q
	ICzeI3VXc+WmOmojgIfS3Fyag28KsefzurSm22o1G7kr1l7GSymo1lDcszgKyh0WZn6tqBaPNYO/i
	zzE5Gqiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkjXg-0008LR-AW; Mon, 15 Jun 2020 07:28:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjXd-0008Ke-LP
 for linux-riscv@lists.infradead.org; Mon, 15 Jun 2020 07:28:27 +0000
Received: by mail-wm1-x342.google.com with SMTP id l17so13537389wmj.0
 for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2020 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9ToGcomrsNJ5IsfmhCaE8bj4p8OLeJAdAKZdbE/NfmE=;
 b=axkMGOdv9xLipRtu44iTU38CgJZWN3aUB1wusgLSnk2LzS4fkQWhlzyqCR3D23JqE+
 wsp9mE7nsz0zDlxmsm8gh5Dg63hg4kIhHDI3RJhwcUqyUruLhbtuj8M8WMxU1djpyGCd
 c184Q1pfdDkEui78I9h8YHkgfEsr4KdzG05EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9ToGcomrsNJ5IsfmhCaE8bj4p8OLeJAdAKZdbE/NfmE=;
 b=GbV1cOgLOlzPf7odNPvDxBrvTuVST/rTbG7/HD/K8rodO/hQU7u0qlL12jT0cboFfg
 2U2m+T8SgeN+CsJGoyfmeTfuaw9exkDkFK7NaAU9j0OgYrI4YqGfdOxwEb6WmOJ/XRRQ
 rSJIqJWgHni3e5+QGd2VoVRO9ygYa6gPIzc3PH9+7y1IofKj0orCcV5ywKzc7ZF3S3Q3
 WDsrex17tuVmVisqhFAs4xzaXz1/RfWiAihIr7X1cHKxjNIz7o4PHoRAVrAk56jAHChm
 Hxb6vuc+Rz/z9ViFg223IDfk9VofWARGyyo2v5edP4MQdLnPHsPD6CnIhLZA5gSj7xRD
 Irlw==
X-Gm-Message-State: AOAM530iMnpHiHHqdeVrnwDomlqcFfjIByPZpnLiYMmHMhDqEZlLJLUO
 e0Go/it0wf7oMQVDm9AMyh+yoH+2fMa5hknT0clSowVQ5g==
X-Google-Smtp-Source: ABdhPJzNCm18ZlyzfvaKvuSBWE7doCfmV4oGQgC7ad2B8XbLG8+xVEGL+6XoLxHvsCiFmGssQL7rpcOX9LFTbvrjAZk=
X-Received: by 2002:a1c:f608:: with SMTP id w8mr11354791wmc.78.1592206102980; 
 Mon, 15 Jun 2020 00:28:22 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 15 Jun 2020 00:28:11 -0700
Message-ID: <CAOnJCUJ_rA6TW0QgmDkXnrMoyKKMBygzs1sFQukuJ3mAF3Cu1w@mail.gmail.com>
Subject: mm lock issue while booting Linux on 5.8-rc1 for RISC-V
To: linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_002825_769165_F39F5FFC 
X-CRM114-Status: UNSURE (   5.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Bjorn Topel <bjorn.topel@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,
I encountered the following issue while booting 5.8-rc1 on Qemu for RV64.
I added additional dump_stack and observed that it's happening in bpf free path.
It happens always if CONFIG_DEBUG_VM is enabled. VM_BUG_ON_MM is
compiled away without that.
------------------------------------------------------------------------
forked to background, child pid 113
[   10.328850] CPU: 3 PID: 51 Comm: kworker/3:1 Not tainted
5.8.0-rc1-dirty #732
[   10.331739] Workqueue: events bpf_prog_free_deferred
[   10.334133] Call Trace:
[   10.338039] [<ffffffe000202698>] walk_stackframe+0x0/0xa4
[   10.339988] [<ffffffe000202880>] show_stack+0x2e/0x3a
[   10.340902] [<ffffffe00047074c>] dump_stack+0x72/0x8c
[   10.341451] [<ffffffe0002db4ce>] mmap_assert_locked.part.13+0x14/0x1c
[   10.342131] [<ffffffe0002db330>] walk_page_range_novma+0x0/0x4e
[   10.342973] [<ffffffe000204f94>] set_direct_map_invalid_noflush+0x66/0x6e
[   10.343917] [<ffffffe0002e0706>] __vunmap+0xe8/0x212
[   10.344680] [<ffffffe0002e0882>] __vfree+0x22/0x6e
[   10.345270] [<ffffffe0002e0902>] vfree+0x34/0x56
[   10.345834] [<ffffffe00027d752>] __bpf_prog_free+0x2c/0x36
[   10.346529] [<ffffffe0002801a2>] bpf_prog_free_deferred+0x74/0x8a
[   10.347394] [<ffffffe000219c70>] process_one_work+0x13a/0x272
[   10.348239] [<ffffffe00021a4b4>] worker_thread+0x50/0x2e4
[   10.348900] [<ffffffe00021ed98>] kthread+0xfc/0x10a
[   10.349470] [<ffffffe0002013da>] ret_from_exception+0x0/0xc
[   10.354405] mm ffffffe001018600 mmap 0000000000000000 seqnum 0 task_size 0
[   10.354405] get_unmapped_area 0000000000000000
[   10.354405] mmap_base 0 mmap_legacy_base 0 highest_vm_end 0
[   10.354405] pgd ffffffe001074000 mm_users 2 mm_count 1
pgtables_bytes 8192 map_count 0
[   10.354405] hiwater_rss 0 hiwater_vm 0 total_vm 0 locked_vm 0
[   10.354405] pinned_vm 0 data_vm 0 exec_vm 0 stack_vm 0
[   10.354405] start_code ffffffe000200000 end_code ffffffe00084acc2
start_data 0 end_data ffffffe00106dfe4
[   10.354405] start_brk 0 brk ffffffe0010bd6d0 start_stack 0
[   10.354405] arg_start 0 arg_end 0 env_start 0 env_end 0
[   10.354405] binfmt 0000000000000000 flags 0 core_state 0000000000000000
[   10.354405] ioctx_table 0000000000000000
[   10.354405] exe_file 0000000000000000
[   10.354405] tlb_flush_pending 0
[   10.354405] def_flags: 0x0()
[   10.369325] ------------[ cut here ]------------
[   10.370763] kernel BUG at include/linux/mmap_lock.h:81!
[   10.375235] Kernel BUG [#1]
[   10.377198] Modules linked in:
[   10.378931] CPU: 3 PID: 51 Comm: kworker/3:1 Not tainted 5.8.0-rc1-dirty #732
[   10.380179] Workqueue: events bpf_prog_free_deferred
[   10.381270] epc: ffffffe0002db4d4 ra : ffffffe0002db4d4 sp : ffffffe3eaea7c70
[   10.382561]  gp : ffffffe00106d950 tp : ffffffe3ef752f80 t0 :
ffffffe0010836e8
[   10.383996]  t1 : 0000000000000064 t2 : 0000000000000000 s0 :
ffffffe3eaea7c90
[   10.385119]  s1 : ffffffe001018600 a0 : 0000000000000289 a1 :
0000000000000020
[   10.386099]  a2 : 0000000000000005 a3 : 0000000000000000 a4 :
ffffffe001012758
[   10.387294]  a5 : 0000000000000000 a6 : 0000000000000102 a7 :
0000000000000006
[   10.388265]  s2 : ffffffe3f00674c0 s3 : ffffffe00106e108 s4 :
ffffffe00106e100
[   10.389250]  s5 : ffffffe00106e908 s6 : 0000000000000000 s7 :
6db6db6db6db6db7
[   10.390272]  s8 : 0000000000000001 s9 : ffffffe00021a4f8 s10:
ffffffffffffffff
[   10.391293]  s11: ffffffe3f0066600 t3 : 000000000001a7a8 t4 :
000000000001a7a8
[   10.392314]  t5 : 0000000000000000 t6 : ffffffe00107b76b
[   10.393096] status: 0000000000000120 badaddr: 0000000000000000
cause: 0000000000000003
[   10.397755] ---[ end trace 861659596ac28841 ]---
---------------------------------------------------------------------------------------------------

I haven't had the chance to bisect to figure out which commit caused
the issue. Just wanted
to check if it is a known issue already.

Regards,
Atish

