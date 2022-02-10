Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA63C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuFzlcHZVb0gE3z6CiWYFu3tVRHuD744IL5cjowxLno=; b=1+ZzUCi9/ERg8K
	EnUxFQveejUAlKdXYgQ2aqmtzw937H62I4+ixV7bNWOfiovfcIQdcAkrn55/uL5qoKHHgugus6bQ0
	bVstdS3L4VhsPEqCkyQbLgjV/gozjzybnsjnoMecXIIX5n+WEhwaVQtmrV76UIVl3wz2vjAe1xBXN
	8qnOHE2CMDURufMusqWkiu5YHnEXZHbI7MD2nmp9vdLYvrD1ve4rETL5Gxb3iSl1d/e9KEPdCyPpL
	VN3wQ0NTKsRYS7XoAgM4IwiagtYZxLEcSjiTLZ42ceyn3v1S1dnsW+HCjJjBiSl/4538W3wHtAHb+
	SeHf4/GW9VSPwthFz6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI9eO-003vEI-2K; Thu, 10 Feb 2022 13:38:20 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI9eE-003vAX-DF
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 13:38:12 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id p7so4926997qvk.11
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 05:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O5hijOgErFuZmVTJnRYlbg4uqOqnQSoJMdVQjztX0ho=;
 b=ZQoGjcnQ7vkiRllPo1IbcorQjI/0WVeLmFkW8V+f+4cN1sX5KDgjs2RoZetiDbQxEP
 pBPvoWfTyk1FhdFhEwMjZLXQVr6OYMaC/oiDOIpp9rn/lC8zT1yMr+fwt4xgF02oym6k
 R2C39CmlGtop44cxnPWc2qUynzst+/w0PHrD60JWJkaCgkN/njR1eHexrV6cVkWT6krh
 7g3CWL8UpYrmhmFUtZQmhWUASriecTlPxc4DKTzifxhJiJWc6MVw3LYpru8IjU9Ynefz
 YmuDXxijAWGF0xEe/6C0gxfFIm5TnP/yPTZet05BGc48DGmfBU4wmUmQSLGf5rFDU0KJ
 1OZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O5hijOgErFuZmVTJnRYlbg4uqOqnQSoJMdVQjztX0ho=;
 b=JQ6P8lFRYFjkgRDN+siarrz2Vu9+5rG19F8XLGX2e6fBOdTa+WhLCIdOW0IUQ8ttQo
 XN6YwQJ8UmQCMrVoaZpfhkbaErbUjYCxByFRNi4Do20w4LLwx4gF4hh4bHeS2da1lpLQ
 o48IY2SAeMJdTbvxMeb5e6wpdZTNTCrxbnoJ+DA7frITEao2X+HvKAl26cbLeN7GuavW
 xGPFZceLmGEK4D7sKxBQXR3lZ0X6EQ3qXBehQn1lIBnDq6kMoDgFnmI9MZFThkl3qSzq
 gAC2VdHZVQkLXwHljfcrkhuWJpddp5dSLJapi+wN4iDC4lt1QJdlDNbe6mCWzsD45wRU
 a/yA==
X-Gm-Message-State: AOAM530nHr5feJbgwdPPFY3XkAaEhC77qoTaaOCP0ZGGrRrGME6Kh2zK
 3stMSKixNBMDvOhAN519CvE=
X-Google-Smtp-Source: ABdhPJyPIqwZ2ky57TkuReU64pL6WTFYCs1LbLmGar+1ECiMqOV6IX3uJDQpVSouV9vKdrXfP3Tzrg==
X-Received: by 2002:a05:6214:5095:: with SMTP id
 kk21mr2219575qvb.86.1644500287718; 
 Thu, 10 Feb 2022 05:38:07 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id f2sm10656560qti.61.2022.02.10.05.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:38:07 -0800 (PST)
Date: Thu, 10 Feb 2022 21:37:58 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix oops caused by irq on/off tracer
Message-ID: <20220210133758.yzebffln6j76zme6@mail.google.com>
References: <20220129004226.32868-1-changbin.du@gmail.com>
 <YgAEb425uqy5/dw1@xhacker>
 <20220207123850.l4r5qjswaegwisbx@mail.google.com>
 <YgE7XRE/Uc6gTCWd@xhacker>
 <20220208003502.62gi5xhyg6bk2t2h@mail.google.com>
 <YgP6y99LWFSoxjHg@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgP6y99LWFSoxjHg@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_053810_502507_5770BA49 
X-CRM114-Status: GOOD (  17.11  )
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

On Thu, Feb 10, 2022 at 01:32:59AM +0800, Jisheng Zhang wrote:
[snip]
> Hi Changbin,
> 
> I read the code and find that current riscv frame records during
> exception isn't as completed as other architectures. riscv only
> records frames from the ret_from_exception(). If we add completed
What do you mean for 'record'?

> frame records as other arch do, then the issue you saw can also
> be fixed at the same time.
> 
I don't think so. The problem is __builtin_return_address(1) trigger page fault
here.

