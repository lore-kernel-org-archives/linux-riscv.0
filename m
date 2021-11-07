Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484BEC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 13:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F66A61074
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 13:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F66A61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voSH6nmuFTbDeDV4DUi/7GTbPNaedWy3gvWiO42j8N4=; b=vLJ35vxt063NMO3NcOQ0RMULvJ
	tzAWH8NHJehXsid8TR5NipYtmXigRAiSQzvwx5HwxmQoL4MTEbI0LPEsRS5q4lojczLZjzYOeNkk0
	DJ9yps5Wt/+Nyq7oO1v1YTErlOEMlHN6pY5s656J/fpDGtXu8maepS4WDdn99J8+iMWRX4CO3qK9b
	jAFkDJrOsLOJloy4vWKm5hAuvAueEx6ByW5uzMWa6xl5BHVEi+NGa0rnB+FNYKsQi5Ivdln7rlXuR
	59UYn+Q6zz3zJHmePr3XxCy4FjGtA4h8CVyLSIVopn2IIouYLB/LIuIoW+OxG8Z1OH8JiUdFLefpQ
	d1E2/Pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjhzQ-00ENQC-W5; Sun, 07 Nov 2021 13:13:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjhzO-00ENPb-Tu
 for linux-riscv@lists.infradead.org; Sun, 07 Nov 2021 13:13:40 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B90561074;
 Sun,  7 Nov 2021 13:13:38 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mjhzM-003xkb-17; Sun, 07 Nov 2021 13:13:36 +0000
MIME-Version: 1.0
Date: Sun, 07 Nov 2021 13:13:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Guo Ren
 <guoren@linux.alibaba.com>, Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, stable@vger.kernel.org
Subject: Re: [PATCH V7] irqchip/sifive-plic: Fixup EOI failed when masked
In-Reply-To: <CAJF2gTTcx0GWQ6CY0VJtzAi8TqvOKK00py4f-d_1iHhi1XAXmw@mail.gmail.com>
References: <20211105094748.3894453-1-guoren@kernel.org>
 <CAAhSdy1vyCQdv_gNaNSzU79PC4giCAig6hzgD9JXSXs6+gfFPA@mail.gmail.com>
 <CAJF2gTTcx0GWQ6CY0VJtzAi8TqvOKK00py4f-d_1iHhi1XAXmw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7f9e088982de34e71b8bf656c770427c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 tglx@linutronix.de, palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, guoren@linux.alibaba.com,
 plr.vincent@gmail.com, nikita.shubin@maquefel.me, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_051339_056758_E4D16F6A 
X-CRM114-Status: GOOD (  20.67  )
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

On 2021-11-07 13:09, Guo Ren wrote:
> On Sat, Nov 6, 2021 at 9:45 PM Anup Patel <anup@brainfault.org> wrote:
>> 
>> On Fri, Nov 5, 2021 at 3:18 PM <guoren@kernel.org> wrote:
>> >
>> > From: Guo Ren <guoren@linux.alibaba.com>
>> >
>> > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
>> > only the first interrupt could be handled, and continue irq is blocked by
>> > hw. Because the riscv plic couldn't complete masked irq source which has
>> > been disabled in enable register. The bug was firstly reported in [1].
>> >
>> > Here is the description of Interrupt Completion in PLIC spec [2]:
>> >
>> > The PLIC signals it has completed executing an interrupt handler by
>> > writing the interrupt ID it received from the claim to the claim/complete
>> > register. The PLIC does not check whether the completion ID is the same
>> > as the last claim ID for that target. If the completion ID does not match
>> > an interrupt source that is currently enabled for the target, the
>> >                          ^^ ^^^^^^^^^ ^^^^^^^
>> > completion is silently ignored.
>> >
>> > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
>> > [2] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
>> >
>> > Fixes: bb0fed1c60cc ("irqchip/sifive-plic: Switch to fasteoi flow")
>> > Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
>> > Tested-by: Nikita Shubin <nikita.shubin@maquefel.me>
>> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> 
>> Looks good to me.
>> 
>> Reviewed-by: Anup Patel <anup@brainfault.org>
> Thx
> 
> @Marc Zyngier
> Could you help to take the patch into your tree include "Anup's
> Reviewed-by"? Or Let me update a new version of the patch.

You should have received [1], which shows you what I have done.

         M.

[1] 
https://lore.kernel.org/all/163620881803.626.5045336370262044443.tip-bot2@tip-bot2/
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
