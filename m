Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FDFCAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 01:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9qYsUoJE6c/4vZijuh5eGnnpqSkuWvLxUZjsUas2yU=; b=0eK1nr58UfrajT
	LuNF45I3rJet+A/HgfdBH5pDH1UNkWkvLgGBV9Y/UBoEYa8Ogt+tpCGpxNlcRKKXHwXNtcuwKSg6y
	YzcYWpmKQpqPITXUDIC4+AokLZb6DtQ4Y1AmkwIAfT8pEEv/GaCBkp1mMn1gnrPXYdFH+V8pnH5Nb
	zooXViLI70y0BIbAdPsgBkLK//4kc93otoK2GShfeM/b1dnAVWoTxNcWhFhqlk8ndyxNcTQ39KloF
	X6UDOV+pGwi7Nu7US3GKFXA8BZi++xQzJpGNcZSZA8kIMid+3zr94ChSLtAltXXdCBgNOZC7dpHCn
	xU92wvLtxCKhJyFS51UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Uhp-0000000BVbl-3H0n;
	Fri, 03 Oct 2025 01:35:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Uhn-0000000BVbP-0nQH
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 01:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C43948FFB;
	Fri,  3 Oct 2025 01:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE84EC4CEF4;
	Fri,  3 Oct 2025 01:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759455330;
	bh=Rc0jCyqhwITy1zb5mT2jrVxBrzj0eHN3SwcodYrb+vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbR7WYX1w2sUsckCNEoeEsZXkzBgJmehVfrS5tks3VGq4KaG+52S/lNVMkU7kuIz3
	 021EVPz9SfUanKh/B7g5xLntFBdNDgUhZc2kjY/KyL0uZSY4iYoE/Cdedo9HN3+jX3
	 ahtbNMsYWzapeWKRHx27ZaPm04hGmAvB2qxhFx4Fq4OEH4PewNqd3SZpO3h+u927V0
	 SwThOzyBloUR1/vo/Tw8bRhZ4cH+FpYO1qADmwEripz8KfKCNe6xRmvA3ufmhPntSm
	 7oJGuLdXAx4od24nbP6dRHyw19okWFENXxgwzrFjyp648mclb9yqObWQPuLLtNgHg2
	 FxAJFc6DGTahQ==
Date: Thu, 2 Oct 2025 18:35:28 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] riscv: dts: thead: add xtheadvector to the th1520
 devicetree
Message-ID: <aN8oYBGfd9Y0vp0O@x1>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
 <1ff3fb07b24fb375fcf9d3067aa50583f47c35fe.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ff3fb07b24fb375fcf9d3067aa50583f47c35fe.1758228055.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_183531_250532_20E78C5E 
X-CRM114-Status: UNSURE (   8.64  )
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

On Fri, Sep 19, 2025 at 04:44:47AM +0800, Han Gao wrote:
> The th1520 support xtheadvector [1] so it can be included in the
> devicetree. Also include vlenb for the cpu. And set vlenb=16 [2].
> 
> This can be tested by passing the "mitigations=off" kernel parameter.
> 
> Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-4-236c22791ef9@rivosinc.com/ [1]
> Link: https://lore.kernel.org/linux-riscv/aCO44SAoS2kIP61r@ghost/ [2]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
