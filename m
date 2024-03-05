Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BDEC54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SgXZNlnuDeZUxRlSlD63xVjodAsBBXao9CUs3O9JoM=; b=yFXoK+w8EwpCfl
	5v8t72xGUvL4xipQw+JMb+xBXPP9I0S+NH7xxzCCBdxZefILyFoZGk9q80Tz1hpYV8LxwL0lq7uDU
	R8UvBZr8STsYdNgODKBW84qkDgpGsCyXCBlMc2ZaYdNjXJWO4Drj7p7qwn4CodrDJzJoeC0l1Yw8m
	glD3/ueIGa0P/asN/ibdV6hcZxAQE+R137ZEtFmiVIScs3DZt4DF53PJSa52pNU0NIhSUviIx6kBG
	YLJ0+szlK9sB2Yu+rFHgecqC6q9ZV9EzvoZ1SNbrtptRY0RhUcIHraSET7SjfZyz7otmQiEnWPHUF
	ExUxZ1YsLfnE81hW33LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW5n-0000000E6tB-2vi9;
	Tue, 05 Mar 2024 14:48:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhW5d-0000000E6o0-0eNp
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 14:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EEB6615C3;
	Tue,  5 Mar 2024 14:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E49C433F1;
	Tue,  5 Mar 2024 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709650100;
	bh=ivZ3608XOjlyfI/jTVtD2Rd9tfXwgE5HJrQajJgh2MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAzSaouwcSUTBZt+s6Yv7/P83NDFtlBo4AaFMjL12bVlmPptxiYgrFpko575FcjGW
	 CGk9IQbqNSsmthc+9Z8gicgvmg8+7pM61RA38a2SGI4ho0deAtn4kRnuASxqYH1Qzu
	 ro8ovihIOSoHE6Bba4ih7rlC4Kt5rV7qiygejo7aQHEqnFJZEl2c7iExlDz5WihFPl
	 yoCTO4/McjGTmEh8ShNk2U9uSOE7rlNDXY2H028XvqounaMoD/g2D/KzoBO+Lonc9l
	 Ird4fCpLofrAV6h8EoFKtbDSCEDArLTDle8WEqd7vgmZYCFqiPu5o+VPmi/H+uBw/V
	 0es7Y/klS/UXw==
Date: Tue, 5 Mar 2024 08:48:17 -0600
From: Rob Herring <robh@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: interrupt-controller: Add Canaan
 K230 PLIC
Message-ID: <170965009708.3330690.1601978626699583351.robh@kernel.org>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_1B1643401B7BF8EC04C3B5551D9D703B6209@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_1B1643401B7BF8EC04C3B5551D9D703B6209@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_064821_641068_2790411F 
X-CRM114-Status: UNSURE (   7.89  )
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


On Tue, 05 Mar 2024 05:05:58 +0800, Yangyu Chen wrote:
> Add compatible string for Canaan K230 PLIC.
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
