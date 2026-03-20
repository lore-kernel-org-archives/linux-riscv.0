Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A1D1093177
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 06:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4whEkzYTL24IOGk9J5n6e5JlLMbWXMToFt/Y+W7TMi8=; b=UAHBXEKshvG3fB
	WTT8/KfcbWMBvw49mUiFfwiVNnSmfNmaKcUGYlWXDIW5AA2YbYxf3GGp26LdXkKSPMnmtSTtTqU1J
	4rf4ieIj1Uf/lK6EMlTDiZBOwMhIQ6nhjFZpydvf6EXB20BAEFhLLq+9H244h2oyqZMIy6w95BsaG
	IYihv0iedFljGSmc6MelggtrNJ2Oz2WZOr95ZYT601b4MgiQlweWLvzl8dGJkrMqeUWxAPYRi7u3h
	L+EYo3izq2HMa/G+v+W/Yz3LNKCSqjJEpLVdMdxB2oBXmc3MNThnwwgj14MBktKaoIB9QvT622c06
	7CUfkO0tHZkG9BYBhSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T8l-0000000C9o2-2tsk;
	Fri, 20 Mar 2026 06:15:23 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T8h-0000000C9ms-2HUv
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 06:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=JQYpfAxQPMDU+UQhbE1MSUy13Q2F6xS22
	otyMsA2jzY=; b=M93ZAxsWHsxGH1wkEaID1DbDxrYQ9LBAkoDe4BkySY0iqYCGd
	Iv16vyk18bddS7OR2/1peWHkqBCgwUUdbteos6JNFJemCNlxeBVtN2n1t0YrM/Yz
	GZfLHU3W9iqpDxSIgXlPuBmJXMUuUEMFy93woLacdCYIO5ub8fLgU2WifM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHJSUY5rxpYK8BAA--.1427S2;
	Fri, 20 Mar 2026 14:15:52 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
From: Jia Wang <wangjia@ultrarisc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wangjia@ultrarisc.com, Paul Walmsley <pjw@kernel.org>, 
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
In-Reply-To: <733fff11-c670-42f9-812a-ad5a501491a1@kernel.org>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
 <733fff11-c670-42f9-812a-ad5a501491a1@kernel.org>
Date: Fri, 20 Mar 2026 14:15:03 +0800
Message-Id: <177398730341.868832.396923232162447023.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773987303; l=2136;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=2pqLbTWiRACZPGVDq95jVqtZW/WbdYgtCceAUuj54nw=;
 b=sPDgYDN0CcUjnivhXf0w/8xgnL89SHaQN6UmvkhfIt2rcSqX5SIbiXbr4ZNuKSQBPBXk5dOWN
 3ZuKH1qoC4eBmQGlPqAU3zrUTZQo1cFwhidL78evHloQ+MCoRG0OSRM
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDHJSUY5rxpYK8BAA--.1427S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww15Gw4xuF15GFyDGryDJrb_yoW8ury3pF
	W3CF1YyFyIyr1agF4Sga4xG3W5ZF4kAFW3AF47Kw17tFy5ua40qFZIkw45Wa4DAr48uFW2
	vF1Y9w17Kw47A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQALEWm7kgkAFwAEsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_231520_318908_4B9355FC 
X-CRM114-Status: GOOD (  16.23  )
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

On 2026-03-16 11:05 +0100, Krzysztof Kozlowski wrote:
> On 16/03/2026 08:06, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add UltraRISC DP1000 SoC PCIe controller devicetree bindings.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  .../bindings/pci/ultrarisc,dp1000-pcie.yaml        | 108 +++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> > new file mode 100644
> > index 000000000000..b50ff98dd878
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/ultrarisc,dp1000-pcie.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: UltraRISC DP1000 PCIe Host Controller
> > +
> > +description: |
> > +  UltraRISC DP1000 SoC PCIe host controller is based on the DesignWare PCIe IP.
> > +  This binding describes the UltraRISC specific extensions to the base DesignWare
> > +  PCIe binding.
> > +
> > +maintainers:
> > +  - Xincheng Zhang <zhangxincheng@ultrarisc.com>
> > +  - Jia Wang <wangjia@ultrarisc.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-bus.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ultrarisc,dp1000-pcie
> > +
> > +  reg:
> > +      - description: Data Bus Interface (DBI) registers.
> > +      - description: PCIe configuration space region.
> 
> Never tested. Test your patches before sending to avoid common mistakes.
> Several issues here are just duplicating known issue.
> 
> Read also sashiko review of your code.
> 
> https://sashiko.dev/#/patchset/20260316-ultrarisc-pcie-v1-0-ef2946ede698%40ultrarisc.com
>

Thanks for the review and the pointer.

I have checked the Sashiko report and will fix all issues in the next version. 

> Best regards,
> Krzysztof
> 

Best regards,
Jia


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
