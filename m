Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42783CFD31C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWLO/KjkBkQJFDHIXSYR/8Db1hkqlNFYvgxYLLn77CU=; b=IB94a50YGAKHe8
	+zQGZKB5Mi7Cx3EtXgRET3XqHG9hW96t6oEMAWqJ5GUkJ/oyss/reH/Rbx/QPOwRpf01UpBR7YGHi
	NRufS7NsqU9MWg7Cf8KwGU6fnMt4Geskwu73k907+M9fpgRN2hyqibYIeIpg//yUZcSTJHD6eA44W
	BsNV7syG7QwR1Dc/6B5R/Fcw7/WZsZvlJg0Lj4TijzVRkObYZOtBKKTwoajX0dg3ZGEmwCU1f78Ka
	0reYJUznjlf68Yrgapfvsg0nyrK9eepvYUE7Zjn25s2SklzHuS/F1HJ8TJQKyX3ORAcrWfYvEYNu8
	wyDoqZ20o5NO6FWQweVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQzf-0000000BDLx-48e8;
	Mon, 24 Nov 2025 07:28:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQzd-0000000BDLZ-3xr8
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 07:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED159436F5;
	Mon, 24 Nov 2025 07:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44ABCC4CEF1;
	Mon, 24 Nov 2025 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763969292;
	bh=ZDZIia8zrNrBXeTrtfnZ0ehnk5iZSLwJEC5c2kAwBrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9gguEOeakc89TYwr1m6aIV2G4rrfvAmLyNSOMYuVeFhpxuLtNv3/etnMRhbH9awI
	 rl3h+6nOyylz1Ni63gcSG4tZW5zaI1lZVfaZdeiwSvrGlcuTvkNCSU9mUZEGCA1SGI
	 2y13CJ7SwIvvB8UYf4qxNwyyCMAsgJxkc21FtNHsaFCozdjdYvdmV18plG73VghOgL
	 RHlE4mLvuL+RAMLvhjJhPYM7xBAHA/ZlKxN7DEr7c5CRBNJ03kFpKEFdB+sGH38HXV
	 xCHyr/Y83cOzrcrUlYZONa5h3ksgMF+FR44Weg4L5U2BwedomLfXEMN/71PcRKw2eY
	 GULryeY5BHq6Q==
Date: Mon, 24 Nov 2025 08:28:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: E Shattow <e@freeshell.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
Message-ID: <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-2-e@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251123225059.49665-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_232814_033774_797E0C44 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 23, 2025 at 02:50:44PM -0800, E Shattow wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Add "xunlong,orangepi-rv" as a StarFive JH7110 SoC-based board.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: E Shattow <e@freeshell.de>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
