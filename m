Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D63C6FA8E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JErx8qwIDxj7Lq5ES+oWaTgiHLRFJQJC777IsZdWZls=; b=jWnBzBcEq6Gokl
	eQ0Zai2tL7/nhNGsuQjUQ87RBwKb9g6NKTVo/jvqNAXHKCrFgJ2XzV4udND16X7dyPd6p++KpfdsS
	4IQZzIM7Hh4noHHsuu3Sz6b5NExOp7a5JEbkGSMxAX+CIvj+Mo/TAEbrCX6Hw6Dl5Ir754bwn4a3O
	P5sZlZSTBhzDjcmhlTsI79iIel+5+Lb9paj/CgqHOsxHBeaIufJ3GXHV2fzblrCfU449pnaOtNRd5
	b8HsTf/tVMmqAHYuN8IfIG14P1TJttaNch7UGmY0bublwyCLI1eeyHeeK3M9MThRSblYsKrJxXkiC
	pkSxm2iw6T8oz0aRj4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2vp-00C45L-KM; Wed, 21 Sep 2022 16:50:41 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2vm-00C42s-NF
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:50:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id n15so3965418wrq.5
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=2gHgaIeXWsDaK0jT9I81izavyxaAOC2Z2MO2p3WE3C4=;
        b=nkeni2Jn+Kuku0Chnr478GEVpIWCpyu/jXkU1/ZsCUZaIVLYjEWnomRI0L3SSQooVs
         ZHKss5UCQvu4bnTjQDdZtJugLaF/ye6eqQq2lrx2Nz130K1g3Cl9I7RZqOpL92h7mQdE
         7gwXp3OVqYed0YbMi0z+37Vta/gOf2fYNP+H1iS+spYIDXmwFiBrhkLEe7pJP/bfaNsc
         rT9NvoNF+F8yAIXq68FxrVwxq6fzaLbiW8jxsd7nKtS8TvCjw2qXlaORPpZVuXFgtbGe
         6JAm3OricsYWlmUyIt11ZTDDLj+h8eDZLxv3vZuk8Db5m629AIjiLCV9HklIsKpqqPYC
         4hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=2gHgaIeXWsDaK0jT9I81izavyxaAOC2Z2MO2p3WE3C4=;
        b=tgubpHlIQzyxGasUJUSoNYWNFW03BlqOvb94Fa6gWe00NJ7mNRiKFqIdCegNETOBlM
         JQi661V6E3kX98gPcG1uhJ7A/mMRBout1q+rIIuDcXffin2f7QRonHX0xHlyKaVmurnB
         vIU/l70G8BTVpnpce02meySPS1cZl9aWkOQk7aJVMhdPw4Brotd1HuEJAHqs07VSnnO+
         LMJGSnbNNRJKY0H2Euxu47tIOSZPzDALGpbJZtPDyQqEFVvQgmYmPKc3ZiC9f+Gn3jly
         xMtNP8ujHPdjMfXOQV2GZgWDIfTK9/TT39bgm54p6CZQzDMNueU10YaBuZ/Up8S5yRhd
         AM9Q==
X-Gm-Message-State: ACrzQf31TYrXv/0hTMwSxAAp2q0oIzyH0kMp5Mg5lW8rLS77kCieuoqZ
	jFu8p8W0kQbN3XTkgX5kBI9TWnEQX8AWT3Oo8aKwL8xnoqDrDg==
X-Google-Smtp-Source: AMsMyM5egBqt8G1bG4m7b5OUvFG+8mLc1ag2sSWFSoiQm2i9VOXx8QmLfjU+VdmTT8HCS5Set7wcZ/o6sm3rB+IANKI=
X-Received: by 2002:adf:dcc8:0:b0:22a:b9e3:bab8 with SMTP id
 x8-20020adfdcc8000000b0022ab9e3bab8mr17956544wrm.341.1663779037122; Wed, 21
 Sep 2022 09:50:37 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:50:01 -0700
Message-ID: <CAM2SziVvaN5YAmq6r1ynvwrDo6xG5nrqwMG4E8icsdFO4BnHyQ@mail.gmail.com>
Subject: [PATCH 14/17] riscv: Fix a kernel panic issue if $s2 is set to a
 specific value before entering Linux
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_095038_781004_105FD8D9 
X-CRM114-Status: GOOD (  15.02  )
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

