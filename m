Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A2DC4452E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgY7834nA30AZXpHnbr8JqPBGNilE/FWXXcEl2ni230=; b=QgFoxj0n92Vnol
	B910iKW6Y1O+Pp9arg7SqbAznMh3sHZuToZ4tNOTlgotyzJDIJUZVIgz11y/p0GpiM4tFSlNv13VI
	R/yNTw9/djK2XU348Xyr8WqihBmH307jjZMuhE/hL2l3uiXIq+nJuWVE9dsGcsu/BHSh7AaTB9Jg8
	4pjZkZZ7Mgyou1/h67g7MyqTg5EuWud+A8hwZObxho6Rusuqy/TcZ/CH9pdptBdk/5nPRIv69k0wV
	TmZc6WevZnysmLlp1NpWJ1XN2qWOmG/HwEd5U1d2cT+1zBM5YpB0zAqe5+T5F1ttMIjK/sssWpZFX
	gax7NBvXthcWg5ACCRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYgF-00000005YZf-3pYH;
	Wed, 21 Jan 2026 13:55:31 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYg8-00000005YYo-0GtA;
	Wed, 21 Jan 2026 13:55:29 +0000
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-03 (Coremail) with SMTP id rQCowAAXOuG+2nBp3sIgBg--.24067S2;
	Wed, 21 Jan 2026 21:55:12 +0800 (CST)
Date: Wed, 21 Jan 2026 21:55:10 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: gregkh@linuxfoundation.org, conor@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aXDavrU8ATmUyWHE@duge-virtual-machine>
References: <20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260120143243.71937-4-jiayu.riscv@isrc.iscas.ac.cn>
 <aXB7GqQaxtgKReVa@vaman>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXB7GqQaxtgKReVa@vaman>
X-CM-TRANSID: rQCowAAXOuG+2nBp3sIgBg--.24067S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67k0a2IF6w1UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr
	0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r43Mx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8489tUUUUU==
X-Originating-IP: [183.192.221.134]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_055525_956024_579859A5 
X-CRM114-Status: UNSURE (   7.14  )
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

On Wed, Jan 21, 2026 at 12:37:06PM +0530, Vinod Koul wrote:
> On 20-01-26, 22:32, Jiayu Du wrote:
> > + * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> 
> 2026 now!
> 
...
> > +	void __iomem *base = global->base;
> > +	u32 val;
> 
> blank line here please
> 
...
> > +    /* Configure test register (pull-ups/pull-downs) */
> 
> wrong alignment above, pls fix it

Thanks for pointing out these issues. I will fix them in v5.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
