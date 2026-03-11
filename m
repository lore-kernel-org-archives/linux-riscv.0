Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10D51125865
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 18:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgRENSC7yvCsE+z/2xo4iYW0BQanFMMwLr4i3pyOCYU=; b=mgUKVi6rIczVly
	ZsxJKhfjiGiNEuWfYOvNNVpskr29KxgD6nDH5ENqAuYW2sG/ZgW1mTBvbW1CWLBoGaQiXn2TjGxTe
	YPKmK6C2pB6dtqZFN0DJEHNMRimfta0m1302TDnLGOKJ3PCg5yxBNCY3LLf8zmPv/hughZkIIuuc7
	yl4O0XGfUjba5tPB5unPo+AVGvDcKWd5i2DiF6aHjilfHI7ESkTWRCDpCbXnLtG8P9a7v3fDsYl3s
	ni6DuXc6KjR5o4p5quxP4mVKm954AlApeBtEbTlY+m3g5XUaJJFdMlao6Il3HVI4JAFYTUW59hegq
	EQ2vm7MNWpexs6RnwRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OWC-0000000CDWO-2ISf;
	Wed, 11 Mar 2026 18:42:52 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OW9-0000000CDVF-3Bze
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 18:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=GD2NKC1NguisWpvw6QCUZiLG2drMKNDcd055CeU3wTI=; b=mrO41Wn2J/SeJauPY7KsZiZlwi
	r/Hx8AmJ0uowfY7xOPtbX8UnScMn1I8gVmZbCM4m5vYq7AwNHzFCA5SFAIL0JRvDtwnnj7c++L6gt
	pP7czcQSIeV0Hy7cZdEeUfwdgKPWxewSM4FqBYYWsuTwllzQl7zfsUguQXztRRJxr/Y2cQrQyBrHW
	B9nPA2U4JHRgfi7QIZ/Rkr+6Dnixks3JlKQm+crdRSJUPnVVSCeiU7awT6pZXpeSlC75y1+rpavUG
	IT92wQ+Bv66p86pnPRzK67fSLRzIe0SUgPRVk6lRJ/4oFs+P312EhN6gdO3aRn7BDEDdSd9NPj4Bs
	WFDpx/zA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w0OW1-00000007fzj-3GdE;
	Wed, 11 Mar 2026 19:42:41 +0100
Date: Wed, 11 Mar 2026 19:42:41 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <abG3ofh1nLWPO_XS@aurel32.net>
Mail-Followup-To: Andi Shyti <andi.shyti@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Alex Elder <elder@riscstar.com>
References: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_114249_823293_EF1C9E84 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi,

On 2026-02-07 23:08, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Troy Mitchell (2):
>       i2c: spacemit: move i2c_xfer_msg()
>       i2c: spacemit: introduce pio for k1
> 
>  drivers/i2c/busses/i2c-k1.c | 316 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 236 insertions(+), 80 deletions(-)
> ---
> base-commit: 2fe0719258a48c204270366ef574066122e81924
> change-id: 20260207-b4-k3-i2c-pio-318088c1b3b7

Since there hasn't been any further comments on the latest version, 
would it be possible to consider merging it in 7.1?

Thanks
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
