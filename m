Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B788CCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 05:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSXYjmikXSCcZCVXKTa+D3TzfTR/YORKRZv3pCKYpII=; b=Skp/GJL7WGbYMM
	9SITmRqymtAyFWV+E+3sdQ7KUz4jnVKsnQKG8JE9oa2jHekhVrmT7yp93Q2WVc0dbhvOscYyh4+6e
	X0MbCivD3jjIyKV+pUtnT0pZWBlUSf6snZq9wU/eURhU2RB9IRXsRyJ110HNU57oiIHfomhsigi0z
	X7lkj8ElNtgN+Edv2JUCwlHzb8bQpYojzGA864X0yF6WoAWi1Af5Rmz1s8HKuRVb5QvRkeuhM6J3Y
	GPnEjavjc1cQB+oTa0FNbkHWOhkh0FMCLO7xSdMFNay5+kIA7mFLoupyC+P8DUEJf8ObU/E2hcTfk
	yRdcoP6GvJqlLdgyNcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzCW-0000000HOek-03EZ;
	Wed, 29 Oct 2025 05:58:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzCU-0000000HOe6-1qIx
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 05:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6609C60223;
	Wed, 29 Oct 2025 05:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761F6C4CEF7;
	Wed, 29 Oct 2025 05:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761717505;
	bh=LsZ1vHE8LISoCJXup6m2y/jZ7lCTlE9JnkLZJ+nsGzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAJ/muu6fYOzeweIFSbHTkQ+z16gj/rOD7Ap8GXMMI19Ct/8u40LmNL+9h4MAs6F4
	 a1oJXoE31rZDuE5ZRKdV5X9rptMYNsOM1GxLQg6aPEdKxWoIxWtjkdWId7f6lYvCIl
	 8lOwOzDGypOE4Qgkj3pPgLv8XRYy43c5xOo4J8wmZ00XpVkgtxSJxcz9zBOZxFRyki
	 TPcdNOQTTIPbrWlmeU7nb4trAVv6JAN2mJ487gq2WD5BxSMmQjE330a30f/76Eeb1D
	 dXeL8+okcXlUIlAYPDHnC12qHSkSL2yJ2Ijhr9Hc4HetXMBCfRuIsFCewHNBiqCqnh
	 BAgq6ZXG7Jdtw==
Date: Wed, 29 Oct 2025 06:58:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com, 
	paul.walmsley@sifive.com, samuel.holland@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <20251029-nebulous-doberman-of-wholeness-0fd3a5@kuoka>
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-2-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029001052.36774-2-josh.milas@gmail.com>
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

On Tue, Oct 28, 2025 at 08:10:48PM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC [2].
> 
> Link: https://milkv.io/duo-s [1]
> Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]

Drop second link, not relevant. You are not adding new SoC here, are
you?

> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---

No changes against v2? You received comments, didn't you?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
