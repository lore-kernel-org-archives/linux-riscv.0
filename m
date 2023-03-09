Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0EC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1I4g/9V0Fj2Gbrk0ov8FCafDe2Nf1ij831vqtUrJMEI=; b=URCcZo5ZbXlRXg
	E2ZeK+bWbDJei8BfO/qqXxxbYt7c1ZCtMjjdZ7DGZEzk9FY5/hdJ1JRkE4Wbw7b+tJj3efHsMUprq
	7MnailrgTKMF8oFzbzBe7VEpzFDyrX3OJb+eSFsWwdBSjfSQgp8ljNsDfr7gFogRPre6urGtQc6qt
	GjbKkorZ2Hsqc5Oxiw8qnKTmS5JfNXXxj2+o44IedbJVmPvDBQHCWVO00r+BOJimmsuYY3YqJ8uv+
	VP12ou3LTN4PRoJCYjjmTCu2RqaVGO5AN7z9ZKjc+L+1ZanbZniP0dvrEwYFD/Pa8AWRElSPyvHdX
	FGStQvOxlBeqg9OEtG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paJSo-00BKJP-1K; Thu, 09 Mar 2023 16:49:58 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paJSk-00BKHu-OV
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 16:49:56 +0000
Received: by mail-ed1-x529.google.com with SMTP id x3so9496299edb.10
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 08:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678380591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgic3f/gjOyxiKYh62jpCJs0jVWnVDJC8Te95iLZjwo=;
        b=ax83c2vxhZYCk0TpyhtJp23BimvdTF6npaqHWRaMl0UBiouaMsGOTazXO4KhSRAwXT
         KyUr79RoFtIBRDeUs4WRg0yzU6iiQqxwbTTEygh7xJBmS7tPRy+BRqARd9BnfXYjp/Yk
         MoV2qiUvwG8hzMXWsWzOjHZ24PxmzbSZpHJucnJ3flEyzVhstRN7psnvwLZyzvPddb2T
         Ltg+RsqSeNDnUdZqJ0Yh+JsVVbD/cII2nK2ejlEWuEXsPmFI27HjLHTpHJBPLxkxyEk4
         FbPICI222spaHGlYelDxU/8rHP0ZYwnmoR0rQHnrzmIawSrgQ++GmeDwBo8WPWm8UooR
         rLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678380591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pgic3f/gjOyxiKYh62jpCJs0jVWnVDJC8Te95iLZjwo=;
        b=Fg1Ydp9LnzEtnv0UgHwd8OYcyrkQkOQrI/pcTSv/oIDXaLOAXk062BNZHTnqP2V4Xw
         ll6pmqs+6TqAlBwk6BKwo8zTkS22UFMdje5S4rmYGtZq4YQUzONV3VPZag8uC87xVzt2
         Ho6M9EDTHZ17sWExlGio30Rqf0VLAJXJJjKcmGBb4BY/88ehIbL9oEhrQbeb/8qqxyVM
         R8p1nvpT953pISYo+O9sU6laBVF5+MKRNqfMcQf+A5pPqSi9VjoXY7AWsK9EOKOaF9KJ
         K2fPmJy7XZMiFgFDIeRnt0fV8bHDDJOsyo1Xtoe3yssmW1OKyK1gE9lA0JLw1l3LerG3
         37iA==
X-Gm-Message-State: AO0yUKWq+RPNt1Qt79Zg/HO0uR3zQCFwiqKy+0aPYv7fqjiDa0Mje3qO
	u3kBZkrPcmqGo+ph5OqKnKo5IiCE83Q=
X-Google-Smtp-Source: AK7set/LtRi8+lnJ2SlDyhowh2roV/4ee5bP9Xz1GN0BphVGFwWGGKTQXrjNcfFwwZie24/2Lqo2cw==
X-Received: by 2002:a05:6402:1345:b0:4af:6e95:85ec with SMTP id y5-20020a056402134500b004af6e9585ecmr20569400edw.4.1678380590914;
        Thu, 09 Mar 2023 08:49:50 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-172.cust.vodafonedsl.it. [188.217.49.172])
        by smtp.gmail.com with ESMTPSA id c14-20020a50f60e000000b004af720b855fsm9927439edn.82.2023.03.09.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 08:49:50 -0800 (PST)
Date: Thu, 9 Mar 2023 17:49:48 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <ZAoOLIERMYI8UVlA@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <3a605bc8-104e-0935-4fd8-2da16ab9053b@starfivetech.com>
 <ZAb7JVghuiwZF1Q5@wendy>
 <2f03dfb2-5cf8-e954-913c-f0c27db6bcf5@starfivetech.com>
 <ZAh/UeSlUeGoKxki@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <4c071642-e3c8-4716-a580-5b42e25efb1c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c071642-e3c8-4716-a580-5b42e25efb1c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_084954_836774_E0DBAA93 
X-CRM114-Status: GOOD (  23.24  )
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

