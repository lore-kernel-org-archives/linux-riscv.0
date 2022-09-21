Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E643C6FA8E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbobfLEtfjh9A+2/Foc2C+co08hCfYp4LyCinU0Bf3Q=; b=CkQ8sPX7B0O9Hs
	+iOrzTXO5tM9/eUdzWxoUvE08aHj+C999UNy5RtdJdjKTmJ9NjyrlVhQXunrPbpMDW7W0x1pgYaql
	mviyRwcSqqKpg60g5YKQTawVw3GffRYwzEeFkSxhMl/5jQn3DdUU2UNN+m5zU4WFX+kfcWmvYIIr+
	BDDHTaAkRLFW5+w7uLS/NW3/lHlKZRMFFBJ5IISPwJfJCSIZ10wRfNuQIQLIi9RHwrluuILVCgP2g
	GAQ/rI54Ekn2V799v0uafMOJ2NJWkzy0ISUlFiB0ElbrnURIrYPN1g4r1fhGuRVZcsjI02U51BGdU
	YdznCNA+t7kH4oOFQvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5hE-00CUxX-DZ; Wed, 21 Sep 2022 19:47:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5h8-00CUsw-4v
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 19:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LZQfptf+iYOUQ8McXiQWO1D3Z3+wk/s8KlPsiOQszMo=; b=omoiTuTvjOf9LE73eEH6IKEjM9
	ZISruvSCEIsnwi5erKlv1jTUYLTfD+KJm3048NEto9nR0TMpIahmai7Xgtjqfn6mdjZph12hpOJ+x
	9lnbJuHMkDwmS5vrWaRnXlpxl+F4rddOZiu301W6A0rhdHUIGWxsyFuH5DrGkpXoCfx/TxN7Qwix3
	sv7cA9nu2LxgXzmak1l4M487VHs77IHFCdabbqJhTV7y1eH3VtfhI2bmWFDzOhJv14Iqj2qBLA/us
	DqxOWEEQgMEekI84KcMcDwJDRU7ykGtKj4/J5G3BQSPladKfulTwS0JwoCreFQlJ/RTo6tvsyqTP/
	+PUC/Jiw==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gb-00EkAF-0Z
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:47:33 +0000
Received: by mail-pj1-x1033.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so7003358pjh.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LZQfptf+iYOUQ8McXiQWO1D3Z3+wk/s8KlPsiOQszMo=;
        b=fLo/25hZZvbqAWWrfCa9AR09JZTbZvA/eWoemQieM8qvfSGK7wd1M82idmT80Z6blc
         sZ5gk7fJRwh8tUXA5Bv8rFj4StdGykFCYRlCdbsP5rP7XDsdpllvRg7pqEjjhaVBIK1C
         djB/zQIPrb2ePapJthYG6h6lV5RRZuSC/QSNvj+hTz+MnCJSTx2aF5B23Hlzu1VCH+Kl
         Tu9z6g1JRsqqc3niqxguPv/GGuUn4/gnDo6aqaYWCHwYQ7Egj4nxH+bsOfknDyx67J5U
         noir1IWH6xIL1TUvi8bVJW3MhXWNEPzWG9IGVU98zT1Lk4W0T/EBerSot0gUpiHiTcAa
         WECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LZQfptf+iYOUQ8McXiQWO1D3Z3+wk/s8KlPsiOQszMo=;
        b=xbHH4hEsheHTjB6OFuxk0Ton5yLNLw27S5IbqEfLB3vfSXRJnJvehdMx+DUCei7T6L
         IBy8DrKYM6+PbbzF9K//zYsveO1haLlzxZe94RCPGjGCElTJpUFmW/FE67wNHGD8QTo1
         wh80HxlejbzW0jLpn3p9l22vg9tzfGzjwJw1F4nDYy5vWMic+HSHqorrMg3tl5J5ADsE
         9PG/Y+dVuiafEEqsz6jjawDS2c5+paLjAVnibwOgPKvHPooGL2cFwpLvc8aVUUZWXsei
         vdaQPq1wdgwo/Lb/fQGHuF9ghwYHrgrBiTlQaTm6v7QhnlwKt3fNd5On54AL7Cd3LES+
         2j6A==
X-Gm-Message-State: ACrzQf0ckkC7dePm3oacOd3i4/qLAdhtOCa5zVXDuPGCoH8Sh6ySQxon
	k3Ig/C+73YkKhL3z44cSjFCuw5OWI+zy6w==
X-Google-Smtp-Source: AMsMyM4X4GYl48FGLsx4hQkWZvRn7D130krIaHsqhGZXIX/ZJ5qyDwvK1bJ69zqn79p7/OmvSFFW7Q==
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id d11-20020a170902aa8b00b001788f1d6936mr6393259plr.168.1663789619250;
        Wed, 21 Sep 2022 12:46:59 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:58 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	ShihPo Hung <shihpo.hung@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH 14/17] riscv: Fix a kernel panic issue if $s2 is set to a specific value before entering Linux
Date: Wed, 21 Sep 2022 12:46:26 -0700
Message-Id: <20220921194629.1480202-15-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_204730_178227_8605177B 
X-CRM114-Status: GOOD (  16.12  )
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
