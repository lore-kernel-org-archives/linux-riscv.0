Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB885EFCBB6
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLNqJrKQKAC8odZhhJtYBBbp4ryCS347ZBKUNuKfckk=; b=JiKk1CgJ6KCrd7
	kGoDgZlO8ofNpnd1YW/GOUJdlz6zXWdKkGa3rkw9Ty0UJgcSty1h1ATpBf5ITVOVm4szYX2C6KJXG
	LrsVVonBNQuhUoFEGzW0+nNGjxdeBtlU/pdJBVLCdHpQct+Vkag1Q8etS5MMl5cAsE+PL+OZHubZN
	WKxVAc6KdHbszkhqX1W1c72iEh+N4vhIK7r52M4Jo5oUGDzjCOl/3RGU4XdTDUt4AMfzkbo5F3r2F
	NHekhi7wJX+xenclwl1D0YGtilbMG0LP+gO8Lp1Ld99h56D9Ext/M+mjoT2M+mwZcWz5Onfyu2/dt
	DJBE8np78HqB0aA2zLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21Le-00000003PM8-1S8v;
	Mon, 16 Mar 2026 06:22:42 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21LY-00000003PLJ-22IU
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=ZHcmiWhMpL9GuM0+CEr7+pw6x8VFu4/fr
	Ucpb3ikMBE=; b=FpH/i98fQaEK9PE5XOydftKAyM+npewBtGNMiP6X2rrZpFq1y
	qXyJ06EaqVUQvvZaccuv8J9VTaOeyHs3sDIzzCf/9bpRwEheNGpyfSZFyWfttWnG
	Zvbq7F1wuZMwAvYQtOpDU/EL3j34kVtZw5U+J6NbSy3Ax8YcUjze+QMxsI=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHJSUnobdpPyQBAA--.1003S2;
	Mon, 16 Mar 2026 14:20:24 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] dt-bindings: serial: update bindings of ultrarisc
 dp1000 uart
From: Jia Wang <wangjia@ultrarisc.com>
To: Yao Zi <me@ziyao.cc>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <abeJHQPJpXIANdzR@pie>
References: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
 <20260316-ultrarisc-serial-v1-2-c464f3e933a5@ultrarisc.com>
 <abeJHQPJpXIANdzR@pie>
Date: Mon, 16 Mar 2026 14:19:34 +0800
Message-Id: <177364197414.3367033.1418052022015632631@leopard>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773641974; l=767;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=SXRuGaGaepP5p5H3sbCrVibKE3OY4HQUupGgKw00IQ8=;
 b=A4U4AQzWYhDM28iMYkVyNvX5B3Z+tCtetiW0LGU4uWBc4MsODRkPkhLd+UCPbq5gcUTtDk8be
 utrTXaJO7hJBz9jFrhSKLKel8YFrGyF85827sTIVCAfwb48qd2xQo/a
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDHJSUnobdpPyQBAA--.1003S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw15try7Cw1kuFy3WrWDCFg_yoW3JFb_uF
	1xA3s7u3yDWFn7tan3JFn5A3y5C395Ar13WFn5tryYkrySva9xGF1ktrySy3s3Xr4Igr97
	CryIy390kF4agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAIEWm2TAkADAAKsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_232238_216373_BB1A6F67 
X-CRM114-Status: GOOD (  13.49  )
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

On 2026-03-16 04:39 +0000, Yao Zi wrote:
> On Mon, Mar 16, 2026 at 09:36:19AM +0800, Jia Wang wrote:
> > Add UltraRISC vendor-prefix information
> 
> You don't add any new vendor prefixes in this patch. This commit message
> should probably be updated.
> 
> > Add DP1000 UART compatible information
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> 
> And the dt-bindings patch should go before the driver changes.
> 
Thanks for the review!

I will update the commit message in v2 as suggested, and
reorder the dt-bindings patch before the driver changes.

Best regards,
Jia Wang
> > ---
> >  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Best regards,
> Yao Zi
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
