Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4CBCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4Re6inLGn3o4+ST8ghXKI6YpjS7Vfe+0QuVU5NqAlA=; b=sXgyeiqebr5XLq
	BVL2BI0zJ+cbiag8w+C4KJCyZwVyGVHmPryydWJ/C5BGdY7tjrl3oZCbl3i1sxtrFPODS9Efa0OP3
	BmEk+AJ4Ac++4b244VC85Psm0MNQCuSwDay8GjsdQvr4fK/g2KEggOIPZuxPMw/l9JJ+I8BWi6eL3
	6uVKnY30DzOdyr7ViBk3tvZvBnLBFG4LNOZkELLeAluNXicdJCoCUWZjWvJfwhbhgJGC1DJXEmGgK
	p+cq0EC+XWFl1xr0yCTlencyQxfXozhv+7mcgotE+Y52aLmdziuJZkVlNLWc7UwwmKI51uspf38oR
	MN1F2QgH4bXfttsFqouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5dl-00000001EN0-2Rj2;
	Wed, 29 Oct 2025 12:51:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5dj-00000001ELa-1wFa
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 12:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 338ED41566;
	Wed, 29 Oct 2025 12:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13910C4CEF7;
	Wed, 29 Oct 2025 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761742258;
	bh=4TBWX2dHkHV9SwuNsU7c4yBhCIWcloSM+wJm+VDz19g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzcgEJ0BKNZr6wA+ygkQR6d44U8lmT5D7Mn/4HstBHyo6yyb1W7ER7wpPK/cX1bbZ
	 /NXMB/pVwxddzZa8raLzXbbHtc2GlNvuZDZ9B+kZnpEeiJBAfO4pNB9MkQ2PwiRhqy
	 Tv7S2t2XDresd6M0yS7uzKr4XFA05/cy9JjhVt3JeeXxgZ6nw9cnZrt/4lTu7p+Hj+
	 owVYIH5bm4dGJip3seN0hr818oMFVxmTzba19fHyZkb7yjX3qEShQypEP5jN3nkNen
	 2tjvfFNs/bBKCKvt1GT8ztNlL1hIgxeuCg1zFpjKsihTv07+CNbu9xibVdg1W9E30C
	 QWG2doAdI4Oeg==
Date: Wed, 29 Oct 2025 12:50:51 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 5/5] riscv: dts: thead: Add reset controllers of more
 subsystems for TH1520
Message-ID: <aQINq-rdtT3Dps2g@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-6-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014131032.49616-6-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_055059_534467_48A6B269 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 01:10:32PM +0000, Yao Zi wrote:
> Describe reset controllers for VI, MISC, AP, DSP and AO subsystems. The
> one for AO subsystem is marked as reserved, since it may be used by AON
> firmware.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

There is a conflict now in next but I will fix it when applying.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