> However, I'm not sure what's the best choice now.
> 
> A simple demo to this incomplete frames:
> add dump_stack() in any ISR, then
> 
> in riscv:
> [    2.961294] Call Trace:
> [    2.961460] [<ffffffff8000485e>] dump_backtrace+0x1c/0x24
> [    2.961823] [<ffffffff805ed980>] show_stack+0x2c/0x38
> [    2.962153] [<ffffffff805f292e>] dump_stack_lvl+0x40/0x58
> [    2.962483] [<ffffffff805f295a>] dump_stack+0x14/0x1c
> [    2.962792] [<ffffffff805f31a0>] serial8250_interrupt+0x20/0x82
> [    2.963139] [<ffffffff80053032>] __handle_irq_event_percpu+0x4c/0x106
> [    2.963526] [<ffffffff80053170>] handle_irq_event+0x38/0x80
> [    2.963856] [<ffffffff80056a32>] handle_fasteoi_irq+0x96/0x188
> [    2.964198] [<ffffffff800526ce>] generic_handle_domain_irq+0x28/0x3a
> [    2.964567] [<ffffffff802f0ae4>] plic_handle_irq+0x88/0xec
> [    2.964896] [<ffffffff800526ce>] generic_handle_domain_irq+0x28/0x3a
> [    2.965264] [<ffffffff802f08e4>] riscv_intc_irq+0x34/0x5c
> [    2.965584] [<ffffffff805f6dc8>] generic_handle_arch_irq+0x4a/0x74
> [    2.966068] [<ffffffff80002fe8>] ret_from_exception+0x0/0xc
> 
> in x86:
> [    1.191274] Call Trace:
> [    1.192223]  <IRQ>
> [    1.192758]  dump_stack_lvl+0x45/0x59
> [    1.192982]  serial8250_interrupt+0x24/0x88
> [    1.193105]  __handle_irq_event_percpu+0x66/0x1b0
> [    1.193239]  handle_irq_event+0x34/0x70
> [    1.193345]  handle_edge_irq+0x85/0x1e0
> [    1.193455]  __common_interrupt+0x38/0x90
> [    1.193573]  common_interrupt+0x73/0x90
> [    1.193809]  </IRQ>
> [    1.193889]  <TASK>
> [    1.193956]  asm_common_interrupt+0x1b/0x40
> [    1.194318] RIP: 0010:_raw_spin_unlock_irqrestore+0x1b/0x40
> [    1.194566] Code: 24 be 01 02 00 00 e9 54 20 bf ff 0f 1f 40 00 0f 1f
> 44 00 00 f7 c6 00f
> [    1.195137] RSP: 0000:ffff888000243b68 EFLAGS: 00000246
> [    1.195314] RAX: 0000000000000000 RBX: ffffffff82025840 RCX:
> 0000000000000000
> [    1.195482] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
> 0000000000000001
> [    1.195645] RBP: 0000000000000202 R08: ffffffffffffffff R09:
> 0000000000000000
> [    1.195808] R10: 00000000000000eb R11: 0000000000000000 R12:
> 0000000000000000
> [    1.195972] R13: 0000000000000040 R14: 0000000000000000 R15:
> ffff888000c39000
> [    1.196245]  ? _raw_spin_unlock_irqrestore+0x15/0x40
> [    1.196373]  serial8250_do_startup+0x42d/0x600
> [    1.196502]  uart_port_startup+0x11b/0x270
> [    1.196619]  uart_port_activate+0x3f/0x60
> [    1.196729]  tty_port_open+0x7e/0xd0
> [    1.196835]  ? _raw_spin_unlock+0x12/0x30
> [    1.196942]  uart_open+0x1a/0x30
> [    1.197036]  tty_open+0x153/0x7c0
> [    1.197144]  chrdev_open+0xbf/0x230
> [    1.197253]  ? cdev_device_add+0x90/0x90
> [    1.197359]  do_dentry_open+0x13c/0x360
> [    1.197470]  path_openat+0xb0c/0xe00
> [    1.197577]  ? update_load_avg+0x5f/0x640
> [    1.197691]  ? finish_task_switch.isra.0+0xac/0x240
> [    1.197821]  do_filp_open+0xb2/0x150
> [    1.197935]  ? preempt_schedule_thunk+0x16/0x18
> [    1.198049]  ? preempt_schedule_common+0x90/0xd0
> [    1.198167]  ? preempt_schedule_thunk+0x16/0x18
> [    1.198291]  file_open_name+0xf1/0x1b0
> [    1.198397]  filp_open+0x2c/0x50
> [    1.198495]  console_on_rootfs+0x19/0x52
> [    1.198648]  kernel_init_freeable+0x19a/0x1c7
> [    1.198765]  ? rest_init+0xc0/0xc0
> [    1.198867]  kernel_init+0x16/0x110
> [    1.198965]  ret_from_fork+0x1f/0x30
> [    1.199131]  </TASK>
> 
As I said before, this issue is not related to stackdump.

Besides, you can see more calltrace on x86 that because x86 iterate all stacks
(kernel, irq or exception) when dumping stacktrace. While RISCV only show
calltrace of current stack.


-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
