Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7099ED58E49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 03:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtHBGwCeljxlJ7wDWeJe47qp2Gz5/pAcDW4tAQJPjDE=; b=d6x1p1bQG20etm
	QlM+xZT5sjZCxe7RFz0ell+08stUQJ20Z5LUksDIIj0Gx3WvmXtwbzk+FiUA5p/WpLM8se3BrDHjk
	fGJDIMc7qYG8p7KX8e2Mqa3R7IWvp0b9yWCXnIOn7F3WknNCrvFMLmxVH1OYvkxA3I3OdTUPtnTdo
	jPTQIwHLNltNFPio29Ueg6SVDULuStfiqwNcuXalHqayH/lZYP6IXzlSzpKH5yYGyU7G5JZhifdcy
	sC8/D4NqRwnGtR8TKy0H2vanoT8PULza5EoXwbU26KUhg0lAwE9BfS1lzCAGbhtwtSgSiqWpmCGTC
	k3v6Xx0tVEB/By/RfDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwu71-0000000CBbw-0P59;
	Mon, 02 Mar 2026 03:38:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwu6y-0000000CBbS-071u
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 03:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C80143CBF;
	Mon,  2 Mar 2026 03:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A48C19423;
	Mon,  2 Mar 2026 03:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772422703;
	bh=tkyELmpejTLBUSV5SURHjr2MDlMxpNxT6V7ppU9CESc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pKB/qdtBvj62XtioPQsZZBD5rQlhOvCo4jiur+fhAQAjD6JG7OKhwZ1dixGVw6FUU
	 KnzeD0LjW6+aPCfghs3z+UbWdDT50E8iiK3rb7cvgjYzA/aH1isS8MAd9Xii+eSiES
	 CnIogF9cXav74pJH6vwU/j6sa062P6OjRn4HJPYKzK1ADXt2NcYWHDLCe2awDf0p6X
	 nxCXfSp1N4TqizuVreb/7M9sMsOdJLlKj0F0X9He+j0pC1D6xK1l5QctLIDnkL5kvl
	 qAngG636MvGQ3ZAsjthyYZfywmZTKqPUKO5U6kYPhNSP8KIvqIB7sWz0TEreXpkXpr
	 fPbYFAAsIv7Mw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: adapt regulator node name to preferred form
Date: Mon,  2 Mar 2026 03:38:15 +0000
Message-ID: <177242109477.25815.16699220030099258528.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
References: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_193824_409801_3B0E331C 
X-CRM114-Status: UNSURE (   6.45  )
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


On Thu, 26 Feb 2026 09:35:00 +0000, Yixun Lan wrote:
> The preferred node name for fixed-regulators has changed to pattern [1]:
>  '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
> 
> Adjust all SpacemiT DT regulator node names to fix this.
> 
> 

Applied, thanks!

[1/1] riscv: dts: spacemit: adapt regulator node name to preferred form
      https://github.com/spacemit-com/linux/commit/edea11c0aa8ca88537cc48d0d83296c66ab69ab8

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
