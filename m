Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A661EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrHKpesCY+BKwQDaIB6y03ACLGO1lQZ/gn0cQsUlso8=; b=fBUn8pixN8hcnu
	82P9/rvu8+CGOeDJASK4+FWx10Y/UktZwVVz+C5gxFDQDscBh0IpmClor5NMnGqpLAXY8aoy5A+Ko
	TkRzezlTdXOAJRx6lwjIIioGH8K7c6kKPWoyeUVN9EvTJVA+pyRFauj0rzZvWiQciomuIQyUJMQ5/
	AifcpuEXLVQcYEyWtocFpsLHzFn+SwB12pROv7XPeixEwQFkpjcDETn4j4E6QJQy/FJqyWUAwBlgN
	D8RRXg8g47wEOULwiR4CQFbL8RMJXFeiA7iwvIBClAHSgVd0PnMrhMqKsDsBg6AEAwzEEot+8zq39
	uJuksakWGf1ayv04V1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAAc5-000ptN-0k;
	Fri, 16 Jun 2023 14:39:45 +0000
Received: from kuriko.dram.page ([65.108.252.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAAc3-000prq-09
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 14:39:44 +0000
Message-ID: <4440a0b1-bf67-9c37-0526-1a447ff8568a@dram.page>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dram.page; s=mail;
	t=1686926376; bh=D3G6HTwRcPV6KnfEheAEItSyD7W7vt2jWXDdc7E1V78=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=YFPavAo7QyVgTMfpKQgwgzy89b8jO6AdVmNablD2JZi8OCPQXDzYs+QyGqPgKsEGq
	 4n0fCMiL6DuOta7+rR04nkyzUtIe1dU+nMrXFbekxjeDLHcrEd4noPqjQllCHMPu0p
	 5J1V03UYBKBcrr8RaZEFob8Xqxz9Sx9McIpT1mo0=
Date: Fri, 16 Jun 2023 22:39:09 +0800
MIME-Version: 1.0
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bin Meng <bmeng.cn@gmail.com>, "Hongren (Zenithal) Zheng" <i@zenithal.me>
References: <20211007123632.697666-1-anup.patel@wdc.com>
 <20211007123632.697666-6-anup.patel@wdc.com>
Content-Language: en-US
From: Vivian Wang <uwu@dram.page>
Subject: Re: [RFC PATCH v4 05/10] dt-bindings: interrupt-controller: Add
 ACLINT MSWI and SSWI bindings
In-Reply-To: <20211007123632.697666-6-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_073943_262622_9708F261 
X-CRM114-Status: UNSURE (   6.17  )
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

Hi all,

We are working on devicetree generation for rocket-chip, specifically
generating ACLINT nodes instead of CLINT nodes. (WIP at [1].) We were
wondering if riscv,aclint-{m,s}swi should really be an interrupt-controller.

According to the devicetree specification (v0.3 found at [2]), an
interrupt-controller *receives* interrupts. The ACLINT devices only ever
generates interrupts, so they would be classified as interrupt
generating device rather than interrupt controller or interrupt nexus.

These bindings, as is, require the MSWI and SSWI devices to have the
interrupt-controller property and #interrupt-cells = <0>, which does not
reflect its functionality. It nonsensically implies that another device
may have an interrupt routed through an MSWI/SSWI as interrupt-parent.
Removing these requirements makes more sense.

I'm not sure about what other node name to use though. It seems that
these are more like mailboxes, but also not exactly. In any case a
clarification of the bindings would be appreciated.

Thanks,
dram

[1]: https://github.com/chipsalliance/rocket-chip/pull/3330
[2]: https://www.devicetree.org/specifications/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
