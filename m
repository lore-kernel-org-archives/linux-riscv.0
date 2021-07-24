Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769A6C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 16:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AC260E8E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 16:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0AC260E8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCN0wMOc6urLgMDge1b0iz0su68RRMl0zb4oh7q8dwo=; b=v3ETPpoO5Ae+XD
	9kQ3PPP8+8uCXJ/zg+g8Ntp/YUHhQ1OPb1xnZCy8yUuLeOtTSQKT2a+anf+XhxwJatnWxjDVAMALA
	up80WxdeTTrV/i25qytIvIv2EdsLBKuW/hEOnnhkiy50QagaJpyBfzWfB2iO3gq2TpNQfTMl7ZgqA
	+aiuMoD3WoMMBZMmG43LVKFu0qUOartxqt8YvVXO6LKmZHR09qCdX98cJCtCz+X9Nopb7n2K6P2cj
	O8oHLIiz/IQOIPCo7nOHnzB/fJNgFSuz+syKatn+lEfkV+laNe/UJXAzM1kWnTpk/UUmXcuyW67Cp
	pjNVKnXT/96QHvglte/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7KDr-007PDz-Fi; Sat, 24 Jul 2021 16:09:55 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7KDn-007PCy-30
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 16:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=GAR4WWqAXHVgE5qg2lxEmsawH6VzLA7G6o
 qKmn9MhG0=; b=vARQtY1nDQKC1pwGtR68vqFZtjr/vwNUZIl2fqttkiMKIBpv/6
 j12/vL8IB7AwXjCBtD+cvfvJuyVh9VofF3OSlygCJv4t7RxoCk29vkZP5ajjd9LF
 oXtDich8vvxMGI0i2tOr2NyXbxt4Sgz9SpO6lS0nTffYNwgybiW0z2AG8=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAnL3cdO_xgxE0+AA--.8738S2; 
 Sun, 25 Jul 2021 00:09:01 +0800 (CST)
Date: Sun, 25 Jul 2021 00:02:58 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] riscv: stacktrace: Fix NULL pointer dereference
Message-ID: <20210725000258.1ca59266@xhacker>
In-Reply-To: <CAOnJCU+h9uwBP57Nhh2tX9boOeQ9eV-_jjY0zSzUqhmi2Ptd2A@mail.gmail.com>
References: <20210716214051.32eea3a8@xhacker>
 <CAOnJCU+h9uwBP57Nhh2tX9boOeQ9eV-_jjY0zSzUqhmi2Ptd2A@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAnL3cdO_xgxE0+AA--.8738S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryftrWUZF1DJw1xKF13twb_yoWrCrWfpF
 15JF17CrW8Jr1xtw17tr15ZF15Ar1DAa43Jr9xAr1FyFyUWr1UXw18tFW5WF1qyrn5Ja4x
 trn0gws2vr4DJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
 6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_090951_621515_EE6DB109 
X-CRM114-Status: GOOD (  21.36  )
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

Hi @Palmer,

On Fri, 16 Jul 2021 07:07:24 -0700
Atish Patra <atishp@atishpatra.org> wrote:

> On Fri, Jul 16, 2021 at 6:47 AM Jisheng Zhang wrote:
> >
> > From: Jisheng Zhang <jszhang@kernel.org>
> >
> > When CONFIG_FRAME_POINTER=y, calling dump_stack() can always trigger
> > NULL pointer dereference panic similar as below:
> >
> > [    0.396060] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
> > [    0.396692] Hardware name: riscv-virtio,qemu (DT)
> > [    0.397176] Call Trace:
> > [    0.398191] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000960
> > [    0.399487] Oops [#1]
> > [    0.399739] Modules linked in:
> > [    0.400135] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
> > [    0.400570] Hardware name: riscv-virtio,qemu (DT)
> > [    0.400926] epc : walk_stackframe+0xc4/0xdc
> > [    0.401291]  ra : dump_backtrace+0x30/0x38
> > [    0.401630] epc : ffffffff80004922 ra : ffffffff8000496a sp : ffffffe000f3bd00
> > [    0.402115]  gp : ffffffff80cfdcb8 tp : ffffffe000f30000 t0 : ffffffff80d0b0cf
> > [    0.402602]  t1 : ffffffff80d0b0c0 t2 : 0000000000000000 s0 : ffffffe000f3bd60
> > [    0.403071]  s1 : ffffffff808bc2e8 a0 : 0000000000001000 a1 : 0000000000000000
> > [    0.403448]  a2 : ffffffff803d7088 a3 : ffffffff808bc2e8 a4 : 6131725dbc24d400
> > [    0.403820]  a5 : 0000000000001000 a6 : 0000000000000002 a7 : ffffffffffffffff
> > [    0.404226]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
> > [    0.404634]  s5 : ffffffff803d7088 s6 : ffffffff808bc2e8 s7 : ffffffff80630650
> > [    0.405085]  s8 : ffffffff80912a80 s9 : 0000000000000008 s10: ffffffff804000fc
> > [    0.405388]  s11: 0000000000000000 t3 : 0000000000000043 t4 : ffffffffffffffff
> > [    0.405616]  t5 : 000000000000003d t6 : ffffffe000f3baa8
> > [    0.405793] status: 0000000000000100 badaddr: 0000000000000960 cause: 000000000000000d
> > [    0.406135] [<ffffffff80004922>] walk_stackframe+0xc4/0xdc
> > [    0.407032] [<ffffffff8000496a>] dump_backtrace+0x30/0x38
> > [    0.407797] [<ffffffff803d7100>] show_stack+0x40/0x4c
> > [    0.408234] [<ffffffff803d9e5c>] dump_stack+0x90/0xb6
> > [    0.409019] [<ffffffff8040423e>] ptdump_init+0x20/0xc4
> > [    0.409681] [<ffffffff800015b6>] do_one_initcall+0x4c/0x226
> > [    0.410110] [<ffffffff80401094>] kernel_init_freeable+0x1f4/0x258
> > [    0.410562] [<ffffffff803dba88>] kernel_init+0x22/0x148
> > [    0.410959] [<ffffffff800029e2>] ret_from_exception+0x0/0x14
> > [    0.412241] ---[ end trace b2ab92c901b96251 ]---
> > [    0.413099] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> >
> > The reason is the task is NULL when we finally call walk_stackframe()
> > the NULL is passed from __dump_stack():
> >
> > |static void __dump_stack(void)
> > |{
> > |        dump_stack_print_info(KERN_DEFAULT);
> > |        show_stack(NULL, NULL, KERN_DEFAULT);
> > |}
> >
> > Fix this issue by checking "task == NULL" case in walk_stackframe().
> >
> > Fixes: eac2f3059e02 ("riscv: stacktrace: fix the riscv stacktrace when CONFIG_FRAME_POINTER enabled"

Missed a ")" at the end here, do you want a resend?

PS: This patch is missed for twice.

Thanks

> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/kernel/stacktrace.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> > index bde85fc53357..7bc8af75933a 100644
> > --- a/arch/riscv/kernel/stacktrace.c
> > +++ b/arch/riscv/kernel/stacktrace.c
> > @@ -27,7 +27,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
> >                 fp = frame_pointer(regs);
> >                 sp = user_stack_pointer(regs);
> >                 pc = instruction_pointer(regs);
> > -       } else if (task == current) {
> > +       } else if (task == NULL || task == current) {
> >                 fp = (unsigned long)__builtin_frame_address(1);
> >                 sp = (unsigned long)__builtin_frame_address(0);
> >                 pc = (unsigned long)__builtin_return_address(0);
> > --
> > 2.32.0
> >
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv  
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
