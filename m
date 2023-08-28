Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0918C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+uktCdjK6YhqyD8fb3g0RahgEUO9I/lI6gFoY8jse4=; b=jA10wGjUyYJ4px
	y9mVO/MGOOYOpMqmmYSkGqwCjohtE3D6yGxtQQE2LvqeYEFW0m+FGYZLg5ef/XEbVWjD/2Mbcx3bt
	X0KrknYRn2nRi2oiCRVDB3aXlpngQlUoECBgq2MMHjoc9T9UH9XCrxzV49Y2GIo0ZnZQIp2xmbHqn
	lqijsWemU0lEdX0HScaVENihkqsQBl1InHM6qOoakipx0F4BaJB6DlSn+FQbeU24oo/XcRuhOe0XY
	d/LWjHvxIvAw2t8GhuZuhDkqHvmk9YisQs5MP6C9xvu2nrF8Q/X5d8EDfsyQ2NSPp8vE0K1a+SxIO
	Jh2SdzGFoW97MQVEGsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qadzh-009mZG-30;
	Mon, 28 Aug 2023 15:17:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qadze-009mY2-1Y
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 15:17:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A580617A5;
	Mon, 28 Aug 2023 15:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761EEC433C7;
	Mon, 28 Aug 2023 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693235848;
	bh=yfaHuxm/bNdSiHw+0iYEhh/JqUocRSKuoWqVRwNq8KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7/6MvnkBriK1EzeEBQCJH2Rsg56bX2QG22RCV4HXa1i+YqDdBv4oHfrzxY2zjzJx
	 E4NpKud9szn/+FB9ePxT0cl57OAstIXPW8AndUi6qmS6D7ckLqwNajbZyHHnW5kQdd
	 Cq129HBKAm7TSdQwCYB2ZC69jLlAEC9eI8gp29ypX0HLQ2YUaZPcBswqwmCUTfZSdg
	 UlQveJ37sA8V/S7Z0VCrAp9YLT8/VTRy8MlJU5dPn2QY7Zs+u8Pt9UgiZz8FArrMfL
	 16puTDTdrmYmD5+S5BmKINMDUsAdw0AEvFAu/yOsVJbgnEKuVsK4zuajyM0YmL6y+N
	 wSZ1HrQ/cxERA==
Date: Mon, 28 Aug 2023 23:05:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Jiexun Wang <wangjiexun@tinylab.org>
Cc: dfustini@baylibre.com, adrian.hunter@intel.com, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, conor@kernel.org, devicetree@vger.kernel.org,
	guoren@kernel.org, jkridner@beagleboard.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	robertcnelson@beagleboard.org, robh+dt@kernel.org,
	ulf.hansson@linaro.org, wefu@redhat.com
Subject: Re: [PATCH RFC v2 0/4] RISC-V: Add basic eMMC support for BeagleV
 Ahead
Message-ID: <ZOy3v+YgZgU1NrWx@xhacker>
References: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
 <20230828044016.109515-1-wangjiexun@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230828044016.109515-1-wangjiexun@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_081730_582292_04DF7824 
X-CRM114-Status: GOOD (  13.19  )
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

On Mon, Aug 28, 2023 at 12:40:16PM +0800, Jiexun Wang wrote:
> Hello,
> I tested the patch on my LicheePi 4A board.
> It can successfully boot with eMMC, but when I use the eMMC more frequently - for instance:
> 
> $ while true; do /bin/dd if=/dev/zero of=bigfile bs=1024000 count=1024; done &
> 
> I encounter the following error:
> 
> sbi_trap_error: hart1: illegal instruction handler failed (error -2)

> sbi_trap_error: hart1: mcause=0x0000000000000002 mtval=0x0000000060e2de4f
> sbi_trap_error: hart1: mepc=0x000000000001897c mstatus=0x0000000a00001820
> sbi_trap_error: hart1: ra=0x00000000000170f8 sp=0x000000000004adc8
> sbi_trap_error: hart1: gp=0xffffffff8136ea90 tp=0xffffffd900228000
> sbi_trap_error: hart1: s0=0x0000000000000000 s1=0x000000000004ae08
> sbi_trap_error: hart1: a0=0x000000003f9aa9bc a1=0x0000000000000004
> sbi_trap_error: hart1: a2=0x0000000000000000 a3=0x0000000000000000
> sbi_trap_error: hart1: a4=0x0000000000042248 a5=0x00000000000170e5
> sbi_trap_error: hart1: a6=0x0000000000000000 a7=0x0000000054494d45
> sbi_trap_error: hart1: s2=0x000000000004aee8 s3=0x0000000000000000
> sbi_trap_error: hart1: s4=0x000000000004ae08 s5=0x0000000000000000
> sbi_trap_error: hart1: s6=0xffffffff813aa240 s7=0x0000000000000080
> sbi_trap_error: hart1: s8=0xffffffff80a1b5f0 s9=0x0000000000000000
> sbi_trap_error: hart1: s10=0xffffffd9fef5d380 s11=0xffffffff81290a80
> sbi_trap_error: hart1: t0=0x0000000a00000820 t1=0x0000000000000000
> sbi_trap_error: hart1: t2=0xffffffff80c00318 t3=0x0000000000000001
> sbi_trap_error: hart1: t4=0x0000000000000330 t5=0x0000000000000001
> sbi_trap_error: hart1: t6=0x0000000000040000
> 
> My kernel version is v6.5-rc3.
> My OpenSBI version is 1.3.
> I tried to use other versions of OpenSBI, yet the problem persists. 
> Is there a possibility of any underlying bug? Your insights into this would be greatly appreciated.


Can you plz try below opensbi?
https://github.com/xhackerustc/thead-opensbi.git


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
