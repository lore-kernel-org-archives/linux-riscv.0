Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1CD105D999
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 02:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfBp74zT7WdXyyNXIZSZ590MRVgVGpC0KT4OkP9L/u0=; b=pNlgBGGU42E3Iq
	MXGartmPYSq8WL+TlKcZcyyjLgw+caC7pp/VEtugBhZe0SEb3lD+41swFl7pHwc+Q/CcmxAurVkjQ
	NLsAEKcaGPP5urCIm9yZwWYabGsvRTbA1lMmzFNSWrR9SJKXN3NcxVAh8eGn0T9rA2Kc+HKkxq3Zw
	D8R7td1DrYd0+RgibTjFEG0z1HciD4IqBwiFju+/KdC02HsXratk+b63+aHF9Kjiqbbx1E89Lc3CB
	GbbBKjoabiboWeoXsbVjtWwiLusTmcbl9SR1VFiEzNvkCNUYSB6ivyk0wt8qdm8md+gXAihHQYHHl
	2NqiA/ffTlpL69mWiC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAIs9-000000088dF-390u;
	Wed, 08 Apr 2026 02:42:29 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAIs6-000000088cR-3qNM
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 02:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=sVYEmmSFx/Qa+zg9gNW+mOmFsSLO72sqB
	J5Bs0zLjOw=; b=mLYfLZDVnZBJXcOsekEw64CXUxqWLG6y1/jkw4b/11dPpzGxt
	qi2yqYzaEtOfagNLx+RnoVTFQaDQHYpzsDKO2QPxjPYBPiGEdvvXIgJ8SGIpcjHn
	RK2HDCxcWlqLVSlFUu/cK9BokV0/josGRyOT7luqw+TKS/Pf2qcCbmpiBI=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUK1wNVps6oBAA--.1093S2;
	Wed, 08 Apr 2026 10:43:02 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] MAINTAINERS: Add entry for the UltraRISC DP1000
 PCIe controller driver and its DT binding
From: Jia Wang <wangjia@ultrarisc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jia Wang <wangjia@ultrarisc.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260407-gentle-warping-tanuki-0edbda@quoll>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
 <20260407-ultrarisc-pcie-v2-2-2aa2a19a7fb3@ultrarisc.com>
 <20260407-gentle-warping-tanuki-0edbda@quoll>
Date: Wed, 08 Apr 2026 10:42:15 +0800
Message-Id: <177561613504.2731393.2161128268287250427.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775616135; l=1349;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=VuDGKiH1dfzbiq7CXtN7KnySBPSNYMNmuEZzDJ7/rBM=;
 b=908Ms2KXDzLk+JXrsJqpSHY2ON3qWRRuLYhyhbZDYSqtqep1+DpuasFLyuE0aVUYocqs4Aokq
 2889emGG2crC19+1S5WG/ToTUtyzzMfg8Tbe9DkNpeZQtuhtFs16X39
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cUK1wNVps6oBAA--.1093S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWkXrW5Kr1xuF4xXrWDArb_yoW8JFWfpr
	48CF95AF97Jr43Kanag3W3ua4rXw4kAry3Wa9rKw1vvF9xGw15J3WDKwn8u3Z0yr18WF42
	yr4j934fCa17Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQALEWnUfzsANwABsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_194227_659126_060522B6 
X-CRM114-Status: GOOD (  18.29  )
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

On 2026-04-07 09:44 +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 10:40:53AM +0800, Jia Wang wrote:
> > Add a MAINTAINERS entry for the UltraRISC DP1000 PCIe host driver and its
> > DT binding.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c3fe46d7c4bc..c8159670a14d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20582,6 +20582,14 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> >  F:	drivers/pci/controller/plda/pcie-starfive.c
> >  
> > +PCIE DRIVER FOR ULTRARISC DP1000
> > +M:	Xincheng Zhang <zhangxincheng@ultrarisc.com>
> > +M:	Jia Wang <wangjia@ultrarisc.com>
> > +L:	linux-pci@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> 
> There is no such file.
> 
> This is not supposed to be a separate commit.
>

Hi Krzysztof,

Thanks for the review.

In the next version I will fold this patch into the commit that adds the
actual driver and DT binding, so the referenced files will exist.
 
> > +F:	drivers/pci/controller/dwc/pcie-ultrarisc.c
> 
> No such file.
> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
Jia Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
