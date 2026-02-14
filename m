Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F336AEF99FF
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 06:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfBOtNsqVlCsPyDa55NNO8yZF6z/nmrGtMXAwn/hMsQ=; b=zez9ZVRmIgtnku
	abcAzqvAQAn3HfbF+nmmK2F2BrqvRZMMo1WtvceBK0VzPJLElDZY85AnQlHnxE6UsnfA15o3t/k8U
	E1NoZ1N1TK+CNZeYTCHpmZUcjh73x5ktC0HiUfdGpDl0nYC+3v8ATjTWIcm6DzjsBEe0PIT37MsoC
	H/NnYMkgVkfi3aS/vbnhwOadyRb4AEOJD8cKHzSai0DSKgaXBSPK4qBiVN9g/9zrlTMGcdB7gJ8MQ
	HLqVBunH7FeSbVlA87pRa7xYczmAS+D8UoidwoyFCg5DRTTls+c3PhI3O6IuVJ1XU7cAdf7kfGyJh
	H1467C0cS7+Y/Lqyx37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr9DW-00000004L4G-0Kqo;
	Sat, 14 Feb 2026 06:33:22 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr9DQ-00000004L3l-3aC9
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 06:33:19 +0000
Received: from duge-virtual-machine (unknown [110.228.131.240])
	by APP-05 (Coremail) with SMTP id zQCowAAntQgkF5Bpt2dCCA--.30789S2;
	Sat, 14 Feb 2026 14:33:09 +0800 (CST)
Date: Sat, 14 Feb 2026 14:33:08 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <aZAXJOHqrhKh8kd5@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <aYNwmqEjvfAahGA+@duge-virtual-machine>
 <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
X-CM-TRANSID: zQCowAAntQgkF5Bpt2dCCA--.30789S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF17Aw45Cw18CFW8JrW8JFb_yoW8CFyfpr
	ZayF4v9F1DJr48Xa93uw4UuF10v3Z7Ar1xGw15G34kWFy3AFySqrZ7u3W5Za4Dur43GF4j
	vr1Yka4Uu348ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
	8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU89Z23UUUUU==
X-Originating-IP: [110.228.131.240]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_223317_268758_CD28C8D6 
X-CRM114-Status: GOOD (  18.98  )
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

On Sat, Feb 14, 2026 at 12:37:24AM +0800, Xukai Wang wrote:
> 
> On 2026/2/5 00:15, Jiayu Du wrote:
> > On Fri, Jan 16, 2026 at 09:26:18PM +0800, Xukai Wang wrote:
> >> This patch series adds clock controller support for the Canaan Kendryte
> >> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> >> PLLs and an external pulse input, with the controller managing these
> >> sources and their derived clocks.
> >  
> > Hi, Xukai. Currently, the k230 initial series and the patch 3 of the
> > pinctrl series has been in the linux next. So if possible, you need
> > to rebase your clock series onto the latest linux-next.
> >
> > Then I will proceed with the development based on your v11 of the
> > clock series.
> I've rebased my patch series to `linux-next` (20260212). I noticed that
> the patch which updated the `k230.dtsi` format has been merged into
> `linux-next`.
> 
> Consequently, I've updated the `prerequisite-patch-id` for my series
> from `deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc` [1] to
> `9a2d01f55574b538dad572e193f81c44661f0853` [2]. Is this change correct?

Junhui Liu's commit `8cfdbd5e207d434a6e924eb81092874177f97536: riscv: dts:
canaan: k230: Add b ISA extension`, also modified k230.dtsi. I'm not
sure if you noticed this.

> Separately, I sent you my v11 clock series for PREVIEW, but it seems you
> haven't received it.

I have received the v11 version of the clock series that you sent. I will
conduct the test shortly.

> Link:
> https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/
> [1]
> Link:
> https://lore.kernel.org/linux-devicetree/20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn/
> [2]
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
