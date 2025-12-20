Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0599E668A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ul8lulChPvqPzbZ7pssXcThajOLhOPr5bZHcvODh2sM=; b=JmNNLtTJVQHeA9
	OqY9DasxdEdxlxC9gb529WghZzLXGNy4rvSKwj/+vMh4evSrlFlOVWZ4JHlJLElUuR8okjVvo0v+Z
	Dm7fkUUfTdx9WTquwwp8562JG4m+UOabOlDesCEqyAClonyJQYidydzlDAK8mweVcgo0AL5Vic77C
	fhBaXh92akeAhzXu80Hd1hcAvmlmy3KF14UQX6/D8boZI/nq2Me/QpoXz/Gx9jd7D6ahSsBUB2qjY
	nZP05LuW1ypGfE2M7h0UMPTSl0O1HYWCjOcNOwuoznD1eLWxpt8+ZiPH4/vzn2myUffm2oqOQ4LdW
	Mmo0xnHAYENfOqlRE4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmtT-0000000BDRw-0af3;
	Sat, 20 Dec 2025 02:40:31 +0000
Received: from mail97.out.titan.email ([3.219.11.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWmtR-0000000BDRc-0USf
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 02:40:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dY7tL4Kk7z9rvT;
	Sat, 20 Dec 2025 02:40:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=0EUIjb/VY8iaB+oqYc/1jCz1JlY4M5G1NKjhuSLy4mk=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=to:in-reply-to:subject:message-id:date:from:cc:references:mime-version:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1766198426; v=1;
	b=QCynwGtCzyb9C/CmaKTWW4Y3oNkRJztG201MaW3RB/FFthdKHYU32W2IgpnDhjrbueSFxxze
	taOf4bivWGRy/Dd8+EMVEq91QzABQrWGo0nfbYAznVlR7M4j4bKg3DbFhY83PUhYU8t0MGv9sAj
	uqGwVljJQH1mRAR6TCbRncYg=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dY7tF68PPz9rvQ;
	Sat, 20 Dec 2025 02:40:21 +0000 (UTC)
Date: Sat, 20 Dec 2025 02:40:12 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <aUYMjAi8YIqValwb@pie>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1766198426463720322.21635.3765431148171030953@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=WtDRMcfv c=1 sm=1 tr=0 ts=69460c9a
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=7mOBRU54AAAA:8
	a=posyo3T4zH_C_FV0dzsA:9 a=CjuIK1q_8ugA:10 a=wa9RWnbW_A1YIeRBVszw:22
	a=3z85VNIBY5UIEeAh_hcH:22 a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_184029_242214_04855E01 
X-CRM114-Status: UNSURE (   7.21  )
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

On Sat, Dec 20, 2025 at 09:11:20AM +0800, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module,
> the auxiliary device id need to be adjusted, otherwise reset driver
> will fail to probe.

Does it mean the reset driver fails to probe with only PATCH 1 in the
series applied? If so these two patches should probably be merged, or we
will get unfunctional commits.

Regards,
Yao Zi

> Signed-off-by: Yixun Lan <dlan@gentoo.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