On Wed, Mar 08, 2023 at 01:36:41PM +0000, Conor Dooley wrote:
> On Wed, Mar 08, 2023 at 01:28:01PM +0100, Tommaso Merciai wrote:
> > On Tue, Mar 07, 2023 at 06:08:53PM +0800, Hal Feng wrote:
> 
> > > The above two methods can fix the problem. Here are my test results.
> > > The VisionFive board can boot up successfully if and only if all above
> > > two applied.
> > > The VisionFive 2 board can boot up successfully if I merge Linus's new
> > > changes.
> > 
> > Tested also on my side. Hope this can be helpfull.
> > 
> > > Hope your fix will be merged in rc2. Thank you for your reply.
> > 
> > Fully agree.
> 
> If you only have a VisionFive 2, it shouldn't matter to you, as you
> don't need to fix up any SiFive errata (at the moment at least).
> Linus' fix is already in his tree, so should be in -rc2!
> The fix for the VisionFive was applied to Palmer's RISC-V fixes tree
> last night:
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=fixes&id=bf89b7ee52af5a5944fa3539e86089f72475055b
> 
> Thanks,
> Conor.


Hi Conor,
Thanks for the info.
Playing with this series I got the following error:

[    6.278182] BUG: spinlock bad magic on CPU#0, udevd/136
[    6.283414]  lock: 0xffffffd84135e6c0, .magic: ffffffff, .owner: <none>/-1, .owner_cpu: -1
[    6.291677] CPU: 0 PID: 136 Comm: udevd Not tainted 6.3.0-rc1-g92569901a7f9-dirty #14
[    6.299502] Hardware name: StarFive VisionFive 2 v1.3B (DT)
[    6.305069] Call Trace:
[    6.307517] [<ffffffff80005530>] dump_backtrace+0x1c/0x24
[    6.312921] [<ffffffff80844b4e>] show_stack+0x2c/0x38
[    6.317976] [<ffffffff8085032c>] dump_stack_lvl+0x3c/0x54
[    6.323377] [<ffffffff80850358>] dump_stack+0x14/0x1c
[    6.328429] [<ffffffff80845668>] spin_dump+0x64/0x70
[    6.333394] [<ffffffff80058f26>] do_raw_spin_lock+0xb4/0xf2
[    6.338970] [<ffffffff80857d04>] _raw_spin_lock+0x1a/0x22
[    6.344370] [<ffffffff8008153c>] add_timer_on+0x8a/0x132
[    6.349684] [<ffffffff8084b9fa>] try_to_generate_entropy+0x216/0x278
[    6.356037] [<ffffffff804ebfdc>] urandom_read_iter+0x40/0xb8
[    6.361697] [<ffffffff801a1216>] vfs_read+0x17e/0x1f8
[    6.366752] [<ffffffff801a1986>] ksys_read+0x5e/0xc8
[    6.371710] [<ffffffff801a19fe>] sys_read+0xe/0x16
[    6.376503] [<ffffffff8000357a>] ret_from_syscall+0x0/0x2
[    6.381905] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000007
[    6.390683] Oops [#1]
[    6.392956] Modules linked in:
[    6.396011] CPU: 0 PID: 136 Comm: udevd Not tainted 6.3.0-rc1-g92569901a7f9-dirty #14
[    6.403835] Hardware name: StarFive VisionFive 2 v1.3B (DT)
[    6.409401] epc : enqueue_timer+0x1a/0x90
[    6.413414]  ra : add_timer_on+0xe2/0x132
[    6.417425] epc : ffffffff80080c60 ra : ffffffff80081594 sp : ffffffc8044dbc60
[    6.424640]  gp : ffffffff814ffe50 tp : ffffffd8c171ad00 t0 : 6666666666663c5b
[    6.431855]  t1 : 000000000000005b t2 : 666666666666663c s0 : ffffffc8044dbcc0
[    6.439070]  s1 : ffffffc8044dbd08 a0 : ffffffd84135e6c0 a1 : ffffffc8044dbd08
[    6.446284]  a2 : ffffffffffffffff a3 : 000000003e000000 a4 : 000000000000023e
[    6.453498]  a5 : 000000000000023e a6 : ffffffd84135f930 a7 : 0000000000000038
[    6.460712]  s2 : ffffffd84135e6c0 s3 : 0000000000000040 s4 : ffffffff81501080
[    6.467926]  s5 : ffffffd84135e6c0 s6 : ffffffff815011b8 s7 : ffffffffffffffff
[    6.475141]  s8 : ffffffff81502820 s9 : 0000000000000040 s10: 0000002ab0a49320
[    6.482355]  s11: 0000000000000001 t3 : ffffffff81512e97 t4 : ffffffff81512e97
[    6.489569]  t5 : ffffffff81512e98 t6 : ffffffc8044db948
[    6.494875] status: 0000000200000100 badaddr: 0000000000000007 cause: 000000000000000f
[    6.502783] [<ffffffff80080c60>] enqueue_timer+0x1a/0x90
[    6.508095] [<ffffffff8084b9fa>] try_to_generate_entropy+0x216/0x278
[    6.514448] [<ffffffff804ebfdc>] urandom_read_iter+0x40/0xb8
[    6.520107] [<ffffffff801a1216>] vfs_read+0x17e/0x1f8
[    6.525160] [<ffffffff801a1986>] ksys_read+0x5e/0xc8
[    6.530126] [<ffffffff801a19fe>] sys_read+0xe/0x16
[    6.534918] [<ffffffff8000357a>] ret_from_syscall+0x0/0x2
[    6.540322] Code: 87b2 0813 0805 1613 0037 9832 3603 0008 e190 c211 (e60c) 5613
[    6.547711] ---[ end trace 0000000000000000 ]---
[    6.552325] note: udevd[136] exited with irqs disabled
[    6.557531] note: udevd[136] exited with preempt_count 2


I'm working on top of Linux version 6.3.0-rc1-g92569901a7f.
Did you already see this crash?
Let me know.

Thanks,
Tommaso





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
