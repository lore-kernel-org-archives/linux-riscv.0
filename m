Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7791093177
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2ImtX84LlRg3/KRUjrfisCCAkV8M3wuYihfIJ3L/XA=; b=N0SZidjIOXyrM7
	HS1hAVNVqy4hGa4mvOKoAb07Nn2HpuFq2CssV7aCE6ACwzP6sQdOOorAOp8L/ypSJIXXlqZOfeTCi
	G4r4C/p/mMs8GAIlqkwOcQsq+ltSEIHT5xukHgHbKs4fqCchTWDJpKsueP9wz5LIX8MNh0lSXS20K
	B4thc6SCVx3ybSLJhO2WLQKhqzuszv28SIU72qV/i710J2gzX8HPke2nK5IzYRbM4+RqbRSKJ/Vst
	GchDvRjHnAdwMvEiQqv8MSHabpubLg1gyUtn675T1W5sLqpDFz+nIHHBqX+avmyd6IJW6RsKf71y5
	676yTNVXF8udnarv0A2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TBh-0000000CAKT-2ITB;
	Fri, 20 Mar 2026 06:18:25 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3TBe-0000000CAK9-3oYz
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 06:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=bRUfZLyt/5bbKear2hy3kAF4bra3kk4x5
	MeE45aviEY=; b=AqsCrI5GmKr9FowOxDDph3CBlawoXfEmE94ySb/5oJpq0MzuL
	ENkX+SMUQARi+6OnTBPZio4zDRWLNwBlZaIvl1aOxKzDy9BzfSGkl6HwclW1wdvs
	SlUApbq9JbzSTUIiaykx6tc/odwA1TWWH/x4p7OVXAQe1dAdpjI6JQYmak=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHJSXT5rxpc68BAA--.1429S2;
	Fri, 20 Mar 2026 14:18:59 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
From: Jia Wang <wangjia@ultrarisc.com>
To: Yao Zi <me@ziyao.cc>
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
In-Reply-To: <abje5wWCljOBhgHU@pie>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
 <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
 <abje5wWCljOBhgHU@pie>
Date: Fri, 20 Mar 2026 14:18:10 +0800
Message-Id: <177398749027.868832.1298847153062607253.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773987490; l=1364;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=uKJgmveAw36txwApbSJWSFtsbo6gNksbtD2JG9bD7TI=;
 b=UALu9pLedyKJYQt3882L8CXqjYL0j8xc6UE+2hx0VucaBoRO0SxCFg71riFjudhQTrtrx3pKX
 PgT2CEiiPFXA78HqvsCiG4w15o9kmIlylPT/NEE7AaCV6qIaAoIKPbe
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDHJSXT5rxpc68BAA--.1429S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4fKFyDZw1fKF4rXryrZwb_yoW8GryUpF
	y7CF1FkFyxtr1a9a1Sq3W7Gw13Xrs7AFW3Jw47Kw17tFy5Wa4rXa9rK3y5Z3WDXr4kWFyY
	9F1Y9w43K3y7Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRRBT5DUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAMEWm844oAAgABsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_231823_347269_8BD0005A 
X-CRM114-Status: GOOD (  12.67  )
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

On 2026-03-17 04:56 +0000, Yao Zi wrote:
> On Mon, Mar 16, 2026 at 03:06:59PM +0800, Jia Wang via B4 Relay wrote:
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
> 
> If so, you should probably refer snps,dw-pcie.yaml to avoid
> some duplication.

Thanks for the suggestion. I will reference snps,dw-pcie.yaml in v2.

> 
> Regards,
> Yao Zi
>
 
Regards,
Jia



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
