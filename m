Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F2AD3EE89
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UN7GJZjasNhQF3pMv6k2mD9qoNaMplrhVSNU3A9re14=; b=S123SZI6SZOv+R
	hkM3XLcAXyBMftn6qh0ZKpcvXV3Imu/Z+LAEtMQSeFl0LspOY5VQlCQCC9oNtRg+4CZT5nGwCGf4p
	Rs6Sa3YKQuCRQv49UPbLGSkUN0CrpcKEdzxE+QGXqxA9HX9RH8E29Y6+s0MLpO/z3mzcTe9SthaNC
	qN8Tg45sCVrqoo8A2kfeXqlPEoEN4Xr7WlLVcEVUIWB2vXuDsPnCPTizw+SLV1aC+niV9ZotAG7TG
	W0ieZSpOUrarAUa1bJtV0bWQ11hP4Jdp765+t2+EZM2UvqbPkwufAdASpf6gDNyMCWl180+9Ho9Lb
	WjT0uM/J+IbyPcYB0hTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix85-00000007Ne3-3cEH;
	Thu, 22 Jan 2026 16:01:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix80-00000007NdQ-2WQX
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:01:52 +0000
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-01 (Coremail) with SMTP id qwCowACXP2vcSXJpCLXLBQ--.27565S2;
	Fri, 23 Jan 2026 00:01:34 +0800 (CST)
Date: Fri, 23 Jan 2026 00:01:32 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <aXJJ3MjQSq8Rq084@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
 <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
X-CM-TRANSID: qwCowACXP2vcSXJpCLXLBQ--.27565S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4DKFWDKr43Gr13Xr43KFg_yoW8Wr1kp3
	93uF18CFWDK34I9F1jvw4xCw1DtFs5ta18JFnav348Aw43Z34kZF1I9w42vayjvrnrCayU
	Ar48Jwn8tFW2v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2wIDUUUUU
X-Originating-IP: [183.192.221.134]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_080149_085725_A5F17E77 
X-CRM114-Status: GOOD (  15.30  )
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

On Thu, Jan 22, 2026 at 07:40:29PM +0800, Xukai Wang wrote:
> 
> On 2026/1/19 16:18, Jiayu Du wrote:
> >> +
> >> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
> >> +		     K230_HS_HCLK_SRC_GATE,
> >> +		     0x18, 0, 0, 0,
> >> +		     &hs_hclk_high_src_rate.clk.hw);
> > Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,
> 
> I'm a bit confused, as I don't recall making these specific changes.
> Looking at the code below, the only difference between v9 and v10 is
> within the K230_CLK_GATE_FORMAT(hs_hclk_src_gate, ...) definition, where
> the second parameter changed from 1 to 0. Everything else appears
> consistent. Could you clarify which change you were referring to?

> > but after my board test, I find that when hs_hclk_high_gate is turned
> > off, the mmc/sd and other high-speed subsystems can not work. So maybe
> > you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.
> 
> Regarding the clock management, I recommend explicitly enabling
> hs_hclk_high_gateas it will be closed by `close unused clocks`.

Sorry, you are right. It was me who made the changes locally. And I
saw your reply to this email[1], which you said According to the vendor's
code, the parent clock of hs_hclk_src is hs_hclk_high_src.

Indeed, the parent clock of hs_hclk_src is hs_hclk_high_src. but
hs_hclk_high_gate is the gate of hs_hclk_high_src. So, what you mean is
that you will add the CLK_IS_CRITICAL flag to the hs_hclk_high_gate?

Link: https://lore.kernel.org/all/159615d3-cc52-43be-bf6d-5fe717ef1cc4@zohomail.com/ [1]

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
