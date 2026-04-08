Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9615A10F9940
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOD0WnJQ3r1NYnOTRYqfdDvhRVt7U7v4izDj46ZUMUI=; b=3guLgp98oc5qCn
	i0BFOgy+pFKj+XTKtoCoJbEQdtNX9Se9J3Gbmai5Wg3nrWdut2QLEsP4dcWgk/slSHyuZGqFTmdl6
	pyZROcTmvfTFRZZI+MafFp3PLkNvNW1zpLMCwrAQAZpsw5WyK5AWAA+28YrppOfP60hLhlYtXh3Mg
	ELQzbbVvixUBslFHJtEhjaxrNo7tYLeHhwq/jItIgMSVye1Q6NoGWoKXl9w9AExrRR9E6ldVyz/o4
	YdbvQd5YRUeL7TlFhQcuVrQFZbWMoflFl0ajHUS/c7K2+o2avoTzOciIOHWoYsH6K7oziH4rwtDHk
	Sz5oV8CAEhbWUfry4ENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAU69-000000090aJ-0937;
	Wed, 08 Apr 2026 14:41:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAU66-000000090ZW-2ilp
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 14:41:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E78A42D97;
	Wed,  8 Apr 2026 14:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C72C19421;
	Wed,  8 Apr 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775659297;
	bh=9Wh+UdZumYojid9BJ79nOukj+1g3DhzrpOCs2lcpkKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQwKaji5c3YHl2s49VDS37ys8LeBDbxv9oQj9p9sBr/doYxy3qfFkBVzRmtiZrghv
	 sn6XTXiq7icjPfTa1ZFGQiA7saECcOaeYzagPWM6VI29qIaXXAbQihHtDPRTUIIfri
	 81isnx+S0Aww+2COAyIFjmojnZzJlCjdR6X9nQs83Ueym8nlIj5BgyDTEaWU4s8khv
	 XwA7OGKsr+tkKvgJEGLK7MspRfmMvWjoj2lcO3pcSS7/c/hmmfDIx2ZTAPlcQiQeP9
	 phVXdh4te+zts/zinziolOTr4gZkZ9dCTYYjNRghSM5IG3Is3mYnVPI+DARC8HqVL7
	 qU9lTSU7IreSw==
Date: Wed, 8 Apr 2026 09:41:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-pci@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pci: sophgo: Add dma-coherent property
 for SG2042
Message-ID: <177565929503.2148173.1789231317334503357.robh@kernel.org>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
 <20260331171248.973014-2-gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331171248.973014-2-gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_074138_710156_27C9DB75 
X-CRM114-Status: UNSURE (   8.83  )
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


On Wed, 01 Apr 2026 01:12:47 +0800, Han Gao wrote:
> Add dma-coherent as an allowed property in the SG2042 PCIe host
> controller binding. SG2042's PCIe root complexes are cache-coherent
> with the CPU.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
