Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC03E88D8B
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4w7zvEK87GPaxoJbsLBZ6MZUc9LinbL75RAW9Qu7XU=; b=Qu/ZcCNVR7icb7
	wVwuJ/OYKM640l5Pe2KLu5pf2PW5PoVxVSprhPFMPwrN4oCr54x6ESpW2fm4UHbar3R0+OJj5XAjy
	qhxJW0MnKh2otjtwwVglWdQ1f/h41OKJjJARPaHmgeW114Bup0PUzeKj80Np5nMWgBbmZ31zbOYl3
	i6mYFZKm6JK8DF6/Sg4eUA0uu0gVACDEQ7viz5Wsj8CaUOzpFMM+35NvHxwrLVv8EqhzActo862ha
	5cUF/K+Jz/r8guO4q2dl9q+15EWklbf5B961DD7v3bc2sk3t2R/xGuW6gBBUBX2VPI+oY60MXcLqB
	svndyRfCQQFxJgflCNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8w0Q-00000003Ga5-0tjG;
	Sat, 04 Apr 2026 08:05:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8w0O-00000003GZc-0HFf
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 08:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50D33405FA;
	Sat,  4 Apr 2026 08:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49E9C19423;
	Sat,  4 Apr 2026 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775289916;
	bh=+ZsFuW9tk4hpboN25ffYwk5fs+8ZFTtpTy5hNNCs0rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Msh7SXqaYc4dEhC0eWoa9RuY3A/5Y3lbGZPolVZMuBeFMLMTY++zEal6AaERDxIyp
	 EbLrx+23Td8iphI2FqP+xkP2Wbj1DHHB8EA6suyDLv7rhbzueRrPER9cvRDhW3Vrp0
	 GwIb/iOCbqns2to1L8MU5ERT1XUJKGitfRdNGZ0sQ2BU2YreXzafQ/Mu5Bvc/rKYDF
	 1bQaLHrPSETEN8+Yu3pWtueuiwlL+ladx+2fKkZgfhLueyRrdr86ROtvZ4K2OGJ/ML
	 f1LtmVDt1t2NSV5C51QF1XLAAbJsuJNxtLQ/S2O60GBbz8VE1gHvGZFwZvxNTONS7R
	 X42sBlLXLMelA==
Date: Sat, 4 Apr 2026 10:05:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <20260404-polite-parrot-of-progress-401d4e@quoll>
References: <20260403111516.379795-1-josh.milas@gmail.com>
 <20260403111516.379795-2-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403111516.379795-2-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_010520_126607_CB53DA39 
X-CRM114-Status: UNSURE (   5.43  )
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

On Fri, Apr 03, 2026 at 07:15:12AM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
