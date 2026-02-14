Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC92EF99E1
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kZ8Q9vD1SYUEdfpmwPCiq0cRwe1xnSdf58IU7zAm1E=; b=PLpeZevH7G9Vkv
	sq3gWpJgCTdQ29AaVFTOkbCYajo0tINm2hxvuYPCsTV1TSd+XJrPunp2IxGuXJiZvsfe4Wv4Llf2t
	m9tuXuLYDZf1t6X03yJrjd7IcYf2PzuYj3aTODCmf1RTXANaXuc+gtu93tQoC9Qsirj3/Jg3+/V9L
	Sld48OVpzp69G20TZz4k1kwsxJyxdTwOgenUqsH+OSVn4e4k0PbQ90rgkukaXhtnlwB1ZUOXJzW4S
	9jy7P+SvD8UJsslsJEoXEaHkMck4ycTr2bwN65xBipSXQu8iAfyc9GsVVtJytCH60iOVUb134fUWK
	7CsWs3dUxDwmpMB3BKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAoN-00000004O26-1xhB;
	Sat, 14 Feb 2026 08:15:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrAoK-00000004O1h-1oze
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 08:15:30 +0000
Received: from duge-virtual-machine (unknown [110.228.131.240])
	by APP-01 (Coremail) with SMTP id qwCowAAXv2oaL5BpR2PhBw--.14107S2;
	Sat, 14 Feb 2026 16:15:23 +0800 (CST)
Date: Sat, 14 Feb 2026 16:15:22 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <aZAvGnSrJ7/Ov6wV@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <aYNwmqEjvfAahGA+@duge-virtual-machine>
 <f97dbaa3-b6d6-4dd2-aab9-f24a68c4adfe@zohomail.com>
 <aZAXJOHqrhKh8kd5@duge-virtual-machine>
 <283d631f-7cc6-4ec6-9946-5e2120625150@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <283d631f-7cc6-4ec6-9946-5e2120625150@zohomail.com>
X-CM-TRANSID: qwCowAAXv2oaL5BpR2PhBw--.14107S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rArWxWr13Kw1DtF4ruFg_yoW8tw17pr
	WSyF4v9F4DJr48JasIgw4YgF1Fv3WkAr1UWr15Kr98uFyavF1Sqrs7W3W5u3WDGrs8GF12
	vr45Gasruw18ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2FksUUUUU
X-Originating-IP: [110.228.131.240]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_001528_864697_B3CD4332 
X-CRM114-Status: GOOD (  20.16  )
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

On Sat, Feb 14, 2026 at 03:34:16PM +0800, Xukai Wang wrote:
> 
> On 2026/2/14 14:33, Jiayu Du wrote:
> > On Sat, Feb 14, 2026 at 12:37:24AM +0800, Xukai Wang wrote:
> >> On 2026/2/5 00:15, Jiayu Du wrote:
> >>> On Fri, Jan 16, 2026 at 09:26:18PM +0800, Xukai Wang wrote:
> >>>> This patch series adds clock controller support for the Canaan Kendryte
> >>>> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> >>>> PLLs and an external pulse input, with the controller managing these
> >>>> sources and their derived clocks.
> >>>  
> >>> Hi, Xukai. Currently, the k230 initial series and the patch 3 of the
> >>> pinctrl series has been in the linux next. So if possible, you need
> >>> to rebase your clock series onto the latest linux-next.
> >>>
> >>> Then I will proceed with the development based on your v11 of the
> >>> clock series.
> >> I've rebased my patch series to `linux-next` (20260212). I noticed that
> >> the patch which updated the `k230.dtsi` format has been merged into
> >> `linux-next`.
> >>
> >> Consequently, I've updated the `prerequisite-patch-id` for my series
> >> from `deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc` [1] to
> >> `9a2d01f55574b538dad572e193f81c44661f0853` [2]. Is this change correct?
> > Junhui Liu's commit `8cfdbd5e207d434a6e924eb81092874177f97536: riscv: dts:
> > canaan: k230: Add b ISA extension`, also modified k230.dtsi. I'm not
> > sure if you noticed this.
> >
> So, should I use `8cfdbd5e207d434a6e924eb81092874177f97536` as the
> `prerequisite-patch-id` instead of
> `9a2d01f55574b538dad572e193f81c44661f0853`?

Yeah, I think so. Cause the latest modification in linux-next is really
from it.

But actually, you are already using the latest linuxnext version now.
Doesn't it mean that the prerequisite-patch-id might not be necessary?

> >> Link:
> >> https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/
> >> [1]
> >> Link:
> >> https://lore.kernel.org/linux-devicetree/20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn/
> >> [2]
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
