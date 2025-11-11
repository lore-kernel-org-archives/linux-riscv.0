Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92C1CCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 22:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWMhahNK/Qr47l6gtEHdBGfi2yi+Shllx0I6bZ8Bc6g=; b=RTlAS39ftcbkEM
	S4S1owttrNyYjQN5qjTZUKWNd2V6XiSI64Tr7E/WCv8621zL/dkcDIjd7yv9fs+fr7vez1IEUJcGL
	ycMvwDQ8tM5CxoZpj7oDDBqW9JPiPNjpaY5JDw1JmXyU/l3wbEWUlEeDQmbKaorXutG+2vQd+fy3x
	VaDewnZhWya8+kFnfZxG+/F7Sg/+EwrS0F4aIZka4LKEfR0dADrcBogxC17rbC1llrv5gG6Mr5DiN
	sakWrrizmehoCgGZE9J3W5O672kkwt8XVJFj4eFAZAmAbK4NVoVe9umxaX+hTD0ec+IZHcYdR+VMP
	0OZzFwRjKeG7eWCNGv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIxGW-00000007rYa-0VD0;
	Tue, 11 Nov 2025 22:55:08 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIxGP-00000007rXk-1rvB
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 22:55:06 +0000
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E79B6340E2A;
	Tue, 11 Nov 2025 22:54:58 +0000 (UTC)
Date: Wed, 12 Nov 2025 06:54:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] clk: spacemit: fix comment typo
Message-ID: <20251111225453-GYA1677982@gentoo.org>
References: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_145501_506867_7CF4790D 
X-CRM114-Status: UNSURE (   8.72  )
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

Hi Stephen:

On 23:50 Tue 11 Nov     , Encrow Thorne wrote:
> Fix incorrect comment to match the filename.
> 
> Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
> Hi Stephen,
> 
> Could you please take a look at this patch for inclusion?
> 
right, this is a trivial fix, and as there is no other clk patch
for SpacemiT this cycle, so can you simply take it via your tree?

thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
