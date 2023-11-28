Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8C5C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 04:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KdeuPREiEJVsClT6EdOTi8wnmjEl368O2V+Zct5K0o=; b=mwqW+7GcyJHwIY
	fjy+Nx20OrNENnBfsgniaBTJg194+v7qZ1BjGUXYm3w2snrQRUq3IFhR+2zhvHwhrAZixoY7T6lXR
	CdR93HQDbASi48NZt3JADA0e6fQ6T7PaAi3afQ7gOPmkxi4nkPXVqVoFtlRag7ZAzyyhO5jusQDBc
	+QYIi8FbAk5TKyb8GuN855soU9/ameMSGLuNlkJd8L8DZMQpV9zhcf9ZfTF2ui94zqsQ6x6Oayx9B
	+y1Bib5Y07PDmPfP5r/JWwWoJOrfg7JCfW1tvNbGvtGRWlH+X5uD9odq03aYr4qqTRvMMT3PJRYfS
	zZnAkEuqQwh56GygKn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pTO-0041lz-36;
	Tue, 28 Nov 2023 04:13:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pTL-0041lM-2N
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 04:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85304CE18E3;
	Tue, 28 Nov 2023 04:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563E6C433C8;
	Tue, 28 Nov 2023 04:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701144796;
	bh=kAFkMvBuLfoHgFynFH6S+wAYd5BKHuLLlWYI0TgSnM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsHK2C7QQNAZvE2TpT26qgP1ecn2xqUubax583ZQy5fNMPwpmu2nys/t5HsPExq+g
	 wG+FFNol9mfsKnM+zqMiItVBu6YQ4psJBxsJXd9eWz7J8X/y41QYBUevA8jbCO3nhk
	 Y5W2quyU6plh7doZG9VKUbYXwzIHeQIQEeaIiN9KeitQ1tXtLNgRdondYiZYicad7i
	 BEtxWIUZxyjBe+cJ9aX1JPJtwPv6gGiYDpptmYPfB9/3I7WyRr4Ob2cD4RoRZ0duXx
	 CiRknHcsC8zqx6J7XaRuvFva0sPGO0R7xHj4fbMufD6iN1eW2IGRKo4iNN7aW0Z+DS
	 E4aRjGvVaEdkg==
Date: Mon, 27 Nov 2023 20:13:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 12/13] RISC-V: crypto: add Zvksh accelerated SM3
 implementation
Message-ID: <20231128041314.GK1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-13-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-13-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_201319_963460_9B39E652 
X-CRM114-Status: UNSURE (   5.67  )
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

On Mon, Nov 27, 2023 at 03:07:02PM +0800, Jerry Shih wrote:
> +static int __init riscv64_riscv64_sm3_mod_init(void)

There's an extra "_riscv64" in this function name.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
