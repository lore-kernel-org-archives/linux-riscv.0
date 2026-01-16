Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE69D4A615
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 09:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRCsBAjcqkFuN/Pl7T+2AVe4bxs7eFvhJ3E0M/75j30=; b=qy3IvoCcW08XB9
	VChFWiPPzdvhZjCXUBoPBvX+YTB9zuXH0E1Bzai3rGxMkHZL2zFGsgVo1hOFwYlkY2SOPLtTrB3z4
	T2r6scJVZu0C8fV6NyJUx1YrT4l8XfBTo3fN3XFJgYL6J6PY5acLKEjtWByZWZVzunOWYEZ3y4aTV
	roPlMgvG+Pu5D/s0QB4wornKQIQmXcwMErkqaHG0hLul/3DYSBP5cRhPqLVZWJmRdCnCCEsomFVHM
	ZWT7dTLuvbMUqDhaxcF5D1BpaLfmBToQhEOFpOlvMjW96xY8V5+xC1wq/m4NL+ce0HUPFW3ZqCrrR
	Vs0FKyjgu8rkqLMbgBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfnw-0000000Dp6m-2ywp;
	Fri, 16 Jan 2026 09:07:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfnu-0000000Dp5g-0yyp
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 09:07:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFC8641AF6;
	Fri, 16 Jan 2026 09:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6660DC116C6;
	Fri, 16 Jan 2026 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554457;
	bh=Uyza62GPhPfaIQZoBoObSPoMPXlfhoyzO+RPjobtCKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pl7UZp5RHLbTXr1qSqa5lzvR33jJVZkIIuwzFB1DnzhkHFnZL2xNEnPaC8ET09fWY
	 3hWbZg987ZXJ8hSh9EIRJ3p5yMnTlbAFoAaAMsY9SrL/GubkTAnqVM7ujG4/gO9brR
	 yJyfZ3UM+JCIrY5ouF+cvw7P7f1mk2ZMYW2g0gBItSh0jR8M5sC/tZfme6JjBeQukq
	 evn+Se0Er42jywIRokurNK/jdE5JOI4j+gyxcWeaSfh7ksGO3yBnzFBLhG+QNdxez7
	 9/lVXdgBJOVf/LqcT/PXIy/UenZJn3YirWFd+XGZFtswG8AIjtqrXkjqYgastdLqEL
	 VXCf2BqnvkMwQ==
Date: Fri, 16 Jan 2026 10:07:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 6/8] soc: tenstorrent: Add auxiliary device definitions
 for Atlantis
Message-ID: <20260116-scarlet-hound-of-dignity-1482aa@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-6-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-6-7356e671f28b@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_010738_291665_F95F9A4C 
X-CRM114-Status: GOOD (  15.76  )
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

On Thu, Jan 15, 2026 at 05:42:05PM -0600, Anirudh Srinivasan wrote:
> Reset shares the same registers as the Clock Controller, so it is
> implemented as an auxiliary device of the Clock Controller.
> 
> This commit adds the auxiliary device definitions needed for this.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  include/soc/tenstorrent/atlantis-syscon.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
> index f1dc6ad33c6d..972a9b7da596 100644
> --- a/include/soc/tenstorrent/atlantis-syscon.h
> +++ b/include/soc/tenstorrent/atlantis-syscon.h
> @@ -8,6 +8,14 @@
>  #include <linux/bits.h>
>  #include <linux/types.h>
>  
> +struct atlantis_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};

Completely pointless. You do not have any user of this.

Adding a few unused lines is not a logical change to the kernel. Why not
adding it member by member like one patch for empty struct, then second
patch for struct with adev, then third patch adding regmap?


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