Panic log:
[    0.018707] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[    0.023060] Oops [#1]
[    0.023214] Modules linked in:
[    0.023725] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.14.0 #33
[    0.023955] Hardware name: SiFive,FU800 (DT)
[    0.024150] epc : __vstate_save+0x1c/0x48
[    0.024654]  ra : arch_dup_task_struct+0x70/0x108
[    0.024815] epc : ffffffff80005ad8 ra : ffffffff800035a8 sp :
ffffffff81203d50
[    0.025020]  gp : ffffffff812e8290 tp : ffffffff8120bdc0 t0 :
0000000000000000
[    0.025216]  t1 : 0000000000000000 t2 : 0000000000000000 s0 :
ffffffff81203d80
[    0.025424]  s1 : ffffffff8120bdc0 a0 : ffffffff8120c820 a1 :
0000000000000000
[    0.025659]  a2 : 0000000000001000 a3 : 0000000000000000 a4 :
0000000000000600
[    0.025869]  a5 : ffffffff8120cdc0 a6 : ffffffe00160b400 a7 :
ffffffff80a1fe60
[    0.026069]  s2 : ffffffe0016b8000 s3 : ffffffff81204000 s4 :
0000000000004000
[    0.026267]  s5 : 0000000000000000 s6 : ffffffe0016b8000 s7 :
ffffffe0016b9000
[    0.026475]  s8 : ffffffff81203ee0 s9 : 0000000000800300 s10:
ffffffff812e9088
[    0.026689]  s11: ffffffd004008000 t3 : 0000000000000000 t4 :
0000000000000100
[    0.026900]  t5 : 0000000000000600 t6 : ffffffe00167bcc4
[    0.027057] status: 8000000000000720 badaddr: 0000000000000000
cause: 000000000000000f
[    0.027344] [<ffffffff80005ad8>] __vstate_save+0x1c/0x48
[    0.027567] [<ffffffff8000abe8>] copy_process+0x266/0x11a0
[    0.027739] [<ffffffff8000bc98>] kernel_clone+0x90/0x2aa
[    0.027915] [<ffffffff8000c062>] kernel_thread+0x76/0x92
[    0.028075] [<ffffffff8072e34c>] rest_init+0x26/0xfc
[    0.028242] [<ffffffff80800638>] arch_call_rest_init+0x10/0x18
[    0.028423] [<ffffffff80800c4a>] start_kernel+0x5ce/0x5fe
[    0.029188] ---[ end trace 9a59af33f7ba3df4 ]---
[    0.029479] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.029907] ---[ end Kernel panic - not syncing: Attempted to kill
the idle task! ]---

The NULL pointer accessing caused the kernel panic. There is a NULL
pointer is because in vstate_save() function it will check
(regs->status & SR_VS) == SR_VS_DIRTY and this is true, but it shouldn't
be true because vector is not used here. Since vector is not used, datap
won't be allocated so it is NULL. The reason why regs->status is set to
a wrong value is because pt_regs->status is put in stack and it is polluted
after setup_vm() called.

In prologue of setup_vm(), we can observe it will save s2 to stack however
s2 is meaningless here because the caller is assembly code and s2 is just
some value from previous stage. The compiler will base on calling
convention to save the register to stack. Then 0x80008638 in s2 is saved
to stack. It might be any value. In this failure case it is 0x80008638 and
it will accidentally cause SR_VS_DIRTY to call the vstate_save() function.

(gdb) info addr setup_vm
Symbol "setup_vm" is a function at address 0xffffffff80802c8a.
(gdb) va2pa 0xffffffff80802c8a
$64 = 0x80a02c8a
(gdb) x/10i 0x80a02c8a
   0x80a02c8a:  addi    sp,sp,-48
   0x80a02c8c:  li      a3,-1
   0x80a02c8e:  auipc   a5,0xff7fd
   0x80a02c92:  addi    a5,a5,882
   0x80a02c96:  sd      s0,32(sp)
   0x80a02c98:  sd      s2,16(sp) <-- store to stack

After returning from setup_vm()
(gdb) x/20i  0x0000000080201138
   0x80201138:  mv      a0,s1
   0x8020113a:  auipc   ra,0x802
   0x8020113e:  jalr    -1200(ra)    <-- jump to setup_vm()
   0x80201142:  auipc   a0,0xa03
(gdb) p/x $sp
$70 = 0x81404000
(gdb) p/x *(struct pt_regs*)($sp-0x120)
$71 = {
  epc = 0x0,
  ra = 0x0,
  sp = 0x0,
  gp = 0x0,
  tp = 0x0,
  t0 = 0x0,
  t1 = 0x0,
  t2 = 0x0,
  s0 = 0x0,
  s1 = 0x0,
  a0 = 0x0,
  a1 = 0x0,
  a2 = 0x0,
  a3 = 0x81403f90,
  a4 = 0x80c04000,
  a5 = 0x1,
  a6 = 0xffffffff81337000,
  a7 = 0x81096700,
  s2 = 0x81400000,
  s3 = 0xffffffff81200000,
  s4 = 0x81403fd0,
  s5 = 0x80a02c6c,
  s6 = 0x8000000000006800,
  s7 = 0x0,
  s8 = 0xfffffffffffffff3,
  s9 = 0x80c01000,
  s10 = 0x81096700,
  s11 = 0x82200000,
  t3 = 0x81404000,
  t4 = 0x80a02dea,
  t5 = 0x0,
  t6 = 0x82200000,
  status = 0x80008638, <- Wrong value in stack!!!
  badaddr = 0x82200000,
  cause = 0x0,
  orig_a0 = 0x80201142
}
(gdb) p/x $pc
$72 = 0x80201142
(gdb) p/x sizeof(struct pt_regs)
$73 = 0x120

Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 2c81ca42ec4e..c7effef23f41 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -301,6 +301,7 @@ clear_bss_done:
        la tp, init_task
        la sp, init_thread_union + THREAD_SIZE
        XIP_FIXUP_OFFSET sp
+       addi sp, sp, -PT_SIZE
 #ifdef CONFIG_BUILTIN_DTB
        la a0, __dtb_start
        XIP_FIXUP_OFFSET a0
@@ -318,6 +319,7 @@ clear_bss_done:
        /* Restore C environment */
        la tp, init_task
        la sp, init_thread_union + THREAD_SIZE
+       addi sp, sp, -PT_SIZE

 #ifdef CONFIG_KASAN
        call kasan_early_init
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
