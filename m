Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4467AC54EAA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkkHXRRGnrglX6W1tgPTCGh1JlWkuNso9easgB0vJMU=; b=wOmiCu62HXosnV
	u8Kadh80qg4sEBAsdeCOC2crxqNo87dv+U3yKEsziJrxVpUU7DSJKgTdN0OVSxWzTGtt900gqpvFc
	gueCatvCk1E1GI8Zye+NhDljVN9eNsPSt+OsNFq1+pmuFH73S5VEcEMth4yOp77mkXrwXy309bJuy
	mCxlFcFtw5DpxF1wfkv/pFA569yfz1zT5zvTWmuEN2ZWzMMrV5kf/IDNrnR5Pr0E6IRwrVL77pNjI
	CcbhU1kPijjVn2vXesW0E0hgIqwQ5suin9G2/DNwV05ZTz+2+Ia52mGcK4d0ulb0FEUsFxHEgx/Sj
	iXlZZ+QlXH6l2lpPXCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhja-007p4g-1I; Wed, 25 Jan 2023 15:30:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfW-007Vc8-Jf
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:22:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id be8so5119088plb.7
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ew3vZo2pVfV8U2bSvN4f2u18nXuKAkb+BzL0BPqJZc=;
        b=g1IiI2wxbiYzl8yz52VMtrN062rAACUxS7tcmpU4VpQmYGy0dAoLQATQXCdQpeABQO
         +3EV+4En3dcria10TeZyzui+DUvvYmvIrjnClrNURiNuuXAUw8qJAsMt2OOR4D57fTPu
         vDfhbG4l28N/2ADe/AIV8H7jOGeWTHxASSzby7VmHnP3QdLHFnEr3xSWdpL5CwzPpZzz
         U0YCaNMSJF+Mc15J3QCDutCwDvBYbLeWMf2DWJoXukMav9GP0dRODn+jXHrBcTKj9Hq1
         4tNCSXBu+i4jNGaKdp0V3LKBmT/1SdmbNsS8ColEmEbEyNduf2lZLBfmEHUtMRmUY4PF
         je4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ew3vZo2pVfV8U2bSvN4f2u18nXuKAkb+BzL0BPqJZc=;
        b=ATwLQgKgsT0sDeQEj28Qy3+rZRNeQfqFsI1sGNvihthVYCEAtxFVWDek9FVzvEOgik
         Quf5F6t1gVLWeBQZXK2gvLVFTADWt4b64B+RTfixjVMTfhv8hyxPVuPH5YQnq8S1Tu1U
         qrfy0jGbQMV9XYk6YLbfsjV+P6bVEwBspKjgRQhLoP1Li9Y1052C9+RhP+5KKaTRt2hq
         r6VYzLiWL7rzehrm9lmjCgA4f9T3qzYJbzCKlwtSzR/bthu1021OXUC0E80iiDkc4phs
         Y/TvoF5UWmi304XxDc3cmFAGObKk34/EmNwN/p4jU4IKu77zbjJZURU7iPYUG4lo3UpC
         CrRw==
X-Gm-Message-State: AFqh2kr60NjqFlW9a9BuiC2U79BKAK+y/3+7WngejXSjhHlc38Ze+htB
	xvMhrMkMPX1TbSwOXzglSS+QgmKsa4MSaajSLh23UEtf6Z/4AqVFlzmMhTcblzhguBygM3132xx
	c5+ij4cpO1ygjIy3BGGeGAUk2V7F0gmTNeggBbovRlD8CQI7xKBKdWJe6wpHJLIC98tTFcrAgvo
	V8LzrtOl/AHw==
X-Google-Smtp-Source: AMrXdXsnNjWMnsRjB1iBltkh2gDQaK/DHbfJzZ7b+wSLN3cyzVSacV7JZf1ZenHBOTj2dxOg0Y5dzg==
X-Received: by 2002:a05:6a20:12d1:b0:b8:36a7:c5c5 with SMTP id v17-20020a056a2012d100b000b836a7c5c5mr41708514pzg.27.1674656550009;
        Wed, 25 Jan 2023 06:22:30 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:22:29 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	ShihPo Hung <shihpo.hung@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Myrtle Shah <gatecat@ds0.me>
Subject: [PATCH -next v13 15/19] riscv: Fix a kernel panic issue if $s2 is set to a specific value before entering Linux
Date: Wed, 25 Jan 2023 14:20:52 +0000
Message-Id: <20230125142056.18356-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062230_685063_38DD82A7 
X-CRM114-Status: GOOD (  15.55  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Panic log:
[    0.018707] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    0.023060] Oops [#1]
[    0.023214] Modules linked in:
[    0.023725] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.14.0 #33
[    0.023955] Hardware name: SiFive,FU800 (DT)
[    0.024150] epc : __vstate_save+0x1c/0x48
[    0.024654]  ra : arch_dup_task_struct+0x70/0x108
[    0.024815] epc : ffffffff80005ad8 ra : ffffffff800035a8 sp : ffffffff81203d50
[    0.025020]  gp : ffffffff812e8290 tp : ffffffff8120bdc0 t0 : 0000000000000000
[    0.025216]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : ffffffff81203d80
[    0.025424]  s1 : ffffffff8120bdc0 a0 : ffffffff8120c820 a1 : 0000000000000000
[    0.025659]  a2 : 0000000000001000 a3 : 0000000000000000 a4 : 0000000000000600
[    0.025869]  a5 : ffffffff8120cdc0 a6 : ffffffe00160b400 a7 : ffffffff80a1fe60
[    0.026069]  s2 : ffffffe0016b8000 s3 : ffffffff81204000 s4 : 0000000000004000
[    0.026267]  s5 : 0000000000000000 s6 : ffffffe0016b8000 s7 : ffffffe0016b9000
[    0.026475]  s8 : ffffffff81203ee0 s9 : 0000000000800300 s10: ffffffff812e9088
[    0.026689]  s11: ffffffd004008000 t3 : 0000000000000000 t4 : 0000000000000100
[    0.026900]  t5 : 0000000000000600 t6 : ffffffe00167bcc4
[    0.027057] status: 8000000000000720 badaddr: 0000000000000000 cause: 000000000000000f
[    0.027344] [<ffffffff80005ad8>] __vstate_save+0x1c/0x48
[    0.027567] [<ffffffff8000abe8>] copy_process+0x266/0x11a0
[    0.027739] [<ffffffff8000bc98>] kernel_clone+0x90/0x2aa
[    0.027915] [<ffffffff8000c062>] kernel_thread+0x76/0x92
[    0.028075] [<ffffffff8072e34c>] rest_init+0x26/0xfc
[    0.028242] [<ffffffff80800638>] arch_call_rest_init+0x10/0x18
[    0.028423] [<ffffffff80800c4a>] start_kernel+0x5ce/0x5fe
[    0.029188] ---[ end trace 9a59af33f7ba3df4 ]---
[    0.029479] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.029907] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

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
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 7cc975ce619d..512ebad013aa 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -301,6 +301,7 @@ clear_bss_done:
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
+	addi sp, sp, -PT_SIZE
 #ifdef CONFIG_BUILTIN_DTB
 	la a0, __dtb_start
 	XIP_FIXUP_OFFSET a0
@@ -318,6 +319,7 @@ clear_bss_done:
 	/* Restore C environment */
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
+	addi sp, sp, -PT_SIZE
 
 #ifdef CONFIG_KASAN
 	call kasan_early_init
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
