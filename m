Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3C4C369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWpjBh5VHiIJ+T2Qw9Xu7coCYA+Hpl4bDR/7AoRf3tg=; b=Zfr0YQjWrdF382
	Mldgupf+/Eo6C3HYzd1ChQmAX/G7ycnrYwGkpNqyjDCzxQywvOOxjQx9Zi+julkkxZZJKL0qSgQje
	2lXpxeXzPCeFul2IF7LjxTaf29yBMFGA+ikHOlFjfBA6npi+HkW88wxZ7CNo8nnfSCxCtdzjDF7zE
	p9lxbZ5baDtmmNqtQNr8fIY9q73RCFCv3eGfj+1MTUQebaaN+f0DMGCVqgMScJo98a8SVpd5JptwW
	KZ/zjFGXK1BjRIh6cYyIhJ4RFzHmIiwjHI7jb9oaiea8zaHdUDWz3jj+cGNQmxbxCVHRm0alaCwz4
	CW4bXNpxgWEh4Z9rsTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oxn-000000013Hu-25nZ;
	Mon, 07 Apr 2025 16:04:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nEn-00000000gHu-2wUn
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 044FA5C5D07;
	Mon,  7 Apr 2025 14:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDABC4CEDD;
	Mon,  7 Apr 2025 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035248;
	bh=eE3M8z7vIEzEzXYZWugQbudz1ajq2YdJpDuNX1B+lQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHYom3BSDj1J5/Cj56P29FDzbB/dIJRMbX7QMPZ3vhcXj9PIbNFTahQ84BBwJD6nF
	 hsiT7tbV0eJsILYj5dUq3Zc3+1vICgZFGQbtovQYozzofsFXptcNIfkwxpaVWw2SDI
	 pUQ1eCXOJHul2F7i2GfdqK7YrUAKM777EntgEZtQv4c+FU5NSYLRwD1uvhuONOYoj2
	 Sp9mO4zS8hyNf5OkUGsWf3uS2x8x8r0JwEIHDyaTTzYMT63eQbT9XeO9kGKPosBkmp
	 g4PyCNXKdAwbKnmSVrevNVXdE1my7WBiAOq4X/NRYAUshIFiNUieNnuxwgi00iu0nJ
	 qBFj8f82Gg4Jg==
Date: Mon, 7 Apr 2025 09:14:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: palmer@dabbelt.com, alex@ghiti.fr, conor+dt@kernel.org,
	linux-riscv@lists.infradead.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	aou@eecs.berkeley.edu, krzk+dt@kernel.org, tim609@andestech.com,
	tglx@linutronix.de, daniel.lezcano@linaro.org
Subject: Re: [PATCH 3/9] dt-bindings: interrupt-controller: add Andes QiLai
 PLIC
Message-ID: <174403524699.2250131.15335040346348626283.robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-4-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-4-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_071409_782731_6B21FDE1 
X-CRM114-Status: UNSURE (   6.54  )
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


On Mon, 07 Apr 2025 18:49:31 +0800, Ben Zong-You Xie wrote:
> Add a new compatible string for Andes QiLai PLIC.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
