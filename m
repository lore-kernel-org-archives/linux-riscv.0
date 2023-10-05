Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17242E7B61F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 06:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJ73CHLu9GbLZPHvLIbzMEAb1woz26O2kXzfPynp4q0=; b=yT2L5nxVA6L811
	lZDbf4aYeP225mtDCZHbkBW7RowFGOutGT1WhXGmZSbvayRbC+G32+HldvBwkPo+9ZQo+EsiBNnc0
	jG7hh2pZf1sxscmjZdDr4EiTTB466S6f2I5T+LSx5/9BK0vwlVipxYm0NAKr/uo9WIWw7iavTOLxo
	5nnPyBFInBgF55/sptBh6g+pIw/CKNdovk6GHnghmRk9a0FCpQjOC5B0IFG7wkfiP7Dw3Ee3wWEpt
	Y8ojcNrvlhqcAmjIi1lS4jKpScFHWz9WhSfQlKSusoVKADmutizWawF6GyEmM67uFodh6dyZSXh1R
	IIx9Kd0USiLJy1Bu+bxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoIBK-001Xni-2P;
	Thu, 05 Oct 2023 06:49:58 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qoIBI-001XnF-1g;
	Thu, 05 Oct 2023 06:49:56 +0000
Date: Wed, 4 Oct 2023 23:49:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/7] RISC-V: Detect XVentanaCondOps from ISA string
Message-ID: <ZR5clPwviAN2SHVY@infradead.org>
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-2-apatel@ventanamicro.com>
 <ZRpitP5y1yhzKwbE@infradead.org>
 <CAK9=C2XyQtHy3__i+fahbi49=j5Z3Z_Bv5s3Ptqjmuaa5q18LA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XyQtHy3__i+fahbi49=j5Z3Z_Bv5s3Ptqjmuaa5q18LA@mail.gmail.com>
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

On Mon, Oct 02, 2023 at 09:06:08PM +0530, Anup Patel wrote:
> > extensions?
> >
> 
> We already have few T-Head specific extensions so Linux RISC-V
> does allow vendor extensions.

Only for kernel internal operation and to actually boot the
chip.  IMHO still the wrong tradeoff, but very different from actually
user visible extensions that will lead to fragmentation of the
ecoysystem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
